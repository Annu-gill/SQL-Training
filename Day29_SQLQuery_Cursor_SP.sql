-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Annu Gill
-- Create date: 05-02-2026
-- Description:	Stored procedure for checking low stock products
-- =============================================
CREATE OR ALTER PROCEDURE dbo.LogLowStockProducts
(
    @ReorderLevel INT = 30   -- threshold for low stock
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @ProductId   INT,
        @ProductName VARCHAR(100),
        @StockQty    INT;

    -- Optional: clear previous logs
    TRUNCATE TABLE dbo.ReorderLog;

    -- Declare cursor
    DECLARE curLowStock CURSOR FAST_FORWARD
    FOR
        SELECT ProductId, ProductName, StockQty
        FROM dbo.Products
        WHERE StockQty < @ReorderLevel
        ORDER BY StockQty ASC;

    -- Open cursor
    OPEN curLowStock;

    -- Fetch first row
    FETCH NEXT FROM curLowStock
        INTO @ProductId, @ProductName, @StockQty;

    -- Loop through cursor
    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO dbo.ReorderLog (ProductId, Message)
        VALUES
        (
            @ProductId,
            'Reorder needed for ' 
            + @ProductName 
            + ' (Stock=' + CAST(@StockQty AS VARCHAR(10)) + ')'
        );

        FETCH NEXT FROM curLowStock
            INTO @ProductId, @ProductName, @StockQty;
    END

    -- Cleanup
    CLOSE curLowStock;
    DEALLOCATE curLowStock;
END
GO

-- How to execute it
-- EXEC dbo.LogLowStockProducts;        -- uses default 30
-- EXEC dbo.LogLowStockProducts 20;     -- custom threshold

-- Result check
 --SELECT * 
 --FROM dbo.ReorderLog
 --ORDER BY LogId;

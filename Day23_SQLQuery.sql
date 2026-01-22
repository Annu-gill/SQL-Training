--use LpuDB

--create procedure MyPractice
--as
--begin

--SELECT * from Customers

--END


--go
--exec MyPractice

--alter procedure MyPractice
---- Optional or Parameters
--@City varchar(50)
--as
--Begin

--SELECT * from Customers where City = @City
--END

--go
--exec MyPractice 'Coimbatore'


--=================================================================================================================================
-- =============================================
-- Author:		Annu Gill
-- Create date: 22-01-2026
-- Description:	Sample SP
-- =============================================
--CREATE PROCEDURE [dbo].[Sp_GetCustomerByNameAndCity]
--ALTER PROCEDURE [dbo].[Sp_GetCustomerByNameAndCity]

--	-- Add the parameters for the stored procedure here
--	@Name varchar(100),
--	@City varchar(50)
--AS
--BEGIN
--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;

--    -- Insert statements for procedure here
--	SELECT *from Customers where FullName=@Name AND City=@City
--END
--GO
--Exec Sp_GetCustomerByNameAndCity 'Gopi Suresh', 'Coimbatore'

----------------------------------------------------------------------------------------------------------------------

-- CRUD (Create, Retrieve, Update, Delete) operations using design Query in Editor GUI

--INSERT INTO tbl_department
--                  (Dept_Id, Dept_Name)
--VALUES (4, 'Cleaning')

--UPDATE tbl_department
--SET          Dept_Id = 62, Dept_Name = 'Healthcare'
--WHERE  (Dept_Id = 2)

--SELECT * from tbl_department

----CREATE PROCEDURE [dbo].[Sp_CrudOperations]
--ALTER PROCEDURE [dbo].[Sp_CrudOperations]

--AS
--BEGIN

---- Read
--SELECT * 
--from tbl_department

---- INSERT
--INSERT INTO tbl_department(Dept_Id,Dept_Name)
--VALUES
--	(5,'Dept_5'),
--	(6,'Dept_6')

---- UPDATE
--UPDATE tbl_department
--SET
--	Dept_Id=55,
--	Dept_Name='Updated Dept'
--WHERE Dept_Id=5

---- DELETE
--DELETE FROM tbl_department
--WHERE Dept_Id=1

--END
--GO

--EXEC Sp_CrudOperations


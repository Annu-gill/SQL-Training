-- when storing data in database every 8kb or 12kb is considered as single page
-- after labelling, finding page would be easy


SET STATISTICS IO ON;   -- shows logical reads
SET STATISTICS TIME ON;    -- 
----------------------------------------

create view perf_issue_vw
as 
SELECT * from perf_issue

SELECT * from perf_issue_vw
-- view has read only records, we dont have operations internally



```
SELECT * INTO perf_issue FROM Person.person;

SELECT ROW_NUMBER() OVER (ORDER BY BusinessEntityID) AS RowNumber, * FROM perf_issue;

-----------------------------------------------

SELECT
	so.name,
	ps.*
FROM
	sys.dm_db_partition_stats ps
INNER JOIN
	sysobjects so 
ON
	ps.object_id = so.id
WHERE
	so.xtype = 'U'

------------------------------------------------

SELECT
	so.name,
	ps.used_page_count
FROM
	sys.dm_db_partition_stats ps
INNER JOIN
	sysobjects so 
ON
	ps.object_id = so.id
WHERE
	so.xtype = 'U'
ORDER BY ps.used_page_count DESC
```


USE AdventureWorks2025;
GO

DROP TABLE IF EXISTS dbo.SOH_Practice;
SELECT TOP (300000)
  SalesOrderID, CustomerID, OrderDate, SubTotal, TaxAmt, Freight, TotalDue
INTO dbo.SOH_Practice
FROM Sales.SalesOrderHeader
ORDER BY SalesOrderID;

-- Create a clustered index on SalesOrderID (common pattern)
-- This leaves our search columns (CustomerID, OrderDate) without a supporting index.
CREATE CLUSTERED INDEX CX_SOH_Practice_SalesOrderID
ON dbo.SOH_Practice(SalesOrderID);

DROP INDEX IF EXISTS CX_SOH_Practice_SalesOrderID ON dbo.SOH_Practice;

-----------------------------------

SET STATISTICS IO ON;  
SET STATISTICS TIME ON;

SELECT SalesOrderID from dbo.SOH_Practice where SalesOrderID = 43669;
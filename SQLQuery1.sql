--1

SELECT * FROM HumanResources.EmployeePayHistory
SELECT * FROM Person.Person;

WITH stawkiCTE (BusinessEntityID, Rate, RateChangeDate, FristName, LastName)
AS
(
	SELECT eph.BusinessEntityID, eph.Rate, eph.RateChangeDate, per.FirstName, per.LastName
	FROM HumanResources.EmployeePayHistory eph
	JOIN Person.Person per ON per.BusinessEntityID = eph.BusinessEntityID
)

SELECT * INTO #TempEmployeeInfo FROM stawkiCTE;

SELECT * FROM #TempEmployeeInfo;

--2

SELECT * FROM SalesLT.Customer ORDER BY CompanyName;
SELECT * FROM SalesLT.SalesOrderHeader;

WITH sprzedazeCTE (CompanyContact, Revenue)
AS
(
	SELECT CONCAT(cus.CompanyName, ' ','(', cus.FirstName, ' ','', cus.LastName, '',')') AS CompanyContact, soh.TotalDue AS Revenue
	FROM SalesLT.Customer cus
	JOIN SalesLT.SalesOrderHeader soh ON cus.CustomerID = soh.CustomerID
)

SELECT * FROM sprzedazeCTE ORDER BY CompanyContact

--3

SELECT * FROM SalesLT.Product;
SELECT * FROM SalesLT.ProductCategory;
SELECT * FROM SalesLT.SalesOrderHeader;
SELECT * FROM SalesLT.SalesOrderDetail;

WITH kategorieCTE (Category, SalesValue)
AS
(
	SELECT cat.Name, ROUND(SUM(sod.LineTotal), 2)
	FROM SalesLT.ProductCategory cat
	JOIN SalesLT.Product pro ON pro.ProductCategoryID = cat.ProductCategoryID
	JOIN SalesLT.SalesOrderDetail sod ON sod.ProductID = pro.ProductID
	GROUP BY cat.Name, pro.ListPrice
)

SELECT * FROM kategorieCTE ORDER BY Category;



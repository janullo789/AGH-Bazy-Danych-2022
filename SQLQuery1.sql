--a

CREATE OR ALTER FUNCTION dbo.sumFibo (@a INT, @b INT)
RETURNS INT
AS BEGIN
	RETURN (@a + @b)
END


CREATE OR ALTER PROCEDURE fibo @nr INT
AS BEGIN

	DECLARE @fiboTab TABLE(nr INT NOT NULL IDENTITY(0,1), fiboNr INT NOT NULL)
	INSERT INTO @fiboTab VALUES (0),(1)

	WHILE ((@nr - 2) > 0)
	BEGIN
		INSERT INTO @fiboTab SELECT dbo.sumFibo((SELECT MAX(fiboNr) FROM @fiboTab),
												(SELECT TOP 1 fiboNr FROM @fiboTab WHERE nr = (SELECT (MAX(nr) - 1) FROM @fiboTab)))
		SET @nr = @nr - 1
	END

	SELECT nr, fiboNr AS Liczba FROM @fiboTab
END

EXEC fibo 19

--b

SELECT * FROM Person.Person
SELECT * FROM Person.BusinessEntity

CREATE TRIGGER triggerUppercase
ON Person.Person
AFTER INSERT
AS
	BEGIN
		UPDATE Person.Person SET LastName = UPPER(LastName)
		FROM Person.Person per
		WHERE EXISTS (SELECT 1 FROM inserted tab WHERE tab.BusinessEntityID = per.BusinessEntityID);
END

DROP TRIGGER Person.triggerUppercase

INSERT INTO Person.Person (BusinessEntityID,FirstName,MiddleName,LastName,PersonType) VALUES (20779,'Jakub','A','Kowalski','SC')

INSERT INTO Person.BusinessEntity(rowguid)
VALUES(newid())
SELECT * FROM Person.BusinessEntity

--c

SELECT * FROM Sales.SalesTaxRate

CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
AFTER UPDATE
AS
	BEGIN
		DECLARE @TaxRate1 int, @TaxRate int
		SELECT @TaxRate1 = TaxRate FROM INSERTED SalesTaxRate
		SELECT @TaxRate = TaxRate FROM DELETED
		IF (@TaxRate1 > 1.3*@TaxRate OR @TaxRate1 < 0.7*@TaxRate)
			PRINT 'Zmieniles wartosc pola o wiecej niz 30%'
END

DROP TRIGGER Sales.taxRateMonitoring

UPDATE Sales.SalesTaxRate
SET TaxRate = 20
WHERE SalesTaxRateID = 1;
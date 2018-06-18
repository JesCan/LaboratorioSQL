/* Poner en uso la base de datos */
Use AdventureWorks2016
GO

/* Muestrame el nombre, apellido, departamento, estado civil del empleado */
SELECT Person.FirstName as Nombre, Person.LastName as Apellido,
    HumanResources.Department.Name as Departamento, HumanResources.Employee.MaritalStatus as 'Estado Civil'
FROM HumanResources.EmployeeDepartmentHistory
    INNER JOIN Person.Person
    ON EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
    INNER JOIN HumanResources.Department
    ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
    INNER JOIN HumanResources.Employee
    ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = HumanResources.Employee.BusinessEntityID

/* Muestrame el listado de clientes que hicieron su orden de compra en los meses de noviembre
y diciembre del año 2012 */
SELECT CONCAT(Person.LastName, ', ',Person.FirstName) AS Cliente,
    CONCAT(MONTH(OrderDate),'/',YEAR(OrderDate)) AS 'Mes y  Año'
FROM Sales.SalesOrderHeader
    INNER JOIN Sales.Customer
    ON Sales.SalesOrderHeader.CustomerID = Sales.Customer.CustomerID
    INNER JOIN Person.Person
    ON Customer.PersonID = Person.BusinessEntityID
WHERE Year(OrderDate) = 2012 AND (MONTH(OrderDate) BETWEEN 11 AND 12 )

SELECT *
FROM Sales.SalesOrderHeader
SELECT *
FROM Sales.Customer
WHERE CustomerID = 29825
SELECT *
FROM Person.Person
WHERE Person.BusinessEntityID = 3412

/* Muestrame la cantidad de órdenes de pedido atentidos por cada medio de envio */
SELECT Purchasing.ShipMethod.Name AS 'Medio de envío ',
    COUNT(Purchasing.ShipMethod.Name) AS 'Cantidad'
FROM Sales.SalesOrderHeader
    INNER JOIN Purchasing.ShipMethod
    ON Sales.SalesOrderHeader.ShipMethodID = Purchasing.ShipMethod.ShipMethodID
GROUP BY Purchasing.ShipMethod.Name

/* Mostrar la cantidad de ventas realizadas de acuerdo al país */
SELECT País =
        CASE
        WHEN Sales.SalesTerritory.CountryRegionCode = 'AU' THEN 'Australia'
        WHEN Sales.SalesTerritory.CountryRegionCode = 'US' THEN 'Estados Unidos'
        WHEN Sales.SalesTerritory.CountryRegionCode = 'DE' THEN 'Alemania'
        WHEN Sales.SalesTerritory.CountryRegionCode = 'FR' THEN 'Francia'
        WHEN Sales.SalesTerritory.CountryRegionCode = 'GB' THEN 'Inglaterra'
        WHEN Sales.SalesTerritory.CountryRegionCode = 'CA' THEN 'Canadá'
        END, 
       Sales.SalesTerritory.Name AS 'Estado',
       COUNT(Sales.SalesOrderHeader.TerritoryID) AS 'Total'
FROM Sales.SalesOrderHeader
    INNER JOIN Sales.SalesTerritory
    ON Sales.SalesOrderHeader.TerritoryID = Sales.SalesTerritory.TerritoryID
GROUP BY Sales.SalesTerritory.CountryRegionCode, Sales.SalesTerritory.Name
ORDER BY Sales.SalesTerritory.CountryRegionCode


SELECT count(Sales.SalesOrderHeader.TerritoryID )
FROM Sales.SalesOrderHeader
WHERE SalesOrderHeader.TerritoryID = 5

SELECT Sales.SalesTerritory.Name, Sales.SalesTerritory.CountryRegionCode
FROM Sales.SalesTerritory
WHERE Sales.SalesTerritory.TerritoryID = 5


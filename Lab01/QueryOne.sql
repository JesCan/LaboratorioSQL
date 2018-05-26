/* Crear una BD en blanco */
CREATE DATABASE HospitalHHH;
GO

/* Necesito visualizar el listado de base de datos de tu servidor local */
SELECT database_id, name 
FROM sys.databases;
GO

/* Poner en uso una base de datos */
USE HospitalHHH;
GO

/* Ver listado de tablas de una base de datos */
Use AdventureWorks2016
SELECT name from sys.tables;

/* Ver listado de vistas de una base de datos */
USE AdventureWorks2016;
SELECT NAME FROM SYS.views;
GO

/* Visualizar la información detallada de una base de datos */
EXEC sp_helpdb AdventureWorks2016;

/* Utilizando snippets */
-- Create a new database called 'MercadoVG'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'MercadoVG'
)
CREATE DATABASE MercadoVG
GO

/* Eliminar una Base de Datos */
DROP DATABASE HospitalHHH;
GO

/* Eliminar base de datos AdventureWORKS */
DROP DATABASE AdventureWorks2016;
DROP DATABASE AdventureWorksDW2016;
GO
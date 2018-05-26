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
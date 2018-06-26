/* Poner en uso la BD Librería */
USE dbLibrary
GO

/* Visualizar las tablas de la base de datos activa */
EXEC sp_tables
GO

/* Visualizar los registros de la tabla Género */
SELECT * FROM Genero
GO

/* Crear un SP que permita listar los registros de la tabla género */
CREATE PROCEDURE sp_ListGen
AS
    BEGIN
        SELECT * FROM Genero
    END
GO

/* Ejcutar Store Procedure de listado de género */
EXEC sp_ListGen
GO

/* Crear un SP que permita listar los registros de la tabla cliente */
CREATE PROCEDURE sp_ListCliente
AS
    BEGIN
        SELECT * FROM Cliente
    END
GO

/* Ejecutar SP que permite listar clientes */
EXEC sp_ListCliente
GO

/* Crear un SP que permita listar los clientes ordenados por la columna sexo de forma ascendente */
CREATE PROCEDURE sp_ListClienteSexo
AS
    BEGIN
        SELECT * FROM Cliente
        ORDER BY  Cliente.sexoCliente ASC
    END
GO

/* Ejecutar SP que muestre listado de clientes por sexo */
EXEC sp_ListClienteSexo
GO

/* Modificar el SP anterior de tal forma que permita mostrar el listado de clientes 
de acuerdo a la letra del sexo indicado*/
ALTER PROCEDURE sp_ListClienteSexo
    @Sexo VARCHAR(1)
AS
    BEGIN
        SELECT *
        FROM Cliente
        WHERE Cliente.sexoCliente = @Sexo
    END
GO

/* Ejecutar SP que muestre los clientes del sexo femenino */
EXEC sp_ListClienteSexo @Sexo = F
GO

/* Modificar el SP de tal forma que se vea completo el nombre del sexo */
ALTER PROCEDURE sp_ListClienteSexo
    @Sexo VARCHAR(1)
AS
    BEGIN
        SELECT CONCAT( Cliente.apeCliente, ', ', Cliente.nomCliente) AS Cliente,
        Cliente.dniCliente AS dni,
        Sexo =
        CASE 
            WHEN Cliente.sexoCliente = 'F' THEN 'Femenino'
            WHEN Cliente.sexoCliente = 'M' THEN 'masculino'
        END
        FROM Cliente
        WHERE Cliente.sexoCliente = @Sexo
    END
GO

/* Ejecutar SP que muestre los clientes del sexo femenino */
EXEC sp_ListClienteSexo @Sexo = M
GO


/* Crer un SP que permita ingresar registros a la tabla Género */
CREATE PROCEDURE sp_AddGen
    @Codigo VARCHAR(4),
    @nombre VARCHAR(MAX)
AS
    BEGIN
        INSERT INTO Genero
            (idGenero, nomGenero)
        VALUES
            (@Codigo, @nombre)
    END
GO

/* Agregar el género comedia */
EXEC sp_AddGen @Codigo = 5, @nombre = 'Comedia'
GO

/* Verificamos que se haya agregado el registro */
SELECT * FROM Genero
GO

/* Agregar los géneros Infantil,  Obra Literaria y Drama */
EXEC sp_AddGen @Codigo = 6, @nombre = 'Infantil'
EXEC sp_AddGen @Codigo = 7, @nombre = 'Obra Literaria'
EXEC sp_AddGen @Codigo = 8, @nombre = 'Drama'
GO

/* Verificamos que se haya agregado el registro */
SELECT * FROM Genero
GO

/* Elaborar un SP que permita validar el código de género antes de ingresar un registro */
ALTER PROCEDURE sp_ValidAddReg
    @Codigo INT,
    @nombre VARCHAR(MAX)
AS
    BEGIN
        IF(SELECT Genero.idGenero FROM Genero WHERE Genero.idGenero = @Codigo) IS NOT NULL
            SELECT 'No puedo ingresar el registro porque el código ya existe' AS 'Resultado'
        ELSE
            INSERT INTO Genero
                (idGenero, nomGenero)
            VALUES
                (@Codigo, @nombre);
            SELECT * FROM Genero ORDER BY idGenero
    END
GO

/* Validar ingreso de genero con el código 2 */
EXEC sp_ValidAddReg @Codigo = 2, @Nombre = 'Series'
EXEC sp_ValidAddReg @Codigo = 9, @Nombre = 'Series'
EXEC sp_ValidAddReg @Codigo = 11, @Nombre = 'Comics'
GO

/* Eliminar registro a través de un SP */
CREATE PROCEDURE SP_DelGen
    @Codigo VARCHAR(4)
AS
    BEGIN
        DELETE FROM Genero
        WHERE Genero.idGenero = @Codigo
    END
GO

/* Ejecutar SP */
EXEC SP_DelGen @Codigo = 11
GO

/* Listar registros de la tabla género */
SELECT * FROM Genero
GO








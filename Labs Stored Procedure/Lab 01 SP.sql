/* Listar base de datos del servidor */
EXEC sp_databases
GO

/* Listar procedimientos almacenados de una base de datos */
EXEC sp_stored_procedures
GO

/* Listar tablas y vistas de una base de datos activa */
EXEC sp_tables
GO

/* Mi primer procedimiento almancenado */
CREATE PROCEDURE sp_SumNum
    @VarUno INT = 0,
    @VarDos INT = 0,
    @Suma INT = 0
AS
    BEGIN
        SET @Suma = @VarUno + @VarDos
        SELECT @Suma
    END
GO

/* Ejecutar mi primer procedimiento almacenado */
EXEC sp_SumNum
GO

/* Modificar mi procedimiento almacenado */
ALTER PROCEDURE sp_SumNum
    @VarUno INT = 5,
    @VarDos INT = 20,
    @Suma INT = 0
AS
    BEGIN
        SET @Suma = @VarUno + @VarDos
        SELECT @Suma AS 'Resultado'
    END
GO

/* Ejecutar mi primer procedimiento almacenado */
EXEC sp_SumNum
GO

/* Eliminar mi procedimiento almacenado */
DROP PROCEDURE sp_SumNum
GO

/* Elaborar un SP que permita ingresar 2 números y devuelva la sumatoria de ellos */
CREATE PROCEDURE sp_SumNum2
    @VarUno INT,
    @VarDos INT,
    @Suma INT = 0
AS
    BEGIN
        SET @Suma = @VarUno + @VarDos
        SELECT @Suma AS 'Resultado'
    END
GO

/* Sumando dos números */
EXEC sp_SumNum2 @VarUno = 300, @VarDos = 600
GO

/* Elaborar un SP que permita ingresar dos números y devolver el mayor de ellos */
ALTER PROCEDURE sp_Evaluar
    @NumUno INT,
    @NumDos INT
AS
    BEGIN
        IF @NumUno > @NumDos
            SELECT @NumUno AS 'Número mayor'
        ELSE
            SELECT @NumDos AS 'Número mayor'
    END
GO

/* Comparando números */
EXEC sp_Evaluar @NumUNo = 50, @NumDos = 80
GO

/* Elaborar un SP que permita comparar dos números si son iguales o si son diferentes devolver el mayor */
CREATE PROCEDURE sp_Evaluar2
    @NumUno INT,
    @NumDos INT
AS
    BEGIN
        IF @NumUno = @NumDos
            PRINT 'Los números son iguales'
        ELSE
            IF @NumUno > @NumDos
                SELECT @NumUno AS 'Número mayor'
            ELSE
                SELECT @NumDos AS 'Número mayor'
    END
GO

/* Comparando números */
EXEC sp_Evaluar2 @NumUno = 800, @NumDos = 80
EXEC sp_Evaluar2 @NumUno = 800, @NumDos = 800
GO
  
/* Elaborar un SP que permita enumerar una debida cantidad de números */
CREATE PROCEDURE sp_Listar
    @Num INT,
    @Inicio INT = 0
AS
    BEGIN
        WHILE (@Inicio < @Num)
            BEGIN
                SET @Inicio = @Inicio + 1 
                PRINT @Inicio       
            END
    END
GO

/* Listar 5 números */
EXEC sp_Listar @Num = 5
GO

/* Elaborar un SP que permita repetir el mensaje "RETROCEDER NUNCA, RENDIRSE JAMAS"
de acuerdo a un número que ha sido ingresado */

/* Elaborar un SP que permita ingresar un nombre y devuelva un mensaje de saludo con
el mismo nombre */
CREATE PROCEDURE sp_Saludo
    @Nombre VARCHAR(40)
AS
    BEGIN
        PRINT 'Hola ' + @Nombre
    END
GO

/* Probando el SP Saludo */
EXEC sp_Saludo @Nombre = Manuel
GO

/* Elaborar un SP que permita ingresar un nombre y una fecha de nacimiento */
CREATE PROCEDURE sp_NomFecNac
    @Nombre VARCHAR(40),
    @FecNac DATE
AS
    BEGIN
        SELECT @Nombre AS Nombre, @FecNac AS 'Fecha Nacimiento'
    END
GO

/* Probando SP Ingresar nombre y Fecha de Nacimiento */
--- Ver la configuración de idioma del servidor
SELECT @@LANGUAGE
GO

--- Ver formato de fecha de acuerdo al idioma
EXEC sp_helplanguage
GO

--- Probando SP
EXEC sp_NomFecNac @Nombre = 'Manuel Alberto', @FecNac = '06/23/2018'
GO

/* Elaborar un SP que permita ingresar un nombre y fecha de nacimiento en formato dd/mm/yyyy */
CREATE PROCEDURE sp_NomFecNac2
    @Nombre VARCHAR(40),
    @FecNac VARCHAR(10)
AS
    BEGIN
        SELECT @Nombre AS Nombre, 
        CONVERT(datetime, @FecNac, 103) AS 'Fecha de Nacimiento'
    END
GO

/* Probando SP */
EXEC sp_NomFecNac2 @Nombre = Oscar, @FecNac = '23/06/2018'
GO

/* Modificando el SP */
ALTER PROCEDURE sp_NomFecNac2
    @Nombre VARCHAR(40),
    @FecNac VARCHAR(10)
AS
    BEGIN
        SELECT @Nombre AS Nombre, 
        FORMAT(CONVERT(datetime, @FecNac, 103), 'd', 'en-gb') AS 'Fecha de Nacimiento'
    END
GO

/* Probando SP */
EXEC sp_NomFecNac2 @Nombre = Gilberto, @FecNac = '02/12/2000'
GO

/* Elaborar un SP que permita ingresar un nomnbre, una fecha de nacimiento 
y devuelva los mismos datos más la edad basada en años */
CREATE PROCEDURE sp_NomFecNac3
    @Nombre VARCHAR(40),
    @FecNac VARCHAR(10)
AS
    BEGIN
        SELECT @Nombre AS Nombre, 
        FORMAT(CONVERT(datetime, @FecNac, 103), 'd', 'en-gb') AS 'Fecha de Nacimiento',
        DATEDIFF(YEAR, CONVERT(datetime, @FecNac, 103), GETDATE()) AS 'Edad'
    END
GO

/* Probando SP */
EXEC sp_NomFecNac3 @Nombre = Gilberto, @FecNac = '02/12/2000'
GO
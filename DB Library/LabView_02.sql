SELECT Libro.tituloLibro, Libro.Genero_idGenero, Genero.nomGenero
FROM Libro
    INNER JOIN Genero
    ON Libro.Genero_idGenero = Genero.idGenero
GO
SELECT Libro.tituloLibro, Pais.nomPais
FROM Libro
    INNER JOIN Pais
    ON Libro.Pais_idPais = Pais.idPais
GO
/* Creando una Vista */
CREATE VIEW vwDatosLibro
AS
    SELECT Libro.tituloLibro, Autor.nomAutor, Autor.apeAutor
    FROM Libro
        INNER JOIN Autor
        ON Libro.Autor_idAutor = Autor.idAutor
GO
/* Ver registros de una vista */
SELECT *
FROM vwDatosLibro
GO
/* Listar el nombre del autor, el libro que ha escrito, el género y país respectivo en una vista llamada vwDatosAutor */
/* En Vista listar la cantidad de libros por género*/
CREATE VIEW vwGenLib
AS
    SELECT Genero.nomGenero AS 'Genero' , COUNT(Libro.Genero_idGenero) AS 'Total'
    FROM Libro
        INNER JOIN Genero
        ON Libro.Genero_idGenero = Genero.idGenero
    GROUP BY Genero.nomGenero
GO
/* Ver registros de vista */
SELECT *
FROM vwGenLib
GO

/* Vista que liste la cantidad de libros por país */
CREATE VIEW vwPaisLib
AS
SELECT Pais.nomPais AS 'País', COUNT(Pais.idPais) AS 'Total'
FROM Libro
INNER JOIN Pais
ON Libro.Pais_idPais = Pais.idPais
GROUP BY Pais.nomPais
GO
/* ver listado de vista */
SELECT * FROM vwPaisLib
GO

/* Ver listado de Vistas de una base de datos */
SELECT Name FROM sys.views
GO

SELECT Prestamos.fecsalPrestamo, 
CONCAT(Bibliotecario.apeBibliotecario, ', ', Bibliotecario.nomBibliotecario) AS 'Bibliotecario',
Libro.tituloLibro
FROM Prestamos
INNER JOIN Bibliotecario
ON Prestamos.Bibliotecario_idBibliotecario = Bibliotecario.idBibliotecario
INNER JOIN Detalle_Prestamo
ON Prestamos.idPrestamo = Detalle_Prestamo.Prestamos_idPrestamo
INNER JOIN Libro
ON Detalle_Prestamo.Libro_idLibro = Libro.idLibro


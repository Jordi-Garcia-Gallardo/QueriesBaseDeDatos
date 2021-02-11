SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio * 1.20 AS 'Precio dolar (Cambio 1,20)' FROM producto;
SELECT nombre AS 'Nom de producto', precio 'euros', precio * 1.20 AS 'dolars' FROM producto;
SELECT upper(nombre), precio FROM producto;
SELECT lower(nombre), precio FROM producto;
SELECT nombre, UPPER(LEFT(nombre,2)) AS "Abreviat" FROM fabricante;
SELECT ROUND(precio) FROM producto;
SELECT nombre, FLOOR(precio) FROM producto 
SELECT fabricante.codigo FROM fabricante JOIN producto WHERE fabricante.codigo = producto.codigo_fabricante
SELECT distinct fabricante.codigo FROM fabricante JOIN producto WHERE fabricante.codigo = producto.codigo_fabricante
SELECT nombre FROM fabricante ORDER BY nombre ASC
SELECT nombre FROM fabricante ORDER BY nombre DESC
SELECT * FROM producto ORDER BY nombre ASC, precio DESC
SELECT * FROM fabricante LIMIT 5
SELECT * FROM fabricante LIMIT 3,2
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1
SELECT nombre FROM producto WHERE codigo_fabricante = 2
SELECT p.nombre, precio, f.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo 
SELECT p.nombre, precio, f.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC
SELECT p.codigo, p.nombre, f.codigo, f.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo
SELECT p.nombre, precio, f.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo ORDER BY precio ASC LIMIT 1
SELECT p.nombre, precio, f.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo ORDER BY precio DESC LIMIT 1
SELECT p.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'LENOVO'
SELECT p.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND precio > 200
SELECT p.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR  f.nombre='Hewlett-Packard' OR f.nombre='seagate'    
SELECT p.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate')
SELECT p.nombre, precio FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e'
SELECT p.nombre, precio FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%'
SELECT p.nombre, precio, f.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo WHERE precio >=180 ORDER BY precio DESC, p.nombre ASC 
SELECT distinct f.codigo, f.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo WHERE p.codigo_fabricante = f.codigo
SELECT f.nombre, p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.nombre IS NULL
SELECT p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'LENOVO'
SELECT * FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE precio = (SELECT precio FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante  WHERE f.nombre IN ('LENOVO') ORDER BY precio DESC LIMIT 1)
SELECT p.nombre FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante  WHERE f.nombre IN ('LENOVO') ORDER BY precio DESC LIMIT 1
SELECT p.nombre FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante  WHERE f.nombre IN ('HEWLETT-PACKARD') ORDER BY precio ASC LIMIT 1
SELECT p.nombre FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante WHERE precio >= (SELECT precio FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante  WHERE f.nombre IN ('LENOVO') ORDER BY precio DESC LIMIT 1)
SELECT p.nombre FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre IN ('ASUS') AND precio > (SELECT avg (precio)  FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante  WHERE f.nombre IN ('ASUS'))
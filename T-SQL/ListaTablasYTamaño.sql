/*
------------------------------------------------------------------------------------------------------------------------------------------------------------------
Fecha:			26/12/2013
Autor:			Ren� Pacios
Descripci�n:	Obtiene una lista de las tablas conenidas en la base de datos actual, junto con el n�mero de campos y el tama�o m�ximo por registro

------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

SELECT o.name 'Tabla',
     COUNT(*) 'Columnas',
	 SUM(c.length) 'Tama�o  m�x. registro (bytes)'
FROM
     sysobjects o
INNER JOIN syscolumns c ON
     c.id = o.id
where o.xtype='U' and o.name<>'dtproperties'
group by o.name
order by 1
/* No necesario, si se desease informaci�n de una s�la tabla en ese caso es mejor usar sys.tables, o syscolumns */
--WHERE
--     o.name = '<table name>'

/* Consultas auxiliares */
select * from sysobjects
where xtype='U'

select * from sys.tables

select * from syscolumns
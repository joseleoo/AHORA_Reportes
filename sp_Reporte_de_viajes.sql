SELECT   IdTipo,IdEstado, *  FROM Albaranes_Envio WHERE  IdTipo=4  



SELECT  * FROM Albaranes_Envio_Lineas where IdEnvio=29
--SELECT * FROM Albaranes_Estados
--SELECT * FROM Albaranes_Envio_Tipos
SELECT * FROM Almacenes WHERE IdAlmacen=4041
SELECT Pers_AlmacOrig, * FROM Conf_Albaranes_Envio --WHERE 
SELECT ae.IdEnvio,
 (SELECT Nombre FROM Almacenes WHERE IdAlmacen=88 ) AS AlmacenOrigen, 
  cae.Pers_AlmacOrig, 
  ael.IdAlmacen, 
  a.Nombre AS AlmacenDestino,
   ae.IdTipo, 
   ae.IdEstado,
    a.Ciudad,
a.Provincia, * 	
				FROM Almacenes a 
				INNER JOIN Albaranes_Envio_Lineas ael ON ael.IdAlmacen=a.IdAlmacen 
				INNER JOIN	Albaranes_Envio ae ON ae.IdEnvio=ael.IdEnvio
				INNER JOIN Conf_Albaranes_Envio cae ON cae.IdEnvio = ael.IdEnvio
				WHERE ae.IdTipo=4 --AND  IdEstado=0 
																     
use FUNDEXITO0603
GO
/****** Object:  StoredProcedure [dbo].[PPers_IndicadoresXMesXestadoxPlanta]    Script Date: 20/03/2020 10:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[PPers_IndicadoresXMesXestadoxPlanta] @pmes  varchar(100),  @pidestado  varchar(100),  @pidplanta  varchar(10)  
as


select 'Cartón + Plástico + Otros' 
as rubro, 
 (select isnull(sum(isnull(pcl.Total_Euros, 0) ), 0) from Pedidos_Cli_Lineas pcl  left join Facturas_Cli_Cab fcc on fcc.IdFactura = pcl.IdFactura  where pcl.IdArticulo in (select IdArticulo from Articulos where IdFamilia in (1, 2, 5))and IdAlmacen = @pidplanta and year(fcc.FechaActualizacion) = year(getdate()) -1 and MONTH(fcc.FechaActualizacion) in (SELECT * FROM dbo.splitstring(@pmes))  and pcl.IdEstado = @pidestado ) 
 anhoanterior, 
  (select isnull(sum(isnull(pcl.Total_Euros, 0) ), 0) from Pedidos_Cli_Lineas pcl  left join Facturas_Cli_Cab fcc on fcc.IdFactura = pcl.IdFactura  where pcl.IdArticulo in (select IdArticulo from Articulos where IdFamilia in (1, 2, 5)) and year(fcc.FechaActualizacion) = year(getdate()) and IdAlmacen = @pidplanta and MONTH(fcc.FechaActualizacion) in (SELECT * FROM dbo.splitstring(@pmes))  and pcl.IdEstado = @pidestado ) 
  anhoactual ,
  
  (select isnull(sum(isnull(Plata, 0)), 0) from Pers_Ventas where anho = year(getdate()) and IdPlanta = @pidplanta  and IdFamilia in (1, 2, 5)  and mes in (SELECT * FROM dbo.splitstring(@pmes))) 
  presupuesto ,  
  'Total Ingresos' as tpRubro
  union all 
select 'Chatarra' 
as rubro,  
(select isnull(sum(isnull(pcl.Total_Euros, 0) ), 0) from Pedidos_Cli_Lineas pcl  left join Facturas_Cli_Cab fcc on fcc.IdFactura = pcl.IdFactura  where pcl.IdArticulo in (select IdArticulo from Articulos where IdFamilia in (4))and IdAlmacen = @pidplanta and year(fcc.FechaActualizacion) = year(getdate()) -1 and MONTH(fcc.FechaActualizacion) in (SELECT * FROM dbo.splitstring(@pmes))  and pcl.IdEstado = @pidestado ) 
anhoanterior,  
(select isnull(sum(isnull(pcl.Total_Euros, 0) ), 0) from Pedidos_Cli_Lineas pcl  left join Facturas_Cli_Cab fcc on fcc.IdFactura = pcl.IdFactura  where pcl.IdArticulo in (select IdArticulo from Articulos where IdFamilia in (4)) and year(fcc.FechaActualizacion) = year(getdate()) and IdAlmacen = @pidplanta and MONTH(fcc.FechaActualizacion) in (SELECT * FROM dbo.splitstring(@pmes))  and pcl.IdEstado = @pidestado )  
anhoactual,
(select isnull(sum(isnull(Plata, 0)), 0) from Pers_Ventas where anho = year(getdate()) and IdPlanta = @pidplanta  and IdFamilia in (4)  and mes in (SELECT * FROM dbo.splitstring(@pmes)))
 presupuesto,	
  'Total Ingresos' as tpRubro
  union all
select 'Otros residuos aprovechables' as rubro, 
 (select isnull(sum(isnull(pcl.Total_Euros, 0) ), 0) from Pedidos_Cli_Lineas pcl  left join Facturas_Cli_Cab fcc on fcc.IdFactura = pcl.IdFactura  where pcl.IdArticulo in (select IdArticulo from Articulos where IdFamilia in (39))and IdAlmacen = @pidplanta and year(fcc.FechaActualizacion) = year(getdate()) -1 and MONTH(fcc.FechaActualizacion) in (SELECT * FROM dbo.splitstring(@pmes))  and pcl.IdEstado = @pidestado ) 
 anhoanterior,  
 (select isnull(sum(isnull(pcl.Total_Euros, 0) ), 0) from Pedidos_Cli_Lineas pcl  left join Facturas_Cli_Cab fcc on fcc.IdFactura = pcl.IdFactura  where pcl.IdArticulo in (select IdArticulo from Articulos where IdFamilia in (39)) and year(fcc.FechaActualizacion) = year(getdate()) and IdAlmacen = @pidplanta and MONTH(fcc.FechaActualizacion) in (SELECT * FROM dbo.splitstring(@pmes))  and pcl.IdEstado = @pidestado ) 
  anhoactual,
  (select isnull(sum(isnull(Plata, 0)), 0) from Pers_Ventas where anho = year(getdate()) and IdPlanta = @pidplanta  and IdFamilia in (39)  and mes in (SELECT * FROM dbo.splitstring(@pmes)))
  presupuesto,
   'Total Ingresos' as tpRubro
  union all
select 'Ganchos' 
as rubro,  
(select isnull(sum(isnull(pcl.Total_Euros, 0) ), 0) from Pedidos_Cli_Lineas pcl  left join Facturas_Cli_Cab fcc on fcc.IdFactura = pcl.IdFactura  where pcl.IdArticulo in (select IdArticulo from Articulos where IdFamilia in (3))and IdAlmacen = @pidplanta and year(fcc.FechaActualizacion) = year(getdate()) -1 and MONTH(fcc.FechaActualizacion) in (SELECT * FROM dbo.splitstring(@pmes))  and pcl.IdEstado = @pidestado ) 
anhoanterior,  
(select isnull(sum(isnull(pcl.Total_Euros, 0) ), 0) from Pedidos_Cli_Lineas pcl  left join Facturas_Cli_Cab fcc on fcc.IdFactura = pcl.IdFactura  where pcl.IdArticulo in (select IdArticulo from Articulos where IdFamilia in (3)) and year(fcc.FechaActualizacion) = year(getdate()) and IdAlmacen = @pidplanta and MONTH(fcc.FechaActualizacion) in (SELECT * FROM dbo.splitstring(@pmes))  and pcl.IdEstado = @pidestado )  
anhoactual,
(select isnull(sum(isnull(Plata, 0)), 0) from Pers_Ventas where anho = year(getdate()) and IdPlanta = @pidplanta  and IdFamilia in (3)  and mes in (SELECT * FROM dbo.splitstring(@pmes))) 
presupuesto ,
 'Total Ingresos' as tpRubro

union all
select 'Mano de obra + costos fijos' as rubro ,  
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate())-1 and IdPlanta = @pidplanta  and IdConcepto = 1  and mes in (SELECT * FROM dbo.splitstring(@pmes))) 
as  anhoanterior, 
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 1  and mes in (SELECT * FROM dbo.splitstring(@pmes))) 
anhoactual,    
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 1  and mes in (SELECT * FROM dbo.splitstring(@pmes))) 
presupuesto ,
 'Total Costos' as tpRubro

union all
select 'Operarios de Basura' as rubro ,  
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate())-1 and IdPlanta = @pidplanta  and IdConcepto = 2  and mes in (SELECT * FROM dbo.splitstring(@pmes))) 
as  anhoanterior, 
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 2  and mes in (SELECT * FROM dbo.splitstring(@pmes))) 
anhoactual,    
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 2  and mes in (SELECT * FROM dbo.splitstring(@pmes))) 
presupuesto ,
 'Total Costos' as tpRubro
union all

select 'Operarios Centros Comerciales' as rubro ,  
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate())-1 and IdPlanta = @pidplanta  and IdConcepto = 4  and mes in (SELECT * FROM dbo.splitstring(@pmes))) as  anhoanterior, 
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 4  and mes in (SELECT * FROM dbo.splitstring(@pmes))) anhoactual,    
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 4  and mes in (SELECT * FROM dbo.splitstring(@pmes))) presupuesto 
,
 'Total Costos' as tpRubro
 union all

select 'Salud Ocupacional (SG-SST)' as rubro ,  
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate())-1 and IdPlanta = @pidplanta  and IdConcepto = 17 and mes in (SELECT * FROM dbo.splitstring(@pmes))) as  anhoanterior, 
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 17  and mes in (SELECT * FROM dbo.splitstring(@pmes))) anhoactual,    
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 17  and mes in (SELECT * FROM dbo.splitstring(@pmes))) presupuesto 
,
 'Total Costos' as tpRubro
 union all

select 'Reparación de maquinaria' as rubro ,  
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate())-1 and IdPlanta = @pidplanta  and IdConcepto = 6 and mes in (SELECT * FROM dbo.splitstring(@pmes))) as  anhoanterior, 
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 6  and mes in (SELECT * FROM dbo.splitstring(@pmes))) anhoactual,    
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 6  and mes in (SELECT * FROM dbo.splitstring(@pmes))) presupuesto 
,
 'Total Costos' as tpRubro 
 union all


select 'Montacargas' as rubro ,  
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate())-1 and IdPlanta = @pidplanta  and IdConcepto = 7 and mes in (SELECT * FROM dbo.splitstring(@pmes))) as  anhoanterior, 
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 7  and mes in (SELECT * FROM dbo.splitstring(@pmes))) anhoactual,    
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 7  and mes in (SELECT * FROM dbo.splitstring(@pmes))) presupuesto ,
 'Total Costos' as tpRubro
 union all

select 'Arrendamiento de maquinaria y deprec.' as rubro ,  
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate())-1 and IdPlanta = @pidplanta  and IdConcepto = 8 and mes in (SELECT * FROM dbo.splitstring(@pmes))) as  anhoanterior, 
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 8  and mes in (SELECT * FROM dbo.splitstring(@pmes))) anhoactual,    
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 8  and mes in (SELECT * FROM dbo.splitstring(@pmes))) presupuesto 
,
 'Total Costos' as tpRubro
 union all

select 'Materiales' as rubro ,  
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate())-1 and IdPlanta = @pidplanta  and IdConcepto = 11 and mes in (SELECT * FROM dbo.splitstring(@pmes))) as  anhoanterior, 
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 11  and mes in (SELECT * FROM dbo.splitstring(@pmes))) anhoactual,    
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 11  and mes in (SELECT * FROM dbo.splitstring(@pmes))) presupuesto 
,
 'Total Costos' as tpRubro
 union all

select 'Costos adhesivos' as rubro ,  
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate())-1 and IdPlanta = @pidplanta  and IdConcepto = 12 and mes in (SELECT * FROM dbo.splitstring(@pmes))) as  anhoanterior, 
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 12  and mes in (SELECT * FROM dbo.splitstring(@pmes))) anhoactual,    
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 12 and mes in (SELECT * FROM dbo.splitstring(@pmes))) presupuesto 
,
 'Total Costos' as tpRubro
union all


select 'Costos Ganchos' as rubro ,  
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate())-1 and IdPlanta = @pidplanta  and IdConcepto = 14 and mes in (SELECT * FROM dbo.splitstring(@pmes))) as  anhoanterior, 
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 14  and mes in (SELECT * FROM dbo.splitstring(@pmes))) anhoactual,    
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 14 and mes in (SELECT * FROM dbo.splitstring(@pmes))) presupuesto 
,
 'Total Costos' as tpRubro
union all


select 'Comisión venta de chatarra' as rubro ,  
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate())-1 and IdPlanta = @pidplanta  and IdConcepto = 16 and mes in (SELECT * FROM dbo.splitstring(@pmes))) as  anhoanterior, 
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 16  and mes in (SELECT * FROM dbo.splitstring(@pmes))) anhoactual,    
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 16 and mes in (SELECT * FROM dbo.splitstring(@pmes))) presupuesto 
,
 'Total Costos' as tpRubro
union all


select 'Facilitadores' as rubro ,  
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate())-1 and IdPlanta = @pidplanta  and IdConcepto = 3 and mes in (SELECT * FROM dbo.splitstring(@pmes))) as  anhoanterior, 
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 3  and mes in (SELECT * FROM dbo.splitstring(@pmes))) anhoactual,    
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 3 and mes in (SELECT * FROM dbo.splitstring(@pmes))) presupuesto 
,
 'Total Gastos Administrativos' as tpRubro
 union all

select 'Costos admón programa (nomina, viajes)' as rubro ,  
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate())-1 and IdPlanta = @pidplanta  and IdConcepto = 15 and mes in (SELECT * FROM dbo.splitstring(@pmes))) as  anhoanterior, 
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 15  and mes in (SELECT * FROM dbo.splitstring(@pmes))) anhoactual,    
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 15 and mes in (SELECT * FROM dbo.splitstring(@pmes))) presupuesto 
,
 'Total Gastos Administrativos' as tpRubro

  union all
select 'Proyectos de Reciclaje' as rubro ,  
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate())-1 and IdPlanta = @pidplanta  and IdConcepto = 13 and mes in (SELECT * FROM dbo.splitstring(@pmes))) as  anhoanterior, 
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 13  and mes in (SELECT * FROM dbo.splitstring(@pmes))) anhoactual,    
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 13 and mes in (SELECT * FROM dbo.splitstring(@pmes))) presupuesto 
,
 'Total Gastos Administrativos' as tpRubro
  union all
select 'Encuentro facilitadores' as rubro ,  
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate())-1 and IdPlanta = @pidplanta  and IdConcepto = 9 and mes in (SELECT * FROM dbo.splitstring(@pmes))) as  anhoanterior, 
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos_Real  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 9  and mes in (SELECT * FROM dbo.splitstring(@pmes))) anhoactual,    
(select isnull(sum(isnull(valor, 0)), 0) from Pers_Costos  where anho = year(getdate()) and IdPlanta = @pidplanta  and IdConcepto = 9 and mes in (SELECT * FROM dbo.splitstring(@pmes))) presupuesto 
,
 'Total Gastos Administrativos' as tpRubro


--Creando un Schema para Tienda de Ropa
CREATE SCHEMA TiendaRopa
--done

--Creando tablas indep

--CASO PRACTICO TIENDA DE ROPA
--Una tienda de ropa desea digitalizar su inventario y sus procesos de venta para mejorar la gestión y evitar errores manuales.
--Diseñar una base de datos normalizada que permita:
-- Evitar duplicidad de productos y clientes
-- Registrar ventas con múltiples productos
-- Consultar el historial de compras por cliente

--Creando las entidades que dan más detalle del Producto
--CategoriaProd, LoteProd, TipoTelaProd

CREATE TABLE tiendaropa.CategoriaProd(
	idCategoriaProd serial PRIMARY KEY,
	NombreCate varchar(30),
	DescripcionCate varchar(100)
)

CREATE TABLE tiendaropa.LoteProd(
	idLoteProd serial PRIMARY KEY,
	NombreLote varchar(30),
	DescripcionLote varchar(100)
)

ALTER TABLE tiendaropa.LoteProd
ADD COLUMN FechaLote date; --lotes de ropa tienen fechas de lote (fabricación)

CREATE TABLE tiendaropa.TipoTelaProd(
	idTipoTelaProd serial PRIMARY KEY,
	NombreTela varchar(30),
	DescripcionTela varchar(100)
)

CREATE TABLE tiendaropa.Producto(
	idProducto serial PRIMARY KEY,
	NombreProd varchar(30),
	DescripcionProd varchar(100),
	TallaProd varchar(20),
	Color varchar(50),
	idCategoriaProd int REFERENCES tiendaropa.CategoriaProd(idCategoriaProd),
	idLoteProd int REFERENCES tiendaropa.LoteProd(idLoteProd),
	idTipoTelaProd int REFERENCES tiendaropa.TipoTelaProd(idTipoTelaProd)
)

--Creando entiedades que complementan ComprasTienda y VentasTienda
--Proveedores y Clientes
CREATE TABLE tiendaropa.Proveedores(
	idProveedores serial PRIMARY KEY,
	NombreProv varchar(50),
	TelefonoProv varchar(20),
	CorreoProv varchar(100),
	DireccionProv varchar(250)
)

CREATE TABLE tiendaropa.Clientes(
	idClientes serial PRIMARY KEY,
	NombreCli varchar(50),
	TelefonoCli varchar(20),
	CorreoCli varchar(100),
	DireccionCli varchar(250)
)

CREATE TABLE tiendaropa.ComprasTienda(
	idComprasTienda serial PRIMARY KEY,
	FechaCompra date,
	idProveedores int REFERENCES tiendaropa.Proveedores(idProveedores)
)

CREATE TABLE tiendaropa.VentasTienda(
	idVentasTienda serial PRIMARY KEY,
	FechaVenta date,
	idClientes int REFERENCES tiendaropa.Clientes(idClientes)
)

--Creando los DetalleCompra y Detalle Venta

CREATE TABLE tiendaropa.DetalleComprasTienda(
	idDetalleComprasTienda serial PRIMARY KEY,
	idComprasTienda int REFERENCES tiendaropa.ComprasTienda(idComprasTienda),
	idProducto int REFERENCES tiendaropa.Producto(idProducto),
	CantidadCompra int,
	PrecioUnitCompra decimal
)

CREATE TABLE tiendaropa.DetalleVentasTienda(
	idDetalleVentasTienda serial PRIMARY KEY,
	idVentasTienda int REFERENCES tiendaropa.VentasTienda(idVentasTienda),
	idProducto int REFERENCES tiendaropa.Producto(idProducto),
	CantidadVenta int,
	PrecioUnitVenta decimal
)

--Creando tabla de Inventario (Compra-Venta)

CREATE TABLE tiendaropa.Inventario(
	idInventario serial PRIMARY KEY,
	idDetallleComprasTienda int REFERENCES tiendaropa.DetalleComprasTienda(idDetalleComprasTienda),
	idDetalleVentasTienda int REFERENCES tiendaropa.VentasTienda(idDetalleVentasTienda),
	CantidadProd int, 
	PrecioUnitProd decimal
)
--se pueden crear constraints para indicar condiciones para que los valores del atributo idDetalleVenta...
--puedan ser negativos para indicar un "movimiento de salida"
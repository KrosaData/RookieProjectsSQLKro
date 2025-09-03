Spanish
Descripción: Una tienda de ropa desea digitalizar su inventario y sus procesos de venta para mejorar la gestión y evitar errores manuales.​
Entidades sugeridas:​
- `Producto`: nombre, talla, color, precio, stock, id_categoria  ​
- `Categoría`: nombre, descripción  ​
- `Cliente`: nombre, correo, teléfono  ​
- `Venta`: fecha, id_cliente  ​
- `DetalleVenta`: id_venta, id_producto, cantidad, precio_unitario​Descripción:  ​

Objetivo:​ Diseñar una base de datos normalizada que permita:​
- Evitar duplicidad de productos y clientes​
- Registrar ventas con múltiples productos​
- Consultar el historial de compras por cliente

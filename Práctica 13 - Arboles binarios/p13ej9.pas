{
Una empresa de materiales para la Construcción dispone de una lista con los productos que 
comercializa. Dicha lista posee: código y nombre de producto, stock actual, stock mínimo y precio 
unitario. Además la empresa posee una sucursal que diariamente envía la información de sus 
ventas. De cada venta se conoce número de venta, el código de producto y cantidad vendida. 

Toda la información se encuentra ordenada por código de producto. Se pide:

	a) Realizar un módulo que reciba la información de ventas de un día y actualiza el stock actual 
	de la lista de productos.
	b) Semanalmente se realizan las compras a las industrias mayoristas por lo que es necesario 
	generar una estructura (eficiente para la búsqueda) con aquellos productos cuyo stock actual 
	es inferior al mínimo ((stock minimo)). Los datos que se almacenan son: código de producto y stock a reponer 
	(diferencia entre el stock mínimo y el actual). Esta estructura se debe generar ordenada por 
	stock a reponer.
	c) A partir de la estructura generada en el inciso b), realice un modulo que informe 
	eficientemente los códigos de los productos cuyo stock a reponer se encuentre entre 500 y 
	1.000
}
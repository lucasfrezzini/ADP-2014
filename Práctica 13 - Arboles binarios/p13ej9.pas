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

program ejercicio9;

	type

		str = String[20];

		venta = record
			nroVenta: Integer;
			cod_prod: Integer;
			cantVen: Integer;
		end;

		material = record
			cod_prod: Integer;
			nombre: str;
			stocka: Integer;
			stockm: Integer;
			precio: real;
		end;

		listaV = nodo3;
		nodo3 = record
			dato : venta;
			sig: listaV;
		end;

		listaM = nodo2;
		nodo2 = record
			dato: material;
			sig: listaM;
		end;

		stockArbol = record
			stock: Integer;
			cod_prod: Integer;
		end;

		arbol = ^nodo;
		nodo = record
			dato : stockArbol;
			hi:= arbol;
			hd:= arbol;
		end;

	procedure modStock(var l: listaM; cod, tot: Integer);
		var
			aux: listaM;
		begin
			aux:= l;
			{Existe el código del producto en la lista de Materiales, por lo tanto, siempre lo va a encontrar, no es necesario el <> nil}
			while (cod <> aux^.dato.cod_prod) do
				aux:= aux^.sig;
			aux^.dato.stocka:= aux^.dato.stocka - tot;
		end;

	procedure actualizarStock(l2: listaV; var l: listaM;);
		var
			act, totVend: Integer;
		begin
			while (l2 <> nil) do begin
				act:= l2^.dato.cod_prod;
				totVend:= 0;
				while (act = l2^.dato.cod_prod) do begin
					totVend:= totVend + l2^.dato.cantVen;
					l2:= l2^.sig;
				end;
				modStock(l, act, totVend);
			end;
		end;

	procedure agregarNodo(var a: arbol; cod, stock: Integer);
		begin
			if (a = nil) then begin
				new(a);
				a^.dato.stock:= stock;
				a^.dato.cod_prod:= cod;
				a^.hd:= nil;
				a^.hi:= nil;
			end
			else
				if (stock < a^.dato.stock) then
					agregarNodo(a^.hi, cod, stock)
				else
					agregarNodo(a^.hd, cod, stock);
		end;

	procedure crearArbol(var a: arbol; l: listaM);
		var
			aux: Integer;
		begin
			while (l <> nil) do begin
				aux:= l^.dato.stockm - l^.dato.stocka;
				if (aux > 0) then begin
					agregarNodo(a, l^.dato.cod_prod, aux);
				end;
				l:= l^.sig;
			end;
		end;

	procedure filtrarStock(a: arbol; inf, sup: Integer);
		begin
			if (a <> nil) then
				if (a^.dato.stock >= inf) then
					if (a^.dato.stock <= sup) then begin
						write('Este codigo de producto: ', a^.dato.cod_prod, 'debe reponer el stock entre 500 y 1000 unidades');
						filtrarStock(a^.hi, inf, sup);
						filtrarStock(a^.hd, inf, sup);
					end
					else
						filtrarStock(a^.hi, inf, sup);
				else
					filtrarStock(a^.hd, inf, sup);
		end;

	var
		inf, sup: Integer;
		a: arbol;
		l: listaM;
		l2: listaV;

	begin
		inf:= 500;
		sup:= 1000;
		a:= nil;
		l:= nil;
		l2:= nil;
		crearListaMateriales(l); {Se dispone}
		crearListaVentas(l2); {Se dispone}
		actualizarStock(l2, l);
		crearArbol(a, l);
		filtrarStock(a, inf, sup);
	end.

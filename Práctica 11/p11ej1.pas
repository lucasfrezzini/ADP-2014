{
Dos  sucursales  de  una  perfumería  disponen  cada  una  de  una  estructura  con  las  ventas 
realizadas.  De  cada  venta  se  conoce  código  del  producto  y  cantidad  vendida.  Las  ventas 
están ordenadas por código de producto, y un producto puede ser vendido 0, 1 ó más veces 
en la misma sucursal y además puede ser vendido en las dos sucursales.

Se pide generar una nueva lista que totalice la cantidad de ventas de cada producto.
Las listas de ventas deben recorrerse una sola vez.
}

program ejercicio1;

	type
		venta = record
			codigo: Integer;
			cantidad: Integer;
		end;

		lista = ^nodo;
		nodo = record
			dato: venta;
			sig: lista;
		end;

	procedure minimo(var l1: lista; var l2: lista; var min: venta);
		begin
			if (l1 = nil) and (l2 = nil) then begin
				min.cod:= 99999;
			end
			else
				if (l1 <> nil) and (l2 <> nil) then begin
					if (l1^.dato.codigo < l2^.dato.codigo) then begin
						min:= l1^.dato;
						l1:= l1^.sig;
					end
					else begin
						min:= l2^.dato;
						l2:= l2^.sig;
					end;
				end
				else
					if (l1 = nil) then begin
						min:= l2^.dato;
						l2:= l2^.sig;
					end
					else begin
						min:= l1^.dato;
						l1:= l1^.sig;
					end;
		end;

	procedure crearLista(var l3: lista; act: integer; cantidad: integer);
		var
			nuevo: lista;
		begin
			new(nuevo);
			nuevo^.dato.cantidad:= cantidad;
			nuevo^.dato.codigo:= act;
			nuevo^.sig:= l3;
			l3:= nuevo;
		end;

	procedure merge(l1: lista; l2: lista; var l3: lista);
		var
			cantidad, act: Integer;
			min, act: venta;
		begin
			min:= 99999;
			minimo(l1, l2, min);
			while (min.cod <> 99999) do begin
				act= min.cod;
				cantidad:= 0;
				while (act = min.cod) do begin
					cantidad:= cantidad + min.cantidad;
					minimo(l1, l2, min);
				end;
				crearLista(l3, act, cantidad);
			end;
		end;

	var
		l1, l2, l3: lista;
	begin
		l1:= nil;
		l2:= nil;
		l3:= nil;
		crearListaPerfumeria(l1); {Se dispone}
		crearListaPerfumeria(l2); {Se dispone}
		merge(l1, l2, l3);
	end.

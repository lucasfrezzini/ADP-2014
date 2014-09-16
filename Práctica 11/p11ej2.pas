{
Un  supermercado  dispone  de  las  listas  de  ventas  del día  de  sus  dos  sucursales.  De  cada 
venta se conoce: código de producto y la cantidad vendida. Ambas listas están ordenadas por 
código de producto de forma ascendente. Un productopuede ser vendido 0, 1 ó más veces en 
la misma sucursal y además puede ser vendido en las dos sucursales. 

Escriba  un  módulo  que reciba  las  dos  listas  y  genere  una  nueva  lista  con  la  cantidad  total 
vendida  para  cada  código  de  producto.  La  nueva  lista  debe  estar  ordenada  por  código  de 
producto de forma descendente y las listas de ventas deben recorrerse una sola vez
}

program ejercicio2;

	type
		venta = record
			cod: Integer;
			cant: Integer;
		end;

		lista = ^nodo;
		nodo = record
			dato: venta;
			sig: lista;
		end;

	procedure minimo(var l1: lista; var l2: lista; min: venta);
		begin
			if (l1 = nil) and (l2 = nil) then
				min.cod:= 99999;
			end
			else
				if (l1 <> nil) and (l2 <> nil) then begin
					if (l1^.dato.cod < l2^.dato.cod) then begin
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

	procedure cargarAdelante(var l3: lista; cant: Integer; cod: Integer);
		var
			nuevo: lista;
		begin
			new(nuevo);
			nuevo^.dato.cod:= cod;
			nuevo^.dato.cant:= cant;
			nuevo^.sig:= l3;
			l3:= nuevo;
		end;

	procedure merge(l1: lista; l2: lista; var l3: lista);
		var
			act, cant:= Integer;
			min: venta;
		begin
			minimo(l1, l2, min);
			while (min.cod:= 99999) do begin
				act:= min.cod;
				cant:= 0;
				while (act = min.cod) do begin
					cant:= cant + min.cant;
					minimo(l1, l2, min);
				end;
				cargarAdelante(l3, cant, act);
			end;
		end;

	var
		l1, l2, l3: lista;

	begin
		l1:= nil;
		l2:= nil;
		l3:= nil;
		crearLista(l1); {Se dispone}
		crearLista(l2); {Se dispone}
		merge(l1, l2, l3);
	end.

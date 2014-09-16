{
Un depósito de Productos Electrónicos dispone de una estructura donde registra los datos de
los productos que almacena (ordenada por código). De cada producto se conoce: código
(entero), descripción y stock actual.
Diariamente, dos salones de ventas envían una lista de productos vendidos al depósito. De
cada producto vendido se conoce: el código del producto y cantidad de unidades vendidas. Un
código de producto puede no aparecer, o aparecer una o más veces en cada lista. Estas listas
están ordenadas por código de producto. Se pide:

	a) Generar una nueva lista de pedidos a partir de las dos listas de pedidos recibidas. Esta
	nueva lista también debe estar ordenada por código de producto y debe contener para
	cada código de producto vendido el total de unidades pedidas. Cada vez que totalice
	un producto debe actualizar el stock que el deposito maneja para el mismo (suponga
	que hay suficiente stock).

	b) Informar el código de los dos productos que más se vendieron.

	NOTA: las listas disponibles deben recorrerse una sola vez.
}

program ejercicio3;
	type
		str = String[100];
		deposito = record
			codigo: Integer;
			desc: str;
			stock: Integer;
		end;

		listaDep = ^nodo;
		nodo = record
			dato: deposito;
			sig: listaDep;
		end;

		producto = record
			codigo: Integer;
			cant: Integer;
		end;

		listaProd = ^nodo2;
		nodo2 = record
			dato : producto;
			sig: listaProd;
		end;

	procedure minimo(var l1: listaProd; var l2: listaProd; min: producto);
		begin
			if (l1 = nil) and (l2 = nil) then begin
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

	procedure agregarAtras(var l3: listaProd; cant: Integer; cod: Integer; var ult: listaProd);
		var
			nuevo: listaProd;
		begin
			new(nuevo);
			nuevo^.dato.cod:= cod;
			nuevo^.dato.cant:= cant;
			nuevo^.sig:= nil;
			if (l3 = nil) then
				l3:= nuevo;				
			else
				ult^.sig:= nuevo;
			ult:= nuevo;		
		end;

	procedure maximos(cant: integer; cod: Integer; var max1: Integer; var max2: Integer; var cod1: Integer; var cod2: Integer);
		begin
			if (cant > max1) then begin
				max2:= max1;
				cod2:= cod1;
				max1:= cant;
				cod1:= cod;
			end
			else
				if (cant > max2) then begin
					max2:= cant;
					cod2:= cod;
				end;
		end;

	procedure modStock(var l4: listaDep; cant: Integer; cod: Integer);
		var
			aux: listaDep;
		begin
			aux:= l4;
			while (aux <> nil) and (aux^.dato.cod <> cod) do begin
				aux:= aux^.sig;
			end;
			if (aux <> nil) then
				aux^.dato.stock:= aux^.dato.stock - cant;		
		end;

	procedure merge(l1: listaProd; l2: listaProd; var l3: listaProd, var l4: listaDep);
		var
			ult, min: listaProd;
			act, cant: integer
		begin
			ult:= nil;
			minimo(l1, l2, min);
			while (min.cod <> 99999) do begin
				act:= min.cod;
				cant:= 0;
				while (act = min.cod) do begin
					cant:= cant + min.cant;
					minimo(l1, l2, min);
				end;
				agregarAtras(l3, cant, act, ult);
				modStock(l4, cant, act);
				maximos(cant, act, max1, max2, cod1, cod);
			end;
			write('El codigo del producto que mas vendio con: ', max1, 'fue el COD: ', cod1);
			write('El segundo codigo del producto que mas vendio con: ', max2, 'fue el COD: ', cod2);
		end;

	var
		l1, l2, l3: listaProd;
		l4: listaDep;

	begin
		l1:= nil;
		l2:= nil;
		l3:= nil;
		l4:= nil;
		crearListaDep(l4);
		crearListaProd(l1);
		crearListaProd(l2);
		merge(l1, l2, l3, l4);
	end.

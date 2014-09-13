{
Se dispone una lista de registros con información de aviones. De cada avión se conoce: Marca_avión, 
Modelo_avión, Valor_avión. La lista está ordenada por Marca_avión en forma descendente. 
Implemente un módulo que reciba dicha lista y un registro con la información de un avión y elimine el 
elemento de la lista que coincida totalmente con el registro. Tener en cuenta que el registro puede no 
existir. Devolver si se pudo realizar la eliminación.
}

program ejercicio5;
	type
		str = String[50];
		aviones = record
			marca: str;
			modelo: str;
			valor: real;			
		end;
		lista = ^nodo;
		nodo = record
			dato: aviones;
			sig: lista;
		end;

	procedure leerAvion(var av: aviones);
		begin
			read(av.marca);
			read(av.modelo);
			read(av.valor);
		end;

	function eliminar(var l: lista; av: aviones;): boolean;
		var
			act, ant: lista;
		begin
			if (L = nil) then
				eliminar:= false;
			else begin
				act:= l;
				ant:= l;
				while (act <> nil) and (act^.dato.marca <> av.marca) and (act^.dato.modelo <> av.modelo) and (act^.dato.valor <> av.valor) do begin
					ant:= act;
					act:= act^.sig;
				end;
				if (act = nil) then begin
					eliminar:= false
				else
					if (act = ant) then begin
						l:= act^.sig;
					end
					else
						ant^.sig:= act^.sig;
					dispose(act)
					eliminar:= true;
			end;
		end;

	var
		l: lista;
		av: aviones;
	begin
		l:= nil;
		crearLista(l); {Se dispone}
		leerAvion(av);
		if (eliminar(l, av)) then
			write('Se ha borrado de manera correcta');
		else
			write('No se ha podido borrar correctamente');
	end.


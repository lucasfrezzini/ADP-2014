{
Se necesita contabilizar los votos de las diferentes mesas electorales  de una  provincia. Para ello, se dispone 
de una lista con la siguiente información: código de localidad, número de mesa, y cantidad de votos. La 
información está ordenada por código de localidad. En cada localidad pueden existir 1 o más mesas.

Realizar la impresión en pantalla como se muestra a continuación:

		Código de Localidad X  			Total de Votos
		Código de Localidad Y 			Total de Votos
		.....................    		..............
		.....................  			..............
										Total de Votos en la Provincia
}

program ejercicio6;

	type
		mesa = record
			cod : Integer;
			nro: Integer;
			cant: Integer;			
		end;
		lista = ^nodo;
		nodo = record
			dato: mesa;
			sig: lista;
		end;

	procedure recorrerLista(l: lista);
		var
			votTotal, votLoc, act: Integer;
		begin
			votTotal:= 0;
			while (l <> nil) do begin
				votLoc:= 0;
				act:= l^.dato.cod;
				while (l <> nil) and (act = l^.dato.cod) do begin
					votLoc:= votLoc + l^.dato.cant;
					l:= l^.sig;
				end;
				write('La localidad: ', act, 'tiene un cantidad de votos igual a: ', votLoc);
				votTotal:= votTotal + votLoc;
			end;
			write('El total de votos de la provincia fue: ', votTotal);
		end;

	var
		l: lista;

	begin
		l:= nil;
		crearLista(l); {Se disponee}
		recorrerLista(l);
	end.



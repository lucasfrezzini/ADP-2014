{
a) Escriba un módulo que reciba una lista de strings L y un string S, y retorne verdadero si S está en L (falso,
en caso contrario). La lista no se encuentra ordenada.

b) Idem a), pero suponiendo que la lista está ordenada en forma ascendente. 
Nota: El módulo debe detener la búsqueda al encontrar la primera ocurrencia de la palabra. 
}

program ejercicio3;
	type
		lista = ^nodo;
		nodo = record
			dato : string;
			sig: lista;
		end;

	function desordenada(l: lista; s: string): Boolean;
		var
			ok: Boolean;
		begin
			ok:= false;
			while (l <> nil) and (not ok) do begin
				if (l^.dato = s) then
					ok:= true;
				l:= l^.sig;
			end;
			if (ok) then
				desordenada:= ok
			else
				desordenada:= ok;
		end;

	function ordenada(l: lista; s: string): Boolean;
		begin
			while (l <> nil) and (l^.dato < s) do
				l:= l^.sig;
			if (l^.dato = s) then
				ordenada:= true
			else
				ordenada:= false;
		end;

	var
		l, l2: lista;
		s: string;
	begin
		l:= nil;
		l2:= nil;
		read(s);
		crearListaDeStringOrdenada(l); {se dispone}
		crearListaDeStringDesordenada(l2); {se dispone}
		write('El valor está? ', desordenada(l2, s));
		write('El valor está? ', ordenada(l, s));
	end.

{
Se dispone de una lista de sitios turísticos (nombre del sitio y país) sin orden.
a) Realice un módulo que reciba la lista y un país y retorne la cantidad de ocurrencias del mismo.
b) Realice un módulo para agregar al final de la lista un nuevo sitio turístico que se recibe como parámetro. 
c) Dado un país, generar una nueva lista con los nombres de sus sitios turísticos, si existe. Dicha lista debe 
estar ordenada en forma ascendente.
}

program ejercicio4;

	type
		str = String[50];

		lista2 = ^nodo2;
		nodo2 = record
			nombre : str;
			sig: lista2;
		end;

		sitio  = record
			nombre: str;
			pais: str;
		end;

		lista = ^.nodo;
		nodo = record
			dato : sitio;
			sig: lista;
		end;

	procedure ocurrenciasPais(l: lista; var cantOcu: Integer; pais: str);
		begin
			cantOcu:= 0;
			while (l <> nil) do begin
				if (l^.dato.pais = pais) then
					cantOcu:= cantOcu + 1;
				l:= l^.sig;
			end;
		end;

	procedure leerR(var sitioTur: sitio);
		begin
			read(nombre);
			read(pais);
		end;

	procedure agregarAlFinal(var l: lista; sitioTur: sitio);
		var
			ant, nuevo: lista;
		begin
			new(nuevo);
			nuevo^.dato:= sitioTur;
			nuevo^.sig:= nil;
			if (l = nil) then
				l:= nuevo;
			else
				while (l <> nil) do begin
					ant:= l;
					l:= l^.sig;
				end;
				ant^.sig:= nuevo;
		end;

	procedure cargarEnLista(var l2: lista2, nombre: str);
		var
			act, ant, nuevo: lista2;
		begin
			new(nuevo);
			nuevo^.nombre:= nombre;
			nuevo^.sig:= nil;
			if (l2 = nil) then
				l2:= nuevo;
			else
				act:= l2;
				ant:= l2;
				while (act <> nil) and (act^.nombre < nombre) do begin
					ant:= act;
					act:= act^.sig;
				end;
				if (act = ant) then begin
					nuevo^.sig:= l2;
					l2:= nuevo;
				end
				else begin
					nuevo^.sig:= act;
					ant^.sig:= nuevo;
				end;
		end;

	procedure buscarEnLista(l: lista; var l2: lista2; pais: str);
		begin
			while (l <> nil) do begin
				if (l^.dato.pais = pais) then 
					cargarEnLista(l2, l^.dato.nombre);
				l:= l^.sig;
			end;
		end;

	var
		cantOcu: Integer;
		l: lista;
		l2: lista2;
		pais: str;
		sitioTur: sitio;
	begin
		l:= nil;
		l2:= nil;
		crearListaSitio(l); {Se dispone}
		read(pais);
		ocurrenciasPais(l, cantOcu, pais);
		write('La cantidad de ocurrencias para ese país fue de:', cantOcu);
		leerR(sitioTur);
		agregarAlFinal(l, sitioTur);
		read(pais);
		buscarEnLista(l, l2, pais);
	end.

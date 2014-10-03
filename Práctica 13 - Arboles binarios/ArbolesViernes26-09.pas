{
Se dispone de una lista con la informacion de archivos almacenados en un "pen drive". De cada archivo se conoce:
numero de archivo, fecha de creación, fecha de ultima actualización, extensión y tamaño (expresado en KB). Está
estructura no posee orden alguno.

	a) En base a la lista que se dispone generar una nueva estructura que contenga dos campos: tamaño (en KB) y 
	una lista con la información de los archivos que poseen dicho tamaño. Esta nueva estructura debe estar ordenada
	por tamaño y debe ser eficiente para realizar busquedas por dicho criterio.

	b) Una vez realizada la estructura del inciso a) se pide:
		i) Realizar un modulo que reciba la estrutura generada en el punto a), un tamaño y un numero de archivo y
		elimine dicho archivo sí existe.
		ii) Calcular e informar la cantidad de archivos cuyo tamaño es mayor que 1024KB y menor a 102400KB.
		iii) Calcular e informar la cantidad de archivos que poseen extension 'txt' o 'pdf'.
}

program arbolViernes26;

	type
		str = String[25];

		archivo = record
			nro_arch : Integer;
			fec_crea: str;
			fec_act: str;
			exten: str;
			tamanio: Integer;
		end;

		lista = ^nodo2;
		nodo2 = record
			dato: archivo;
			sig: lista;
		end;

		tipo_arch = record
			tamanio: Integer;
			archivos: lista;
		end;

		arbol = ^nodo;
		nodo = record
			dato: tipo_arch;
			hi: arbol;
			hd: arbol;
		end;

	procedure cargarEnLista(var l: lista; dato: archivo);
		var
			nuevo: lista;
		begin
			new(nuevo);
			nuevo^.dato:= dato;
			nuevo^.sig:= l;
			l:= nuevo;
		end;

	procedure agregarNodo(var a: arbol; dato: archivo);
		begin
			if (a = nil) then begin
				new(a);
				a^.dato.tamanio:= dato.tamanio;
				a^.dato.archivos:= nil;
				cargarEnLista(a^.dato.archivos, dato);
				a^.hi:= nil;
				a^.hd:= nil;
			end
			else
				if (a^.dato.tamanio = dato.tamanio) then begin
					cargarEnLista(a^.dato.archivos, dato)
				end
				else
					if (dato.tamanio < a^.dato.tamanio) then
						agregarNodo(a^.hi, dato)
					else
						agregarNodo(a^.hd, dato);
		end;

	procedure crearArbol(var a: arbol; l: lista);
		begin
			while (l <> nil) do begin
				agregarNodo(a, l^.dato);
				l:= l^.sig;
			end;
		end;

	procedure eliminar(var l: lista; nro_arch: Integer; var ok: Boolean);
		var
			act, ant: lista;
		begin
			act:= l;
			ant:= l;
			while (act <> nil) and (act^.dato.nro_arch <> nro_arch) do begin
				ant:= act;
				act:= act^.sig;
			end;
			if (act = nil) then
				ok:= false;
			else
				if (act = ant) then
					l:= l^.sig;
				else
					ant^.sig:= act^.sig;
				dispose(act);
				ok:= true;
		end;

	procedure buscarNodo(var a: arbol; tam, nro_arch: Integer; var ok: Boolean);
		begin
			if (a <> nil) then
				if (tam = a^.dato.tamanio) then
					eliminar(a^.dato.archivos, nro_arch, ok)
				else
					if (tam < a^.dato.tamanio) then
						buscarNodo(a^.hi, tam, nro_arch)
					else
						buscarNodo(a^.hd, tam, nro_arch);
		end;

	procedure filtrarTamnio(a: arbol; inf, sup: Integer; var cant: Integer);
		begin
			if (a <> nil) then
				if (a^.dato.tamanio >= inf) then
					if (a^.dato.tamanio <= sup) then begin
						cant:= cant + 1;
						filtrarTamnio(a^.hd, inf, sup);
						filtrarTamnio(a^.hi, inf, sup);
					end
					else
						filtrarTamnio(a^.hi, inf, sup);
				else
					filtrarTamnio(a^.hd, inf, sup);
		end;

	procedure buscarExtension(l: lista; var cantExt: Integer);
		begin
			while (l <> nil) do begin
				if (l^.dato.extension = 'txt') or (l^.dato.extension = 'pdf') then
					cantExt:= cantExt + 1;
				l:= l^.sig;
			end;
		end;

	var
		a: arbol;
		l: lista;
		inf, sup, cantExt, cant, tam, nro_arch: Integer;
		ok: Boolean;

	begin
		a:= nil;
		a:= nil;
		crearListaDeArchivos(l); {Se dispone}
		crearArbol(a, l);
		read(tam, nro_arch);
		buscarNodo(a, tam, nro_arch, ok);
		if (ok) then
			write('Se elimino correctamente');
		else
			write('No se elimino correctamente');
		filtrarTamnio(a, inf, sup, cant);
		write('La cantidad de archivos con tamaño entre 1024KB y 102499KB es ', cant);
		buscarExtension(l, cantExt);
		write('La cantidad de extensiones PDF o TXT es ', cantExt);
	end.

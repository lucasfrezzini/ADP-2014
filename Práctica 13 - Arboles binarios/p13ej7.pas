{
Se  dispone  de  una  lista  con  la  información  de  los  animales  de  una  reserva  natural.  De  cada 
animal se registra: nombre popular (por ejemplo: “Pelusa”, “Pepe”, “Toto”, etc), nombre científico 
(por ejemplo: “León”, “Elefante”, etc), familia (por ejemplo “felino”, “reptil”, “ave”, etc), edad y fecha 
de ingreso a la reserva. Esta estructura esta ordenada por nombre científico.

	a)  Genere una nueva estructura con la siguiente información: nombre de la familia y cantidad de 
	animales  de  esa  familia.  Esta  información  debe  estar  ordenada  por  familia  y  debe  ser 
	eficiente para la búsqueda por dicho criterio. 
	Luego de realizar el inciso a), seleccione la estructura más adecuada para: 
	b)  Realizar un módulo que retorne cuál es la familia que cuenta con mayor cantidad de animales 
	en el zoológico. 
	c)  Realizar un módulo que informe el total de animales que tiene el zoológico por cada nombre 
	científico. 
}

program ejercicio7;

	type
		str: String[30];

		dato_animal = record
			familia: str;
			cant: Integer
		end;

		animal = record
			nom_pop: str;
			nom_cie: str;
			familia: str;
			edad: Integer;
			fecha: str;
		end;

		arbol = ^nodo;
		nodo = record
			dato: dato_animal;
			hi: arbol;
			hd: arbol;
		end;

		lista = ^nodo2;
		nodo2 = record
			dato : animal;
			sig: lista;
		end;
 
 	procedure cargarNodo(var a: arbol; dato: str);
	 	begin
	 		if (a = nil) then
	 		begin
	 			new(a);
	 			a^.dato.familia:= dato;
	 			a^.dato.cant:= 1;
	 			a^.hi:= nil;
	 			a^.hd:= nil;
	 		end
	 		else
	 			if (dato = a^.dato.familia) then
		 			a^.dato.cant = a^.dato.cant + 1
		 		else
		 			if (dato < a^.dato.familia) then
		 				cargarNodo(a^.hi, dato);
		 			else
		 				cargarNodo(a^.hd, dato);
	 	end;

 	procedure recorrerLista(var a: arbol; l: lista);
	 	begin
	 		while (l <> nil) do begin
	 			cargarNodo(a, l^.dato.familia);
	 			l:= l^.sig;
	 		end;
	 	end;

	procedure maximo(a: arbol; var fam: str; var max: Integer);
		begin
			if (a <> nil) then begin
				if (a^.dato.cant > max) then begin
					max:= a^.dato.cant;
					fam:= a.dato.familia;
				end;
				maximo(a^.hi, fam, max);
				maximo(a^.hd, fam, max);
			end;
		end;

	procedure cantAnimales(l:lista);
		var
			cant: Integer;
			act: str;
		begin
			while (l <> nil) do begin
				cant:= 0;
				act:= l^.dato.nom_cie;
				while (l <> nil) and (act = l^.dato.nom_cie) do begin
					cant:= cant + 1;
					l:= l^.sig;
				end;
				write('La cantidad de animales con el nombre científico ',act, ' es: ', cant);
			end;
		end;

	procedure inicializar(var a: arbol);
		begin
			a:= nil;
		end;

	var
		a: arbol;
		l: lista;
		fam: str;
		max: Integer;

	begin
		crearLista(l); {Se dispone}
		inicializar(a);
		recorrerLista(a, l);
		maximo(a, fam, max);
		write('La familia que cuenta con más animales en el zoológico es ', fam, ' con un total de ', max, 'de animales');
		cantAnimales(l);
	end.

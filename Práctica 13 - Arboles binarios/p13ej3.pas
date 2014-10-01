{
Se leen números desde teclado hasta que se ingresa el número 0. Generar un árbol binario de 
búsqueda donde para cada número aparezca la cantidad de veces  que fue leído. El árbol debe 
estar ordenado por número. 

Una vez generado el árbol, realice módulos independientes para:
	a)  Informar el número que fue leído mayor cantidad de veces.
	b)  Informar el número más chico leído.
}

program ejercicio3;

	type
		reg = record
			num : Integer;
			cant: Integer;
		end;

		arbol = ^nodo;
		nodo = record
			dato : reg
			hi: arbol;
			hd: arbol;			
		end;

	procedure agregarNodo(var a: arbol; num: Integer);
		begin
			if (a = nil) then begin
				new(a);
				a^.dato.num:= num;
				a^.dato.cant:= 1;
				a^.hi:= nil;
				a^.hd:= nil:
			end
			else
				if (a^.dato.num = num) then
					a^.dato.cant:= a^.dato.cant + 1
				else
					if (num < a^.dato.num) then
						agregarNodo(a^.hi, num)
					else
						agregarNodo(a^.hd, num);
		end;

	procedure crearArbol(var a: arbol);
		var
			nuevo: reg;
			num: Integer;
		begin
			read(num);
			while (num <> 0) do begin	


				agregarNodo(a, num);
				read(num);
			end;
		end;

	procedure maximo(a: arbol; var cant: Integer; var num: Integer);
		begin
			if (a <> nil) then begin
				if (a^.dato.cant > cant) then
					cant:= a^.dato.cant;
					num:= a^.dato.num;
				maximo(a^.hi, cant, num);
				maximo(a^.hd, cant, num);
			end;
		end;

	function minimo(a: arbol): Integer;
		begin
			if (a = nil) then 
					minimo := nil;
				else
					if (a^.hi = nil) then 
							minimo := a^.dato.num;
						else
							minimo := minimo(a^.hi);	
		end;

	procedure inicializar(var a: arbol);
		begin
			a:= nil;
		end;

	var
		a: arbol;
		num, cant, min: Integer;

	begin
		num:= -1;
		cant:= 0;
		inicializar(a);
		crearArbol(a);
		maximo(a, cant, num);
		write('El numero que más cantidad de repetidos tiene es: ', num);
		min:= minimo(a);
		write('El numero más chico leído es: ', min);
	end.

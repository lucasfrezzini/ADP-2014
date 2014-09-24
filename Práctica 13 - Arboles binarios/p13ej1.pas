{
Se leen números desde teclado hasta que se ingresa el número 0. Almacenarlos en un árbol 
binario de búsqueda. 
Una vez generado el árbol, realice módulos independientes para: 

a) Obtener el número más grande.
b) Obtener el número más chico.
c) Obtener la cantidad de elementos. 
d) Informar los números en orden creciente.
e) Informar los números pares en orden decreciente.

NOTA: Tener en cuenta que cada número debe aparecer una única vez en el árbol.
}

program ejercicio1;

	type
		arbol = ^nodo;
		nodo = record
			num: Integer;
			hi: arbol;
			hd: arbol;
		end;

	procedure crearArbol(var a: arbol; num: Integer);
		begin
			if (a = nil) then begin
				new(a);
				a^.num:= num;
				a^.hi:= nil;
				a^.hd:= nil;	
			end
			else
				if (num < a^.num) then
					crearArbol(a^.hi, num);
				else
					if (num > a^.num) then	
						crearArbol(a^.hd, num);
		end;

	procedure generarArbol(var a: arbol);
		var
			num: Integer;
		begin
			read(num);
			while (num <> 0) do begin
				crearArbol(a, num);
				read(num);
			end;
		end;

	function minimo(a: arbol): arbol;
		begin
			if (a = nil) then 
					minimo := nil;
				else
					if (a^.hi = nil) then 
							minimo:= a;
						else
							minimo:= minimo(a^.hi);	
		end;

	function maximo(a: arbol): arbol;
		begin
			if (a = nil) then 
					maximo := nil;
				else
					if (a^.hd = nil) then 
							maximo:= a;
						else
							maximo:= maximo(a^.hd);	
		end;	

	procedure buscarNumeros(a: arbol; var numMax: integer; var numMin: integer);
		var
			x: arbol;
		begin
			x:= minimo(a);
			numMin:= x^.num;
			x:= maximo(a);
			numMax:= x^.num;
		end;

	procedure cantNodos(a: arbol; var cant: Integer);
		begin
			if (a <> nil) then begin
				cant:= cant + 1;
				cantNodos(a^.hi, cant);
				cantNodos(a^.hd, cant);
			end;
		end;

	{Imprimir en ORDEN, genial, de forma CRECIENTE}
	procedure enOrden(a: arbol);
		begin
			if (a <> nil) then begin
				enOrden(a^.hi);
				write('El numero es: ', a^.num);
				enOrden(a^.hd);
			end;
		end;

	procedure parEnOrden(a: arbol);
		begin
			if (a <> nil) then begin
				parEnOrden(a^.hd);
				if (a^.num mod 2 = 0) then
					write('El numero par es: ', a^.num);
				parEnOrden(a^.hi);
			end;
		end;	

	var
		a: arbol;
		numMax, numMin: integer;
	begin
		a:= nil;
		numMax:= -1;
		numMin:= 99999;
		generarArbol(a);
		buscarNumeros(a, numMax, numMin);
		write('El numero Maximo del arbol es: ', numMax);
		write('El numero Minimo del arbol es: ', numMin);
		cantNodos(a, cant);
		write('La cantidad de elementos del arbol es: ', cant);
		enOrden(a);
		parEnOrden(a);
	end.

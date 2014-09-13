{
Escriba un programa que dada una lista de enteros L:
	-Genere una nueva lista que contenga los números pares que aparecen en L.
	-Informe la cantidad de números que comienzan con un dígito impar. 
	-Informe el porcentaje de números entre 10 y 50. 
Nota: Modularizar la solución. La lista L debe ser recorrida solo una vez
}

program ejercicio2;

	type
		lista = ^nodo;
		nodo = record
			dato : Integer;
			sig: lista;
		end;

	procedure crearListaPar(var l2:lista; numero: Integer);
		var
			nuevo: lista;
		begin
			new(nuevo);
			nuevo^.dato:= numero;
			nuevo^.sig:= nil;
			if (l2 = nil) then
				l2 = nuevo;
			else
				nuevo^.sig:= l2;
				l2:= nuevo;
		end;

	procedure primImpar(numero: Integer; var cantImp: Integer);
		var
			dig: Integer;
		begin
			while (numero <> 0) do begin
				dig:= numero MOD 10;
				numero:= numero DIV 10;
			end;
			if (dig MOD 2 = 1) then 
				cantImp:= cantImp + 1;
			end;
		end;

	function porcentaje(cantidadNum: Integer, total: Integer): real;
		var
			porc: real;
		begin
			porc:= (cantidadNum/total) * 100;
			porcentaje:= porc;
		end;

	procedure recorrerParaAnalizar(l: lista, var l2: lista);
	var
		cantImp, cantidadNum, total: Integer;
	begin
		cantImp:= 0;
		cantidadNum:= 0;
		total:= 0;
		while (l <> nil) do begin
			if (l^.dato MOD 2 = 0) then 
				crearListaPar(l2, l^.dato);
			primImpar(l^.dato, cantImp);
			total:= total + 1;
			if (l^.dato >= 10) and (l^.dato <= 50) then
				cantidadNum:= cantidadNum + 1;
			l:= l^.sig;
		end;
		write('La cantidad de numeros con el primer digito Impar es: ', cantImp);
		write('El porcentaje de numeros entre 10 y 50 es: ', porcentaje(cantidadNum, total));
	end;

	var
		l: lista;
		l2: lista;

	begin
		l2:= nil;
		l:= nil;
		crearLista(l); {Se dispone está lista}
		recorrerParaAnalizar(l, l2);
	end.

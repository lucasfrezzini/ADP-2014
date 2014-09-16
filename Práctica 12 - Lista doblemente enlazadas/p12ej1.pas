{
Escribir un programa que lea una secuencia de números positivos hasta que se ingresa el 0, el 
cual no debe procesarse. Los números leídos deben ser almacenados en orden ascendente en
una lista doblemente enlazada. Los números se leen en orden, por ejemplo: 1, 2, 7, 9, 28, 37, 0.

Finalizada la lectura, imprimir en pantalla los números en forma ascendente (de menor a mayor) 
y descendente (de mayor a menor).
}

program ejercicio1;

	type
		lista = ^nodo;
		nodo = record
			num: Integer;
			sig: lista;
			ant: lista;
		end;

		listaDoble = record
			pri: lista;
			ult: lista;
		end;

	procedure crearLista(var ld: listaDoble; num: Integer);
		var
			nuevo: lista;
		begin
			new(nuevo);
			nuevo^.num:= num;
			nuevo^.sig:= nil;
			nuevo^.ant:= nil;
			if (ld.pri = nil) then
				ld.pri:= nuevo;
			else begin
				ld.ult^.sig:= nuevo;
				nuevo^.ant:= ld.ult;
			end;
			ld.ult:= nuevo;				
		end;
				
		end;

	procedure leerNumeros(var ld: listaDoble);
		var
			num: Integer;
		begin
			read(num);
			while (num <> 0) do begin
				crearLista(ld, num);
				read(num);
			end;
		end;

	procedure imprimirAsc(pri: lista);
		begin
			while (pri <> nil) do begin
				write(pri^.num);
				pri:= pri^.sig;
			end;
		end;

	procedure imprimirDesc(ult: lista);
		begin
			while (ult <> nil) do begin
				write(ult^.num);
				ult:= ult^.ant;
			end;
		end;

	procedure inicializarListaDoble(var ld: listaDoble);
		begin
			ld.pri:= nil;
			ld.ult:= nil;
		end;

	var
		ld: listaDoble;

	begin
		inicializarListaDoble(ld);
		leerNumeros(ld);
		imprimirAsc(ld.pri);
		imprimirDesc(ld.ult);
	end.
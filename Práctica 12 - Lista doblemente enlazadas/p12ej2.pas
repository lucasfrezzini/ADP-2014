{
Modificar el programa del inciso 1) de modo que haga exactamente lo mismo pero los números 
ahora se leen sin orden, por ejemplo: 28, 2, 9, 37, 51, 1, 7, 0.
}

program ejercicio2;

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

	procedure crearListaOrdenada(var ld: listaDoble; num: Integer);
		var
			nuevo, act, ant: lista;
		begin
			new(nuevo);
			nuevo^.num:= num;
			nuevo^.sig:= nil;
			nuevo^.ant:= nil;
			if (ld.pri = nil) then begin
				ld.pri:= nuevo;
				ld.ult:= nuevo;
			end
			else begin
				act:= ld.pri;
				ant:= ld.pri;
				while (act <> nil) and (act^.num < num) do begin
					ant:= act;
					act:= act^.sig;
				end;
				if (act = ant) then begin
					nuevo^.sig:=ld.pri;
					ld.pri^.ant:= nuevo;
					ld.pri:= nuevo;
				end
				else 
					if (act <> nil) then begin
						nuevo^.sig:= act;
						act^.ant:= nuevo;
					end
					else
						ld.ult:= nuevo;
					ant^.sig:= nuevo;
					nuevo^.ant:= ant;				
			end;
				
		end;

	procedure leerNumeros(var ld: listaDoble);
		var
			num: Integer;
		begin
			read(num);
			while (num <> 0) do begin
				crearListaOrdenada(ld, num);
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

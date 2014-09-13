{
a) Se debe leer y almacenar la informacion de llamadas realizadas, en un mes determinado, para una central de
telefonia celular. De cada llamada se lee: numero de telefono, fecha y hora de la llamada, duracion (exp en min)
de la llamada, DNI del titular de la linea, numero de destino, empresa del telefono destino. La lectura finaliza 
cuando se lee el DNI 0. La lista generada debe quedar ordenada por DNI del titular de la linea.

b) UNA VEZ LEIDA Y ALMACENADA la informacion, calcule e informe:
 - El promedio de duración de llamadas para cada titular
 - Los dos DNI de titulares que menos minutos hablaron
}

program telefonica;
	type
		str = String[30];

		llamada = record
			numTel: Integer;
			fyh: str;
			duracion: Integer;
			dni: Integer;
			numDest: Integer;
			emprDest: str;
		end;

		lista = ^nodo;
		nodo = record
			dato: llamda;
			sig: lista;
		end;

	procedure leerLlamada(var l: llamada);
		begin
			read(l.dni);
			if (l.dni <> 0) then begin
				read(l.numTel);
				read(l.fyh);
				read(l.duracion);
				read(l.numDest);
				read(l.emprDest);
			end;
		end;

	procedure ordenada(var L: lista; l: llamada);
		var
			nuevo, act, ant: lista;
		begin
			new(nuevo);
			nuevo^.dato:= l;
			nuevo^.sig:= nil;	
			if (L = nil) then
				L:= nuevo;
			else
				act:= L;
				ant:= L;
				while (act <> nil) and (act^.dato.dni < l.dni) do begin
					ant:= act;
					act:= act^.sig;
				end;
				if (act = ant) thenn begin
					L:= nuevo;
				end
				else
					ant^.sig:= nuevo;
				nuevo^.sig:= act;
		end;

	procedure crearListaOrdenada(var L: lista);
		var
			l: llamada;
		begin
			leerLlamada(l);
			while (l.dni <> 0) do begin
				ordenada(L, l);
				leerLlamada(l);
			end;
		end;

	function promedio(durTotal: Integer; totLlam: Integer;): real;
		begin
			promedio:= durTotal / totLlam;
			{promedio = sumaTotal/cantTOTAL}
		end;

	procedure mismoDni(dur: integer; var durTotal: Integer; var totLlam: integer);
		begin
			durTotal:= durTotal + dur;
			totLlam:= totLlam + 1;
		end;

	procedure minimo(durTotal: integer; dni: integer; var min1: integer; var min2: integer; var dni1: integer, var dni2: integer);
		begin
			if (durTotal < min1) then begin
				min2:= min1;
				dni2:= dni1;
				min1:= durTotal;
				dni1:= dni;
			end
			else
				if (durTotal < min2) then begin
					min2:= durTotal;
					dni2:= dni;
				end;
		end;

	procedure recorrerLista(L: lista);
		var
			act, ant, min1, min2, dni1, dni2:= Integer;

		begin
			min1:= 99999;
			dni1:= 0;
			while (L <> nil) do begin
				act:= L^.dato.dni;
				durTotal:= 0;
				totLlam:= 0;
				while (l <> nil) and (act = L^.dato.dni) do begin {tambien hace l<>nil acá para no salirme de la lista}
					{con act mantengo el ultimo DNI para los calculos}
					mismoDni(L^.dato.duracion, durTotal, totLlam);
					L:= L^.sig;
				end;
				write('El promedio de duracion de llamadas para el DNI Titular: ', act, 
					  'es de: ', promedio(durTotal, totLlam), '%');
				minimo(durTotal, ant, min1, min2, dni1, dni2);
			end;
			write('EL DNI: ', dni1, 'fue el que menos hablo con un total de:', min1, 'minutos.');
			write('EL DNI: ', dni2, 'fue el que menos hablo con un total de:', min2, 'minutos.');
		end;

	var
		L: lista;
	begin
		L:= nil;
		crearListaOrdenada(L);
		recorrerLista(L);
	end.

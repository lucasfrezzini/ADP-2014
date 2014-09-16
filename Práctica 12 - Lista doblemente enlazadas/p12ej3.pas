{
Escribir un programa que lea la información de personas, de cada persona se lee: DNI, Apellido y 
Nombre. La lectura finaliza cuando llega la persona con DNI 0, la cual no debe procesarse. 
Almacene a las personas en una lista doblemente enlazada ordenada por DNI de forma 
ascendente. Las personas se leen desordenadas por DNI.

a. Una vez finalizada la carga:
	i. Escriba un módulo para actualizar la información de una persona. Para ello el 
	módulo debe leer un DNI, buscar dicho DNI en la lista y si existe actualizar el 
	Apellido y Nombre, leyendo nuevos datos desde teclado.

	ii. Escriba un módulo que imprima en pantalla la lista de forma ascendente y en forma 
	descendente.
}

program ejercicio3;

	type
		str = String[30];
		persona = record
			dni: Integer;
			nombre: str;
		end;

		lista = ^nodo;
		nodo = record
			dato: persona;
			sig: lista;
			ant: lista;
		end;

		listaDoble = record
			pri: lista;
			ult: lista;
		end;

	procedure crearLista(var ld: listaDoble; p: persona);
		var
			nuevo, act, ant: lista;

		begin
			new(nuevo);
			nuevo^.dato:= p;
			nuevo^.sig:= nil;
			nuevo^.ant:= nil;
			if (ld.pri = nil) then begin
				ld.pri:= nuevo;
				ld.ult:= nuevo;
			end
			else
				act:= ld.pri;
				ant:= ld.pri;
				while (act <> nil) and (act^.dato.dni < p.dni) do begin
					ant:= act;
					act:= act^.sig;
				end;
				if (act = ant) then begin
					nuevo^.sig:= ld.pri;
					ld.pri^.ant:= nuevo;
					ld.pri:= nuevo;
				end
				else begin
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

	procedure leerPersona(var p: persona);
		begin
			read(p.dni);
			if (p.dni <> o) then
				read(p.nombre)
		end;

	procedure almacenarPersonas(var ld: listaDoble);
		var
			p: persona;
		begin
			leerPersona(p);
			while (p.dni <> 0) do begin
				crearLista(ld, p);
				leerPersona(p);
			end;
		end;

	procedure buscarAndMod(var ld: listaDoble; dni: Integer);
		var
			nombre: str;
			act: lista;
		begin
			act:= ld.pri;
			while (act <> nil) and (act.dato.dni <> dni) do
				act:= act^.sig;
			if (act <> nil) then begin
				read(nombre);
				act^.dato.nombre:= nombre;
			end;
		end;

	procedure actualizarInfo(var ld: listaDoble);
		var
			dni: Integer;
		begin
			read(dni);
			buscarAndMod(ld, dni);
		end;

	procedure imprimirAsc(pri: lista);
		begin
			while (pri <> nil) do
			begin
				write(pri^.dato.dni);
				write(pri^.dato.nombre);
				pri:= pri^.sig;
			end;
		end;

	procedure imprimirDesc(ult: lista);
		begin
			while (ult <> nil) do
			begin
				write(ult^.dato.dni);
				write(ult^.dato.nombre);
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
		almacenarPersonas(ld);
		actualizarInfo(ld);
		imprimirAsc(ld.pri);
		imprimirDesc(ld.ult);
	end.

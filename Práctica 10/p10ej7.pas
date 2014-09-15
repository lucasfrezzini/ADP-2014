{
Realice un programa que genere una lista con información de participantes a un congreso de Medicina. De 
cada uno de ellos se conoce: Apellido y Nombre, Sexo, Especialidad y Fecha (día, mes y año) en la que comenzó 
a ejercer la profesión. La lectura de la información finaliza cuando se lee el Apellido y nombre = ‘ZZZ’.   Para la 
generación de la lista implemente un módulo. La lista debe estar  ordenada por Apellido y Nombre en forma 
ascendente.

Una vez finalizada la lectura de los datos, se pide:

a) Informar los nombres de las mujeres cuya especialidad sea 'Oculista'.
b) Generar una lista con los varones cuyos años de ejercicio profesional están entre 20 y 25.
c) Implemente un módulo recursivo que reciba la lista generada e informe los nombres de los participantes en 
forma descendente. Analice una solución iterativa.

Nota: asuma que todos los meses tienen 30 días y no hay años bisiestos

###############################################################################
### NOTA2: Los años de Ejerción Profesional los calculo con los años nomás. ###
###############################################################################
}

program ejercicio7;
	type
		str = string[50];

		fechas = record
			dia : 1..30;
			mes: 1..12;
			ano: 1900..2050;
		end;

		estudiante = record
			nom: str;
			sexo: str;
			esp: str;
			fecha: fechas;
		end;

		lista = ^nodo;
		nodo = record
			dato: estudiante;
			sig: lista;
		end;

	procedure leerEstudiante(var e: estudiante);
		begin
			read(e.nom);
			if (e.nombre <> 'ZZZ') then begin
				read(e.sexo);
				read(e.esp);
				read(e.fecha.dia);
				read(e.fecha.mes);
				read(e.fecha.año);
			end;
		end;

	procedure insertar(var l: lista; e: estudiante);
		var		
			act, ant, nuevo: lista;
		begin
			new(nuevo);
			nuevo^.dato:= e;
			nuevo^.sig:= nil;
			if (l = nil) then begin
				l:= nuevo;
			end
			else begin
				act:= l;
				ant:= l;
				while (act <> nil) and (act^.dato.nom > e.nom) do begin
					ant:= act;
					act:= act^.sig;
				end;
				if (act = ant) then
					act:= nuevo;
				end
				else
					ant^.sig:=nuevo;
				nuevo^.sig:= act;
			end;
		end;

	procedure crearLista(var l: lista);
		var
			e: estudiante;
		begin
			leerEstudiante(e);
			while (e.nom <> 'ZZZ') do begin
				insertar(l, e);
				leerEstudiante(e);
			end;
		end;

	procedure informarNombres(esp: str; nom: str);
		begin
			if (esp = 'Oculista') then
				write('La mujer Oculista es: ', nom);
		end;

	procedure crearListaVarones(var l2: lista; e: estudiante);
		var
			nuevo: lista;
		begin
			new(nuevo);
			nuevo^.dato:= e;
			nuevo^.sig:= l2;
			l2:= nuevo;
		end;

	procedure varones(var l2: lista; e: estudiante);
		var
			calculo: Integer;
		begin
			calculo:= 2014 - e.fecha.ano;
			if (calculo <= 25) and (calculo >= 20) then
				crearListaVarones(l2, e);
		end;

	procedure recorrerLista(l: lista; var l2: lista);
		begin
			while (l <> nil) do begin
				if (l^.dato.sexo = 'Femenino') then
					informarNombres(l^.dato.esp, l^.dato.nom)
				else
					varones(l2, l^.dato);
			end;
		end;

	procedure recursivo(l: lista);
		begin
			if (l <> nil) then begin
				recursivo(l^.sig);
				write('Su nombre es: ', l^.dato.nom);
			end;
		end;

	var
		l, l2: lista;
	begin
		l:= nil;
		l2:= nil;
		crearLista(l);
		recorrerLista(l, l2);
		recursivo(l);
	end.

{
Se dispone de una lista con la información de alumnos de ADP, de cada alumno se conoce: legajo, apellido, nombre, DNI y año
de ingreso. La lista no posee orden alguno.

Genere una nueva estructura que contenga para cada año de ingreso el listado de los alumnos correspondientes a dicho año. Esta
estructura debe estar ordenado por año de ingreso y debe ser eficiente para la busqueda por dicho criterio.

Luego de genera la nueva estructura, utilice la misma para implementar:

	a) Un módulo que informe la cantidad de alumnos por cada año de ingreso
	b) Un módulo que informe el legajo de aquellos alumnos cuyo año de ingreso sea entre el 2000 y 2013
	c) Un módulo que reciba un año de ingreso, DNI y elimine el alumno de la lista correspondiente.
}

program arbMartes23;

	type
		str = String[20];

		alumno = record
			legajo: Integer;
			apellido: str;
			nombre: str;
			dni: Integer;
			ingreso: Integer;
		end;

		lista = ^nodo2;
		nodo2 = record
			dato: alumno;
			sig: lista;
		end;;

		dato_alumno = record
			ingreso: Integer;
			alumnos: lista;
		end;

		arbol = ^nodo;
		nodo = record
			dato: dato_alumno;
			hi: arbol;
			hd: arbol;
		end;

	procedure cargarEnLista(var l: lista; dato: alumno);
		var
			nuevo: lista;
		begin
			new(nuevo);
			nuevo^.dato:= dato;
			nuevo^.sig:= l;
			l:= nuevo;
		end;

	procedure agregarNodo(var a: arbol; dato: alumno);
		begin
			if (a = nil) then begin
				new(a);
				a^.dato.ingreso:= dato.ingreso;
				a^.dato.alumnos:= nil;
				cargarEnLista(a^.dato.alumnos, dato);
				a^.hi:= nil;
				a^.hd:= nil;
			end
			else
				if (dato.ingreso = a^.dato.ingreso) then
					cargarEnLista(a^.dato.ingreso, dato)
				else
					if (dato.ingreso < a^.dato.ingreso) then begin
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

	function contarAlum(l: lista): Integer;
		var
			cant: Integer;
		begin
			cant:= 0;
			while (l <> nil) do begin
				cant:= cant + 1;
				l:= l^.sig;
			end;
			contarAlum:= cant;
		end;

	procedure cantAlumnos(a: arbol);
		var
			cant: Integer;
		begin
			if (a <> nil) then begin
				write('La cantidad de Alumnos para el año ', a^.dato.ingreso, ' es ', contarAlum(a^.dato.alumnos));
				cantAlumnos(a^.hi);
				cantAlumnos(a^.hd);
			end;
		end;

	procedure filtrarIngreso(a: arbol; inf, sup: Integer);
		begin
			if (a <> nil) then
				if (a^.dato.ingreso >= inf) then
					if (a^.dato.ingreso <= sup) then begin
						write('El legajo de los alumnas con año de ingreso entre 2000 y 2013 es ', a^.dato.legajo);
						filtrarIngreso(a^.hi, inf, sup);
						filtrarIngreso(a^.hd, inf, sup);
					end
					else
						filtrarIngreso(a^.hi, inf, sup);
				else
					filtrarIngreso(a^.hd, inf, sup);
		end;

	procedure eliminar(var l: lista; dni: Integer; var ok: boolean);
		var
			act, ant: lista;
		begin
				act:= l;
				ant:= l;
				while (act <> nil) and (act^.dato.dni <> dni) do begin
					ant:= act;
					act:= act^.sig;
				end;
				if (act <> nil) then
				   if (act = l) then
					 l:= l^.sig;
				   else
					  ant^.sig:= act^.sig;
				   dispose(act);
				   ok:= true;
				else
				   ok := false;

		end;

	procedure buscarIngreso(var a: arbol; dni, ingreso: Integer , var ok: boolean);
		begin
			if (a <> nil) then begin
				if (a^.dato.ingreso = ingreso) then begin
					eliminar(a^.dato.alumnos, dni, ok)
				end
				else
					if (ingreso < a^.dato.ingreso) then 
						buscarIngreso(a^.hi, dni, ingreso)
					else
						buscarIngreso(a^.hd, dni, ingreso);
			end;
		end;

	var
		a: arbol;
		l: lista;
		dni, ingreso, inf, sup: Integer;

	begin
		a:= nil;
		l:= nil;
		inf:= 2000;
		sup:= 2013;
		crearListaDeAlumnos(l); {Se dispone}
		crearArbol(a, l);
		cantAlumnos(a);
		filtrarIngreso(a, inf, sup);
		read(dni);
		read(ingreso);
		buscarIngreso(a, dni, ingreso, ok);
		if (ok) then
			write('El alumno se elimino correctamente.');
		else
			write('El alumno no se pudo eliminar porque no era correcto.');
	end.

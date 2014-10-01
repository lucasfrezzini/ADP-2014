{
Se  dispone  de  una  lista  con  la  información  de  alumnos  de  ADP,  de  cada  alumno  se  registra: 
legajo,  apellido,  nombre,  DNI  y  año  de  ingreso.  Genere  una  nueva  estructura  con  aquellos 
alumnos que posean año de ingreso posterior al 2000. Esta  estructura debe estar ordenada por 
legajo  y  debe  ser  eficiente  para  la  búsqueda  por  dicho  criterio.  Luego  de  generar  la  nueva 
estructura, realice:

	a)  Un  módulo  que  reciba  la  nueva  estructura  e  informe  el  nombre  y  apellido  de  aquellos 
	alumnos cuyo legajo sea superior a 12803.
	b)  Un  módulo  que  reciba  la  nueva  estructura  e  informe  el  nombre  y  apellido  de  aquellos 
	alumnos cuyo legajo este comprendido entre 2803 y 6982.
}

program ejercicio5;

	type
		str = String[25];

		alumno = record
			legajo: Integer;
			apellido: str;
			nombre: str;
			dni: Integer;
			ingreso: Integer;
		end;

		lista = ^nodo;
		nodo = record
			dato: alumno;
			sig: lista;
		end;

		arbol = ^nodo2;
		nodo2 = record
			dato : alumno;
			hi: arbol;
			hd: arbol;
		end;

	procedure agregarNodo(var a: arbol; alum: alumno);
		begin
			if (a = nil) then begin
				new(a);
				a^.dato:= alum;
				a^.hd:= nil;
				a^.hi:= nil;
			end
			else
				if (alum.legajo < a^.dato.legajo) then
					agregarNodo(a^.hi, alum);
				else
					agregarNodo(a^.hd, alum);
		end;

	procedure crearArbol(var a: arbol; l: lista);
		begin
			while (l <> nil) do begin
				if (l^.dato.ingreso >= 2000) then begin
					agregarNodo(a, l^.dato);
				end;
				l:= l^.sig;
			end;
		end;

	procedure legSuperior(a: arbol);
		begin
			if (a <> nil) then begin
				if (a^.dato.legajo > 12803) then
					write('El alumno ', a^.dato.nombre, ' ', a^.dato.apellido, 'posee un legajo mayor a 12803');
				legSuperior(a^.hi);
				legSuperior(a^.hd);
			end;
		end;

	procedure legComprendido(a: arbol; inf: Integer; sup: Integer);
		begin
			if (a <> nil) then begin
				if (a^.dato.legajo >= inf) then
					if (a^.dato.legajo <= sup) then begin
						write('El alumno ', a^.dato.nombre, ' ', a^.dato.apellido, 'se encuentra en el rango de legajos 2803 y 6982');
						legComprendido(a^.hi, inf, sup);
						legComprendido(a^.hd, inf, sup);
					end
					else
						legComprendido(a^.hi, inf, sup);
				else
					legComprendido(a^.hd, inf, sup);
			end;
		end;

	procedure inicializar(var a: arbol);
		begin
			a:= nil;
		end;

	var
		sup, inf: Integer;
		a: arbol;
		l: lista;

	begin
		inf:= 2803;
		sup:= 6982;
		inicializarLista(l); {Se disponen}
		crearLista(l); {Se disponen}
		inicializar(a);
		crearArbol(a, l);
		legSuperior(a, inf, sup);
	end.

{
Se  lee  desde  teclado  los  datos  de  empleados.  De  cada  empleado  se  ingresa:  número  de 
empleado, nombre, apellido y DNI. La lectura finaliza cuando se lee el DNI 0. Almacenarlos en un 
árbol  binario  de  búsqueda  ordenándolos  por  número  de  empleado.  Luego  de  generar  la 
estructura, realice:

	a)  Un módulo  que reciba el árbol e informe el nombre y apellido de aquellos empleados cuyo 
	DNI termina con un número par.
	b)  Un  módulo  que  reciba  el  árbol  y  retorne  el  empleado  que  posee  el  máximo  número  de 
	empleado.
	c)  Un módulo que reciba el árbol y retorne la cantidad total de empleados. 
}

program ejercicio4;
	
	type
		str = String[20];

		empleado = record
			nro : Integer;
			nombre: str;
			apellido: str;
			dni: Integer;
		end;

		arbol = ^nodo;
		nodo = record
			dato : empleado;
			hi: arbol;
			hd: arbol;
		end;

		procedure leerEmpleado(var e: empleado);
			begin
				read(e.dni);
				if (e.dni <> '0') then begin
					read(e.nombre);
					read(e.apellido);
					read(e.nro);
				end;
			end;

		procedure agregarNodo(var a: arbol; e: empleado);
			begin
				if (a = nil) then begin
					new(a);
					a^.dato:= e;
					a^.hi:= nil;
					a^.hd:= nil;
				end
				else
					if (e.nro < a^.dato.nro) then
						agregarNodo(a^.hi, e);
					else
						agregarNodo(a^.hd, e);
			end;

		procedure crearArbol(var a: arbol);
			var
				e: empleado;
			begin
				leerEmpleado(e);
				while (e.dni <> '0') do begin
					agregarNodo(a, e);
					leerEmpleado(e);
				end;
			end;

		procedure impEmp(a: arbol; aux: Integer);
			begin
				if (a <> nil) then begin
					impEmp(a^.hi, aux);
					aux:= a^.dato.dni mod 10;
					if (aux mod 2 = 0) then
						write('El empleado ', a^.dato.nombre, ' ', a^.dato.apellido, 'tiene el ultimo numero del DNI par');
					impEmp(a^.hd, aux);
				end;
			end;

		procedure maxNroEmp(a: arbol; var emp: empleado);
			begin
				if (a <> nil) then begin
					maxNroEmp(a^.hd);
					if (a^.hd = nil) then
					begin
						emp:= a^.dato;
					end;
				end;
			end;

		procedure cantNodos(a: arbol; var cant: Integer);
			begin
				if (a <> nil) then begin
					cant:= cant + 1;
					cantNodos(a^.hi, cant);
					cantNodos(a^.hd, cant);
				end;
			end;

		procedure inicializar(var a: arbol);
			begin
				a^.hd:= nil;
				a^.hi:= nil;
			end;

	var
		cant, aux: Integer;
		a: arbol;
		emp: empleado;

	begin
		inicializar(a);
		cant:= 0;
		crearArbol(a);
		impEmp(a, aux);
		maxNroEmp(a, emp);
		write('El empleado con el Numero de Empleado mayor, es: ', emp.nombre, ' ', emp.apellido);
		cantNodos(a, cant);
		write('La cantidad de Empleados total, es de: ', cant);
	end.

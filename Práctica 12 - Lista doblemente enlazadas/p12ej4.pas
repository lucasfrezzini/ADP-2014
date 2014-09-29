{
Una empresa dispone de una lista de empleados, de un empleado se conoce: Número de 
Empleado, Apellido, Nombre, Profesión, Código de Departamento al que pertenece, Sueldo 
básico y años antigüedad. Dicha lista está ordenada por Número de Empleado (orden principal); 
pero también puede accederse en forma ordenada por código de departamento (orden 
secundario). Se pide:

	a.  Realizar un módulo que reciba un nuevo empleado y lo incorpore a la lista de empleados 
	de la empresa (manteniendo ambos órdenes).

	b.  Implementar un módulo que elimine de la lista todos los empleados que pertenezcan al 
	departamento 4 o al departamento 10 (estos departamentos pueden no existir).

	c.  Implementar un módulo que reciba un departamento como parámetro y retorne un 
	empleado de dicho departamento que sea “Contador”. Si existe más de uno, debe retornar 
	el de mayor antigüedad (tener en cuenta que puede no existir ningún empleado con dichas 
	características e incluso puede no existir el departamento). 
}

program ejercicio4;

	type
		str = String[30];
		empleado = record
			numEmp: Integer;
			nombre: str;
			ape: str;
			prof: str;
			cod: Integer;
			sueldo: real;
			anti: Integer;
		end;

		lista = ^nodo;
		nodo = record
			dato: empleado;
			sig_numEmp: lista;
			sig_cod: lista;
		end;

		listaDoble = record
			pri_numEmp: lista;
			pri_cod: lista;
		end;

	procedure leerEmpleado(var e: empleado);
		begin
			read(e.numEmp);
			read(e.nombre);
			read(e.ape);
			read(e.prof);
			read(e.cod);
			read(e.sueldo);
			read(e.anti);
		end;

	procedure porNumEmp(var ld: listaDoble; nuevo: lista);
		var
			ant, act: lista;
		begin
			act:= ld.pri_numEmp;
			while (act <> nil) and (act^.dato.numEmp < nuevo^.dato.numEmp) do begin
				ant:= act;
				act:= act^.sig_numEmp;
			end;
			if (act = ld.pri_numEmp;) then begin
				nuevo^.sig_numEmp := ld.pri_numEmp;
				ld.pri_numEmp := nuevo;
			end
			else begin
				ant^.sig_numEmp:= nuevo;
				nuevo^.sig_numEmp:= act;
			end;
		end;

	procedure porCod(var ld: listaDoble; nuevo: lista);
		var
			ant, act: lista;
		begin
			act:= ld.pri_cod;
			while (act <> nil) and (act^.dato.cod < nuevo^.dato.cod) do begin
				ant:= act;
				act:= act^.sig_cod;
			end;
			if (act = ld.pri_cod;) then begin
				nuevo^.sig_cod := ld.pri_cod;
				ld.pri_cod := nuevo;
			end
			else begin
				ant^.sig_cod:= nuevo;
				nuevo^.sig_cod:= act;
			end;
		end;

	procedure insertarEmpleado(var ld:listaDoble; e: empleado);
		var
			nuevo: lista;
		begin
			new(nuevo);
			nuevo^.dato:= e;
			nuevo^.sig_cod:= nil;
			nuevo^.sig_numEmp:= nil;
			if (ld.pri_numEmp = nil) then begin
				ld.pri_numEmp:= nuevo;
				ld.pri_cod:= nuevo;
			end
			else begin
				porNumEmp(ld, nuevo);
				porCod(ld, nuevo;
			end;
		end;

	procedure eliminarDepto(var ld: listaDoble;);
		var
			act: Integer;
			aux: lista;
		begin
			aux:= ld^.pri_cod;
			act:= aux.dato.cod;
			while (aux <> nil) and (act <> 4) do begin
				act:= aux^.dato.cod;
				aux:= aux^.sig_cod;
			end;
			if (aux <> nil) then begin
				while (act = 4) do begin
					eliminarCod();
					eliminarNro();
					aux:= aux^.sig_cod;
					act:= aux^.dato.cod;
				end;
			end;
			aux:= ld^.pri_cod;
			while (aux <> nil) and (act <> 10) do begin
				act:= aux^.dato.cod;
				aux:= aux^.sig_cod;
			end;
			if (aux <> nil) then begin
				while (act = 10) do begin
					eliminarCod();
					eliminarNro();
					aux:= aux^.sig_cod;
					act:= aux^.dato.cod;
				end;
			end;
		end;

		{Mucho código para hacer algo tan sencillo, me aburrí. Despues lo veo, trankilo.}

	begin
		
	end.

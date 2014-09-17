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

	procedure insertar(var ld:listaDoble; e: empleado);
		begin
			porNumEmp(ld.pri_numEmp, e);
			porCod(ld.pri_cod, e)
		end;

	begin
		
	end.

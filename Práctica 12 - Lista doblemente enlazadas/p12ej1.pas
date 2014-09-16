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

		punteros = record
			pri_sig: lista;
			pri_ant: lista;
		end;

	begin
		Main();
	end.

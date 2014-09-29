{
Generar un árbol binario de búsqueda con nombres de personas que se leen desde teclado. La 
lectura finaliza con el nombre ‘ZZZ’.  Una vez generado el árbol, realice un módulo que reciba el 
árbol  y  un  nombre,  y  retorne  verdadero  si  existe  dicho  nombre  en  el  árbol  o  falso  en  caso 
contrario
}

program ejercicio2;

	type
		str = String[30];

		arbol = ^nodo;
		nodo = record
			nombre : str;
			hd: arbol;
			hi: arbol;
		end;

	procedure agregarNodo(var a: arbol; nombre: str);
		begin
			if (a = nil) then begin
				new(a);
				a^.nombre:= nombre;
				a^.hi:= nil;
				a^.hd:= nil;
			end
			else 
				if (nombre < a^.nombre) then
					agregarNodo(a^.hi, nombre)
				else
					agregarNodo(a^hd, nombre);
		end;

	procedure crearArbol(var a: arbol);
		var
			nombre: str;
		begin
			read(nombre);
			while (nombre <> 'ZZZ') do begin
				agregarNodo(a, nombre);
				read(nombre);
			end;
		end;

	function buscarElemento(a: arbol; nombre: str): arbol;
		begin 
			if (a = nil) then
				buscarElemento := nil
			else 
				if (nombre = a^.dato) then
					buscarElemento := a;
				else
					if (nombre < a^.dato) then 
						buscarElemento := buscarElemento(a^.hi, nombre)
					else
						buscarElemento := buscarElemento(a^.hd, nombre);
		end;

	procedure inicializar(var a: arbol);
		begin
			a^.hi:= nil;
			a^.hd:= nil;
		end;

	var
		a: arbol;
		nombre: str;
		ok: arbol;
begin
	inicializar(a);
	crearArbol(a);
	write('¿Qué nombre quiere buscar en el arbol?');
	read(nombre);
	ok:= buscarElemento(a);
	if (ok^ = nil) then
		write('No se encontro el elemento buscado.')
	else
		write('El elemento buscado, existe');
end.



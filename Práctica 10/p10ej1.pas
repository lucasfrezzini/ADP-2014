{
a) Escriba un módulo que lea una secuencia de números enteros terminada en 999 y los almacene en una 
lista (agregando al principio). La lista generada debe devolverse como parámetro.

b) Implemente un módulo que reciba una lista de números enteros y retorne la longitud de la lista.

c) Implemente un módulo que reciba una lista de números enteros y devuelva como resultado la cantidad de 
números con 3 dígitos pares.

Realice un programa que invoque a los módulos implementados.
}


program ejercicio1;
	type
		lista = ^nodo;
		nodo = record
			dato: Integer;
			sig: lista;
		end;

	{///////////////////////////////////////////////////
	////// Módulo A ///////////////////////////////////}

	procedure cargarAdelante(var L: lista; numero: Integer);
		var
			nuevo: lista;
		begin
			{creo un nuevo nodo}
			new(nuevo);
			{asigno los valores predeterminados para los elementos del nodo}
			nuevo^.dato:= numero;
			nuevo^.sig:= nil;
			{pregunto por si la lista esta vacía}
			if (L = nil) then
				{sí esta vacía la lista L es igual a 'nuevo'}
			 	L = nuevo;
			{si no esta vacía, agrego atras, se redirecciona 'sig' a L y L a 'nuevo'}
			else begin
				nuevo^.sig:= L;
				L:= nuevo;
			end;
		end;

	procedure leerNumeros(var L: lista);
		var
			numero: Integer;
		begin
			{Leo primero numero}
			read(numero);
			while (numero <> 999) do begin
				{cargo Adelante en la Lista}
				cargarAdelante(L, numero);
				{leo nuevamente para cortar el While}
				read(numero);
			end;
		end;

	{///////////////////////////////////////////////////
	////// Módulo B ///////////////////////////////////}

	procedure contarNumeros(L: lista; var cantN: Integer);
		begin
			{mientras haya elementos en la lista, los cuento y luego retorno la cantidad}
			while (L <> nil) do begin
				cantN:= cantN + 1;
				L:= L^.sig;
			end;
		end;

	{///////////////////////////////////////////////////
	////// Módulo C ///////////////////////////////////}

	function tieneTres(numero: Integer): Boolean;
		var
			digito, cant: Integer;
		begin
			{mientras haya digitos en el numero consulto}
			while (numero <> 0) do begin
				digito:= numero MOD 10;
				{me fijo sí es par}
				if (digito div 2 = 0) then
					cant:= cant + 1;
				numero:= numero DIV 10;
			end;
			{sí hay más de 3 digitos pares, devuelvo TRUE en la funcion}
			if (cant = 3) then
				tieneTres:= true
			else
				tieneTres:= false;
		end;

	procedure digitosPares(var L: lista; var cantP: Integer;);
		var
			numero: Integer;
		begin
			while (L <> nil) do begin
				numero:= L^.dato;
				{sí tiene exactamente 3 digitos pares, aumento la cantidad}
				if (tieneTres(numero)) then
					cantP:= cantP + 1;
				{avanzo en la lista}
				L:= L^.sig;
			end;
		end;

	{///////////////////////////////////////////////////
	////// Prog. P ////////////////////////////////////}

	var
		L: lista;
		cantN: Integer;
		cantP: Integer;

	begin
		{inicilizo la lista}
		L:= nil;
		{llamo proceso para leer y cargar los numeros en la lista}
		leerNumeros(L);
		{inicializo la variable cantN y cantP}
		cantN:= 0;
		cantP:= 0;
		{cuento los numeros y luego imprimo la cantidad}
		contarNumeros(L, cantN);
		write('La cantidad de Numeros en la Lista, es de: ', cantN);
		digitosPares(L, cantP);
		write('La cantidad de Numeros con 3 digitos Pares o más, es de: ', cantP);
	end.
{
Una  fábrica  de  pastas  dispone  de  una  estructura  con  la  información  de  las  ventas  que  se 
realizaron durante el mes agosto. De cada venta se conoce: el código de pasta, cantidad, fecha y 
número de cliente. Esta información no tiene ningún orden.

Se pide generar una  nueva  estructura que almacene por cada código de pasta, la cantidad total 
vendida durante  el  mes  de agosto  y los números de los clientes que la solicitaron (si el cliente 
solicitó  más  de  una  vez  un  código  de  pasta,  debe  aparecer  una  sola  vez  para  ese  código  de 
pasta). Esta estructura debe estar ordenada por código de pasta y ser eficiente para la búsqueda 
por dicho criterio. 
Utilizando  la  nueva  estructura  generada  realice  módulos  independientes  para  resolver  cada 
inciso:

	a)  Informar los números de cliente que realizaron compras para los códigos de pastas que están 
	entre 4 y 11. 
	b)  Informar los códigos de pasta que tuvieron una cantidad de ventas mayor a 100 y menor que 
	200.
	c)  Informar  los  dos  códigos  de  pasta  que  tienen  mayor  cantidad  de  clientes  distintos  que  la 
	solicitaron, teniendo en cuenta sólo las pastas cuyo código es menor a 72.
}

program ejercicio8;

	type
		str = String[20];

		lista2 = ^nodo3;
		nodo3 = record
			cod_cli : Integer;
			sig: lista2;
		end;

		dato_pasta = record
			cod_pasta : Integer;
			cant: Integer;
			cantTotal: Integer;
			nros_cli: lista2;
		end;

		pasta = record
			cod_pasta : Integer;
			cant: Integer;
			fecha: str;
			nro_cli: Integer;
		end;

		arbol = ^nodo;
		nodo = record
			dato : dato_pasta;
			hd: arbol;
			hi: arbol;
		end;

		lista = ^nodo2;
		nodo2 = record
			dato : pasta;
			sig: lista;
		end;

	procedure cargarCliente(var l2: lista2; nro_cli: Integer; var cantTotal: Integer);
		var
			nuevo, ant, act: lista2;
		begin
			while (l2 <> nil) and (l2^.cod_cli <> nro_cli) do begin
				ant:= l2;
				l2:= l2^.sig;				
			end;
			if (l2 = nil) then begin
				cantTotal:= cantTotal + 1;
				new(nuevo);
				nuevo^.cod_cli:= nro_cli;
				nuevo^.sig:= nil;
				ant^.sig:= nuevo;
			end;

		end;

	procedure agregarNodo(var a: arbol; dato: pasta; var l2: lista2);
		begin
			if (a = nil) then begin
				new(a);
				a^.dato.cod_pasta:= dato.cod_pasta;
				a^.dato.cant:= dato.cant;
				a^.dato.cantTotal:= 0;
				cargarCliente(a^.dato.nros_cli, dato.nro_cli, a^.dato.cantTotal);
				a^.hi:= nil;
				a^.hd:= nil;
			end
			else
				if (a^.dato.cod_pasta = dato.cod_pasta) then
				begin
					a^.dato.cant:= a^.dato.cant + dato.cant;
					cargarCliente(a^.dato.nros_cli, dato.nro_cli, a^.dato.cantTotal);
				end
				else
					if (dato.cod_pasta < a^.dato.cod_pasta) then
						agregarNodo(a^.hi, dato);
					else
						agregarNodo(a^.hd, dato);
		end;

	procedure recorrerLista(var a: arbol; l: lista);
		begin
			while (l <> nil) do begin
				agregarNodo(a, l^.dato);
				l:= l^.sig;
			end;
		end;

	procedure impLista(puntero: lista2);
		begin
			while (puntero <> nil) do begin
				write('El numero del cliente es: ', puntero^.cod_cli);
				puntero:= puntero^.sig;
			end;
		end;

	procedure nroClientes(a: arbol; inf; sup);
		begin
			if (a <> nil) then
				if (a^.dato_pasta.cod_pasta >= inf) then
					if (a^.dato_pasta.cod_pasta <= sup) then begin
						impLista(a^.dato_pasta.nros_cli);
						nroClientes(a^.hi, inf, sup);
						nroClientes(a^.hd, inf, sup);
					end
					else
						nroClientes(a^.hi, inf, sup);
				else
					nroClientes(a^.hd, inf, sup);
		end;

	procedure cantVentas(a: arbol; inf; sup);
		begin
			if (a <> nil) then
				if (a^.dato_pasta.cant >= inf) then
					if (a^.dato_pasta.cant <= sup) then begin
						write('El código ', a^.dato_pasta.cod_pasta, ' tiene una cantidad de ventas mayor');
						cantVentas(a^.hi, inf, sup);
						cantVentas(a^.hd, inf, sup);
					end
					else
						cantVentas(a^.hi, inf, sup);
				else
					cantVentas(a^.hd, inf, sup);
		end;

	procedure maximo(cant, cod: integer; var max1, max2, cod1, cod2: Integer);
		begin
			if (cant > max1) then begin
				max2:= max1;
				cod2:= cod1;
				max1:= cant;
				cod1:= cod;
			end
			else
				if (cant > max2) then begin
					max2:= cant;
					cod2:= cod;
				end;
		end;

	procedure codPastas(a: arbol; var max1, max2, cod1, cod2: Integer);
		begin
			if (a <> nil) then begin
				if (a^.dato_pasta.cod_pasta < 72) then begin
					maximo(a^.dato_pasta.cant, a^.dato_pasta.cod_pasta, max1, max2, cod1, cod2);
					codPastas(a^.hi, max1, max2, cod1, cod2);
					codPastas(a^.hd, max1, max2, cod1, cod2);
				end
				else
					codPastas(a^.hi, max1, max2, cod1, cod2);
			end;
		end;

	var
		a: arbol;
		l: lista;
		cant, cod, max1, max2, cod1, cod2, inf, sup: Integer;

	begin
		a:= nil;
		l:= nil;
		max1:= -1;
		cod1:= 0;
		inf:= 4;
		sup:= 11;
		crearLista(l); {Se dispone}
		recorrerLista(a, l);
		nroClientes(a, inf, sup);
		inf:= 100;
		sup:= 200;
		cantVentas(a, inf, sup);
		codPastas(a, max1, max2, cod1, cod2);
		write('Los dos codigos de pastas que tienen mayor cantidad de clientes son ', cod1, ' y ', cod2);
	end.

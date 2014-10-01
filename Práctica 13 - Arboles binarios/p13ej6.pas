{
Se dispone de un árbol con la información de vehículos vendidos por una concesionaria. De cada 
vehículo  se  registra:  patente,  marca,  año  de  fabricación  y  color.  Esta  estructura  se  encuentra 
ordenada por patente.

	a)  Genere  una  nueva  estructura  con  la  información  de  los  vehículos  fabricados  entre  2010  y 
	2014. Esta estructura no debe estar ordenada.
	Luego de realizar el inciso a), seleccione la estructura más adecuada para implementar: 
	b)  Un módulo que informe el porcentaje de vehículos de color gris, teniendo en cuenta solamente 
	aquellos autos fabricados entre 2010 y 2014. 
	c)  Un módulo que informe el porcentaje de vehículos de color gris, teniendo en cuenta solamente 
	aquellos vehículos cuya patente sea mayor que “HAA000”
}

program ejercicio6;
	
	type
		str = String[25];

		auto = record
			patente : Integer;
			marca: str;
			fabri: Integer;
			color: str;
		end;

		arbol = ^nodo;
		nodo = record
			dato: auto;
			hi: arbol;
			hd: arbol;
		end;

		lista = ^nodo2;
		nodo2 = record
			dato : auto;
			sig: lista;
		end;

	procedure crearLista(var l: lista; dato: auto);
		var
			nuevo: lista;
		begin;
			new(nuevo);
			nuevo^.dato:= dato;
			nuevo^.sig:= l;
			l:= nuevo;
		end;

	procedure filtrar(var l: lista; a: arbol; inf: Integer; sup: Integer);
		begin
			if (a <> nil) then begin
				if (a^.dato.fabri >= inf) then begin
					if (a^.dato.fabri <= sup) then begin
						crearLista(l, a^.dato);
						filtrar(l, a^.hi, inf, sup);
						filtrar(l, a^.hd, inf, sup);
					end
					else
						filtrar(l, a^.hi, inf, sup);	
				end
				else
					filtrar(l, a^.hd, inf, sup);
		end;
	
	procedure porcentajeGris(l: lista; var porcentaje: real; var: cantPatentes: Integer; var cantGris: Integer);
		var
			total: Integer;
		begin
			cantGris:= 0;
			total:= 0;
			while (l <> nil) do begin
				if (l^.dato.color = 'Gris') then begin
					cantGris:= cantGris + 1;
					if (l^.dato.patente > 'HAA000') then
						cantPatentes:= cantPatentes + 1;
				end;
				total := total + 1;
				l:= l^.sig;
			end;
			porcentaje:= (cantGris/total)*100;
		end;

	function porcentajePatente(cantPatentes: Integer; cantGris: Integer): real;
		begin
			porcentajePatente:= (cantPatentes/cantGris)*100;
		end;

	procedure inicilizarLista(var l: lista);
		begin
			l:= nil;
		end;

	var
		cantPatentes, cantGris, inf, sup: Integer;
		l: lista;
		a: arbol:
		porcentaje, porcentajePat: real;

	begin
		crearArbol(a) {Se dispone}
		inicilizarLista(l);
		inf:= 2010;
		sup:= 2014;
		cantGris:= 0;
		cantPatentes:= 0;
		filtrar(l, a, inf, sup);
		porcentajeGris(l, porcentaje, cantPatentes, cantGris);
		write('El porcentaje de Autos de color Gris, con años de fabricacion entre 2010 y 2014 es: ', porcentaje);
		porcentajePat:= porcentajePatente(cantPatentes, cantGris);
		write('El porcentaje de Autos de color Gris, con patente mayor a "HAA000" es: ', porcentajePat);
	end.

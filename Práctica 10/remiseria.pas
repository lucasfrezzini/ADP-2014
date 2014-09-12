{
Una remisería dispone de información correspondiente al año 2013 de los autos que posee para brindar el servicio de transporte.
De cada auto se conoce: patente, marca, modelo y los viajes realizado. Por cada viaje se conoce: fecha, codigo de zona (1..4) y
distancia recorrida (kilometros recorridos durante el viaje). Además se dispone de una table con las tarifas por kilometro de
cada zona (1..4)-

Se desea conocer:
- Las patentes de los dos autos con mayor recaudacion durante el año 2013
}

program remiseria;

	type
		cod = 1..4;
		stg = string[20];

		viaje = record
		    fecha: stg;
		    codigo: cod;
		    dist: integer;
		end;

		lista2 = ^nodo2;

		nodo2 = record
		    dato: viaje;
		    sig : lista2;
		end;

		remis = record
		    patente: string[7];
		    marca: stg;
		    modelo: stg;
		    viajes_r: lista2;
		end;

		lista = ^nodo;

		nodo = record
		    dato: remis;
		    sig : lista;
		end;

		tabla = array [1..4] of real; {Se dispone, zona 1..4 -> pos 1..4}

	function valorDistHecha(precio: real; dist: Integer;): real; {precio =  t[cod]}
		var
			calculo: real;
		begin
			calculo:= distancia * precio;
			valorDistHecha:= calculo;
		end;

	procedure contarDistanciaAuto(l2: lista2; var cantRecaudada: real; t: tabla); {l2 sería, l^dato.viajes_r}
		begin
			while (l2 <> nil) do begin
				cantRecaudada:= cantRecaudada + valorDistHecha(t[l2^.dato.codigo]; l2^.dato.dist);
				l2:= l2^.sig;
			end;
		end;

	procedure maximos(cantRecaudada: real; patente: stg; var: max1: real; var max2: real; var pat1: stg; var pat2: stg;);
		begin
			if (cantRecaudada > max1) then begin
				max2:= max1;
				pat2:= pat1;
				max1:= cantRecaudada;
				pat1:= patente;
			end
			else
				if (cantRecaudada > max2) then begin
					max2:= cantRecaudada;
					pat2:= patente;
				end;
		end;

	procedure recorrerListaDeAutos(l1: lista; t: tabla;);
		var
			max1, max2, cantRecaudada: real;
			pat1, pat2: stg;
		begin
			cantRecaudada:= 0;
			max1:= -1;
			pat1:= '000 000'
			while (l1 <> nil) do begin
				contarDistanciaAuto(l1^dato.viajes_r, cantRecaudada, t);
				maximos(cantRecaudada, l1^.dato.patente, max1, max2, pat1, pat2);
				l1:= l1^.sig;
			end;
			write('El auto que más recaudo en el 2013 fue: ', pat1, 'con un total de: $', max1);
			write('El segundo auto que más recaudo en el 2013 fue: ', pat2, 'con un total de: $', max2);
		end;

	var
		l1: lista;
		t: tabla;
	begin
		l1:= nil;
		crearTabla(t);
		crearListaDeRemises(l1);
		recorrerListaDeAutos(l1, t);
	end.

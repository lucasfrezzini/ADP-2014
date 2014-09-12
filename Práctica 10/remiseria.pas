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

	procedure contarDistanciaAuto(l2: lista2; var cantRecaudada: real; t: tabla); {l2 sería, l^.viajes_r}
		begin
			while (l2 <> nil) do begin
				cantRecaudada:= cantRecaudada + valorDistHecha(t[l2^.dato.cod]; l2^.dato.dist);
				l2:= l2^.sig;
			end;
		end;

	procedure maximos();
	begin
		
	end;

	begin
		Main();
	end.

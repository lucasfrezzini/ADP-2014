{
La secretaria de turismo de la nación dispone de una estructura donde almacena para cada una de las 
provincias (1..23) su nombre y la información de los paquetes turísticos que se realizan en la misma. De cada 
paquete turístico se conoce: código, nombre del lugar turístico, precio por persona.
Se pide informar: 

a) Para cada provincia el código del paquete más costoso por persona
b) Los dos nombres de provincias que poseen menos paquetes turísticos
}

program ejercicio8;

	type
		str = String[50];
		paquete = record
			codigo: Integer;
			nombre: str;
			precio: real;
		end;

		prov = record
			nombre : str;
			paq: lista;
		end;

		provincias = array [1..23] of prov;

		lista = ^nodo;
		nodo = record
			dato: paquete;
			sig: lista;
		end;

	procedure maximo(cod: integer; valor: real; var max1: real; var cod1: real);
		begin
			if valor > max1 then begin
				max1:= valor;
				cod1:= cod;
			end;
		end;

	procedure minimos(cant: integer; nom: str; var min1: integer; var min2: integer; var nom1: str; var nom2: str);
		begin
			if (cant < min1) then begin
				min2:= min1;
				nom2:= nom1;
				min1:= cant;
				nom1:= nom;
			end
			else
				if (cant < min2) then begin
					min2:= cant;
					nom2:= nom;
				end;
		end;

	procedure recorrerEstructura(p: provincias);
		var
			i, max1, min1, min2: Integer;
			nom1, nom2: str;
			cod1: real;
			punt: lista;
		begin
			max1:= -1;
			min1:= 99999;
			nom1:= 'ZZZ';
			for i:= 1 to 23 do begin
				punt:= p[i].paq;
				cant:= 0;
				while (punt <> nil) do begin
					maximo(punt^.dato.codigo, punt^.dato.precio, max1, cod1);
					punt:= punt^.sig;
					cant:= cant + 1;
				end;
				minimos(cant, p[i].nombre, min1, min2, nom1, nom2);
				write('El codigo del paquete más costoso por persona es: ', cod1);
			end;
			write('Las provincias que poseen menos paquetes son: ', nom1, 'y ', nom2);
		end;

	var
		p: provincias;

	begin
		crearEstructura(p);
		recorrerEstructura(p);
	end.

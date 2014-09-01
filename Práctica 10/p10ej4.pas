{4) Se dispone de una lista de sitios turísticos (nombre del sitio y país) sin orden.
a) Realice un módulo que reciba la lista y un país y retorne la cantidad de ocurrencias del mismo.
b) Realice un módulo para agregar al final de la lista un nuevo sitio turístico que se recibe como parámetro. 
c) Dado un país, generar una nueva lista con los nombres de sus sitios turísticos, si existe. Dicha lista debe 
estar ordenada en forma ascendente.}

program eje4;
type
	str = string[50];
	paises = record
		sitio : str;
		pais : str;
	end;
	lista = ^nodo;
	nodo = record
		dato : paises;
		sig: lista;
	end;

	procedure A(L: lista; pais: str; var cantN: Integer);
		begin
			while (L <> nil) do begin
				if (L^.dato.pais = pais) then cantN := cantN + 1;
				L := L^.sig;
			end;
		end;

	procedure B(L: lista; nuevo: lista);
		begin
			while (L <> nil) do begin
				ant := L;
				L := L^.sig;
			end;
			ant^.sig := nuevo;
			nuevo^.sig = nil;
		end;

	procedure C(L: lista; pais: str; var L2: lista);
		var
			ult, act, nuevo: lista;
		begin
			while (L <> nil) do begin
				if (L^.dato.pais = pais) then begin
					new(nuevo);
					nuevo^.dato.sitio := L^.dato.sitio;
					nuevo^.dato.pais;
					act := L2;
					ult := L2;

					while (act <> nil) and (act^.dato.sitio < nuevo^.dato.sitio) do begin
						ant := act;
						act := act^.sig;
					end;

					if (ant = act) then L2 := nuevo
					else ant^.sig := nuevo;
					nuevo^.sig := act;
				end;
				L := L^.sig;
			end;
		end;
var
	cantN: Integer;
	L, L2: lista;
	pais, sitio: str;
begin
	L := nil;
	L2 := nil;
	cantN := 0;
	read(pais);
	A(L, pais, cantN);
	read(pais);
	read(sitio);
	new(nuevo);
	nuevo^.dato.sitio := sitio;
	nuevo^.dato.pais := pais;
	B(L, nuevo);
	read(pais);
	C(L, pais, L2);
end.









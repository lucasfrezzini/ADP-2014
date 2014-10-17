{
5.-  a)  Defina  e  implemente  el  TAD  micro  de  20  asientos  (numerados  de  1  a  20).  Implemente  las  siguientes 
operaciones: 
	Crear un micro  [crea un micro vacío para un destino dado].
	Ver destino  [retorna el destino del micro]
	Ocupar un asiento específico  [dado un número de asiento el mismo se ocupa].
	Cantidad de asientos libres   [retorna la cantidad de asientos no ocupados].
	Liberar un asiento específico   [dado un nro. de asiento el mismo se libera].
	Asiento ocupado   [dado un nro. de asiento, retorna Verdadero en caso que el mismo esté ocupado, Falso en caso contrario].
	Ver asiento libre   [retorna un número de asiento libre].
	Asiento válido  [dado un número de asiento retorna verdadero si el mismo pertenece al micro, falso en caso contrario]
	Hay asiento libre   [retorna verdadero en caso que exista al menos un asiento libre, falso en caso contrario]. 


b) Una empresa de transporte de pasajeros de larga distancia, dispone de una estructura con la información de su 
flota de micros (tipo exportado del TAD), la misma está ordenada por destino y debe ser eficiente para la búsqueda 
por dicho criterio. Suponga que hay un único micro por destino. 
Realice un programa que lea de teclado los datos: nombre de persona y destino deseado (la lectura finaliza cuando 
se ingresa el nombre ‘ZZZ’). A cada persona se le debe informar, en caso que la empresa tenga un micro que va al 
destino deseado y disponga de asiento libre en el micro, el número de asiento asignado.
}

TAD microTAD;
	tipo exportado micrito;
	interface
		procedure crearUnMicro(var m: micrito; dest: str);
		procedure verDestino(var dest: str; m: micrito);
		procedure ocuparAsientoEspecifico(var m: micrito; nAsiento: Integer);
		function cantidadAsientosLibres(m: micrito): Integer;
		procedure liberarAsientoEspecifico(var m: micrito; nAsiento: Integer);
		function asientoOcupado(m: micrito; nAsiento): boolean;
		function verAsientoLibre(m: micrito): Integer;
		function asientoValido(nAsiento: Integer): boolean;
		function hayAsientoLibre(m: micrito): Integer;

	implementacion
		type

			str = String[30];

			vMicros = array[1..20] of Integer;

			micrito = record
				destino: str;
				asientos: vMicros;
			end;

		procedure crearUnMicro(var m: micrito; dest: str);
			var
				i: Integer;
			begin
				m.destino:= dest;
				for i := 1 to 20 do
					m.asientos[i]:= 0;
			end;
				
		procedure verDestino(var dest: str; m: micrito);
			begin
				dest:= m.destino;
			end;

		procedure ocuparAsientoEspecifico(var m: micrito; nAsiento: Integer);
			begin
				m.asiento[nAsiento]:= 1;
			end;

		function cantidadAsientosLibres(m: micrito): Integer;
			var
				cant, i: Integer;
			begin
				cant:= 0;
				for i := 1 to 20 do
					if (m.asientos[i] = 0) then
						cant:= cant + 1;
				asientosLibres:= cant;
			end;

		procedure liberarAsientoEspecifico(var m: micrito; nAsiento: Integer);
			begin
				m.asiento[nAsiento]:= 0;
			end;

		function asientoOcupado(m: micrito; nAsiento): boolean;
			begin
				if (m.asientos[nAsiento] = 1) then
					asientoOcupado:= True;
				else
					asientoOcupado:= False;
			end;

		function verAsientoLibre(m: micrito): Integer;
			var
				i: Integer;
			begin
				i:= 1;
				while (i <= 20) and (m.asientos[i] <> 1) do begin
					i:= i+1;
				end;
				asientoLibre:= i;
			end;

		function asientoValido(nAsiento: Integer): boolean;
			begin
				if (nAsiento >= 1) and (nAsiento <= 20) then
					asientoValido:= True;
				else
					asientoValido:= False;
			end;

		function hayAsientoLibre(m: micrito): Integer;
			var
				i: Integer;
			begin
				i:= 1;
				while (i <= 20) and (m.asientos[i] <> 0) do
					i:= i+1;
				if (i <= 20) then
					hayAsientoLibre:= True;
				else
					hayAsientoLibre:= False;
			end;


program ejercicio5;

USES microTAD;

	type
		arbol = ^nodo;
		nodo = record
			m: micrito;
			hi: arbol;
			hd: arbol;
		end;

		regDato = record
			dest: str;
			nombre: str;
		end;

	procedure leerPersonayDestino(var rD: regDato);
		begin
			read(rD.dest);
			read(rD.nombre);
		end;

	procedure consultarAsientos(var m: micrito);
		var
			asi: Integer;
		begin
			if (hayAsientoLibre(a^.m)) then
				asi:= verAsientoLibre(a^.m);
				ocuparAsientoEspecifico(a^.m, asi);
				write('El asiento del micro tiene el num: ', asi, ' ¡Buen viaje!');
		end;

	procedure buscarDestino(var a: arbol; rD: regDato);
		var
			dest: str;
		begin
			if (a <> nil) then begin
				verDestino(dest, a^.m);
				if ( dest = rD.dest) then begin
					consultarAsientos(a^.m);
				end
				else
					if (dest < rD.dest) then
						consultarAsiento(a^.hd)
					else
						consultarAsiento(a^.hi);
			end;
		end;

	procedure atender(a: arbol);
		var
			rD: regDato;
		begin
			leerPersonayDestino(rD);
			while (rD.nombre <> 'ZZZ') do begin
				buscarDestino(a, rD);
				leerPersonayDestino(rD);
			end;
		end;

	var
		a: arbol;

	begin
		crearArbolDeViajes(a); {Se dispone}
		atender(a);
	end.

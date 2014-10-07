{//////////////////////////////////////////////////
 // TAD Tinvitado /////////////////////////////////
 //////////////////////////////////////////////////

 IMPLEMENTACION
}

type 
	invitado = record
		nombre : String[30];
		apellido: String[30];
		distancia: Integer;
		es_familiar: boolean;	
	end;

{//////////////////////////////////////////////////
 // TAD TLista_Invitado ///////////////////////////
 //////////////////////////////////////////////////

 IMPLEMENTACION
}

type
	lista_invitado = ^nodo;
	nodo = record
		invit: invitado;
		sig: lista;
	end;

program ProgramName;
	type

		inv = record
			distancia: Integer;
			cant: Integer;
		end;

		arbol = ^nodo2;
		nodo2 = record
			dat : inv;
			hi: arbol;
			hd: arbol;
		end;

procedure crearListaInvitados(var l: lista_invitado;);
	var
		invit: invitado;
		nombre, apellido: String[30];
		distancia: Integer;
		fam: boolean;

	begin
		read(nombre, apellido, distancia, fam); {boolean no se lee ni se escribe}
		crearLista(l);
		while (nombre <> 'fin') do begin
			crearInvitado(invit, nombre, apellido, distancia, fam);
			agregar_invitado(l, invit);
			read(nombre, apellido, distancia, fam);
		end;
	end;

procedure agregarNodo(var a: arbol, dist: Integer);
	begin
		if (a =  nil) then begin
			new(a);
			a^.dato.distancia:= dist;
			a^.dato.cant:= 1;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else
			if (dist = a^.dato.distancia) then
				a^.dato.cant:= a^.dato.cant + 1
			else
				if (dist < a^.dato.distancia) then
					agregarNodo(a^.hi, dist)
				else
					agregarNodo(a^.hd, dist);
	end;

procedure crearArbol(var a: arbol; l: lista_invitado);
	var
		i: invitado;
	begin
		iniciar_recorrido(l);
		while (ver_final(l)) do begin
			dame_invitado(l, i)
			if (verFamiliar(i)) then
				agregarNodo(a, verDistancia(i)); {enviar verDistancia()}
		end;
	end;

procedure cantInv(a: arbol; var cantI: Integer);
	begin
		if (a <> nil) then
			if (a^.dato.distancia <= 150) then begin
				cantI:= cantI + 1;
				cantInv(a^.hi, cantI);
				cantInv(a^.hd, cantI);
			end
			else
				cantInv(a^.hi, cantI);
	end;

procedure calcularCantFam(a: arbol; var cantFam: Integer);
	begin
		if (a <> nil) then begin
			cantFam:= cantFam + a^.dato.cant;
			calcularCantFam(a^.hi, cantFam);
			calcularCantFam(a^.hd, cantFam);
		end;
	end;

function promedioInv(a: arbol, cantInv: integer): Integer;
	var
		cantFam: Integer;
	begin
		cantFam:= 0;
		calcularCantFam(a, cantFam);
		promedioInv:= cantFam / cantInv;
	end;

var
	a: arbol;
	l: lista_invitado;
	cantI, cantInv: Integer;

begin
	crearListaInvitados(l);
	crearArbol(a, l);
	cantInv(a, cantI);
	write('La cantidad de Invitados familiares de Fernandito que estan a 150Km de distancia o menos son: ', cantI);
	write('El promedio de invitados que son familiares de Fernandito es: ', promedioInv(a, cantidad_invitados(l)));
end.



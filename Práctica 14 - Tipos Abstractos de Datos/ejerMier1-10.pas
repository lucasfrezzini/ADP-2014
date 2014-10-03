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

procedure crearListaInvitados(var li: lista_invitado;);
	var
		invit: invitado;
		nombre, apellido: String[30];
		distancia: Integer;
		fam: boolean;

	begin
		read(nombre, apellido, distancia, fam);
		crearLista(li);
		while (nombre <> 'fin') do begin
			crearInvitado(invit, nombre, apellido, distancia, fam);
			agregar_invitado(li, invit);
			read(nombre, apellido, distancia, fam);
		end;
	end;

procedure crearArbol(var a: arbol; li: lista_invitado);
	var
		i: invitado;
	begin
		iniciar_recorrido(li);
		while (ver_final(li) <> nil) do begin
			dame_invitado(li, i)
			if (verFamiliar(i)) then
				agregarNodo(a, verDistancia(i)); {enviar verDistancia()}
		end;
	end;


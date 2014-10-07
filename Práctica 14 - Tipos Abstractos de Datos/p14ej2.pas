{
	Defina e implemente un TAD Persona con los atributos: Nombre, DNI, ocupacion, altura y peso. Implemente un programa
	que utilizando el TAD Persona:

		A) Almacene en un vector 45 personas.
		B) Luego de almacenar la informacion:
			i)		Informe todos los datos de la persona con mayor peso.
			ii) 	Informe los nombres de las personas cuya altura no supera el 1.70 metros.
			iii)	Modifique la ocupacion de la persona con DNI: 32000512 a 'empleado de comercio'.
}

TAD	personaTAD
Interface
	type exportado persona

	procedure crearPersona(var p: persona; nom, ocup: str; dni: Integer; alt, peso: real);
		{Se envia la variable de tipo 'persona' junto a los datos de la persona y se devuelve la persona creada}

	procedure asignarPersona(var p2: persona; p: persona);
		{Se envian ambas variables de tipo 'persona' y se realiza la asignacion}

	procedure consNombre(p: persona; nombre: str);
	procedure consOcupacion(p: persona; ocupacion: str);
		{Se consulta nombre o ocupacion y se devuelve en una variable la consulta}

	function consAlt(p: persona): real;
	function consPeso(p: persona): real;
		{Se consulta Altura o Peso y se devuelve la consulta}

	function consDni(p: persona): Integer;
		{Se devuelve el Dni de la persona consultada}

	procedure modNombre(var p: persona; nom: str);
	procedure modDni(var p: persona; dni= Integer);
	procedure modOcupacion(var p: persona; ocup:= str);
	procedure modAlt(var p: persona; alt: real);
	procedure modPeso(var p: persona; peso: real);
		{Se envia la variable tipo 'persona' y el dato a modificar en la Persona}

Implementacion
	type
		str = String[30];
		persona = record
			nombre : str;
			dni: Integer;
			ocupacion: str;
			alt: real;
			peso: real;
		end;

	procedure crearPersona(var p: persona; nom, ocup: str; dni: Integer; alt, peso: real);
		begin
			p.nombre:= nom;
			p.dni:= dni;
			p.ocupacion:= ocup;
			p.alt:= alt;
			p.peso:= peso;
		end;

	procedure asignarPersona(var p2: persona; p: persona);
		begin
			p2:= p;
		end;

	procedure consNombre(p: persona; nombre: str);
		begin
			nombre:= p.nombre;
		end;

	procedure consOcupacion(p: persona; ocupacion: str);
		begin
			ocupacion:= p.ocupacion;
		end;

	function consAlt(p: persona): real;
		begin
			consAlt:= p.alt;
		end;

	function consPeso(p: persona): real;
		begin
			consPeso:= p.peso;
		end;

	function consDni(p: persona): Integer;
		begin
			consDni:= p.dni;
		end;

	procedure modNombre(var p: persona; nom: str);
		begin
			p.nombre:= nom;
		end;

	procedure modDni(var p: persona; dni= Integer);
		begin
			p.dni:= dni;
		end;

	procedure modOcupacion(var p: persona; ocup:= str);
		begin
			p.ocupacion:= ocup;
		end;

	procedure modAlt(var p: persona; alt: real);
		begin
			p.alt:= alt;
		end;

	procedure modPeso(var p: persona; peso: real);
		begin
			p.peso:= peso;
		end;

program ejercicio2;
	
	USES personaTAD

	type
		str = string[40];

		per = record
			nombre : str;
			dni: Integer;
			ocupacion: str;
			alt: real;
			peso: real;
		end;	

		vector = array[1..45] of persona;

	procedure leerDatos(var pe: per);
		begin
			read(pe.nombre);
			read(pe.dni);
			read(pe.ocupacion);
			read(pe.alt);
			read(pe.peso);
		end;

	procedure almacenarEnVector(var v: vector);
		var
			p: persona;
			pe: per;
			i: Integer;
		begin
			for i:= 1 to 45 do begin
				leerDatos(pe);
				crearPersona(p, pe.nombre, pe.ocupacion, pe.dni, pe.alt, pe.peso);
				asignarPersona(v[i], p);
			end;
		end;

	procedure maximo(p: persona; var max: real; var maxp: persona);
		begin
			if (p.peso > max) then begin
				max:= p.peso;
				maxp:= p;
			end;
		end;

	procedure recorrerVector(var v: vector);
		var
			i: Integer;
			max:= real;
			ocu:= str;
		begin
			max:= -1;
			ocu:= 'empleado de comercio';
			for i:= 1 to 45 do begin
				maximo(v[i], max, maxp);				
				if (consAlt(v[i]) <= 1.70) then
					write('El nombre es: ', consNombre(v[i]));
				if (consDni(v[i]) = 32000512) then
					modOcupacion(v[i], ocu);
			end;
			write('La persona de mayor peso tiene los siguientes datos: ', maxp.nombre, ' ', maxp.dni,' ', maxp.ocupacion,' ', maxp.peso,' ', maxp.alt);
				{Se imprimio de la forma más crota posible}
		end;

	var
		v: vector;

	begin
		almacenarEnVector(v);
		recorrerVector(v);
	end.

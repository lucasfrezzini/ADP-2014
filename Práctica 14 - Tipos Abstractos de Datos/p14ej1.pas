{
a) Defina e implemente un TAD triangulo con los siguientes atributos: base, altura, angulos internos. Dicho TAD debe
contener las operaciones: CalcularSuperficie y CantidadDeLadosIguales

b) Utilizando el TAD definido en a) realice un programa que genere 10 triangulos (leyendo los datos necesarios). 
Luego de la lectura de todos los datos, informe la cantidad de triangulos equilateros, isosceles y escalenos.
}

TAD triangulosTAD
Interface
	type exportado triangulo

	procedure crearTriangulo(var t: triangulo; base, alt, ang1, ang2, ang3: real);
		{se ingresan los valores de la base, altura, angulos y se devuelve}

	procedure asignarTriangulo(var t2: triangulo; t: triangulo);
		{se ingresa el triangulo inicial y la nueva variable de tipo 'triangulo' para ser asignada}

	function consBase(t: triangulo): real;
	function consAlt(t: triangulo): real;
		{Se ingresa la variable 'triangulo' y se devuelve la consulta correspondiente}
	function consAng1(t: triangulo): real;
	function consAng2(t: triangulo): real;
	function consAng3(t: triangulo): real;
		{Se ingresa la variable 'triangulo' y se devuelve la consulta correspondiente}

	procedure modBase(var t: triangulo; base: real);
	procedure modBase(var t: triangulo; base: real);
		{se envia la variable tipo 'triangulo' y la base o altura a modificar}

	procedure modAng1(var t: triangulo; ang1: real);
	procedure modAng2(var t: triangulo; ang2: real);
	procedure modAng3(var t: triangulo; ang2: real);
		{Se envia la variable tipo 'triangulo' y el valor del angulo que queremos modificar}

	procedure CalcularSuperficie(t: triangulo; var sup: real);
		{se ingresan los valores de la base y altura y se devuelve la superficie en sup}

	procedure CantidadDeLadosIguales(t: triangulo; var cantLados: Integer);
		{Se ingresa la variable tipo 'triangulo' y se devuelve 3, 2, 0 dependiendo si es Equilatero, Isosceles, o Escaleno}

Implementacion
	type
		triangulo = record
			base : real;
			alt: real;
			ang1: real;
			ang2: real;
			ang3: real;
		end;

	procedure crearTriangulo(var t: triangulo; base, alt, ang1, ang2, ang3: real);
		begin
			t.base:= base;
			t.alt:= alt;
			t.ang1:= ang1;
			t.ang2:= ang2;
			t.ang3:= ang3;
		end;

	procedure asignarTriangulo(var t2: triangulo; t: triangulo);
		begin
			t2:= t;
		end;

	procedure modBase(var t: triangulo; base: real);
		begin
			t.base:= base;
		end;

	procedure modAlt(var t: triangulo; alt: real);
		begin
			t.alt:= alt;
		end;

	procedure modAng1(var t: triangulo; ang1: real);
		begin
			t.ang1:= ang1;
		end;

	procedure modAng2(var t: triangulo; ang2: real);
		begin
			t.ang2:= ang2;
		end;

	procedure modAng3(var t: triangulo; ang3: real);
		begin
			t.ang3:= ang3;
		end;

	function consBase(t: triangulo): real;
		begin
			consBase:= t.base;
		end;

	function consAlt(t: triangulo): real;
		begin
			consAlt:= t.alt;
		end;

	function consAng1(t: triangulo): real;
		begin
			consAng1:= t.ang1;
		end;

	function consAng2(t: triangulo): real;
		begin
			consAng2:= t.ang2;
		end;

	function consAng3(t: triangulo): real;
		begin
			consAng3:= t.ang3;
		end;

	procedure CalcularSuperficie(t: triangulo; var sup: real);
		begin
			sup:= (t.base * t.alt) / 2;
		end;

	procedure CantidadDeLadosIguales(t: triangulo; var cantLados: Integer);
		begin
			if (t.ang1 = t.ang2) and (t.ang2 = t.ang3) then
				cantLados:= 3
			else
				if (t.ang1 <> t.ang2) and (t.ang2 <> t.ang3) and (t.ang1 <> t.ang3) then
					cantLados:= 0
				else
					cantLados:= 2;
		end;

program ejercicio1;
	USES
		triangulosTAD

	type
		str = String[25];

		datoT = record
			base : real;
			alt: real;
			ang1: real;
			ang2: real;
			ang3: real;
		end;

		vector = array[1..10] of triangulo;


	procedure leerDatos(var tr: datoT);
		begin
			read(tr.base);
			read(tr.alt);
			read(tr.ang1);
			read(tr.ang2);
			read(tr.ang3);
		end;

	procedure crearTriangulos(var v: vector; );
		var
			i: Integer;
			tr: datoT;
			t: triangulo;
		begin
			for i := 1 to 10 do begin
				leerDatos(tr);
				crearTriangulos(t, tr.base, tr.alt, tr.ang1, tr.ang2, tr.ang3);
				asignarTriangulo(v[i], t);
			end;
		end;

	procedure tipoT(cantLados: Integer; var tipo: String);
		begin
			if (cantLados = 3) then
				tipo:= 'Equilatero'
			else
				if (cantLados = 2) then
					tipo:= 'Isosceles'
				else
					tipo:= 'Escaleno';
		end;

	procedure informarTipoT(v: vector);
		var
			i,cantLados: Integer;
			tipo: str;
		begin
			for i := 1 to 10 do begin
				CantidadDeLadosIguales(v[i], cantLados);
				tipoT(cantLados, tipo);
				write('El triangulo numero: ', i, ' es un triangulo: ', tipo);
			end;
		end;


	var
		v: vector;

	begin
		crearTriangulos(v);
		informarTipoT(v);
	end.
	
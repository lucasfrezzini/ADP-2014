{
1) 
a) Se leen dos valores reales desde teclado que corresponden a la base y altura de un 
rectángulo. Calcule a partir de dichos valores el área y perímetro e informe en pantalla.

b) Modifique a) para informar el área y perímetro sólo en caso de que los valores leídos sean 
positivos. 

c) Modifique b) para permitir que el usuario calcule el área y perímetro de 20 rectángulos cuyos 
valores de base y altura ingresará desde teclado
}

{//////////////////////////////////////////////
/// a)
///////////////////////////////////////////////}

program eje1a;
	var
		base: real;
		alt: real;
		area: real;
		perim: real;

	begin
		read(base);
		read(altura);

		area := base * alt;
		write('El area del rectangulo es ', area);

		perim := base * 2 + alt * 2;
		write('El perimetro del rectangulo es ', perim);
	end.

{//////////////////////////////////////////////
/// b)
///////////////////////////////////////////////}

program eje1b;
	var
		base: real;
		alt: real;
		area: real;
		perim: real;

	begin
		read(base);
		read(altura);

		if (base > 0) and (alt > 0) then begin
			area := base * alt;
			write('El area del rectangulo es ', area);

			perim := base * 2 + alt * 2;
			write('El perimetro del rectangulo es ', perim);
		end;
		
	end.

{//////////////////////////////////////////////
/// c)
///////////////////////////////////////////////}

program eje1a;
	var
		base: real;
		alt: real;
		area: real;
		perim: real;
		i: Integer;

	begin
		for i := 1 to 20 do begin
			read(base);
			read(altura);

			if (base > 0) and (alt > 0) then begin
				area := base * alt;
				write('El area del rectangulo es ', area);

				perim := base * 2 + alt * 2;
				write('El perimetro del rectangulo es ', perim);
			end;
		end;
	end.


{Se leen desde teclado edades de personas que asisten a una escuela de inglés hasta ingresar 
un número menor a 6. Informar para cada edad ingresada la categoría a la que pertenece 
sabiendo que: categoría “niños” abarca edades de 6 a 14, categoría “jóvenes” de 15 a 18 años, 
y al resto le corresponde categoría “adultos”. }

program eje2p2;

	var
		edad: Integer;	

	begin
		read(edad);
		while (edad >= 6) do begin
			if (edad <= 14) then
				write('Categoría "Niños"');
			else
				if (edad >= 15) and (edad <= 18) then
					write('Categoría "Jovenes"');
				else
					write('Categoría "Adultos"');	
		end;	
	end.

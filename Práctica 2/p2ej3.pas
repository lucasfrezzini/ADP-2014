{Se leen 31 valores desde teclado que representan cantidades de automóviles vendidos en una 
concesionaria por cada día del mes de Octubre. Informar los dos días en que se registraron la 
mayor cantidad de ventas y la cantidad mínima vendida junto al día en que se produjo.}

program eje3p2;
	var
		num, max, max2, min, dia, i: Integer;
	begin
		max := -1;
		min := 99999;
		for i := 1 to 31 do begin
			read(num);
			if (num > max) then begin
				max2 := max;
				max := num;
				{ Máximo mayor }
			end
			else
				if (num > max) then
					max2 := num;
					{ Máximo menor }
			end;
			if (num < min) then begin
				min = num;
				dia = i;
				{ Mínimo y día de ese mínimo }
			end;
		end;
		write('El Primer día de mayor venta, se obtuvo: ', max, );
		write('El Segundo día de mayor venta, se obtuvo: ', max);
		write('El día de peor venta fue: ', dia, 'con: ', max);
	end.
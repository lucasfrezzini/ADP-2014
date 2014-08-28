{Se leen 31 valores desde teclado que representan cantidades de automóviles vendidos en una 
concesionaria por cada día del mes de Octubre. Informar los dos días en que se registraron la 
mayor cantidad de ventas y la cantidad mínima vendida junto al día en que se produjo.}

program eje3p2;
	var
		total, num, max, max2, min, dia, i: Integer;
	begin
		total := 0;
		max := -1;
		min := 99999;
		for i := 1 to 31 do begin
			read(num);
			if (num > max) then begin
				max2 := max;
				max := num;
			end;
			if (num < min) then begin
				min = num;
				dia = i;
			end;
		end;
	end.
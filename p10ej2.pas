{2) Escriba un programa que dada una lista de enteros L:
A Genere una nueva lista que contenga los números pares que aparecen en L.
B Informe la cantidad de números que comienzan con un dígito impar.
C Informe el porcentaje de números entre 10 y 50.
Nota: Modularizar la solución. La lista L debe ser recorrida solo una vez}

program ej2;
type

lista = ^nodo ;
nodo = record
dato:integer ;
sig:lista ;
end;

procedure agregaradelante (var l:lista; num:integer);
var
nue:lista;
begin
new (nue);
nue^.dato:= num;
nue^.sig:= l;
l:=nue;
end;

function par (num:integer):boolean;
var
dig:integer;
ok: boolean;
begin
ok:= false;
dig:= num mod 10;
if (dig mod 2 = 0) then ok:= true;
par:= ok;
end;

function comienzaimpar (num:integer):boolean;
var
dig:integer;
ok: boolean;
begin
ok:=false;
while (num <> 0) do
begin
     dig:= num mod 10;
     if not (dig mod 2 = 0) then ok:= true;
     num:= num div 10;
end;
comienzaimpar:= ok;
end;


procedure crearlista (var l: lista);

var
num:integer;

begin

writeln ('ingrese num');
readln (num);
while (num<> 999) do
begin
agregaradelante (l, num);
writeln ('ingrese num');
readln (num);
end;
end;

procedure A (var l2:lista; l:lista;var cant:integer; var cant2:integer; var total:integer);

begin

while (l <> nil) do
begin
if (par (l^.dato)) then  agregaradelante (l2, l^.dato);
if (comienzaimpar (l^.dato)) then cant:= cant + 1;
if (l^.dato >= 10) and (l^.dato <= 50) then cant2:= cant2 +1;
total:= total +1;
l:=l^.sig;
end;

end;

var
l,l2:lista;
cant, cant2, total: integer;

begin
cant:= 0;
cant2:=0;
total:=0;
l:= nil;
l2:=nil;
crearlista (l);
A (l2, l, cant, cant2, total);
writeln ('cantidad de numeros que comienzan con digito impar', cant);
writeln ('porcentaje de numeros entre 10 y 50', (cant2*100)DIV total);
while (l2 <> nil) do
begin
writeln('nueva lista l2:', l2^.dato);
l2:= l2^.sig;
end;
readln;
readln;
end.









% 1. Comparar área del círculo

area_circulo(Radio, Area):- 
    Area is pi * Radio ** 2.

comparar_area(Radio, Limite, Resultado):- 
    area_circulo(Radio, Area),
    (Area > Limite   -> Resultado = 'Mayor';
     Area =:= Limite -> Resultado = 'Igual';
     Resultado = 'Menor').
%comparar_area(10,12, Resultado).                           Mayor
%comparar_area(10,314.1592653589793, Resultado).            Igual


% 2. Comparar perímetro de un cuadrado

perimetro_cuadrado(Lado, Perimetro):-
    Perimetro is 4 * Lado.

comparar_perimetro(Lado, Limite, Resultado):-
    perimetro_cuadrado(Lado, P),
    (P > Limite   -> Resultado = 'Mayor';
     P =:= Limite -> Resultado = 'Igual';
     Resultado = 'Menor').
% comparar_perimetro(5, 18, R).



% 3. Verificar si un número es positivo, negativo o cero

verificar_signo(Num, Resultado):-
    (Num > 0  -> Resultado = 'Positivo';
     Num < 0  -> Resultado = 'Negativo';
     Resultado = 'Cero').
%verificar_signo(-3, R).



% 4. Comparar la raíz cuadrada con un valor

comparar_raiz(Num, Limite, Resultado):-
    Raiz is sqrt(Num),
    (Raiz > Limite   -> Resultado = 'Mayor';
     Raiz =:= Limite -> Resultado = 'Igual';
     Resultado = 'Menor').
%comparar_raiz(25, 5, R).


% 5. Calcular el área de un triángulo y verificar si es mayor que 50

area_triangulo(Base, Altura, Area):-
    Area is (Base * Altura) / 2.

area_mayor_50(Base, Altura, Resultado):-
    area_triangulo(Base, Altura, Area),
    (Area > 50 -> Resultado = 'Mayor';
    Resultado = 'No mayor').
%area_mayor_50(10, 12, R).


% 6. Verificar si un número es par o impar

par_o_impar(Num, Resultado):-
    (0 is Num mod 2 -> Resultado = 'Par';
    Resultado = 'Impar').

%par_o_impar(7, R).

% 7. Comparar el logaritmo natural con un valor

comparar_ln(Num, Limite, Resultado):-
    Ln is log(Num),
    (Ln > Limite   -> Resultado = 'Mayor';
     Ln =:= Limite -> Resultado = 'Igual';
    Resultado = 'Menor').
%comparar_ln(5, 1.5, R).


% 8. Calcular la potencia y verificar si supera 100

comparar_potencia(Base, Exponente, Resultado):-
    Potencia is Base ** Exponente,
    (Potencia > 100 -> Resultado = 'Mayor';
     Resultado = 'No mayor').
% comparar_potencia(3, 4, R).
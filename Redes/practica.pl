% Hechos
red1(pc1, redd1, estrella).
red1(pc2, redd1, estrella).
red1(pc3, redd1, estrella).
red1(pc4, redd1, estrella).
red1(switch1, redd1, estrella).

conexion(switch1, router1).

red2(pc5, redd2, bus).
red2(pc6, redd2, bus).
red2(pc7, redd2, bus).
red2(server1, redd2, bus).




%1. Muestre las PCs de la topología de estrella (red1).
% Regla para mostrar PCs en topología estrella 
pcs_estrella(PC) :- red1(PC, _, estrella).
% Regla para ver si algo es un dispositivo conectado
dispositivo(X) :- red1(X,_,_); red2(X,_,_); conexion(X,_); conexion(_,X).
%findall(PC, red1(PC, _, estrella), Lista).


%2. Desarrolle una regla que determine si un dispositivo pertenece a una red.
pertenece_red(Dispositivo, Red) :- red1(Dispositivo, Red, _); red2(Dispositivo, Red, _).
%pertenece_red(switch1, R).


%3. ¿Puede el S1 enviar ping a la pc2?
ping(S1, PC) :- red1(S1, Red, _), red1(PC, Red, _).
%ping(switch1, pc2).

%4. Invente una regla.
mismo_tipo_red(D1, D2) :- 
    red1(D1, Red, _), 
    red1(D2, Red, _).
% mismo_tipo_red(pc1, pc4).


%5. Invente una regla que utilice una expresión aritmética.
%cuenta cuántos dispositivos hay en una red- hay 5 multiplica *10
total_dispositivos(Red, Total) :-
    findall(D, (red1(D, Red, _); red2(D, Red, _)), L),
    length(L, N),
    Total is N * 10.
%total_dispositivos(redd1, T).


%.6 Invente una regla que utilice un comparador.
%para comparar nombres alfabéticamente
es_antes(D1, D2) :-
    (red1(D1,_,_) ; red2(D1,_,_)),
    (red1(D2,_,_) ; red2(D2,_,_)),
    D1 @< D2.
%es_antes(pc1, pc3).      da true
% es_antes(pc7, pc1).          da false



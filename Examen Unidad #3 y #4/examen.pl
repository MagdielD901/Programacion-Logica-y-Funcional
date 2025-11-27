%Hechos
%Fortran
lenguaje(fortran, algol).
lenguaje(fortran, basic).
lenguaje(fortran, pli).

%Algol
lenguaje(algol, simula).
lenguaje(algol, basic).
lenguaje(algol, pli).
lenguaje(algol, clu).

%Simula
lenguaje(simula, smalltalk).

%smalltalk
lenguaje(smalltalk, self).
lenguaje(smalltalk, objetivec).
lenguaje(smalltalk, python).
lenguaje(smalltalk, rubi).
lenguaje(smalltalk, scheme).

%Self
lenguaje(self, javascript).

%CLU
lenguaje(clu, ruby).

%Basic
lenguaje(basic, visualbasic).
lenguaje(basic, superbasic).

%Visual Basic
lenguaje(visualbasic, c).

%PL/I
lenguaje(pli, pls).
lenguaje(pli, cpm).
lenguaje(pli, plc).

%PL/S
lenguaje(pls, plsa).

%PL/SA
lenguaje(plsa, plx).


%1.
%---------------------------------------------------------
%Muestre los derivados directos de Fortran   
% Regla: Derivados directos de un lenguaje
derivado_directo(X, Y) :- lenguaje(X, Y).

%derivado_directo(fortran, X).

%Respuesta
%X = algol ;
%X = basic ;
%X = pli.



%2
%--------------------------------------------------------
%¿Es derivado Javascript de Self (devolverá true o false; 
es_derivado(X, Y) :- lenguaje(Y, X).
es_derivado(X, Y) :- lenguaje(Y, Z), es_derivado(X, Z).

%es_derivado(javascript, self).

%Respuesta
%True



%3.
%--------------------------------------------------------
%¿Es SuperBasic lenguaje hermano de VisualBasic? (devolverá true o false; 
hermanos(X, Y) :-
    lenguaje(Padre, X),
    lenguaje(Padre, Y),
    X \= Y.
%hermanos(superbasic, visualbasic).

%Respuesta
%True



%4.
%--------------------------------------------------------
%Invente una regla. 
% X es nieto de Y si Y es padre de Z y Z es padre de X
nieto(X, Y) :-
    lenguaje(Y, Z),
    lenguaje(Z, X).

%nieto(smalltalk, algol).

%Respuesta
%True


%5.
%--------------------------------------------------------
%Invente una regla que utilice una expresión aritmética. 
% Cada relación lenguaje/2 tiene un costo fijo de 1
costo_relacion(1).

% Regla: costo total entre Y → Z → X
costo_nieto(X, Y, CostoTotal) :-
    lenguaje(Y, Z),
    lenguaje(Z, X),
    costo_relacion(C1),
    costo_relacion(C2),
    CostoTotal is C1 + C2.

%costo_nieto(smalltalk, algol, Costo).

%Respuesta
%Costo =2



%6.
%-------------------------------------------------------
%Invente una regla que utilice un comparador.   
% Cuenta cuántos lenguajes derivan directamente de L
contar_descendientes(L, Total) :-
    findall(Hijo, lenguaje(L, Hijo), Lista),
    length(Lista, Total).

mas_descendientes(L1, L2) :-
    contar_descendientes(L1, T1),
    contar_descendientes(L2, T2),
    T1 > T2.   

%mas_descendientes(algol, fortran).

%Resultado
%True

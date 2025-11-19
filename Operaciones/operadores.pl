%Suma
suma(X, Y, R) :- R is X +Y.
%resultado: suma(10,2,R).

%resta
resta(X, Y, R) :- R is X -Y.
%resultado: resta(10,2,R).

%multiplicacion
multiplicacion(X, Y, R) :- R is X *Y.
%resultado: multiplicacion(10,2,R).


%division real
divisionr(X, Y, R) :- R is X/Y.
%resultado: divisionr(10,2,R).

%division entera
divisione(X, Y, R) :- R is X div Y.
%resultado: divisione(10,2,R).

%resto de la division
restodiv(X, Y, R) :- R is X mod Y.
%resultado: restodiv(8,2,R).


%X elevado a Y
restodiv(X, Y, R) :- R is X ^Y.
%resultado: restodiv(10,2,R).

%negacion
negacion(X, R) :- R is - X.
%resultado: negacion(10,R).

%valor absoluto
absoluto(X, R) :- R is abs(X).
%resultado: absoluto(-10,R).

%arco coseno
acoseno(X, R) :- R is acos(X).
%resultado: acoseno(1,R).

%arco seno 
asin(X, R) :- R is asin(X).
%resultado: asin(0.2,R).

%arco tangente
atangente(X,R) :- R is atan(X).
%resultado: atangente(1.6,R).

%coseno
coseno(X,  R) :- R is cos(X).
%resultado: coseno(10,R).

%exponencial
exponencial(X, R) :- R is exp(X).
%resultado: exponencial(2,R).

%Logaritmo neperiano                  
logaritmo(X, R) :- R is log(X)/log(2).
%resultado: logaritmo(10,R).

%Logaritmo base 2
base(X, R) :- R is log(X).
%resultado: base(2,R).

%seno
seno(X,  R) :- R is sin(X).
%resultado: seno(2,R).

%raiz cuadrada
raiz(X, R) :- R is sqrt(X).
%resultado: raiz(2,R).

%tangente
tangente(X, R) :- R is tan(X).
%resultado: tangente(2,R).

% Redondeo con N decimales
redondeo(X, N, R) :-  Factor is 10**N,
    R is round(X * Factor) / Factor.
%redondeo(10, 2, R).









% Comparación de términos en PROLOG     (TRUE O FALSE)

% X es menor que Y
xmenory(X, Y, R) :- (X < Y -> R = true ; R = false).
% resultado: xmenory(10,2,R).

% X es mayor que Y
xmayory(X, Y, R) :- (X > Y -> R = true ; R = false).
% resultado: xmayory(10,2,R).

% X es menor o igual que Y
xm(X, Y, R) :- (X =< Y -> R = true ; R = false).
% resultado: xm(10,2,R).

% X es mayor o igual que Y
xma(X, Y, R) :- (X >= Y -> R = true ; R = false).
% resultado: xma(2,2,R).

% X es igual que Y
xi(X, Y, R) :- (X =:= Y -> R = true ; R = false).
% resultado: xi(8,2,R).

% X es distinto que Y
xd(X, Y, R) :- (X =\= Y -> R = true ; R = false).
% resultado: xd(5,2,R).


% Comparación de expresiones en PROLOG

% La expresión X es igual que la expresión Y
xiy(X, Y, R) :- (X == Y -> R = true ; R = false).
% resultado: xiy(10,2,R).

% La expresión X es distinta que la expresión Y
xdy(X, Y, R) :- (X \== Y -> R = true ; R = false).
% resultado: xdy(9,2,R).

% X es menor que Y (orden estándar)
xmeny(X, Y, R) :- (X @< Y -> R = true ; R = false).
% resultado: xmeny(1,2,R).

% X es mayor que Y (orden estándar)
xmayy(X, Y, R) :- (X @> Y -> R = true ; R = false).
% resultado: xmayy(10,2,R).

% X es menor o igual que Y (orden estándar)
xmeniy(X, Y, R) :- (X @=< Y -> R = true ; R = false).
% resultado: xmeniy(9,9,R).

% X es mayor o igual que Y (orden estándar)
xymayorigual(X, Y, R) :- (X @>= Y -> R = true ; R = false).
% resultado: xymayorigual(10,2,R).

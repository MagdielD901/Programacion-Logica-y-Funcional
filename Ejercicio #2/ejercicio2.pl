%DIAGRAMA
familia(hominoidea, hominidea).
familia(hominoidea, hylobatidae).
familia(hylobatidae, hylobates).
familia(hylobates, gibbon).

familia(hominidea, homininae).
familia(hominidea, ponginae).
familia(ponginae, pongo).
familia(pongo, orangutan).

familia(homininae, hominini).
familia(homininae, gorillini).
familia(gorillini, gorilla).
familia(gorilla, gorilla2).

familia(hominini, homo).
familia(hominini, pan).

familia(homo, human).
familia(pan, bonobo).
familia(pan, chimpanzee).

%GENERACION
generacion(hominoidea,  superfamily).
generacion(hominidea,hylobatidae ,family).
generacion(homininae,ponginae, subfamily).
generacion(hominini,gorillini, tribe).
generacion(homo,pan,gorilla,pongo,hylobates, genus).

generacion(homo, genus).
generacion(pan, genus).
generacion(gorilla, genus).
generacion(pongo, genus).
generacion(hylobates, genus).


%1
descendiente(X, Y) :- familia(Y, X).  % Caso directo: Y es padre de X
descendiente(X, Y) :-  familia(Z, X),  descendiente(Z, Y).  % Y es ancestro de Z

%2
hermano(X, Y) :-
    familia(P, X),
    familia(P, Y),
    X \= Y.

%3
misma_subfamilia(X, Y) :-
    descendiente(X, S),
    descendiente(Y, S),
    familia(F, S),
    F = hominidea,  % nivel de subfamilia
    X \= Y.

%4
misma_familia(X, Y) :-
    descendiente(X, F),
    descendiente(Y, F),
    familia(hominoidea, F),
    X \= Y.

%5
descendientes_directos_tribu(T, D) :-
    familia(T, D).

%6
superfamilia(X, S) :-
    descendiente(X, S),
    generacion(S, superfamily).

%7

generos_misma_subfamilia(Pan, G) :-
    descendiente(Pan, Subf),
    descendiente(G, Subf),
    Subf = homininae,  % subfamilia de Pan
    generacion(G, genus),
    G \= Pan.

%8
ancestro_comun_mas_cercano(X, Y, A) :-
    descendiente(X, A),
    descendiente(Y, A),
    \+ (descendiente(X, B), descendiente(Y, B), familia(A, B)).

%9
es_hominido(X) :-
    descendiente(X, hominidea).

%10
especies_familia(F, Especies) :-
    setof(E, descendiente(E, F), Especies).

%11
generos_hermanos_taxonomicos(X, Ys) :-
    familia(Subf, X),
    setof(Y, (familia(Subf, Y), Y \= X), Ys).

%12
misma_familia2(X, Y) :-
    descendiente(X, F),
    descendiente(Y, F),
    generacion(F, family).

%13
descendientes_directos_subfamilia(S, D) :-
    familia(S, D).

%14
generos_bajo_familia(F, Gs) :-
    setof(G, (
        descendiente(G, F),
        (familia(_, G); generacion(G, genus))
    ), Gs).

%15
ruta_hasta_superfamilia(X, Ruta) :-
    findall(A, descendiente(X, A), Todos),
    include([R]>>(generacion(R, superfamily); familia(_, R)), Todos, Ruta).


%PREGUNTAS

%1- Es el gorila descendiente de hominini? false
%descendiente(gorilla,hominini).

%2- ¿Es el Homo hermano del gorila? false
%hermano(homo, gorilla).

%3- ¿Son el Homo y el Gorilla de la misma subfamilia? true
%misma_subfamilia(homo, gorilla).

%4- ¿Tiene Hominini la misma familia que Pongo? true
%misma_familia(hominini, pongo).

%5- ¿Quiénes son los descendientes directos de una tribu? homo, pan
%descendientes_directos_tribu(hominini, D).

%6- ¿Cuál es la superfamilia a la que pertenece Hylobates? hominoidea
%superfamilia(hylobates, S).

%7- ¿Qué géneros comparten la misma subfamilia con Pan? gorilla, homo
%generos_misma_subfamilia(pan, G).

%8- ¿Cuál es el ancestro común más cercano entre Homo y Gorilla? homininae
%ancestro_comun_mas_cercano(homo, gorilla, A).

%9- ¿Es el orangután un homínido? true
% es_hominido(orangutan).

%10- ¿Cuáles son todas las especies que pertenecen a la familia Hominidae? bonobo, chimpanzee, gorilla, gorilla2, gorillini, homininae, hominini, homo, human.
%especies_familia(hominidea, Especies).

%11- ¿Qué géneros son hermanos taxonómicos de Homo? pan
%generos_hermanos_taxonomicos(homo, Ys).

%12 -¿Comparten Homo y Hylobates la misma familia? false
%misma_familia2(homo, hylobates).

%13- ¿Cuáles son los descendientes directos de la subfamilia Homininae? hominini, gorillini
%descendientes_directos_subfamilia(homininae, D).

%14- ¿Qué géneros están bajo la familia Hominidae? 
%Gs = [gorilla, homo, pan, pongo] ;
%Gs = [gorilla2] ;
%Gs = [gorilla] ;
%Gs = [homininae, ponginae] ;
%Gs = [gorillini, hominini] ;
%Gs = [homo, pan] ;
%Gs = [human] ;
%Gs = [bonobo, chimpanzee] ;
%Gs = [pongo] ;
%Gs = [orangutan].

%generos_bajo_familia(hominidea, Gs).

%15- ¿Cuál es la ruta taxonómica completa desde Homo hasta la superfamilia? [hominini, homininae, hominidea, hominoidea].
%ruta_hasta_superfamilia(homo, Ruta).
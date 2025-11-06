%DIAGRAMA

jefe(mark_zuckerberg,sheryl_sandberg).
jefe(mark_zuckerberg,david_wehner).
jefe(mark_zuckerberg,timothy_campos).
jefe(mark_zuckerberg,mike_schroepfer).
jefe(mark_zuckerberg,elliot_schrage).
jefe(mark_zuckerberg,lori_goler).

jefe(elliot_schrage,rebecca_van_dyck).
jefe(elliot_schrage,heather_freeland).

%¿Quién es el jefe del Rebecca?                                           R= X = elliot_schrage
%jefe(X,rebecca_van_dyck).

%¿Es jefe Mark del jefe de Rebecca?                                       R= X = elliot_schrage
%jefe(mark_zuckerberg, X), jefe(X, rebecca_van_dyck).                     

%¿Es Lori jefe de alguien?                                                R= false
%jefe(lori_goler, X).

%Mostrar empleados del jefe de Heather                                    R= Jefe = elliot_schrage, Empleado = rebecca_van_dyck 
%jefe(Jefe, heather_freeland), jefe(Jefe, Empleado).

%¿Es Timothy jefe de Rebecca?                                             R= False
%jefe(timothy_campos, rebecca_van_dyck).


%Mostrar compañeros de nivel de Mike                                      R=Jefe = mark_zuckerberg,
%                                                                         Compañero = david_wehner ;
%                                                                         Jefe = mark_zuckerberg,
%                                                                         Compañero = timothy_campos ;
%                                                                         Jefe = mark_zuckerberg,
%                                                                         Compañero = elliot_schrage ;
%                                                                         Jefe = mark_zuckerberg,
%                                                                         Compañero = lori_goler.
%jefe(Jefe, mike_schroepfer), jefe(Jefe, Compañero), Compañero \= mike_schroepfer.



%¿Es el jefe de Rebeca compañero de nivel de David?                         R= Jefe = elliot_schrage, Super = mark_zuckerberg
%jefe(Jefe, rebecca_van_dyck), jefe(Super, Jefe), jefe(Super, david_wehner).

%¿Es compañero de nivel Mike de Lori?                                       R= J = mark_zuckerberg.
%jefe(J, mike_schroepfer), jefe(J, lori_goler).



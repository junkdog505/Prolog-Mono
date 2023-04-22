% --------------------- Problema del Mono y el Plátano ---------------------

% -----------------------
% Alumno: Amézquita Soto Edison Cristian
% -----------------------
% Descripción del problema
% -----------------------

% --------------------------------------------------------------------------
% Dentro de una habitación se encuentra un mono.
% En medio de la habitación cuelga un plátano del techo.
% El mono está hambriento y quiere coger un plátano.
% El mono no puede alcanzar el plátano desde el piso.
% En la habitación, hay una ventana que tiene una caja que el mono puede utilizar.
% El mono puede hacer las siguientes acciones:
%   - Caminar sobre el piso
%   - Subir a la caja
%   - Empujar la caja (Si el mono se encuentra junto a la caja).
%   - Coger el plátano.
% --------------------------------------------------------------------------

%hechos

se_encuentra(mono, habitacion).
se_encuentra(platano, techo).
estado(mono, hambriento).
estado(mono, satisfecho).
se_ubica(caja, ventana).
se_ubica(caja, piso).
distancia(mono, caja, lejos).
distancia(mono, caja, cerca).
realiza(mono, subir, caja).
realiza(mono, bajar, caja).
realiza(mono, empujar, caja).
realiza(mono, agarrar, platano).


%reglas

% Regla 1: muestra si el mono se encuentra con hambre o no.
situacion_hambre(mono, X):-                                 % input correcto: situacion_hambre(mono, hambriento).
    estado(mono, X),
    write("El mono se encuentra: "), X = hambriento, write(X),nl.

% regla 2: contraparte de la regla 1.
situacion_hambre(mono, X):-
    write("El mono se encuentra:"), X = satisfecho, write(X),nl.

% Regla 3: muestra si la caja se ubica en la ventana o en el piso.
bajar_caja(mono, bajar, caja, X):-                          % input correcto bajar_caja(mono, bajar, caja, ventana)
    se_ubica(caja, X), X = ventana, write("La caja se encuentra en la: "), write(X), write(" del cuarto"),nl,
    realiza(mono, bajar, caja),write("El mono baja la caja de la ventana").

% Regla 4: Opción "Else" de bajar_caja.
bajar_caja(mono, bajar, caja, X):-                          % input correcto: mover_caja(mono, caja, piso, cerca, empujar).
    se_ubica(caja, X), X = piso, write("La caja se encuentra en el: "), write(X), write(" del cuarto"),nl,
    realiza(mono, bajar, caja),write("El mono no puede bajar la caja porque ya esta en el piso").

% Regla 5: mueve la caja para alcanzar el platano
mover_caja(mono, caja, X, Y, Z) :- 
    se_ubica(caja, X), X = piso,
    distancia(mono, caja, Y), Y = cerca,
    realiza(mono, Z, caja), Z = empujar,
    write('La caja se encuentra en el '), write(X), write(' y el mono esta '), write(Y), nl,
    write('El mono puede empujar y ubicar la caja para alcanzar el platano').

% Regla 6: no se cumple las condiciones para mover la caja
mover_caja(mono, caja, X, Y) :-

    write('La caja se encuentra en un lugar no accesible ( '),write(X), write(' ) y el mono esta '), write(Y), nl,
    write('El mono no puede moverla porque la caja no es accesible').

% Regla 7: Si el mono puede agarrar el platano
agarrar_platano(X, Y, Z, W, V, U, T, S):-                   % input correcto: agarrar_platano(mono, hambriento, platano, techo, piso, subir, caja, agarrar).
    estado(X, Y), X = mono, Y = hambriento,
    se_encuentra(Z, W), Z = platano, W = techo,
    se_ubica(T, V), T = caja, V = piso,
    distancia(X, T, cerca), X = mono, T = caja, 
    realiza(X, U, T), X = mono, U = subir, T = caja,
    realiza(X, S, Z), X = mono, S = agarrar, Z = platano, nl,
    write("El mono se encuentra hambriento, El mono ve un platano en el techo"),nl,
    write("El mono ubica la caja que esta en el piso y cerca de el"), nl,
    write("el mono sube a la caja y agarra el platano"), nl.






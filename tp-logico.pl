%Punto 1

candidato(frank,rojo).
candidato(claire, rojo).
candidato(garrett, azul).
candidato(jackie, amarillo).
candidato(linda, azul).
candidato(catherine, rojo).
candidato(seth, amarillo).
candidato(heather, amarillo).

edad(frank, 50).
edad(claire, 52).
edad(garrett, 64).
edad(peter, 26).
edad(jackie, 38).
edad(linda, 30).
edad(catherine, 59).
edad(heather, 50).

postulaEn(azul, buenosAires).
postulaEn(azul, tierraDelFuego).
postulaEn(azul, sanLuis).
postulaEn(azul, neuquen).
postulaEn(rojo, buenosAires).
postulaEn(rojo, santaFe).
postulaEn(rojo, cordoba).
postulaEn(rojo, chubut).
postulaEn(rojo, tierraDelFuego).
postulaEn(rojo, sanLuis).
postulaEn(amarillo, chaco).
postulaEn(amarillo, formosa).
postulaEn(amarillo, tucuman).
postulaEn(amarillo, salta).
postulaEn(amarillo, santaCruz).
postulaEn(amarillo, laPampa).
postulaEn(amarillo, corrientes).
postulaEn(amarillo, misiones).
postulaEn(amarillo, buenosAires).

habitantes(buenosAires, 15355000)
habitantes(chaco, 1143201)
habitantes(tierraDelFuego, 160720).
habitantes(sanLuis, 489255).
habitantes(neuquen, 637913).
habitantes(santaFe, 3397532).
habitantes(cordoba, 3567654).
habitantes(chubut, 577466).
habitantes(formosa, 527895).
habitantes(tucuman, 1687305).
habitantes(salta, 1333365).
habitantes(santaCruz, 273964).
habitantes(laPampa, 349299).
habitantes(corrientes, 992595).
habitantes(misiones, 1189446).

% Los casos en los que se dicen afirmaciones negativas como que alguien no 
% pertenece a un partido o que un partido no tiene afiliados no se refleja 
% en la base de datos porque por el principio de universo cerrado todo lo 
% que no se aclare que es verdad prolog lo toma como falso

%Punto 2

esPicante(Provincia):-
    muchosHabitantes(Provincia),
    variosPartidos(Provincia).

muchosHabitantes(Provincia):-
    habitantes(Provincia, Habitantes),
    Habitantes > 1000000.

variosPartidos(Provincia):-
    postulaEn(Partido1, Provincia),
    postulaEn(Partido2, Provincia),
    Partido1 /= Partido2.

%Punto 3

% intencionDeVotoEn(Provincia, Partido, Porcentaje)

intencionDeVotoEn(buenosAires, rojo, 40).
intencionDeVotoEn(buenosAires, azul, 30).
intencionDeVotoEn(buenosAires, amarillo, 30).
intencionDeVotoEn(chaco, rojo, 50).
intencionDeVotoEn(chaco, azul, 20).
intencionDeVotoEn(chaco, amarillo, 0).
intencionDeVotoEn(tierraDelFuego, rojo, 40).
intencionDeVotoEn(tierraDelFuego, azul, 20).
intencionDeVotoEn(tierraDelFuego, amarillo, 10).
intencionDeVotoEn(sanLuis, rojo, 50).
intencionDeVotoEn(sanLuis, azul, 20).
intencionDeVotoEn(sanLuis, amarillo, 0).
intencionDeVotoEn(neuquen, rojo, 80).
intencionDeVotoEn(neuquen, azul, 10).
intencionDeVotoEn(neuquen, amarillo, 0).
intencionDeVotoEn(santaFe, rojo, 20).
intencionDeVotoEn(santaFe, azul, 40).
intencionDeVotoEn(santaFe, amarillo, 40).
intencionDeVotoEn(cordoba, rojo, 10).
intencionDeVotoEn(cordoba, azul, 60).
intencionDeVotoEn(cordoba, amarillo, 20).
intencionDeVotoEn(chubut, rojo, 15).
intencionDeVotoEn(chubut, azul, 15).
intencionDeVotoEn(chubut, amarillo, 15).
intencionDeVotoEn(formosa, rojo, 0).
intencionDeVotoEn(formosa, azul, 0).
intencionDeVotoEn(formosa, amarillo, 0).
intencionDeVotoEn(tucuman, rojo, 40).
intencionDeVotoEn(tucuman, azul, 40).
intencionDeVotoEn(tucuman, amarillo, 20).
intencionDeVotoEn(salta, rojo, 30).
intencionDeVotoEn(salta, azul, 60).
intencionDeVotoEn(salta, amarillo, 10).
intencionDeVotoEn(santaCruz, rojo, 10).
intencionDeVotoEn(santaCruz, azul, 20).
intencionDeVotoEn(santaCruz, amarillo, 30).
intencionDeVotoEn(laPampa, rojo, 25).
intencionDeVotoEn(laPampa, azul, 25).
intencionDeVotoEn(laPampa, amarillo, 40).
intencionDeVotoEn(corrientes, rojo, 30).
intencionDeVotoEn(corrientes, azul, 30).
intencionDeVotoEn(corrientes, amarillo, 10).
intencionDeVotoEn(misiones, rojo, 90).
intencionDeVotoEn(misiones, azul, 0).
intencionDeVotoEn(misiones, amarillo, 0).

leGanaA(Candidato1, Candidato2, Provincia):-
    mismoPartido(Candidato1, Candidato2),
    postulaEn(Candidato1, Provincia).
leGanaA(Candidato1, Candidato2, Provincia):-
    not(mismoPartido(Candidato1, Candidato2)),
    postulaEn(Candidato1, Provincia).
    postulaEn(Candidato2, Provincia).    
    mayorPorcentaje(Candidato1, Candidato2, Provincia).

mayorPorcentaje(Candidato1, Candidato2, Provincia):-
    candidato(Candidato1, Partido1),
    candidato(Candidato2, Partido2),
    intencionDeVotoEn(Provincia, Partido1, Porcentaje1),
    intencionDeVotoEn(Provincia, Partido2, Porcentaje2),
    Porcentaje1 > Porcentaje2.

%Punto 4

elGranCandidato(Candidato):-
    candidatoMasJoven(Candidato),
    forAll(postulaEn(Candidato, Provincia), leGanaATodos(Candidato, Provincia)).

leGanaATodos(Candidato, Provincia):-
    forAll(postulaEn(OtroCandidato , Provincia), leGanaA(Candidato, OtroCandidato, Provincia)).

candidatoMasJoven(Candidato):-
    candidato(Candidato, Partido),
    forAll(candidato(OtroCandidato, Partido), mayorQue(OtroCandidato, Candidato)).

mayorQue(Candidato1, Candidato2):-
    edad(Candidato1, Edad1),
    edad(Candidato2, Edad2),
    Edad1 > Edad2.

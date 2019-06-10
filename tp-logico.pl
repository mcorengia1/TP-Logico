%Punto 1

candidato(frank,rojo).
candidato(claire, rojo).
candidato(garrett, azul).
candidato(jackie, amarillo).
candidato(linda, azul).
candidato(catherine, rojo).
candidato(seth, amarillo).
candidato(heather, amarillo).

edad(frank, 	50).
edad(claire,	52).
edad(garrett, 	64).
edad(peter, 	26).
edad(jackie,	38).
edad(linda, 	30).
edad(catherine, 59).
edad(heather, 	50).

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

habitantes(buenosAires, 15355000).
habitantes(chaco, 1143201).
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
    Partido1 \= Partido2.
% se cambio de / a \

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


leGanaA(CandidatoGanador, CandidatoPerdedor, Provincia):-
    mismoPartido(CandidatoGanador, CandidatoPerdedor),
	candidato(CandidatoGanador, PartidoGanador),
    postulaEn(PartidoGanador, Provincia).
leGanaA(CandidatoGanador, CandidatoPerdedor, Provincia):-
    not(mismoPartido(CandidatoGanador, CandidatoPerdedor)),
	candidato(CandidatoGanador, PartidoGanador), % se relaciona al candidato ganador con su partido
	candidato(CandidatoPerdedor, PartidoPerdedor),
    postulaEn(PartidoGanador, Provincia), % se relaciona el partido con la provincia
	postulaEn(PartidoPerdedor, Provincia),
    mayorPorcentaje(CandidatoGanador, CandidatoPerdedor, Provincia).
leGanaA(CandidatoGanador, CandidatoPerdedor, Provincia):-
    not(mismoPartido(CandidatoGanador, CandidatoPerdedor)),
	candidato(CandidatoGanador, PartidoGanador), % se relaciona al candidato ganador con su partido
	candidato(CandidatoPerdedor, PartidoPerdedor),
    postulaEn(PartidoGanador, Provincia), % se relaciona el partido con la provincia
	not(postulaEn(PartidoPerdedor, Provincia)).

mayorPorcentaje(CandidatoGanador, CandidatoPerdedor, Provincia):-
    candidato(CandidatoGanador, PartidoGanador),
    candidato(CandidatoPerdedor, PartidoPerdedor),
    intencionDeVotoEn(Provincia, PartidoGanador, PorcentajeGanador),
    intencionDeVotoEn(Provincia, PartidoPerdedor, PorcentajePerdedor),
    PorcentajeGanador > PorcentajePerdedor.
	
 mismoPartido(Candidato1, Candidato2):-
	candidato(Candidato1, Partido),
	candidato(Candidato2, Partido).

%Punto 4
elGranCandidato(Candidato):-
    candidatoMasJoven(Candidato),
    forall(postulaEn(Partido, Provincia), leGanaATodos(Candidato, Provincia)).

leGanaATodos(Candidato, Provincia):-
%	candidato(Candidato, Partido),
	candidato(OtroCandidato, OtroPartido),
    forall(postulaEn(OtroPartido , Provincia), leGanaA(Candidato, OtroCandidato, Provincia)).
% leGanaATodos(frank, chubut). leGanaATodos(frank, corrientes). 

candidatoMasJoven(Candidato):-
    candidato(Candidato, Partido),
    forall(candidato(OtroCandidato, Partido), mayorQue(OtroCandidato, Candidato)).

mayorQue(Candidato1, Candidato2):-
    edad(Candidato1, Edad1),
    edad(Candidato2, Edad2),
    Edad1 >= Edad2.


%Punto 5  
% ajusteConsultora(buenosAires, rojo, 20).   ajusteConsultora(neuquen, azul, -10).	OJO neuquen gana, nadie el rojo no compite ahí

ajusteConsultora(Provincia, Partido, PorcentajeDeVotos):-
	leGanaATodos(Candidato, Provincia), % relaciono la provincia con el candidato
	candidato(Candidato, Partido), % relaciono el partido con el candidato
	intencionDeVotoEn(Provincia, Partido, Porcentaje),
	PorcentajeDeVotos is Porcentaje-20.
ajusteConsultora(Provincia, Partido, PorcentajeDeVotos):-
	candidato(Candidato, Partido), % relaciono el partido con el candidato
	not(leGanaATodos(Candidato, Provincia)), % relaciono la provincia con el candidato
	intencionDeVotoEn(Provincia, Partido, Porcentaje),
	PorcentajeDeVotos is Porcentaje+5.
	
%Punto 6

% inflacion(contaInferior, cotaSuperior)
% construir(listaDeObras)
% nuevosPuestosDeTrabajo(cantidad)
% edilicio(hospital, 800)


promete(azul, [construir(hospital, 100), construir(jardines, 100), construir(escuelas, 5)])
promete(azul, inflacion(2, 4)).
	

promete(amarillo, [construir(hospital, 100), construir(universidad, 1), construir(comisarias, 200)])
promete(amarillo, inflacion(1, 15)).


promete(rojo, nuevosPuestosDeTrabajo(800000)).
promete(rojo, inflacion(10, 30)).

%promete(Partido, Promesa() )

%Punto 7
influenciaDePromesas(promete(_, inflacion(CotaInferior, CotaSuperior)), VariacionIntencionDeVotos):-
	VariacionIntencionDeVotos is (CotaInferior + CotaSuperior) / (-2).
influenciaDePromesas(promete(_, nuevosPuestosDeTrabajo(Cantidad)), 3):-
	Cantidad > 50000.
influenciaDePromesas(promete(Partido, Obras), VariacionIntencionDeVotos):-
	findall(Influencia, (calculoInfluencia(Influencia, Obra), member(Obra, Obras)), Influencias),
	sumlist(Influencias, VariacionIntencionDeVotos).

calculoInfluencia(2 , construir(hospital, Cantidad)):-
	Cantidad => 1.
calculoInfluencia(Influencia, construir(jardines, Cantidad)):-	
	Influencia is Cantidad * 0.1.
calculoInfluencia(Influencia, construir(escuelas, Cantidad)):-
	Influencia is Cantidad * 0.1.
calculoInfluencia(200, construir(comisarias, Cantidad)):-
	Cantidad == 200.influenciaDePromesas()
calculoInfluencia(Influencia, construir(Edilicio, Cantidad)):-
	Edilicio /= hospital,
	Edilicio /= comisarias,
	Edilicio /= universidad,
	Edilicio /= jardines,
	Edilicio /= escuelas,
	Influencia is Edilicio * (-1).


%Punto 8
promedioDeCrecimiento(Partido, CrecimientoTotal):-
	findall(Influencia, (promete(Partido, Promesa) , influenciaDePromesas(Promesa, Influencia)), Influencias),
	sumlist(Influencias, CrecimientoTotal).
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
	candidato(CandidatoGanador, PartidoGanador),
	candidato(CandidatoPerdedor, PartidoPerdedor),
	postulaEn(PartidoGanador, Provincia),
	not(postulaEn(PartidoPerdedor, Provincia)).
leGanaA(CandidatoGanador, CandidatoPerdedor, Provincia):-
	candidato(CandidatoGanador, PartidoGanador),
	postulaEn(PartidoGanador, Provincia),
	candidato(CandidatoPerdedor, PartidoPerdedor),
	PartidoGanador \= PartidoPerdedor,
	mayorPorcentaje(PartidoGanador, PartidoPerdedor, Provincia).
leGanaA(CandidatoGanador, CandidatoPerdedor, Provincia):-
	candidato(CandidatoGanador, Partido),
	candidato(CandidatoPerdedor, Partido),
	postulaEn(Partido, Provincia).

mayorPorcentaje(PartidoGanador, PartidoPerdedor, Provincia):-
    intencionDeVotoEn(Provincia, PartidoGanador, PorcentajeGanador),
    intencionDeVotoEn(Provincia, PartidoPerdedor, PorcentajePerdedor),
    PorcentajeGanador > PorcentajePerdedor.


%Punto 4

elGranCandidato(Candidato):-
	candidato(Candidato, Partido),
	forall(postulaEn(Partido, Provincia), leGanaATodos(Candidato, Provincia)),
	candidatoMasJoven(Candidato, Partido).

leGanaATodos(Candidato, Provincia):-
	forall(candidatoSePostulaEn(OtroCandidato, Provincia), leGanaA(Candidato, OtroCandidato, Provincia)).

candidatoSePostulaEn(Candidato, Provincia):-
	candidato(Candidato, Partido),
	postulaEn(Partido, Provincia).

candidatoMasJoven(Candidato, Partido):-
    forall(candidato(OtroCandidato, Partido), masJovenQue(Candidato, OtroCandidato)).

masJovenQue(Candidato1, Candidato2):-
    edad(Candidato1, Edad1),
    edad(Candidato2, Edad2),
    Edad1 =< Edad2.


%Punto 5  
% ajusteConsultora(rojo, buenosAires, 20).   ajusteConsultora(azul, neuquen, 15).	OJO neuquen gana, nadie el rojo no compite ahí

ajusteConsultora(Partido, Provincia, PorcentajeDeVotos):-
	intencionDeVotoEn(Provincia, Partido, Porcentaje),
	partidoGanaEn(Partido, Provincia),
	PorcentajeDeVotos is Porcentaje-20.
ajusteConsultora(Partido, Provincia, PorcentajeDeVotos):-
	intencionDeVotoEn(Provincia, Partido, Porcentaje),
	not(partidoGanaEn(Partido, Provincia)),
	PorcentajeDeVotos is Porcentaje+5.

partidoGanaEn(Partido, Provincia):-
	forall(postulaEn(OtroPartido, Provincia), mayorPorcentaje(Partido, OtroPartido, Provincia)).



%Punto 6

% inflacion(contaInferior, cotaSuperior)
% construir(listaDeObras)
% nuevosPuestosDeTrabajo(cantidad)
% edilicio(hospital, 800)


promete(azul, construir([edilicio(hospital, 100), edilicio(jardines, 100), edilicio(escuelas, 5)])).
promete(azul, inflacion(2, 4)).
	

promete(amarillo,  construir([edilicio(hospital, 100), edilicio(universidad, 1), edilicio(comisarias, 200)])). 
promete(amarillo, inflacion(1, 15)).


promete(rojo, nuevosPuestosDeTrabajo(800000)).
promete(rojo, inflacion(10, 30)).

%promete(Partido, Promesa() )

%Punto 7
influenciaDePromesas(promete(_, inflacion(CotaInferior, CotaSuperior)), VariacionIntencionDeVotos):-
	VariacionIntencionDeVotos is (CotaInferior + CotaSuperior) / (-2).
influenciaDePromesas(promete(_, nuevosPuestosDeTrabajo(Cantidad)), 3):-
	Cantidad > 50000.
	
influenciaDePromesas(promete(_,construir(Obras) ), VariacionIntencionDeVotos):-
	findall(Influencia, (member(Obra, Obras), calculoInfluencia(Influencia, Obra)), Influencias),
	sumlist(Influencias, VariacionIntencionDeVotos).

calculoInfluencia(2 , edilicio(hospital, Cantidad)):-
	Cantidad >= 1.
calculoInfluencia(Influencia, edilicio(jardines, Cantidad)):-	% calculoInfluencia(1.0, construir(jardines, 10)).
	Influencia is Cantidad * 0.1.
calculoInfluencia(Influencia, edilicio(escuelas, Cantidad)):-
	Influencia is Cantidad * 0.1.
calculoInfluencia(2, edilicio(comisarias, 200)).
%calculoInfluencia(-1, edilicio(_, _)).
%	Edilicio \= hospital,
%	Edilicio \= comisarias,
%	Edilicio \= universidad,
%	Edilicio \= jardines,
%	Edilicio \= escuelas,
%	Influencia is Edilicio * (-1).


%Punto 8
% promedioDeCrecimiento(azul, 9.5).		promedioDeCrecimiento(azul, X).
% promedioDeCrecimiento(rojo, -17).     promedioDeCrecimiento(rojo, X).
% promedioDeCrecimiento(amarillo, -4).

promedioDeCrecimiento(Partido, CrecimientoTotal):-
	postulaEn(Partido, _),
	findall(Influencia, (promete(Partido, Promesa) , influenciaDePromesas(promete(Partido, Promesa), Influencia)), Influencias),
	sumlist(Influencias, CrecimientoTotal).
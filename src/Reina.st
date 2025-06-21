Object subclass: #Reina
    instanceVariableNames: 'comidaConsumida colaObjetivos historialObjetivos estado'
    classVariableNames: 'COMIDA_MAX'
    package: 'GuerraHormigas'

Reina class >> inicializarClase: comidaMax
    COMIDA_MAX := comidaMax

Reina class >> inicializarClaseDefault
    self inicializarClase: 3

Reina class >> crear
    ^ self new inicializar

Reina >> inicializar
    comidaConsumida := 0.
    colaObjetivos := OrderedCollection new.
    historialObjetivos := OrderedCollection new.

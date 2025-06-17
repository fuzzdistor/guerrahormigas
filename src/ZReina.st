Object subclass: #Reina
    instanceVariableNames: 'comidaConsumida colaObjetivos historialObjetivos'
    classVariableNames: 'COMIDA_MAX'
    package: 'GuerraHormigas'

Reina class >> inicializarClase: comidaMax
    COMIDA_MAX := comidaMax

Reina class >> crear
    ^ self new

Reina >> inicializar
    comidaConsumida := 0.
    colaObjetivos := OrderedCollection new.
    historialObjetivos := OrderedCollection new.

    

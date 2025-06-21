Object subclass: #Objetivo
    instanceVariableNames: 'posicion recorrido'
    classVariableNames: ''
    package: 'GuerraHormigas'

Objetivo class >> crear: unaPosicion
    ^ self new inicializar: unaPosicion
    
Objetivo >> inicializar: unaPosicion
    posicion := unaPosicion.
    recorrido := OrderedCollection new.

Objetivo >> getPosicion
    ^ posicion

Objetivo >> getRecorrido
    ^ recorrido

Objetivo >> pasoSiguiente: unaPosicion
    | i |
    i := recorrido indexOf: unaPosicion.
    ^ recorrido at: i+1

Objetivo >> pasoAnterior: unaPosicion
    | i |
    i := recorrido indexOf: unaPosicion.
    ^ recorrido at: i-1

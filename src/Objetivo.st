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
    | i posicion |
    i := recorrido indexOf: unaPosicion.
    ((i + 1) < recorrido size) ifTrue: [
        i := i + 1.
    ].
    ^ recorrido at: i

Objetivo >> pasoAnterior: unaPosicion
    | i |
    i := recorrido indexOf: unaPosicion.
    ((i - 1) > 1) ifTrue: [
        i := i - 1.
    ].
    ^ recorrido at: i

Objetivo >> enDestino: unaPosicion
    ^ posicion = unaPosicion


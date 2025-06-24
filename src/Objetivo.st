Object subclass: #Objetivo
    instanceVariableNames: 'recorrido'
    classVariableNames: ''
    package: 'GuerraHormigas'

Objetivo class >> crear: unRecorrido
    ^ self new inicializar: unRecorrido.
    
Objetivo >> inicializar: unRecorrido
    recorrido := unRecorrido.

Objetivo >> esObjetivo
    ^ true

Objetivo >> esRecoleccion
    ^ false

Objetivo >> esAtaque
    ^ false

Objetivo >> getDestino
    ^ recorrido last

Objetivo >> getPartida
    ^ recorrido at: 1

Objetivo >> getRecorrido
    ^ recorrido

Objetivo >> pasoSiguiente: unaPosicion
    | i |
    i := recorrido indexOf: unaPosicion.
    ^ recorrido at: ((i + 1) min: recorrido size)

Objetivo >> pasoAnterior: unaPosicion
    | i |
    i := recorrido indexOf: unaPosicion.
    ^ recorrido at: ((i - 1) max: 1)

Objetivo >> enDestino: unaPosicion
    ^ self getDestino = unaPosicion

Objetivo >> enPartida: unaPosicion
    ^ self getPartida = unaPosicion

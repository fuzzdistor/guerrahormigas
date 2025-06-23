Object subclass: #Objetivo
    instanceVariableNames: 'recorrido tipoLugar'
    classVariableNames: ''
    package: 'GuerraHormigas'

Objetivo class >> crear: unTipoLugar recorrido: unRecorrido
    ^ self new inicializar: unTipoLugar recorrido: unRecorrido.
    
Objetivo >> inicializar: unTipoLugar recorrido: unRecorrido
    tipoLugar := unTipoLugar.
    recorrido := unRecorrido.

Objetivo >> getTipoLugar
    ^ tipoLugar

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

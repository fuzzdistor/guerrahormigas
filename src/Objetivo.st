Object subclass: #Objetivo
    instanceVariableNames: 'recorrido tipoLugar'
    classVariableNames: ''
    package: 'GuerraHormigas'

Objetivo class >> crear: unTipoLugar
    ^ self new inicializar: unTipoLugar
    
Objetivo >> inicializar: unTipoLugar
    tipoLugar := unTipoLugar.
    recorrido := OrderedCollection new.

Objetivo >> getTipoLugar
    ^ tipoLugar

Objetivo >> getDestino
    ^ recorrido last

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
    ^ posicion = unaPosicion


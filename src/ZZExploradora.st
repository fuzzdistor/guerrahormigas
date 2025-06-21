Trabajadora subclass: #Exploradora
    instanceVariableNames: 'historialLugares pasoPrevio'
    classVariableNames: 'MOVIMIENTOS_POR_TURNO'
    package: 'GuerraHormigas'

Exploradora class >> inicializarClase
    MOVIMIENTOS_POR_TURNO := 4.

Exploradora class >> crear
    ^ self new inicializarConPosicion: Point new.

Exploradora class >> derecha
    ^ Point x: 1 y: 0

Exploradora class >> izquierda
    ^ Point x: -1 y: 0

Exploradora class >> arriba
    ^ Point x: 0 y: -1

Exploradora class >> abajo
    ^ Point x: 0 y: 1

Exploradora class >> crear: unaPosicion
    ^ self new inicializarConPosicion: unaPosicion

Exploradora >> inicializarConPosicion: unaPosicion
    super inicializarConPosicion: unaPosicion.
    historialLugares := OrderedCollection new.
    " por defecto asignamos derecha como paso previo "
    pasoPrevio := Exploradora derecha

Exploradora >> ejecutarTurno: unMundo colonia: unaColonia
    (self estaAvanzando) ifTrue: [
        self explorar: unMundo.
    ]

Exploradora >> previamenteVisitado: unaPosicion
    | res |
    res := historialLugares detect: [ :l |
        l getPosicion = unaPosicion ] ifNone: nil.
    ^ res isNotNil
    
Exploradora >> explorar: unMundo
    | lugar movimientos visitado |
    movimientos := 4.
    [ 
        lugar := unMundo lugarEn: posicion.
        visitado := self previamenteVisitado: posicion.
        movimientos := movimientos - 1.
        " hacer mientras tenga movimientos disponibles y el lugar en el que estoy es nil o ya lo visité "    
    ] doWhileTrue: [ movimientos >= 1 and: (lugar isNil or: visitado) ].
    (lugar isNotNil and: (visitado not)) ifTrue: [
        self crearObjetivo: lugar.
    ].


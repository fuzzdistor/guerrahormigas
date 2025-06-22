Trabajadora subclass: #Exploradora
    instanceVariableNames: 'historialLugares pasoPrevio movimientos'
    classVariableNames: 'MOVIMIENTOS_POR_TURNO MOVIDAS'
    package: 'GuerraHormigas'

Exploradora class >> inicializarClase
    MOVIMIENTOS_POR_TURNO := 4.
    MOVIDAS := Array with: 1@0 with: (-1)@0 with: 0@1 with: 0@(-1).

Exploradora class >> getMovPorTurno
    ^ MOVIMIENTOS_POR_TURNO

Exploradora class >> crear
    ^ self new inicializar

Exploradora >> inicializar
    super inicializar.
    historialLugares := OrderedCollection new.
    " por defecto asignamos derecha como paso previo "
    pasoPrevio := Exploradora movidaAt: 1.
    self setAvanzando.

Exploradora class >> movidaAt: indice
    ^ MOVIDAS at: indice

Exploradora >> ejecutarTurno: unMundo colonia: unaColonia
    movimientos := Exploradora getMovPorTurno.
    (self estaAvanzando) ifTrue: [
        self explorar: unMundo.
    ]
    "TODO hacer que la hormiga vuelva y guarde sus pasos en recorrido"

Exploradora >> previamenteVisitado: unaPosicion
    | res |
    res := historialLugares detect: [ :l |
        l posicion = unaPosicion ] ifNone: nil.
    ^ res isNotNil
    
Exploradora >> explorar: unMundo
    | lugar visitado |
    [ 
        self mover: unMundo.
        lugar := unMundo lugarEn: posicion.
        visitado := self previamenteVisitado: posicion.
        movimientos := movimientos - 1.
        " hacer mientras tenga movimientos disponibles y el lugar en el que estoy es nil o ya lo visité "
    ] doWhileTrue: [ movimientos >= 1 and: (lugar isNil or: visitado) ].
    (lugar isNotNil and: (visitado not)) ifTrue: [
        self crearObjetivo: lugar class.
    ].

Exploradora >> mover: unMundo
    | paso |
    [   | rand |
        rand := (1 to: 4) atRandom.
        paso := Exploradora movidaAt: rand.
        " hacer mientras el paso sea el inverso del previo o no este dentro de los limites "
    ] doWhileTrue: [ (paso * -1) = pasoPrevio or: ((unMundo dentroDeLimites: posicion + paso) not) ].
    pasoPrevio := paso.
    posicion := posicion + paso.

Exploradora >> setLugar: unLugar
    super setLugar: unLugar.
    historialLugares add: unLugar

Exploradora >> crearObjetivo: unTipo
    Test log: unTipo name.
    ^ Objetivo crear: unTipo
    

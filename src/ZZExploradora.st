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
    [
        (self estaAvanzando) ifTrue: [
            self explorar: unMundo colonia: unaColonia.
        ].
        (self estaVolviendo) ifTrue: [
            [ 
                self volver.
                movimientos := movimientos - 1.
                (objetivo enPartida: posicion) ifTrue: [
                    (unaColonia getReina) recibirObjetivo: objetivo.
                    self setAvanzando.
                    objetivo := nil.
                ].
            ] doWhileTrue: [ movimientos >= 1 and: self estaVolviendo ].
        ].
    ] doWhileTrue: [ movimientos >= 1 ]

Exploradora >> volver
    posicion := objetivo pasoAnterior: posicion.

Exploradora >> previamenteVisitado: unaPosicion
    | res |
    res := historialLugares detect: [ :l |
        l posicion = unaPosicion ] ifNone: nil.
    ^ res isNotNil
    
Exploradora >> explorar: unMundo colonia: unaColonia
    | lugar visitado |
    [ 
        self caminar: unMundo.
        lugar := unMundo lugarEn: posicion.
        visitado := self previamenteVisitado: posicion.
        movimientos := movimientos - 1.
        " hacer mientras tenga movimientos disponibles y el lugar en el que estoy es nil o ya lo visité "
    ] doWhileTrue: [ (movimientos >= 1) and: (lugar isNil or: visitado) ].
    ((lugar isNotNil) and: (visitado not)) ifTrue: [
        objetivo := self crearObjetivo: (lugar class).
        self calcularRecorrido: (unaColonia posicion) destino: posicion.
        self setVolviendo.
    ].

Exploradora >> caminar: unMundo
    | paso |
    " elegir un paso válido que no me haga retroceder ni irme de los límites del mundo "
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

Exploradora >> calcularRecorrido: unaPartida destino: unDestino
    | recorrido unPunto |
    unPunto := unaPartida.
    recorrido := objetivo getRecorrido.
    recorrido add: unPunto.
    [ 
        | minDist sigPaso |
        minDist := unPunto squaredDistanceTo: unDestino.
        (unPunto fourNeighbors) do: [ :unPaso | 
            | dist |
            dist := unPaso squaredDistanceTo: unDestino.
            (dist < minDist) ifTrue: [
                sigPaso := unPaso.
                minDist := dist.
            ].
        ].
        recorrido add: sigPaso.
        unPunto := sigPaso.
    ] doWhileTrue: [ unPunto ~= unDestino ]
    
Exploradora >> crearObjetivo: unTipo
    ^ Objetivo crear: unTipo
    

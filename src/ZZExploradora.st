Trabajadora subclass: #Exploradora
    instanceVariableNames: 'historialLugares pasoPrevio'
    classVariableNames: 'MOVIDAS'
    package: 'GuerraHormigas'

Exploradora >> esExploradora
    ^ true

Exploradora class >> inicializarClase
    MOVIDAS := Array with: 1@0 with: (-1)@0 with: 0@1 with: 0@(-1).

Exploradora >> getMovPorTurno
    ^ 4

Exploradora class >> crear
    ^ self new inicializar

Exploradora >> inicializar
    super inicializar.
    historialLugares := OrderedCollection new.
    " por defecto asignamos derecha como paso previo "
    pasoPrevio := Exploradora movidaAt: 1.
    self setExplorando.

Exploradora class >> movidaAt: indice
    ^ MOVIDAS at: indice

Exploradora >> estaExplorando
    ^ estado = 'explorando'

Exploradora >> setExplorando
    estado := 'explorando'

Exploradora >> ejecutarAccion: unMundo colonia: unaColonia
    (self estaExplorando) ifTrue: [
        | lugar visitado |
        self caminar: unMundo.
        lugar := unMundo lugarEn: posicion.
        visitado := self previamenteVisitado: posicion.
        ((lugar isNotNil) and: (visitado not)) ifTrue: [
            self prepararObjetivo: lugar desde: unaColonia.
            self setVolviendo.
        ]
    ] ifFalse: [
        super ejecutarAccion: unMundo colonia: unaColonia.
    ]

Exploradora >> alLlegarAHogar: unMundo colonia: unaColonia
    self informarAReina: unaColonia.
    self setExplorando.
    

Exploradora >> prepararObjetivo: unLugar desde: unaColonia
    | reco |
    reco := self calcularRecorrido: (unaColonia posicion) destino: unLugar posicion.
    (unLugar esColonia) ifTrue: [
        objetivo := self crearAtaque: reco.
    ] ifFalse: [(unLugar esFuenteComida) ifTrue: [
            objetivo := self crearRecoleccion: reco.
        ].
    ].

Exploradora >> informarAReina: unaColonia
    (unaColonia getReina) recibirObjetivo: objetivo.
    objetivo := nil.

Exploradora >> previamenteVisitado: unaPosicion
    | res |
    res := historialLugares detect: [ :l |
        l posicion = unaPosicion ] ifNone: nil.
    ^ res isNotNil
    
Exploradora >> caminar: unMundo
    | paso |
    " elegir un paso válido que no me haga retroceder ni irme de los límites del mundo "
    [   
        | rand |
        rand := (1 to: 4) atRandom.
        paso := self class movidaAt: rand.
        " repetir mientras el paso sea el inverso del previo o no este dentro de los limites "
    ] doWhileTrue: [ (paso * -1) = pasoPrevio or: ((unMundo dentroDeLimites: posicion + paso) not) ].
    pasoPrevio := paso.
    posicion := posicion + paso.

Exploradora >> setLugar: unLugar
    super setLugar: unLugar.
    historialLugares add: unLugar

Exploradora >> calcularRecorrido: unaPartida destino: unDestino
    | recorrido unPunto |
    unPunto := unaPartida.
    recorrido := OrderedCollection new.
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
    ] doWhileTrue: [ unPunto ~= unDestino ].
    ^ recorrido

Exploradora >> crearAtaque: unRecorrido
    ^ Ataque crear: unRecorrido

Exploradora >> crearRecoleccion: unRecorrido
    ^ Recoleccion crear: unRecorrido
    

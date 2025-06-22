Trabajadora subclass: #Obrera
    instanceVariableNames: 'comidaCarga'
    classVariableNames: ''
    package: 'GuerraHormigas'

Obrera class >> crear
    ^ self new inicializar

Obrera >> inicializar
    super inicializar.
    comidaCarga := 0

Obrera >> ejecutarTurno: unMundo colonia: unaColonia
    (self estaInactiva) ifTrue: [
        self comer: unaColonia.
    ] ifFalse: [
        (self estaAvanzando) ifTrue: [
            self avanzar.
            (objetivo enDestino) ifTrue: [
                self recogerAlimento: unMundo.
            ]
        ] ifFalse: [
            (self estaVolviendo) ifTrue: [
                self volver.
                (self enColonia) ifTrue: [
                    self depositarAlimento: unaColonia.
                ].
            ].
        ].
    ].

Obrera >> avanzar
    posicion := objetivo pasoSiguiente: posicion.

Obrera >> volver
    posicion := objetivo pasoAnterior: posicion.

Obrera >> recogerAlimento: unMundo
    | fuente | 
    fuente := mundo lugarEn: posicion.
    fuente ifNotNil: [
        comidaCarga := fuente entregarRacion: 3
    ].
    self setVolviendo.

Obrera >> depositarAlimento: unaColonia
    unaColonia almacenarAlimento: comidaCarga.
    (comidaCarga = 0) ifTrue: [
        self setInactiva.
    ].
    comidaCarga := 0.


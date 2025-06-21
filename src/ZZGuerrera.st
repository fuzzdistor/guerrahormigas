Trabajadora subclass: #Guerrera
    instanceVariableNames: 'turnosHastaEntrenada vida resistencia poderGolpe'
    classVariableNames: ''
    package: 'GuerraHormigas'

Guerrera class >> crear
    ^ self new inicializarConPosicion: Point new.

Guerrera class >> crear: unaPosicion
    ^ self new inicializarConPosicion: unaPosicion

Guerrera >> inicializarConPosicion: unaPosicion
    super inicializarConPosicion: unaPosicion.
    turnosHastaEntrenada := 2.
    vida := 100.
    resistencia := 101.
    poderGolpe := 102.

Guerrera >> estaAtacando
    ^ estado = 'atacando'

Guerrera >> estaDefendiendo
    ^ estado = 'defendiendo'

Guerrera >> ejecutarTurno: unMundo colonia: unaColonia
    (turnosHastaEntrenada > 0) ifTrue: [
        turnosHastaEntrenada := turnosHastaEntrenada - 1.
    ].
    (objetivo isNil) ifTrue: [
        self comer: unaColonia
    ] ifFalse: [
        " si estoy avanzando sigo "
        (self estaAvanzando) ifTrue: [
            posicion := objetivo pasoSiguiente: posicion
        ].
        " si estoy volviendo retrocedo "
        (self estaVolviendo) ifTrue: [
            posicion := objetivo pasoAnterior: posicion
        ].
        (posicion = objetivo getPosicion) ifTrue: [
            | lugar |
            lugar := unMundo getLugar: posicion.
            (lugar isNil) ifFalse: [
                "TODO"
            ].
        "TODO"
        ].
    ]
    "TODO"

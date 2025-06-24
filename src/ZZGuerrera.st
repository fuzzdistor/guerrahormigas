Trabajadora subclass: #Guerrera
    instanceVariableNames: 'turnosHastaEntrenada vida resistencia poderGolpe'
    classVariableNames: ''
    package: 'GuerraHormigas'

Guerrera >> esGuerrera
    ^ true

Guerrera class >> crear
    ^ self new inicializar

Guerrera >> inicializar
    super inicializar.
    turnosHastaEntrenada := 2.
    vida := 100.
    resistencia := 101.
    poderGolpe := 102.

Guerrera >> entrenada
    ^ turnosHastaEntrenada = 0

Guerrera >> setAtacando
    estado := 'atacando'

Guerrera >> estaAtacando
    ^ estado = 'atacando'

Guerrera >> alLlegarAObjetivo: unMundo colonia: unaColonia
    | enemiga |
    enemiga := unMundo lugarEn: posicion.
    (enemiga isNotNil) ifTrue: [
        | gestor |
        gestor := unMundo getGestorBatalla.
        gestor registrarAtacante: unaColonia unidad: self coloniaDef: enemiga.
        self setAtacando.
    ] ifFalse: [
        self setVolviendo.
    ]

Guerrera >> alLlegarAHogar: unMundo colonia: unaColonia
    | gestor botin |
    " cobrar botin al llegar "
    gestor := unMundo getGestorBatalla.
    botin := gestor solicitarBotin: unaColonia.
    unaColonia almacenarAlimento: botin.
    objetivo := nil

Guerrera >> ejecutarTurno: unMundo colonia: unaColonia
    turnosHastaEntrenada := 0 max: (turnosHastaEntrenada - 1).
    (self estaAtacando) ifFalse: [
        super ejecutarTurno: unMundo colonia: unaColonia
    ]

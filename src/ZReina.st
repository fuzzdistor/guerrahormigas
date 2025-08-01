Hormiga subclass: #Reina
    instanceVariableNames: 'comidaConsumida colaObjetivos historialObjetivos'
    classVariableNames: 'COMIDA_MAX'
    package: 'GuerraHormigas'

Reina >> esReina
    ^ true

Reina class >> inicializarClase: comidaMax
    COMIDA_MAX := comidaMax

Reina class >> inicializarClase
    self inicializarClase: 3

Reina class >> crear
    ^ self new inicializar

Reina class >> comidaMax
    ^ COMIDA_MAX

Reina >> inicializar
    super inicializar.
    comidaConsumida := 0.
    colaObjetivos := OrderedCollection new.
    historialObjetivos := OrderedCollection new.
    self setInactiva

Reina >> recibirObjetivo: unObjetivo
    " si no lo encuentro lo añado "
    colaObjetivos detect: [ :o |
        o getDestino = unObjetivo getDestino ]
        ifNone: [ colaObjetivos add: unObjetivo ]

Reina >> crearTrabajadora "instanciador recurso"
    | chance hormiga |
    " está comprobado que esto da las chances correctas"
    chance := (0 to: 9) atRandom.
    (chance < 3) ifTrue: [
    	hormiga := self crearObrera
    ] ifFalse: [ (chance < 5) ifTrue: [ 
    		hormiga := self crearExploradora
    	] ifFalse: [(chance < 8) ifTrue: [ 
                hormiga := self crearGuerrera
    		]
    	]
    ].
    ^ hormiga

Reina >> comer: unaColonia
    " herencia por refinamiento "
    super comer: unaColonia.
    (self estaViva) ifTrue: [
        comidaConsumida := comidaConsumida + 1.
    ]

Reina >> crearExploradora
    | hormiga |
    hormiga := Exploradora crear.
    ^ hormiga

Reina >> crearGuerrera
    | hormiga |
    hormiga := Guerrera crear.
    ^ hormiga

Reina >> crearObrera
    | hormiga |
    hormiga := Obrera crear.
    ^ hormiga

Reina >> ejecutarTurno: unMundo colonia: unaColonia
    | hormiga |
    self comer: unaColonia.
    (self estaViva) ifTrue: [
        (comidaConsumida = Reina comidaMax) ifTrue: [
            hormiga := self crearTrabajadora.
            comidaConsumida := 0.
            Test bloque: [
                (hormiga isNil) ifTrue: [
                    Test log: 'Reina ', self id asString, ' fallo en crear hormiga'.
                ] ifFalse: [
                    Test log: 'Reina ', self id asString, ' creo ', hormiga asString.
                ].
            ].
            (hormiga isNotNil) ifTrue: [
                unaColonia agregarHormiga: hormiga.
            ].
        ].
        self procesarObjetivos: unaColonia
    ].

Reina >> procesarObjetivos: unaColonia
    self procesarAtaques: unaColonia.
    self procesarRecolecciones: unaColonia.

Reina >> procesarAtaques: unaColonia
    | guerreras objetivoAtaque |
    " selecciono un objetivo de ataque "
    objetivoAtaque := colaObjetivos detect: [ :a | a esAtaque ] ifNone: nil.
    " selecciono guerreras entrenadas "
    guerreras := (unaColonia getHormigas: [ :g | g esGuerrera and: [ g entrenada ] ]).
    " si no está atacando, hay objetivo y hay al menos 10 guerreras preparadas "
    ((unaColonia atacando or: objetivoAtaque isNil) or: (guerreras size < 10)) ifFalse: [
        | objetivo |
        " deja al menos 5 guerreras entrenadas en la colonia "
        (1 to: guerreras size - 5) do: [ :i |
            | hormiga |
            hormiga := guerreras at: i.
            hormiga setObjetivo: objetivoAtaque.
            hormiga setAvanzando.
        ].
        " como solo voy a declarar la guerra una vez
          añado el objetivo al historial y lo quito de la cola "
        historialObjetivos add: objetivoAtaque.
        colaObjetivos remove: objetivoAtaque.
    ].

Reina >> informarObjetivoTerminado: unObjetivo colonia: unaColonia
    (unObjetivo esAtaque) ifTrue: [
        unaColonia almacenarAlimento: unObjetivo reclamarBotin.
    ] ifFalse: [
        (colaObjetivos includes: unObjetivo) ifTrue: [
            historialObjetivos add: unObjetivo.
            colaObjetivos remove: unObjetivo.
        ].
    ].
    
Reina >> procesarRecolecciones: unaColonia
    | obreras objetivosRecoleccion |
    " selecciono objetivos de recoleccion "
    objetivosRecoleccion := colaObjetivos select: [ :r | r esRecoleccion ].
    " selecciono obreras disponibles "
    obreras := (unaColonia getHormigas: [ :o | o esObrera and: [ o estaInactiva ] ]).
    " si hay objetivos de recoleccion asignar a las obreras "
    (objetivosRecoleccion isNotEmpty) ifTrue: [
        obreras do: [ :obrera |
            obrera setObjetivo: objetivosRecoleccion first.
            obrera setAvanzando.
        ].
    ].


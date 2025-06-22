Hormiga subclass: #Reina
    instanceVariableNames: 'comidaConsumida colaObjetivos historialObjetivos'
    classVariableNames: 'COMIDA_MAX'
    package: 'GuerraHormigas'

Reina class >> inicializarClase: comidaMax
    COMIDA_MAX := comidaMax

Reina class >> inicializarClase
    self inicializarClase: 3

Reina class >> crear
    ^ self new inicializar

Reina class >> comidaMax
    ^ COMIDA_MAX

Reina >> inicializar
    comidaConsumida := 0.
    colaObjetivos := OrderedCollection new.
    historialObjetivos := OrderedCollection new.
    estado := 'inactiva'

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
    	hormiga := self crearTrabajadora: Obrera. 
    ] ifFalse: [ (chance < 5) ifTrue: [ 
    		hormiga := self crearTrabajadora: Exploradora.
    	] ifFalse: [(chance < 8) ifTrue: [ 
                hormiga := self crearTrabajadora: Guerrera.
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

Reina >> crearTrabajadora: unTipo 
    | hormiga |
    hormiga := unTipo crear.
    ^ hormiga

Reina >> ejecutarTurno: unMundo colonia: unaColonia
    | hormiga |
    self comer: unaColonia.
    (self estaViva) ifTrue: [
        (comidaConsumida = Reina comidaMax) ifTrue: [
            hormiga := self crearTrabajadora.
            comidaConsumida = 0.
            (hormiga isNotNil) ifTrue: [
                unaColonia agregarHormiga: hormiga.
            ].
        ].
        self procesarObjetivos: unMundo.
    ].


Reina >> procesarObjetivos: unMundo
    " TODO "
    

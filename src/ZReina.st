Hormiga subclass: #Reina
    instanceVariableNames: 'comidaConsumida colaObjetivos historialObjetivos estado'
    classVariableNames: 'COMIDA_MAX'
    package: 'GuerraHormigas'

Reina class >> inicializarClase: comidaMax
    COMIDA_MAX := comidaMax

Reina class >> inicializarClaseDefault
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

Reina >> crearHormiga "instanciador recurso"
    | chance hormiga |
    " está comprobado que esto da las chances correctas"
    chance := (0 to: 9) atRandom.
    (chance < 3) ifTrue: [
    	hormiga := self crearHormiga: Obrera. 
    ] ifFalse: [ (chance < 5) ifTrue: [ 
    		hormiga := self crearHormiga: Exploradora.
    	] ifFalse: [(chance < 8) ifTrue: [ 
                hormiga := self crearHormiga: Guerrera.
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

Reina >> crearHormiga: unTipo 
    | hormiga |
    hormiga := unTipo crear.
    ^ hormiga

Reina >> ejecutarTurno: unMundo colonia: unaColonia
    | hormiga |
    self comer: unaColonia.
    (self estaViva) ifTrue: [
        (comidaConsumida = Reina comidaMax) ifTrue: [
            hormiga := self crearHormiga.
            comidaConsumida = 0.
            (hormiga isNotNil) ifTrue: [
                unaColonia agregarHormiga: hormiga.
            ].
        ].
        self procesarObjetivos: unMundo.
    ].


Reina >> procesarObjetivos: unMundo
    

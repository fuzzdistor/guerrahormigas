Lugar subclass: #Colonia
    instanceVariableNames: 'colHormigas reina'
    classVariableNames: ''
    package: 'GuerraHormigas'

Colonia class >> crear: unaPosicion comida: cantComida "constructor"
    ^ self new inicializar: unaPosicion comida: cantComida

Colonia >> inicializar: unaPosicion comida: cantComida
    super inicializar: unaPosicion comida: cantComida.
    colHormigas := OrderedCollection new.
    reina := Reina crear.

Colonia >> atacando
    ^ (colHormigas detect: [ :h | 
        (h isMemberOf: Guerrera) and: (h objetivo notNil) ] ifNone: nil) notNil 

Colonia >> crearHormiga "instanciador recurso"
    | chance |
    " está comprobado que esto da las chances correctas"
    chance := (0 to: 9) atRandom.
    (chance < 3) ifTrue: [
    	self crearHormiga: Obrera. 
    ] ifFalse: [ (chance < 5) ifTrue: [ 
    		self crearHormiga: Exploradora.
    	] ifFalse: [(chance < 8) ifTrue: [ 
                self crearHormiga: Guerrera.
    		]
    	]
    ].

Colonia >> crearHormiga: unTipo
    | hormiga |
    hormiga := unTipo crear: self posicion.
    colHormigas add: hormiga.
    ^ hormiga

Colonia >> limpiarHormigasMuertas
    colHormigas := colHormigas select: [:h | h estaViva ]

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
        (h esGuerrera) and: (h objetivo notNil) ] ifNone: nil) notNil 

Colonia >> agregarHormiga: unaHormiga "instanciador recurso"
    unaHormiga setLugar: self.
    colHormigas add: unaHormiga

Colonia >> limpiarHormigasMuertas
    colHormigas := colHormigas select: [ :h | 
        Test bloque: [(h estaMuerta) ifTrue: [ Test log: 'Hormiga ', h asString ,' con id ', h id asString, ' murio'.]].
    h estaViva ]

Colonia >> destruido
    " herencia por reemplazo ya que la condición de destrucción cambia "
    ^ reina estaMuerta

Colonia >> almacenarAlimento: unaCantidad
    cantidadComida := cantidadComida + unaCantidad

Colonia >> getReina
    ^ reina

Colonia >> getHormigas: unBloque
    ^ colHormigas select: unBloque

Colonia >> defensasDisponibles
    ^ colHormigas select: [ :h | h esGuerrera and: [ h entrenada ] ].

Colonia >> ejecutarTurno: unMundo
    " herencia por reemplazo "
    reina ejecutarTurno: unMundo colonia: self.
    (reina estaViva) ifTrue: [
        colHormigas do: [ :h | h ejecutarTurno: unMundo colonia: self ].
        colHormigas := colHormigas select: [ :h | h estaViva ].
    ].

Colonia >> informarObjetivoTerminado: objetivo
    reina informarObjetivoTerminado: objetivo colonia: self

Colonia >> esColonia
    ^ true

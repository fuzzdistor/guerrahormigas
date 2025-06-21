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

Colonia >> agregarHormiga: unaHormiga "instanciador recurso"
    unaHormiga setPosicion: self posicion.
    colHormigas add: unaHormiga

Colonia >> limpiarHormigasMuertas
    colHormigas := colHormigas select: [ :h | h estaViva ]

Colonia >> destruido
    " herencia por reemplazo ya que la condición de destrucción cambia "
    ^ reina estaMuerta

Colonia >> almacenarAlimento: unaCantidad
    cantidadComida := cantidadComida + unaCantidad

Colonia >> getReina
    ^ reina

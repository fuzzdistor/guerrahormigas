Object subclass: #Mundo
    instanceVariableNames: 'ancho alto colLugares managerBatallas'
    classVariableNames: ''
    package: 'GuerraHormigas'

Mundo class >> crearConAlto: unAlto ancho: unAncho "creador de instancia"
    ^ self new inicializarConAlto: unAlto ancho: unAncho

Mundo >> inicializarConAlto: unAlto ancho: unAncho "inicializador de instancia"
    alto := unAlto.
    ancho := unAncho.
    colLugares := OrderedCollection new

Mundo >> lugarEn: unPunto "observador"
    ^ colLugares detect: [ :lugar | 
        lugar posicion = unPunto
        ] ifNone: nil

Mundo >> crearFuenteComida: unPunto cantidadComida: unaCantidad
    | fuenteComida |
    (self lugarEn: unPunto) ifNil: [
        fuenteComida := FuenteComida crear: unPunto comida: unaCantidad.
        colLugares add: fuenteComida.
        ].
    ^ fuenteComida

Mundo >> crearColonia: unPunto cantidadComida: unaCantidad
    | colonia |
    (self lugarEn: unPunto) ifNil: [
        colonia := Colonia crear: unPunto comida: unaCantidad.
        colLugares add: colonia.
        ].
    colonia ifNil: [ self halt ].
    ^ colonia

Mundo >> ejecutarTurno
    "ejecutar turno de todos los lugares"
    colLugares do: [ :l |
        l ejecutarTurno: self
        ].

    "destruir lugares sin comida"
    colLugares := colLugares difference: colLugares select: [ :l |
        l marcadoParaDestruccion
        ].

    "hacer un turno de batallas"
    managerBatallas ejecutarTurno

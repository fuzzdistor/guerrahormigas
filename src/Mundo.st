Object subclass: #Mundo
    instanceVariableNames: 'ancho alto colLugares gestorBatallas'
    classVariableNames: ''
    package: 'GuerraHormigas'

Mundo class >> crearConAlto: unAlto ancho: unAncho "creador de instancia"
    ^ self new inicializarConAlto: unAlto ancho: unAncho

Mundo >> inicializarConAlto: unAlto ancho: unAncho "inicializador de instancia"
    alto := unAlto.
    ancho := unAncho.
    colLugares := OrderedCollection new.
    gestorBatallas := GestorBatallas crear.

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
    ^ colonia

Mundo >> ejecutarTurno
    "ejecutar turno de todos los lugares"
    colLugares do: [ :l |
        l ejecutarTurno: self
        ].

    "destruir lugares sin comida"
    colLugares := colLugares select: [ :l |
        l destruido not
        ].

    "hacer un turno de batallas"
    gestorBatallas ejecutarTurno.

    colLugares := colLugares select: [ :l |
        l destruido not
        ].

Mundo >> dentroDeLimites: unaPosicion
    ^ (unaPosicion x > 0 and: unaPosicion x < ancho) and:
        (unaPosicion y > 0 and: unaPosicion y < alto).

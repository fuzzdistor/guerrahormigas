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

Mundo >> crearFuenteComida: unPunto cantidadComida: unaCantidad "creador de recurso"
    | fuenteComida |
    (self lugarEn: unPunto) ifNil: [
        fuenteComida := FuenteComida crear: unPunto comida: unaCantidad.
        colLugares add: fuenteComida.
        ].
    ^ fuenteComida

Mundo >> crearColonia: unPunto cantidadComida: unaCantidad "creador de recurso"
    | colonia |
    (self lugarEn: unPunto) ifNil: [
        colonia := Colonia crear: unPunto comida: unaCantidad.
        colLugares add: colonia.
        ].
    ^ colonia

Mundo >> ejecutarTurno "turno"
    "ejecutar turno de todos los lugares"
    colLugares do: [ :l |
        l ejecutarTurno: self
        ].

    self limpiarLugaresDestruidos.

    "hacer un turno de batallas"
    gestorBatallas ejecutarTurno.

    self limpiarLugaresDestruidos.


Mundo >> limpiarLugaresDestruidos "limpieza"
    " conservar solo los lugares que no están destruídos "
    colLugares := colLugares select: [ :l |
        l destruido not
        ].

Mundo >> getGestorBatalla
    ^ gestorBatallas.

Mundo >> dentroDeLimites: unaPosicion "comprobacion"
    ^ (unaPosicion x >= 1 and: unaPosicion x <= ancho) and:
        (unaPosicion y >= 1 and: unaPosicion y <= alto).

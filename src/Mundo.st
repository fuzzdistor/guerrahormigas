Object subclass: #Mundo
    instanceVariableNames: 'ancho alto colLugares'
    classVariableNames: ''
    package: 'GuerraHormigas'

Mundo class >> crearConAlto: unAlto ancho: unAncho "creador de instancia"
    ^ self new inicializarConAlto: unAlto ancho: unAncho

Mundo >> inicializarConAlto: unAlto ancho: unAncho "inicializador"
    alto := unAlto.
    ancho := unAncho.
    colLugares := OrderedCollection new

Mundo >> lugarEn: unPunto
    ^ colLugares detect: [ :lugar | 
        lugar posicion = unPunto
        ] ifNone: nil

Mundo >> crearFuenteComida: unPunto cantidadComida: unaCantidad
    | fuenteComida |
    (self getLugar unPunto) ifNil: [
        fuenteComida := FuenteComida crearConComida: unaCantidad.
        colLugares add: fuenteComida.
        ].
    ^ fuenteComida

Mundo >> crearColonia: unPunto cantidadComida: unaCantidad
    | fuenteComida |
    (self getLugar unPunto) ifNil: [
        fuenteComida := FuenteComida crearConComida: unaCantidad.
        colLugares add: fuenteComida.
        ].
    ^ fuenteComida


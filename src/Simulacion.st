Object subclass: #Simulacion
    instanceVariableNames: 'mundo nroTurno'
    classVariableNames: ''
    package: 'GuerraHormigas'

Simulacion class >> crear "creador de instancia"
    ^ self new inicializar

Simulacion >> inicializar "incializador"
    mundo := nil.
    nroTurno := 0

Simulacion >> ejecutarTurno "turno"
    Test log: '--- Inicio Turno ', nroTurno asString, ' ---'.
    mundo ejecutarTurno.
    nroTurno := nroTurno + 1

Simulacion >> getNroTurno
    ^ nroTurno

Simulacion >> crearMundoDefault
    ^ self crearMundo: Configuracion default

Simulacion >> crearMundo: unaConf
    | colonias fuentes |
    colonias := unaConf colonias.
    fuentes := unaConf fuentes.
    mundo := Mundo crearConAlto: unaConf alto ancho: unaConf ancho.
    (0 to: (colonias size / 6) - 1) do: [ :j | | i nuevaCol reina |
        "posx posy comida guerreras obreras exploradoras"
        i := j*6 + 1.
        nuevaCol := mundo crearColonia: (Point x: (colonias at: i) y: (colonias at: i+1)) cantidadComida: (colonias at: i+2).
        reina  := nuevaCol getReina.
        (1 to: (colonias at: i+3)) do: [ :_ |
            nuevaCol agregarHormiga: (reina crearGuerrera).
        ].
        (1 to: (colonias at: i+4)) do: [ :_ |
            nuevaCol agregarHormiga: (reina crearObrera).
        ].
        (1 to: (colonias at: i+5)) do: [ :_ |
            nuevaCol agregarHormiga: (reina crearExploradora).
        ].
    ].

    (0 to: (fuentes size / 3) - 1) do: [ :j | | i nuevaCol |
        "posx posy comida"
        i := j*3 + 1.
        nuevaCol := mundo crearFuenteComida: (Point x: (fuentes at: i) y: (fuentes at: i+1)) cantidadComida: (fuentes at: i+2).
    ].
    ^ mundo

Simulacion >> crearColonia: unPunto cantidadComida: unaCantidad
    mundo crearColonia: unPunto cantidadComida: unaCantidad

Simulacion >> crearFuenteComida: unPunto cantidadComida: unaCantidad
    mundo crearFuenteComida: unPunto cantidadComida: unaCantidad

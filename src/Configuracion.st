Object subclass: #Configuracion
    instanceVariableNames: 'data'
    classVariableNames: ''
    package: 'GuerraHormigas'

Configuracion class >> default
    | default fuentes colonias |
    default := Configuracion new inicializar.
    fuentes := #( 
        "posx posy comida"
        2 2 1000 
        7 2 1000 
        9 2 1000
        14 2 1000
        15 2 1000
        10 4 1000
        14 4 1000
        2 6 1000
        3 8 1000
        7 9 1000
        12 9 1000
        14 10 1000
        3 11 1000
        13 12 1000
        8 13 1000
        ).
    colonias := #( 
        "posx posy comida guerreras obreras exploradoras"
        13 2 300 5 10 5 
        3 3 300 5 10 5 
        6 6 300 5 10 5 
        14 6 300 5 10 5 
        11 11 300 5 10 5
        ).
    default add: #ancho -> 15.
    default add: #alto -> 15.
    default add: #colonias -> colonias.
    default add: #fuentes -> fuentes.
    default add: #semilla -> 0.
    default add: #reina_comida_max -> 3.
    ^ default

Configuracion >> crear
    ^ self new inicializar.

Configuracion >> setAncho: unAncho alto: unAlto
    self add: #ancho -> unAncho.
    self add: #alto -> unAncho.

Configuracion >> add: unPar
    data add: unPar

Configuracion >> inicializar
    data := Dictionary new.

Configuracion >> ancho
    ^ data at: #ancho

Configuracion >> alto
    ^ data at: #alto

Configuracion >> colonias
    ^ data at: #colonias

Configuracion >> fuentes
    ^ data at: #fuentes

Configuracion >> semilla
    ^ data at: #semilla

Configuracion >> reinaComidaMax
    ^ data at: #reina_comida_max


Object subclass: #Configuracion
    instanceVariableNames: 'data'
    classVariableNames: ''
    package: 'GuerraHormigas'

Configuracion class >> default
    | default fuentes colonias |
    default := Configuracion new inicializar.
    fuentes := #( 
        "posx posy comida"
        2 2 100 
        7 2 100 
        9 2 100
        14 2 100
        15 2 100
        10 4 100
        14 4 100
        2 6 100
        3 8 100
        7 9 100
        12 9 100
        14 10 100
        3 11 100
        13 12 100
        8 13 100
        ).
    colonias := #( 
        "posx posy comida guerreras obreras exploradoras"
        13 2 100 5 10 5 
        3 3 100 5 10 5 
        6 6 100 5 10 5 
        14 6 100 5 10 5 
        11 11 100 5 10 5
        ).
    default add: #ancho -> 15.
    default add: #alto -> 15.
    default add: #colonias -> colonias.
    default add: #fuentes -> fuentes.
    default add: #semilla -> 0.
    default add: #reina_comida_max -> 3.
    ^ default

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


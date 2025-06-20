Hormiga subclass: #Guerrera
    instanceVariableNames: 'entrenada vida resistencia poderGolpe posObjetivo modo'
    classVariableNames: ''
    package: 'GuerraHormigas'

Guerrera class >> crear: unaPosicion
    ^ self new inicializarConPosicion: unaPosicion

Guerrera >> inicializarConPosicion: unaPosicion
    super inicializarConPosicion: unaPosicion

Hormiga subclass: #Obrera
    instanceVariableNames: 'entrenada vida resistencia poderGolpe posObjetivo modo'
    classVariableNames: ''
    package: 'GuerraHormigas'

Obrera class >> crear: unaPosicion
    ^ self new inicializarConPosicion: unaPosicion

Obrera >> inicializarConPosicion: unaPosicion
    super inicializarConPosicion: unaPosicion

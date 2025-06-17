Hormiga subclass: #Guerrera
    instanceVariableNames: 'entrenada vida resistencia poderGolpe posObjetivo modo'
    classVariableNames: ''
    package: 'GuerraHormigas'

Guerrera class >> crear: id
    ^ self new inicializar: id

Guerrera >> inicializar: id
    super inicializar: id

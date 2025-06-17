Hormiga subclass: #Obrera
    instanceVariableNames: 'entrenada vida resistencia poderGolpe posObjetivo modo'
    classVariableNames: ''
    package: 'GuerraHormigas'

Obrera class >> crear: id
    ^ self new inicializar: id

Obrera >> inicializar: id
    super inicializar: id

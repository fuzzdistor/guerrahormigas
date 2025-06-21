Lugar subclass: #FuenteComida
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'GuerraHormigas'

FuenteComida class >> crear: unaPosicion comida: cantComida "constructor"
    ^ self new inicializar: unaPosicion comida: cantComida

FuenteComida >> inicializar: unaPosicion comida: unaCantidad
    super inicializar: unaPosicion comida: unaCantidad.

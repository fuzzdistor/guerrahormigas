Hormiga subclass: #Exploradora
    instanceVariableNames: 'mensaje historialMensajes recorridoAColonia'
    classVariableNames: ''
    package: 'GuerraHormigas'

Exploradora class >> crear: unaPosicion
    ^ self new inicializarConPosicion: unaPosicion

Exploradora >> inicializarConPosicion: unaPosicion
    super inicializarConPosicion: unaPosicion

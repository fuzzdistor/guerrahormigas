Object subclass: #Mensaje
    instanceVariableNames: 'lugar tipo'
    classVariableNames: ''
    package: 'GuerraHormigas'

Mensaje class >> crearConLugar: unLugar tipo: unTipo
    ^ self new inicializar: unLugar tipo: unTipo

Mensaje >> inicializar: unLugar tipo: unTipo
    lugar := unLugar.
    tipo := unTipo.

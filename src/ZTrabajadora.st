Hormiga subclass: #Trabajadora
    instanceVariableNames: 'posicion objetivo'
    classVariableNames: ''
    package: 'GuerraHormigas'


Trabajadora >> inicializar "inicializador de instancia"
    super inicializar.
    posicion := nil.
    objetivo := nil.

Trabajadora >> objetivo "observador"
    ^ objetivo

Trabajadora >> posicion "observador"
    ^ posicion

Trabajadora >> setPosicion: unaPosicion
    posicion := unaPosicion

Trabajadora >> setLugar: unLugar
    self setPosicion: unLugar posicion.

Trabajadora >> setObjetivo: unObjetivo
    objetivo := unObjetivo.

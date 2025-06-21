Hormiga subclass: #Trabajadora
    instanceVariableNames: 'posicion objetivo'
    classVariableNames: ''
    package: 'GuerraHormigas'


Trabajadora >> inicializar "inicializador de instancia"
    self incializarConPosicion: Point new.

Trabajadora >> inicializarConPosicion: unPunto "inicializador de instancia"
    super inicializar
    posicion := unPunto.
    objetivo := nil.

Trabajadora >> objetivo "observador"
    ^ objetivo

Trabajadora >> posicion "observador"
    ^ posicion

Trabajadora >> setPosicion: unaPosicion
    posicion := unaPosicion





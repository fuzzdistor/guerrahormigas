Object subclass: #Test
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'GuerraHormigas'

Test class >> probar

Test class >> log: unMensaje
    Stdio stdout nextPutAll: unMensaje asString; lf.

Test class >> testRecorrido
    | e l |
    Hormiga inicializarClase.
    Exploradora inicializarClase.
    e := Exploradora crear.
    e setObjetivo: (e crearObjetivo: Colonia).
    e calcularRecorrido: 1@1 destino: 10@17.
    ^ e


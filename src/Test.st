Object subclass: #Test
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'GuerraHormigas'

Test class >> probar

Test class >> escribirPorConsola: unMensaje
    Stdio stdout nextPutAll: unMensaje asString; lf.

Test class >> escribirPorTranscript: unMensaje
    Transcript show: unMensaje asString; cr.

Test class >> log: unMensaje
    Test escribirPorConsola: unMensaje.
    Test escribirPorTranscript: unMensaje.

Test class >> bloque: unBloque
    unBloque value.

Test class >> testRecorrido
    | e l |
    Hormiga inicializarClase.
    Exploradora inicializarClase.
    e := Exploradora crear.
    e setObjetivo: (e crearObjetivo: Colonia).
    e calcularRecorrido: 1@1 destino: 10@17.
    ^ e


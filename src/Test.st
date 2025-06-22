Object subclass: #Test
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'GuerraHormigas'

Test class >> probar

Test class >> log: unMensaje
    Stdio stdout nextPutAll: unMensaje asString; lf.

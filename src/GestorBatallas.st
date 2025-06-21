Object subclass: #GestorBatallas
    instanceVariableNames: 'diccionarioBatallas diccionarioBotin'
    classVariableNames: ''
    package: 'GuerraHormigas'

GestorBatallas class >> crear
    ^ self new inicializar

GestorBatallas >> inicializar
    diccionarioBatallas := Dictionary new.
    diccionarioBotin := Dictionary new.

GestorBatallas >> registrarAtacante: coloniaAtacante unidad: unaHormiga coloniaDef: coloniaDefensora
    | batalla |
    batalla := diccionarioBatallas 
        at: coloniaAtacante 
        ifAbsentPut: [ 
            Batalla crear: coloniaAtacante defensora: coloniaDefensora 
        ].
    batalla registrarAtacante: unaHormiga

GestorBatallas >> ejecutarTurno
    " librar todas las batallas registradas "
    diccionarioBatallas values do: [ :batalla |
        batalla librarBatalla
        ].
    " guardar los botines de las batallas ganadas por los atacantes "
    diccionarioBatallas values do: [ :batalla |
        (batalla enCurso) ifFalse: [
            (batalla victoriaAtacante) ifTrue: [
                diccionarioBotin add: batalla getAtacante -> botin.
            ].
        ].
    ].
    " eliminar las batallas que terminaron "
    diccionarioBatallas select: [ :aso | 
        | batalla |
        batalla := aso value.
        batalla enCurso
    ]
    " eliminar botines de colonias que murieron antes de reclamarlo "
    diccionarioBotin select: [ :aso |
        | atacante |
        atacante := aso key.
        atacante destruido not
    ]

GestorBatallas >> solicitarBotin: unaColonia
    | botin |
    botin := diccionarioBotin at: unaColonia.
    diccionarioBotin removeKey: unaColonia.
    ^ botin


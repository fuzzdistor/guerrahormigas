Object subclass: #GestorBatallas
    instanceVariableNames: 'dicBatallas dicBotin'
    classVariableNames: ''
    package: 'GuerraHormigas'

GestorBatallas class >> crear
    ^ self new inicializar

GestorBatallas >> inicializar
    dicBatallas := Dictionary new.
    dicBotin := Dictionary new.

GestorBatallas >> registrarAtacante: coloniaAtacante unidad: unaHormiga coloniaDef: coloniaDefensora
    | batalla |
    batalla := dicBatallas 
        at: coloniaAtacante 
        ifAbsentPut: [ 
            Batalla crear: coloniaAtacante defensora: coloniaDefensora 
        ].
    batalla registrarAtacante: unaHormiga

GestorBatallas >> ejecutarTurno
    " librar todas las batallas registradas "
    dicBatallas values do: [ :batalla |
        batalla librarBatalla
        ].
    " guardar los botines de las batallas ganadas por los atacantes "
    dicBatallas values do: [ :batalla |
        (batalla enCurso) ifFalse: [
            (batalla victoriaAtacante) ifTrue: [
                dicBotin add: (batalla getAtacante) -> (batalla getBotin).
            ].
        ].
    ].
    " eliminar las batallas que terminaron "
    dicBatallas select: [ :aso | 
        | batalla |
        batalla := aso value.
        batalla enCurso
    ].
    " eliminar botines de colonias que murieron antes de reclamarlo "
    dicBotin select: [ :aso |
        | atacante |
        atacante := aso key.
        atacante destruido not
    ]

GestorBatallas >> solicitarBotin: unaColonia
    | botin |
    botin := dicBotin at: unaColonia.
    dicBotin removeKey: unaColonia.
    ^ botin


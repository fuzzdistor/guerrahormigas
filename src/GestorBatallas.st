Object subclass: #GestorBatallas
    instanceVariableNames: 'dicBatallas'
    classVariableNames: ''
    package: 'GuerraHormigas'

GestorBatallas class >> crear
    ^ self new inicializar

GestorBatallas >> inicializar
    dicBatallas := Dictionary new.

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

    " eliminar las batallas que terminaron "
    dicBatallas := dicBatallas select: [ :aso | 
        | batalla |
        batalla := aso value.
        batalla enCurso
    ].

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
    diccionarioBatallas values do: [ :batalla |
        batalla librarBatalla
        ].
    diccionarioBatallas values do: [ :batalla |
        (batalla enCurso) ifFalse: [
            (batalla victoriaAtacante) ifTrue: [
                diccionarioBotin put: batalla getAtacante -> botin.
            ].
        ].
    ].

GestorBatallas >> solicitarBotin: unaColonia
    | botin |
    botin := diccionarioBotin at: unaColonia.
    diccionarioBotin removeKey: unaColonia.
    ^ botin

            
            

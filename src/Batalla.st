Object subclass: #Batalla
    instanceVariableNames: 'atacante defensora unidadesAtacantes resultado'
    classVariableNames: ''
    package: 'GuerraHormigas'

Batalla class >> crearConAtacante: unaColAta defensora: unaColDef
    ^ self new inicializarConAtacante: coloniaAtacante defensora: coloniaDefensora

Batalla >> inicializarConAtacante: coloniaAtacante defensora: coloniaDefensora
    atacante := coloniaAtacante.
    defensora := coloniaDefensora.
    unidadesAtacantes := OrderedCollection new.
    resultado := nil.

Batalla class >> librarEncuentro
    | a b |
    a := 0 to: 99 atRandom.
    d := 0 to: 99 atRandom.
    ^ (a - d) sign

Batalla >> librarBatalla
    | unidadesDefensoras i j |
    i := 1.
    j := 1.
    unidadesDefensoras := defensora defensasDisponibles.
    [ :hormigaAtancante | | res |
        res := Batalla librarEncuentro.
        (j <= unidadesDefensoras size) ifTrue: [
            (res > 0) ifTrue: [ 
                (unidadesDefensoras at: j) setEstado: 'muerta'.
                j + 1 
            ].
            (res < 0) ifTrue: [
                (unidadesAtacantes at: i) setEstado: 'muerta'.
            ].
        ] ifFalse: [
            (res > 0) ifTrue: [
                defensora getReina setEstado: 'muerta'.
            ].
            (res < 0) ifTrue: [
                (unidadesAtacantes at: i) setEstado: 'muerta'.
            ].
        ].
        i := i + 1.
    ] doWhileTrue: [ defensora getReina estaViva and: i < unidadesAtacantes size ].
    " elimino de atacantes las hormigas que murieron "
    unidadesAtacantes := unidadesAtacantes select: [:h | h estaViva ].
    " si murio la reina enemiga ganan las atacantes "
    (defensora reina estaViva) ifFalse: [ resultado = 'atacante' ].
    " si no quedan hormigas atacantes ganan las defensoras "
    (unidadesAtacantes size = 0) ifTrue: [ resultado = 'defensora' ].
    defensora limpiarHormigasMuertas.
    atacante limpiarHormigasMuertas.

Batalla >> enCurso
    ^ resultado isNil

Batalla >> getResultado
    ^ resultado

Batalla >> victoriaAtacante
    ^ resultado = 'atacante'

Batalla >> victoriaDefensora
    ^ resultado = 'defensora'

Batalla >> getBotin
    | botin | 
    botin := defensora getComida.
    defensora entregarRacion: botin.
    ^ botin

Batalla >> getAtacante
    ^ atacante

Batalla >> registrarAtacante: unaHormiga
    unidadesAtacantes add: unaHormiga

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
    " pelea entre dos contrincantes "
    " ambos tiran dados d100 y el mayor gana o hay empate "
    " el resultado es 1 si gana a, -1 si gana b, 0 si hay empate "
    a := 0 to: 99 atRandom.
    d := 0 to: 99 atRandom.
    ^ (a - d) sign

Batalla >> librarBatalla
    | unidadesDefensoras i j |
    " manda a pelear las atacantes que fueron registradas contra las defensoras
    disponibles de la colonia defensora hasta que todas las atacantes pelean
    o todas las defensoras de la colonia defensora pierden y también su reina "
    i := 1.
    j := 1.
    unidadesDefensoras := defensora defensasDisponibles.
    [   
        | res |
        res := Batalla librarEncuentro.
        " si la atacante perdio "
        (res < 0) ifTrue: [
            (unidadesAtacantes at: i) setEstado: 'muerta'.
        ].
        " si la defensora perdio "
        (res > 0) ifTrue: [ 
            (j <= unidadesDefensoras size) ifTrue: [
                " si hay defensoras "
                (unidadesDefensoras at: j) setEstado: 'muerta'.
                j + 1 
            ] ifFalse: [
                " si solo queda la reina "
                defensora getReina setEstado: 'muerta'.
            ].
        ].
        i := i + 1.
    ] doWhileTrue: [ (defensora destruida not) and: i <= unidadesAtacantes size ].

    " elimino de atacantes las hormigas que murieron "
    unidadesAtacantes := unidadesAtacantes select: [ :h | h estaViva ].
    " si murio la reina enemiga ganan las atacantes "
    (defensora reina estaViva) ifFalse: [ resultado = 'atacante' ].
    " si no quedan hormigas atacantes ganan las defensoras "
    (unidadesAtacantes size = 0) ifTrue: [ resultado = 'defensora' ].
    defensora limpiarHormigasMuertas.
    atacante limpiarHormigasMuertas.

Batalla >> enCurso
    ^ resultado isNil

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


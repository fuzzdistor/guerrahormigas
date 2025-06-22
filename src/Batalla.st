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

Batalla >> obtenerDefensoras
    ^ defensora defensasDisponibles.
    
Batalla >> librarBatalla
    | unidadesDefensoras i j |
    " manda a pelear las atacantes que fueron registradas contra las defensoras
    disponibles de la colonia defensora hasta que todas las atacantes pelean
    o todas las defensoras de la colonia defensora pierden y también su reina "
    i := 1.
    j := 1.
    unidadesDefensoras := self obtenerDefensoras.
    [
        | res |
        res := Batalla librarEncuentro.
        " si la atacante perdio "
        (res < 0) ifTrue: [
            self matar: (unidadesAtacantes at: i).
        ].
        " si la defensora perdio "
        (res > 0) ifTrue: [ 
            (j <= unidadesDefensoras size) ifTrue: [
                " si hay defensoras "
                self matar: (unidadesDefensoras at: j).
                j + 1.
            ] ifFalse: [
                " si solo queda la reina "
                self matar: (defensora getReina).
            ].
        ].
        i := i + 1.
    ] doWhileTrue: [ (defensora destruido not) and: i <= unidadesAtacantes size ].

    " elimino de atacantes las hormigas que murieron "
    self hacerLimpieza.
    " si murio la reina enemiga ganan las atacantes "
    self computarResultado.

Batalla >> matar: unaHormiga
    unaHormiga setMuerta.

Batalla >> computarResultado
    (defensora destruido) ifTrue: [ resultado = 'atacante' ].
    " si no quedan hormigas atacantes ganan las defensoras "
    (unidadesAtacantes size = 0) ifTrue: [ resultado = 'defensora' ].

Batalla >> hacerLimpieza
    " limpiar atacantes "
    unidadesAtacantes := unidadesAtacantes select: [ :h | h estaViva ].
    " limpiar de colonias "
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


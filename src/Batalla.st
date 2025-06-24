Object subclass: #Batalla
    instanceVariableNames: 'atacante defensora unidadesAtacantes'
    classVariableNames: ''
    package: 'GuerraHormigas'

Batalla class >> crear: unaColAta defensora: unaColDef
    ^ self new inicializarConAtacante: unaColAta defensora: unaColDef

Batalla >> inicializarConAtacante: coloniaAtacante defensora: coloniaDefensora
    atacante := coloniaAtacante.
    defensora := coloniaDefensora.
    unidadesAtacantes := OrderedCollection new.

Batalla class >> librarEncuentro: atk defensora: def
    | a d res |
    " pelea entre dos contrincantes "
    " ambos tiran dados d100 y el mayor gana o hay empate "
    " mata a las que corresponda y devuelve el res "
    " el resultado es 1 si gana a, -1 si gana b, 0 si hay empate "
    a := (0 to: 99) atRandom.
    d := (0 to: 99) atRandom.
    res := (a - d) sign.
    (res < 0) ifTrue: [
        atk setMuerta.
    ].
    (res > 0) ifTrue: [
        def setMuerta.
    ].
    ^ res

Batalla >> librarBatalla
    | unidadesDefensoras i j |
    " manda a pelear las atacantes que fueron registradas contra las defensoras
    disponibles de la colonia defensora hasta que todas las atacantes pelean
    o todas las defensoras de la colonia defensora pierden y también su reina "
    i := 1.
    j := 1.
    unidadesDefensoras := defensora defensasDisponibles.
    " mientras la colonia defensora esté viva y falten atacantes por atacar "
    [ (defensora destruido not) and: i <= unidadesAtacantes size ] whileTrue: 
    [   | atk def res |
        atk := unidadesAtacantes at: i.
        (j <= unidadesDefensoras size) ifTrue: [
            " si hay defensoras "
            def := unidadesDefensoras at: j.
        ] ifFalse: [
            " si solo queda la reina "
            def := defensora getReina.
        ].
        res := Batalla librarEncuentro: atk defensora: def.
        " si la defensora perdio avanzo el arreglo"
        (res > 0) ifTrue: [ 
            j := j + 1.
        ].
        i := i + 1.
    ].

    " elimino de atacantes las hormigas que murieron "
    self hacerLimpieza.
    " si murio la reina enemiga ganan las atacantes "
    self computarResultado.

Batalla >> computarResultado
    (defensora destruido) ifTrue: [ 
        | guerrera botin |
        guerrera := unidadesAtacantes at: 1.
        botin := self getBotin.
        guerrera objetivo guardarBotin: botin.
        unidadesAtacantes do: [ :h | h setVolviendo ].
    ].

Batalla >> hacerLimpieza
    " limpiar atacantes "
    unidadesAtacantes := unidadesAtacantes select: [ :h | h estaViva ].
    " limpiar de colonias "
    defensora limpiarHormigasMuertas.
    atacante limpiarHormigasMuertas.

Batalla >> enCurso
    ^ (defensora destruido not) and: unidadesAtacantes isNotEmpty.

Batalla >> getBotin
    | botin | 
    botin := defensora cantidadComida.
    defensora entregarRacion: botin.
    ^ botin

Batalla >> getAtacante
    ^ atacante

Batalla >> registrarAtacante: unaHormiga
    unidadesAtacantes add: unaHormiga


Hormiga subclass: #Trabajadora
    instanceVariableNames: 'posicion objetivo'
    classVariableNames: ''
    package: 'GuerraHormigas'

Trabajadora >> esTrabajadora
    ^ true

Trabajadora >> inicializar "inicializador de instancia"
    super inicializar.
    posicion := nil.
    objetivo := nil.

Trabajadora >> objetivo "observador"
    ^ objetivo

Trabajadora >> posicion "observador"
    ^ posicion

Trabajadora >> getMovPorTurno
    " base polimórfica "
    ^ 1

Trabajadora >> setPosicion: unaPosicion
    posicion := unaPosicion

Trabajadora >> setLugar: unLugar
    self setPosicion: unLugar posicion.

Trabajadora >> setObjetivo: unObjetivo
    objetivo := unObjetivo.

Trabajadora >> ejecutarTurno: unMundo colonia: unaColonia
    " base polimórfica "
    (self estaInactiva) ifTrue: [
        self comer: unaColonia.
    ] ifFalse: [
        | movimiento |
        movimiento := self getMovPorTurno.
        [ movimiento > 0 ] whileTrue: [
            self ejecutarAccion: unMundo colonia: unaColonia.
            movimiento := movimiento - 1.
        ].
    ]

Trabajadora >> alLlegarAObjetivo: unMundo colonia: unaColonia
    " base polimórfica "

Trabajadora >> alLlegarAHogar: unMundo colonia: unaColonia
    " base polimórfica "

Trabajadora >> ejecutarAccion: unMundo colonia: unaColonia
    (self estaAvanzando) ifTrue: [
        (self avanzar) ifTrue: [
            self alLlegarAObjetivo: unMundo colonia: unaColonia.
        ].
    ] ifFalse: [
        (self estaVolviendo) ifTrue: [
            (self volver) ifTrue: [
                self alLlegarAHogar: unMundo colonia: unaColonia
            ].
        ].
    ]

Trabajadora >> avanzar
    " avanza en el recorrido del objetivo y devuelve verdadero si llegó a destino"
    posicion := objetivo pasoSiguiente: posicion.
    ^ objetivo enDestino: posicion.

Trabajadora >> volver
    " retrocede en el recorrido del objetivo y devuelve verdadero si llegó a partida"
    posicion := objetivo pasoAnterior: posicion.
    ^ objetivo enPartida: posicion.

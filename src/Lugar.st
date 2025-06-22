Object subclass: #Lugar
    instanceVariableNames: 'posicion cantidadComida'
    classVariableNames: ''
    package: 'GuerraHormigas'

Lugar >> inicializar: unaPosicion comida: cantComida "incializador"
    posicion := unaPosicion.
    cantidadComida := cantComida.

Lugar >> posicion "observador"
    ^ posicion

Lugar >> cantidadComida "observador"
    ^ cantidadComida

Lugar >> destruido
    ^ cantidadComida <= 0

Lugar >> ejecutarTurno: unMundo
    " base polimórfica "

Lugar >> entregarRacion: unaCantidad
    | comidaEntregada |
    (unaCantidad <= cantidadComida) ifTrue: [
        comidaEntregada := unaCantidad.
        cantidadComida := cantidadComida - unaCantidad.
    ] ifFalse: [
        comidaEntregada := cantidadComida.
        cantidadComida := 0.
    ].
    ^ comidaEntregada.

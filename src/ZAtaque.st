Objetivo subclass: #Ataque
    instanceVariableNames: 'botin'
    classVariableNames: ''
    package: 'GuerraHormigas'

Ataque >> inicializar: unRecorrido
    super inicializar: unRecorrido.
    botin := 0.

Ataque >> esAtaque
    ^ true

Ataque >> reclamarBotin
    | unaCantidad |
    unaCantidad := botin.
    botin := 0.
    ^ unaCantidad.

Ataque >> guardarBotin: unBotin
    botin := unBotin
    

Object subclass: #Simulacion
    instanceVariableNames: 'mundo nroTurno'
    classVariableNames: ''
    package: 'GuerraHormigas'

Simulacion class >> crearPorDefecto "creador de instancia"
    ^ self new mundo

Simulacion >> inicializarConAlto: unAlto ancho: unAncho "inicializador"
    mundo := Mundo crearConAlto: unAlto ancho: unAncho.
    nroTurno := 0

Simulacion >> inicializarPorDefecto "inicializador"
    self inicializarConAlto: 20 ancho: 20

Simulacion >> ejecutarTurno "ejecucion"
    mundo ejecutarTurno.
    nroTurno := nroTurno + 1

Simulacion >> crearColonia: unPunto cantidadComida: unaCantidad
    mundo crearFuenteComida: unPunto cantidadComida: unaCantidad

Simulacion >> crearFuenteComida: unPunto cantidadComida: unaCantidad
    mundo crearFuenteComida: unPunto cantidadComida: unaCantidad

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

Lugar >> marcadoParaDestruir
    ^ cantidadComida > 0

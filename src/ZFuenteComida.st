Lugar subclass: #FuenteComida
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'GuerraHormigas'

FuenteComida class >> crear: unaPosicion comida: cantComida "constructor"
    ^ self new inicializar: unaPosicion comida: cantComida

FuenteComida >> inicializar: unaPosicion comida: unaCantidad
    super inicializar: unaPosicion comida: unaCantidad.

FuenteComida class >> crearDe: unaColonia
    ^ self crear: (unaColonia posicion) comida: (unaColonia comida)

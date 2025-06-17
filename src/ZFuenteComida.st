Lugar subclass: #FuenteComida
    instanceVariableNames: 'cantComida'
    classVariableNames: ''
    package: 'GuerraHormigas'

FuenteComida class >> crear: unaCoord comida: unaCantidad"constructor"
    | fuente |
    fuente := self new 
    fuente inicializar: unaCoord comida: unaCantidad
    
FuenteComida >> inicializar: unaCoord comida: unaCantidad
    super inicializar: unaCoord
    cantComida: unaCantidad

FuenteComida class >> crearDe: unaColonia
    ^ self crear: (unaColonia posicion) comida: (unaColonia comida)

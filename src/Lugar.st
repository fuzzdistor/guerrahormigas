Object subclass: #Lugar
    instanceVariableNames: 'posicion'
    classVariableNames: ''
    package: 'GuerraHormigas'

Lugar >> inicializar: unaCoord "incializador"
    posicion := unaCoord

Lugar >> posicion "observador"
    ^ posicion

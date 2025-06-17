Object subclass: #Hormiga
    instanceVariableNames: 'identificador posicion objetivo'
    classVariableNames: 'idActual'
    package: 'GuerraHormigas'

Hormiga class >> inicializar "inicializador de clase"
    idActual := 0

Hormiga class >> generarId
    | id |
    id := idActual.
    idActual := idActual + 1.
    ^ id

Hormiga >> inicializar "inicializador"
    identificador := self generarId

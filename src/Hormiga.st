Object subclass: #Hormiga
    instanceVariableNames: 'identificador posicion objetivo'
    classVariableNames: 'idActual'
    package: 'GuerraHormigas'

Hormiga class >> inicializar "inicializador de clase"
    idActual := 0

Hormiga class >> generarId "identificador"
    | id |
    id := idActual.
    idActual := idActual + 1.
    ^ id

Hormiga >> inicializar "inicializador de instancia"
    self incializarConPosicion: Point new.

Hormiga >> inicializarConPosicion: unPunto "inicializador de instancia"
    identificador := self class generarId.
    posicion := unPunto.
    objetivo := nil

Hormiga >> objetivo "observador"
    ^ objetivo

Hormiga >> posicion "observador"
    ^ posicion

Hormiga >> id "observador"
    ^ identificador

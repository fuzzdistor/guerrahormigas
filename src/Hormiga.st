Object subclass: #Hormiga
    instanceVariableNames: 'identificador posicion objetivo estado'
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
    objetivo := nil.
    estado := 'inactiva'

Hormiga >> objetivo "observador"
    ^ objetivo

Hormiga >> posicion "observador"
    ^ posicion

Hormiga >> id "observador"
    ^ identificador

Hormiga >> estaViva
    ^ estado ~= 'muerta'

Hormiga >> estaMuerta
    ^ estado = 'muerta'

Hormiga >> estaAvanzando
    ^ estado = 'avanzando'

Hormiga >> estaVolviendo
    ^ estado = 'volviendo'

Hormiga >> estaInactiva
    ^ estado = 'inactiva'

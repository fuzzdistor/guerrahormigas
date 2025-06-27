Object subclass: #Hormiga
    instanceVariableNames: 'identificador estado'
    classVariableNames: 'idActual'
    package: 'GuerraHormigas'

Hormiga class >> inicializarClase "inicializador de clase"
    idActual := 0

Hormiga class >> generarId "identificador"
    | id |
    id := idActual.
    idActual := idActual + 1.
    ^ id

Hormiga >> inicializar "inicializador de instancia"
    identificador := self class generarId.
    estado := 'inactiva'

Hormiga >> ejecutarTurno: unMundo colonia: unaColonia
    " base polimórfica "

Hormiga >> esHormiga
    ^ true

Hormiga >> esReina
    ^ false

Hormiga >> esTrabajadora
    ^ false

Hormiga >> esObrera
    ^ false

Hormiga >> esExploradora
    ^ false

Hormiga >> esGuerrera
    ^ false

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

Hormiga >> setMuerta
    estado := 'muerta'

Hormiga >> setAvanzando
    estado := 'avanzando'

Hormiga >> setVolviendo
    estado := 'volviendo'

Hormiga >> setInactiva
    estado := 'inactiva'

Hormiga >> comer: unaColonia
    ((unaColonia entregarRacion: 1) = 1) ifFalse: [
        Test log: 'Colonia fallo en entregar raciones para ', self asString, ': ', self id asString.
        self setMuerta.
    ].


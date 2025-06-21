Object subclass: #Hormiga
    instanceVariableNames: 'identificador estado'
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
    identificador := self class generarId.
    estado := 'inactiva'

Hormiga >> ejecutarTurno: unMundo colonia: unaColonia
    " base polimórfica "

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
    (unaColonia entregarRacion: 1) ifFalse: [
        self setMuerta.
    ].


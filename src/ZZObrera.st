Trabajadora subclass: #Obrera
    instanceVariableNames: 'comidaCarga'
    classVariableNames: ''
    package: 'GuerraHormigas'

Obrera >> esObrera
    ^ true

Obrera class >> crear
    ^ self new inicializar

Obrera >> getMovPorTurno
    " retorna 3 si no está cargando comida y 1 si tiene carga "
    ^ 3 - ((comidaCarga sign) * 2)

Obrera >> inicializar
    super inicializar.
    comidaCarga := 0.

Obrera >> alLlegarAObjetivo: unMundo colonia: unaColonia
    | fuente | 
    " buscar fuente en posicion y tomar racion "
    fuente := unMundo lugarEn: posicion.
    fuente ifNotNil: [
        comidaCarga := fuente entregarRacion: 3
    ].
    self setVolviendo.

Obrera >> alLlegarAHogar: unMundo colonia: unaColonia
    unaColonia almacenarAlimento: comidaCarga.
    (comidaCarga = 0) ifTrue: [
        unaColonia getReina informarRecoleccionTerminada: objetivo.
        self setInactiva.
    ].
    comidaCarga := 0.

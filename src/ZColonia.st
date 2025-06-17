Lugar subclass: #Colonia
    instanceVariableNames: 'colHormigas reina cantComida historialMensajes atacando colaNotificaciones'
    classVariableNames: ''
    package: 'GuerraHormigas'

Colonia class >> crear "constructor"
    ^ self new

Colonia >> crearHormiga "instanciador recurso"
    | chance hormiga |
    chance := (0 to: 10) atRandom.
    (chance < 30) ifTrue: [
        hormiga := Exploradora crear.
    ]

Colonia

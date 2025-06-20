Object subclass: #ManagerBatallas
    instanceVariableNames: 'diccionarioBatallas'
    classVariableNames: ''
    package: 'GuerraHormigas'

ManagerBatallas class >> crear
    ^ self new inicializar

ManagerBatallas >> inicializar
    colBatallas := OrderedCollection new.

ManagerBatallas >> registrarAtacante: coloniaAtacante unidad: unaHormiga coloniaDef: coloniaDefensora
    | batalla |
    batalla := diccionarioBatallas 
        at: coloniaAtacante 
        ifAbsentPut: [ 
            Batalla crear: coloniaAtacante defensora: coloniaDefensora 
        ].
    batalla registrarAtacante: unaHormiga

ManagerBatallas >> ejecutarTurno

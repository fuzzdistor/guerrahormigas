Object subclass: #Batalla
    instanceVariableNames: 'atacante defensora uniAtacantes uniDefensoras'
    classVariableNames: ''
    package: 'GuerraHormigas'

Batalla class >> crearConAtacante: unaColAta defensora: unaColDef
    ^ self new inicializarConAtacante: coloniaAtacante defensora: coloniaDefensora

Batalla >> inicializarConAtacante: coloniaAtacante defensora: coloniaDefensora
    
    


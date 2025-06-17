Object subclass: #Utils
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'GuerraHormigas'

Utils class >> comprobarProbabilidad
    | mensajes cadena |
    mensajes := OrderedCollection new.
    cadena := ''.
    1 to: 100000 do: [ :_ | | chance | 
    	chance := (0 to: 9) atRandom.
    	(chance < 3) ifTrue: [
    		mensajes add: 1. 
    		] ifFalse: [ (chance < 5) ifTrue: [ 
    			mensajes add: 2.
    			] ifFalse: [(chance < 8) ifTrue: [ 
    				mensajes add: 3. 
    				] ifFalse: [ 
    					mensajes add: 4.
    				]
    			]
    		].
    ].
    cadena := (mensajes select: [:i | i = 1]) size asString, ' ',
    	(mensajes select: [:i | i = 2]) size asString, ' ',
    	(mensajes select: [:i | i = 3]) size asString, ' ',
    	(mensajes select: [:i | i = 4]) size asString, ' '.
 

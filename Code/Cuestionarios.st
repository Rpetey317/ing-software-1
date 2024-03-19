!classDefinition: #AdeleGoldberg category: #Cuestionarios!
DenotativeObject subclass: #AdeleGoldberg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuestionarios'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AdeleGoldberg class' category: #Cuestionarios!
AdeleGoldberg class
	instanceVariableNames: 'colegaDeTrabajo'!

!AdeleGoldberg class methodsFor: 'info personal' stamp: 'RABG 3/19/2024 16:03:31'!
colegaDeTrabajo

     ^colegaDeTrabajo! !

!AdeleGoldberg class methodsFor: 'info personal' stamp: 'RABG 3/19/2024 16:02:47'!
esMayorQue: unaPersona

	| diferenciaDeEdad |

	diferenciaDeEdad := self fechaDeNacimiento distanceTo: unaPersona fechaDeNacimiento.

	^diferenciaDeEdad positive! !

!AdeleGoldberg class methodsFor: 'info personal' stamp: 'RABG 3/19/2024 16:02:38'!
esMenorQueSuColega

    ^colegaDeTrabajo esMayorQue: self! !

!AdeleGoldberg class methodsFor: 'info personal' stamp: 'RABG 3/19/2024 15:55:38'!
fechaDeNacimiento

	^July/7/1945! !


!AdeleGoldberg class methodsFor: '--** private fileout/in **--' stamp: 'RABG 3/19/2024 16:38:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	colegaDeTrabajo := AlanKay.! !


!classDefinition: #AlanKay category: #Cuestionarios!
DenotativeObject subclass: #AlanKay
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuestionarios'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlanKay class' category: #Cuestionarios!
AlanKay class
	instanceVariableNames: ''!

!AlanKay class methodsFor: 'info personal' stamp: 'RABG 3/19/2024 15:56:27'!
esMayorQue: unaPersona

	| diferenciaDeEdad |

	diferenciaDeEdad := self fechaDeNacimiento distanceTo: unaPersona fechaDeNacimiento.

	^diferenciaDeEdad positive! !

!AlanKay class methodsFor: 'info personal' stamp: 'RABG 3/19/2024 15:54:33'!
fechaDeNacimiento

	^May/17/1940! !


!classDefinition: #AlanTuring category: #Cuestionarios!
DenotativeObject subclass: #AlanTuring
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuestionarios'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlanTuring class' category: #Cuestionarios!
AlanTuring class
	instanceVariableNames: ''!

!AlanTuring class methodsFor: 'info personal' stamp: 'RABG 3/19/2024 16:16:59'!
doesNotUnderstand: aMessage



	^'No entiendo lo que me decis con ', aMessage asString! !

!AlanTuring class methodsFor: 'info personal' stamp: 'RABG 3/14/2024 12:22:07'!
fechaDeNacimiento
	^June/23/1912.! !


!classDefinition: #CloneOfJohnVonNeumann category: #Cuestionarios!
DenotativeObject subclass: #CloneOfJohnVonNeumann
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuestionarios'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CloneOfJohnVonNeumann class' category: #Cuestionarios!
CloneOfJohnVonNeumann class
	instanceVariableNames: ''!

!CloneOfJohnVonNeumann class methodsFor: 'info personal' stamp: 'RABG 3/19/2024 16:20:18'!
fechaDeNacimiento

	^December/28/1903! !


!classDefinition: #JohnVonNeumann category: #Cuestionarios!
DenotativeObject subclass: #JohnVonNeumann
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuestionarios'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'JohnVonNeumann class' category: #Cuestionarios!
JohnVonNeumann class
	instanceVariableNames: ''!

!JohnVonNeumann class methodsFor: 'info personal' stamp: 'RABG 3/14/2024 12:28:05'!
fechaDeNacimiento

	^December/28/1903! !

AdeleGoldberg initializeAfterFileIn!
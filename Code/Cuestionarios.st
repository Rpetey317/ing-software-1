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


!AdeleGoldberg class methodsFor: '--** private fileout/in **--' stamp: 'RABG 3/21/2024 00:23:44'!
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


!classDefinition: #Eminencia category: #Cuestionarios!
Object subclass: #Eminencia
	instanceVariableNames: 'fechaDeNacimiento nombre'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuestionarios'!

!Eminencia methodsFor: 'initialization' stamp: 'RABG 3/20/2024 22:57:12'!
inicializarCon: unNombre y: unaFechaDeNacimiento

    nombre := unNombre.

    fechaDeNacimiento := unaFechaDeNacimiento.! !

!Eminencia methodsFor: 'initialization' stamp: 'RABG 3/20/2024 22:53:26'!
initialize

    nombre := 'Alan Kay'.

    fechaDeNacimiento := May/17/1940! !


!Eminencia methodsFor: 'info personal' stamp: 'RABG 3/20/2024 22:39:36'!
esMayorQue: unaPersona

	| diferenciaDeEdad |

	diferenciaDeEdad := self fechaDeNacimiento distanceTo: unaPersona fechaDeNacimiento.

	^diferenciaDeEdad positive! !

!Eminencia methodsFor: 'info personal' stamp: 'RABG 3/20/2024 22:52:20'!
fechaDeNacimiento

	^fechaDeNacimiento! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Eminencia class' category: #Cuestionarios!
Eminencia class
	instanceVariableNames: ''!

!Eminencia class methodsFor: 'instance creation' stamp: 'RABG 3/20/2024 22:59:25'!
llamada: unNombre nacidaEl: unaFecha



	^self new inicializarCon: unNombre y: unaFecha! !


!classDefinition: #Vehiculo category: #Cuestionarios!
Object subclass: #Vehiculo
	instanceVariableNames: 'combustible'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuestionarios'!

!Vehiculo methodsFor: 'mantenimiento' stamp: 'RABG 3/20/2024 23:14:49'!
cargarCombustible: cantidadDeCombustible

	combustible := cantidadDeCombustible ! !


!Vehiculo methodsFor: 'informacion' stamp: 'RABG 3/20/2024 23:16:54'!
cantidadDeRuedas

	self subclassResponsibility! !


!classDefinition: #Auto category: #Cuestionarios!
Vehiculo subclass: #Auto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuestionarios'!

!Auto methodsFor: 'informacion' stamp: 'RABG 3/20/2024 23:10:10'!
cantidadDeRuedas

	^4! !


!Auto methodsFor: 'acciones' stamp: 'RABG 3/20/2024 23:10:14'!
abrirBaul! !


!classDefinition: #Moto category: #Cuestionarios!
Vehiculo subclass: #Moto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuestionarios'!

!Moto methodsFor: 'informacion' stamp: 'RABG 3/20/2024 23:10:52'!
cantidadDeRuedas

	^2! !


!Moto methodsFor: 'acciones' stamp: 'RABG 3/20/2024 23:10:46'!
abrirBaul! !

AdeleGoldberg initializeAfterFileIn!
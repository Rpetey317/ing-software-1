!classDefinition: #CombatientesTest category: #Clase02!
DenotativeObject subclass: #CombatientesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase02'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatientesTest class' category: #Clase02!
CombatientesTest class
	instanceVariableNames: ''!

!CombatientesTest class methodsFor: 'setup' stamp: 'RB 3/15/2024 19:04:50'!
reiniciarTest

	Goliat curar.	
	Isaac curar.
	David atacarMasSano.
	David asignarEnemigos: {Goliat}! !


!CombatientesTest class methodsFor: 'testing' stamp: 'RB 3/15/2024 17:53:24'!
test01GoliatNoEstaDaniadoAntesDeRecibirDanio

	self reiniciarTest.
	Assert isFalse: Goliat estaDaniado ! !

!CombatientesTest class methodsFor: 'testing' stamp: 'RB 3/15/2024 17:52:37'!
test02GoliatRecibeDanio

	self reiniciarTest.

	Goliat recibirDanio.
	
	Assert isTrue: Goliat estaDaniado.! !

!CombatientesTest class methodsFor: 'testing' stamp: 'RB 3/15/2024 17:56:35'!
test03DavidAtacaAGoliat

	self reiniciarTest.
	
	David atacarA: Goliat.
	
	Assert isTrue: Goliat estaDaniado ! !

!CombatientesTest class methodsFor: 'testing' stamp: 'RB 3/15/2024 18:00:54'!
test04GoliatRecibe4DeDanioDeDavid

	self reiniciarTest.
	
	David atacarA: Goliat .
	
	Assert isTrue: Goliat vidaRestante == 16.! !

!CombatientesTest class methodsFor: 'testing' stamp: 'RB 3/15/2024 18:36:07'!
test05VariosAtaquesHacenDanioCorrecto

	self reiniciarTest.
	
	David atacarA: Goliat.
	David atacarA: Goliat.
	David atacarA: Goliat.
	
	Assert isTrue: Goliat vidaRestante = 8.! !

!CombatientesTest class methodsFor: 'testing' stamp: 'RB 3/15/2024 18:37:51'!
test06DavidAtacaASuEnemigo

	self reiniciarTest.
	
	David asignarEnemigos: {Goliat}.
	
	David atacar.
	
	Assert isTrue: Goliat estaDaniado ! !

!CombatientesTest class methodsFor: 'testing' stamp: 'RB 3/15/2024 18:45:37'!
test07DavidNoAtacaASuNoEnemigo

	self reiniciarTest.
	
	David asignarEnemigos: {Isaac}.
	
	David atacar.
	
	Assert isFalse: Goliat estaDaniado ! !

!CombatientesTest class methodsFor: 'testing' stamp: 'RB 3/15/2024 18:52:19'!
test08DavidPuedeAtacarAlMasSano

	self reiniciarTest.
	
	Isaac recibirDanio.
	
	David asignarEnemigos: {Isaac. Goliat}.
	David atacarMasSano.
	
	David  atacar.
	
	Assert isTrue: Isaac vidaRestante = 16.
	Assert isTrue: Goliat vidaRestante = 16.! !

!CombatientesTest class methodsFor: 'testing' stamp: 'RB 3/15/2024 18:57:30'!
test09DavidPuedeAtacarAlMasDaniado

	self reiniciarTest.
	
	Isaac recibirDanio.
	
	David asignarEnemigos: {Isaac. Goliat}.
	David atacarMasDaniado.
	
	David  atacar.
	
	Assert isTrue: Isaac vidaRestante = 12.
	Assert isTrue: Goliat vidaRestante = 20.! !


!classDefinition: #David category: #Clase02!
DenotativeObject subclass: #David
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase02'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'David class' category: #Clase02!
David class
	instanceVariableNames: 'enemigos estrategia'!

!David class methodsFor: 'combate' stamp: 'RB 3/15/2024 18:43:40'!
asignarEnemigos: enemigosNuevos

	enemigos := enemigosNuevos ! !

!David class methodsFor: 'combate' stamp: 'RB 3/15/2024 19:06:26'!
atacar
	| enemigoAAtacar |
	
	enemigoAAtacar := estrategia value: enemigos .
	
	self atacarA: enemigoAAtacar ! !

!David class methodsFor: 'combate' stamp: 'RB 3/15/2024 17:57:04'!
atacarA: enemigo
	enemigo recibirDanio ! !


!David class methodsFor: 'estrategia' stamp: 'RB 3/15/2024 19:46:45'!
atacarMasDaniado
	estrategia := [:enemigosActuales | enemigosActuales detectMin: [:enemigo | enemigo vidaRestante]]! !

!David class methodsFor: 'estrategia' stamp: 'RB 3/15/2024 19:46:50'!
atacarMasSano
	estrategia := [:enemigosActuales | enemigosActuales detectMax: [:enemigo | enemigo vidaRestante]]! !


!David class methodsFor: '--** private fileout/in **--' stamp: 'RB 3/15/2024 21:06:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	enemigos := ((Array new: 2) at: 1 put: Isaac; at: 2 put: Goliat; yourself).
	estrategia := ((SerializableBlockClosure basicNew instVarAt: 1 put: David; instVarAt: 2 put: '[ :argm0_1 |
	argm0_1 detectMin: [ :argm0_2 |
		argm0_2 vidaRestante ]. ]'; instVarAt: 3 put: #(); yourself) asEvaluable).! !


!classDefinition: #Goliat category: #Clase02!
DenotativeObject subclass: #Goliat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase02'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Goliat class' category: #Clase02!
Goliat class
	instanceVariableNames: 'vidaRestante'!

!Goliat class methodsFor: 'combate' stamp: 'RB 3/15/2024 18:08:03'!
curar

	vidaRestante := 20.! !

!Goliat class methodsFor: 'combate' stamp: 'RB 3/15/2024 18:10:43'!
estaDaniado
	^(vidaRestante  ~= 20).! !

!Goliat class methodsFor: 'combate' stamp: 'RB 3/15/2024 18:08:38'!
recibirDanio

	vidaRestante := vidaRestante - 4.
	! !


!Goliat class methodsFor: 'atributos' stamp: 'RB 3/15/2024 18:11:28'!
vidaRestante
	^vidaRestante ! !


!Goliat class methodsFor: '--** private fileout/in **--' stamp: 'RB 3/15/2024 21:06:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	vidaRestante := 20.! !


!classDefinition: #Isaac category: #Clase02!
DenotativeObject subclass: #Isaac
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase02'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Isaac class' category: #Clase02!
Isaac class
	instanceVariableNames: 'vidaRestante'!

!Isaac class methodsFor: 'combate' stamp: 'RB 3/15/2024 18:44:51'!
curar

	vidaRestante := 20.! !

!Isaac class methodsFor: 'combate' stamp: 'RB 3/15/2024 18:44:51'!
estaDaniado
	^(vidaRestante  ~= 20).! !

!Isaac class methodsFor: 'combate' stamp: 'RB 3/15/2024 18:44:51'!
recibirDanio

	vidaRestante := vidaRestante - 4.
	! !


!Isaac class methodsFor: 'atributos' stamp: 'RB 3/15/2024 18:44:51'!
vidaRestante
	^vidaRestante ! !


!Isaac class methodsFor: '--** private fileout/in **--' stamp: 'RB 3/15/2024 21:06:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	vidaRestante := 12.! !

David initializeAfterFileIn!
Goliat initializeAfterFileIn!
Isaac initializeAfterFileIn!
!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'RABG 4/5/2024 18:21:38'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| addCustomer |
	
	addCustomer := [customerBook addCustomerNamed: 'John Lennon'].
	
	self should: addCustomer notTakeMoreThan: (Duration milliSeconds: 50)
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'RABG 4/5/2024 18:21:38'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| paulMcCartney removeCustomer |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	  
	removeCustomer := [customerBook removeCustomerNamed: paulMcCartney.].

	
	self should: removeCustomer notTakeMoreThan: (Duration milliSeconds: 100) 
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'RABG 4/5/2024 18:21:38'!
test03CanNotAddACustomerWithEmptyName 

	self 
		should: [ customerBook addCustomerNamed: ''.]
		raise: Error
		withExceptionDo: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty
			]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'RABG 4/5/2024 18:25:54'!
test04CanNotRemoveAnInvalidCustomer
	
	| johnLennon |
	
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self
		should: [ customerBook removeCustomerNamed: 'Paul McCartney']
		raise: NotFound 
		withExceptionDo: [ :anError | 
			self assertBook: customerBook onlyHas: johnLennon
			]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'RABG 4/5/2024 18:21:38'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertBook: customerBook hasActive: 0 hasSuspended: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'RABG 4/5/2024 18:21:38'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertBook: customerBook hasActive: 0 hasSuspended: 0. 
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'RABG 4/5/2024 18:25:36'!
test07CanNotSuspendAnInvalidCustomer
	
	| johnLennon |

	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self
		should: [ customerBook suspendCustomerNamed: 'Ringo Starr']
		raise: CantSuspend 
		withExceptionDo: [ :anError | 
			self assertBook: customerBook onlyHas: johnLennon 
			]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'RABG 4/5/2024 18:25:17'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self
		should: [ customerBook suspendCustomerNamed: johnLennon ]
		raise: CantSuspend 
		withExceptionDo: [ :anError | 
			self assertBook: customerBook onlyHas: johnLennon 
			]
! !


!CustomerBookTest methodsFor: 'assertions' stamp: 'RABG 4/5/2024 18:21:47'!
assertBook: aCustomerBook hasActive: activeCustomers hasSuspended: suspendedCustomers 

	self assert: activeCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: suspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: (activeCustomers + suspendedCustomers) equals: aCustomerBook numberOfCustomers! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'RABG 4/5/2024 18:24:50'!
assertBook: aCustomerBook onlyHas: aCustomerName 

	self assert: 1 equals: aCustomerBook numberOfCustomers.
	self assert: (aCustomerBook includesCustomerNamed: aCustomerName)! !


!CustomerBookTest methodsFor: 'setUp/tearDown' stamp: 'RABG 4/5/2024 18:21:38'!
setUp

	customerBook := CustomerBook new.! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'RABG 4/5/2024 18:27:33'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'RABG 4/5/2024 18:35:47'!
removeCustomerNamed: aName 

	active remove: aName ifAbsent:[suspended remove: aName ifAbsent: [^NotFound signal]].
	^aName 
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'RABG 4/5/2024 18:36:27'!
suspendCustomerNamed: aName 
	
	active remove: aName ifAbsent: [^CantSuspend signal].
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !

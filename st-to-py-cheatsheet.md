# Traducción de Smalltalk a Python

## 1.- Sintaxis básica de POO

### 1.1.- Declaración de objetos

_Smalltalk:_

```Smalltalk
Object subclass: MyClass
    instanceVariableNames: 'foo bar'
    classVariableNames: 'taz'

MyClass subclass: MySubclass
    instanceVariableNames: 'subfoo'
    classVariableNames: ''
```

_Python:_

```Python
class MyClass:
    taz = None # Se inicializa aquí

    def __init__(self):
        # Todas las variables de instancia se declaran aquí
        # Esta función puede recibir otros argumentos
        self.foo = None
        self.bar = None

class MySubclass(MyClass):
    def __init__(self):
        super().__init__()
        self.subfoo = None
```

> Por convención, los metodos que empiezan y terminan en doble '\_' (como `__my_method__`) son privados

### 1.2.- Métodos

_Smalltalk:_

```Smalltalk
Object subclass: MyClass
    instanceVariableNames: ''
    classVariableNames: ''

"esto es un mensaje de instancia"
instanceHello: yourName
    ^'hello from an instance, ' + yourName

Myclass class

"esto es un mensaje de clase"
classHello: yourName
    ^'hello from the class, ' + yourName

"------------"

myInstance := MyClass new.
myInstance instanceHello: 'Ruby'
"returns 'hello from an instance, Ruby'"

MyClass classHello : 'Ruby'
"returns 'hello from the class, Ruby'"
```

```Python
class MyClass:
    def instanceHello(self, yourName):
        return "hello from an instance, " + yourName

    # Todos los métodos de clase tienen que tener esto arriba
    # `cls` es como `self` para métodos de clase
    @classmethod
    def classHello(cls, yourName):
        return "hello from the class, " + yourName

myInstance = MyClass()
myInstance.instanceHello("Ruby")
# returns "hello from an instance, Ruby"

MyClass.classHello("Ruby")
# returns "hello from the class, Ruby"
```

> Si miran un .st que provenga de cuis, va a tener un comentario con una colaboración arriba de cada método con metadata que usa el entorno. Los omito en este archivo.

### 1.3.- Creación de instancias

**Creación básica:**

_Smalltalk:_

```Smalltalk
myInstance := MyClass new.
```

_Python:_

```Python
myInstance = MyClass()
```

---

**Creación con mensaje de clase:**

_Smalltalk:_

```Smalltalk
Object subclass: MyClass
    instanceVariableNames: 'foo'
    classVariableNames: ''

initializeWith: anArgument
    "Lógica de inicialización"
    foo := anArgument
    ^self

MyClass class

newWith: anArgument
    "Lógica, de ser necesario"
    ^self new initializeWith: anArgument

"------------"

myInstance := MyClass newWith: myArgument
```

_Python:_

```Python
class MyClass:
    def __init__(self, anArgument):
        # Lógica adicional
        self.foo = anArgument

    # Todos los métodos de clase tienen que tener esto arriba
    # `cls` es como `self` para métodos de clase
    @classmethod
    def newWith(cls, anArgument)
        #Lógica de instanciado
        return cls(anArgument)

myInstance = MyClass.newWith(myArgument)
```

> Por convención, si se provee un menssaje de creación de instancia como `newWith()`, no se debería llamar a `MyClass()` para inicializar instancias.

## 2.- Colecciones

To do later...

## 3. Metaprogramación

### 3.1.- Instancia <-> Clase <-> Subclases

_Smalltalk:_

```Smalltalk
anObject := OrderedCollection new.

anObject class. "devuelve: OrderedCollection"

anObject class class. "devuelve: OrderedCollection class"

anObject class class class. "devuelve: Metaclass"

anObject class superclass. "devuelve: Sequenceable collection"

anObject class new. "devuelve una nueva OrderedCollection."

anObject class subclases. "devuelve: #(SortedCollection)"
```

_Python:_

```Python
anObject = []

anObject.__class__ # devuelve <class 'list'>

anObject.__class__.__class__ # devuelve <class 'type'>

anObject.__class__() # devuelve una nueva lista

anObject.__class__.__subclasses__() # devuelve la lista de subclases de 'list', No olvidar los paréntesis!
```

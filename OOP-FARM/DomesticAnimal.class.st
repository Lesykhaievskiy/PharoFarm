Class {
	#name : 'DomesticAnimal',
	#superclass : 'Magnitude',
	#instVars : [
		'name',
		'age',
		'weight',
		'productivity'
	],
	#category : 'OOP-FARM',
	#package : 'OOP-FARM'
}

{ #category : 'arithmetic' }
DomesticAnimal >> + anotherAnimal [
	"Додавання двох тварин повертає суму їхніх прибутків"
	^ self calculateProfit + anotherAnimal calculateProfit
]

{ #category : 'comparing' }
DomesticAnimal >> <= anotherAnimal [
	"Порівнюємо тварин за величиною їхнього прибутку"
	^ self calculateProfit <= anotherAnimal calculateProfit
]

{ #category : 'accessing' }
DomesticAnimal >> age [
	^ age
]

{ #category : 'accessing' }
DomesticAnimal >> age: aNumber [
	age := aNumber
]

{ #category : 'initialization' }
DomesticAnimal >> initialize [
	super initialize.
	age := 0.
	weight := 0.
	productivity := 0.
]

{ #category : 'testing' }
DomesticAnimal >> isProductiveAge [
	"Тварина приносить прибуток від 2 до 12 років"
	^ age between: 2 and: 12
]

{ #category : 'initialization' }
DomesticAnimal >> name [
	^ name
]

{ #category : 'initialization' }
DomesticAnimal >> name: aString [
	name := aString
]

{ #category : 'actions' }
DomesticAnimal >> passYear [
	age := age + 1.
	weight := weight * 1.05. "Набирає 5% ваги"
	productivity := productivity * 1.02. "Продуктивність росте на 2%"
]

{ #category : 'printing' }
DomesticAnimal >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPutAll: ': ';
		nextPutAll: name asString;
		nextPutAll: ' (Age: ';
		nextPutAll: age asString;
		nextPutAll: ')'
]

{ #category : 'accessing' }
DomesticAnimal >> productivity [
	^ productivity
]

{ #category : 'accessing' }
DomesticAnimal >> productivity: aNumber [
	productivity := aNumber
]

{ #category : 'accessing' }
DomesticAnimal >> weight [
	^ weight
]

{ #category : 'accessing' }
DomesticAnimal >> weight: aNumber [
	weight := aNumber
]

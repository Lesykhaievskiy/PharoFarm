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

{ #category : 'initialization' }
DomesticAnimal >> name [
	^ name
]

{ #category : 'initialization' }
DomesticAnimal >> name: aString [
	name := aString
]

{ #category : 'initialization' }
DomesticAnimal >> printOn: aStream [
	aStream nextPutAll: self class name.
	aStream nextPutAll: ': ', name asString.
	aStream nextPutAll: ' (Age: ', age asString, ')'.
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

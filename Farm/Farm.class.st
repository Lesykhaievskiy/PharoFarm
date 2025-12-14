Class {
	#name : 'Farm',
	#superclass : 'Object',
	#instVars : [
		'animals'
	],
	#category : 'Farm',
	#package : 'Farm'
}

{ #category : 'initialization' }
Farm >> add: anAnimal [
  animals add: anAnimal

]

{ #category : 'adding' }
Farm >> addAnimalViaDialog [
| choice nm ag wt prod animal |

choice := UIManager default chooseFrom: #('Cow' 'Sheep') title: 'Add animal type'.
choice = 0 ifTrue: [ ^ nil ].  "Cancel"

nm := UIManager default request: 'Name?'.
ag := (UIManager default request: 'Age (integer)?') asInteger.
wt := (UIManager default request: 'Weight (number)?') asNumber.
prod := (UIManager default request: 'Productivity (number)?') asNumber.

choice = 1 ifTrue: [
  | fat |
  fat := (UIManager default request: 'Milk fat (number)?') asNumber.
  animal := Cow new.
  animal name: nm; age: ag; weight: wt; productivity: prod.
  "якщо в Cow нема setter milkFat:, тоді просто пропусти наступний рядок"
  (animal respondsTo: #milkFat:) ifTrue: [ animal milkFat: fat ].
].

choice = 2 ifTrue: [
  | hot |
  hot := UIManager default chooseFrom: #('No' 'Yes') title: 'Hot summer?'.
  animal := Sheep new.
  animal name: nm; age: ag; weight: wt; productivity: prod.
  animal isHotSummer: (hot = 2).
].

self add: animal.
^ animal

]

{ #category : 'as yet unclassified' }
Farm >> allReachedProductiveAge [
^ animals allSatisfy: [:a | a isProductiveAge ].

]

{ #category : 'initialization' }
Farm >> initialize [
  super initialize.
  animals := OrderedCollection new.

]

{ #category : 'as yet unclassified' }
Farm >> mostProfitable [
  ^ animals
    ifEmpty: [ nil ]
    ifNotEmpty: [ animals max: [:a | a calculateProfit ] ].

]

{ #category : 'as yet unclassified' }
Farm >> oldest [
  ^ animals
    ifEmpty: [ nil ]
    ifNotEmpty: [ animals max: [:a | a age ] ].

]

{ #category : 'initialization' }
Farm >> printOn: aStream [
  aStream nextPutAll: 'Farm['.
  animals do: [:a | aStream nextPutAll: a printString]
    separatedBy: [ aStream nextPutAll: ', ' ].
  aStream nextPutAll: ']'.

]

{ #category : 'as yet unclassified' }
Farm >> saveAnimalsToFileNamed: fileNameString [
  | file |
  file := FileLocator documents / fileNameString.
  file writeStreamDo: [:s |
    (STON writer on: s) nextPut: animals ].
  ^ file

]

{ #category : 'as yet unclassified' }
Farm >> stoppedBeingProductive [
^ animals select: [:a | (a isProductiveAge not) and: [ a age > 2 ] ].

]

{ #category : 'accessing' }
Farm >> totalProfit [
  ^ animals sum: [:a | a calculateProfit ].

]

{ #category : 'as yet unclassified' }
Farm >> twoYearsPassed [
self yearPassed.
self yearPassed.

]

{ #category : 'as yet unclassified' }
Farm >> yearPassed [
animals do: [:a | a passYear ].

]

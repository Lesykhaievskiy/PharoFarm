Class {
	#name : 'Cow',
	#superclass : 'DomesticAnimal',
	#instVars : [
		'milkFat'
	],
	#category : 'OOP-FARM',
	#package : 'OOP-FARM'
}

{ #category : 'testing' }
Cow >> calculateProfit [
	"Якщо вік не підходить - прибутку 0"
	self isProductiveAge ifFalse: [ ^ 0 ].
	
	"Формула: продуктивність * жирність * ціна"
	^ productivity * milkFat * 50
]

{ #category : 'actions' }
Cow >> feedSpecialFood [
	"Збільшення продуктивності на 10%, а жирності на 5%"
	productivity := productivity * 1.1.
	milkFat := milkFat * 1.05.
]

{ #category : 'initialization' }
Cow >> initialize [
	super initialize.
	
	milkFat := 0.
]

{ #category : 'accessing' }
Cow >> milkFat: aNumber [
	milkFat := aNumber
]

{ #category : 'printing' }
Cow >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' (Cow, Fat: ';
		print: milkFat;
		nextPutAll: '%)'
]

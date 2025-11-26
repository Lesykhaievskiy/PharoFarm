Class {
	#name : 'Sheep',
	#superclass : 'DomesticAnimal',
	#instVars : [
		'isHotSummer'
	],
	#category : 'OOP-FARM',
	#package : 'OOP-FARM'
}

{ #category : 'testing' }
Sheep >> calculateProfit [
	| effectiveProductivity |
	
	"Якщо вік не підходить - прибутку немає"
	self isProductiveAge ifFalse: [ ^ 0 ].
	
	effectiveProductivity := productivity.
	
	"Якщо літо спекотне, продуктивність падає на 30%"
	isHotSummer ifTrue: [ effectiveProductivity := effectiveProductivity * 0.7 ].
	
	"Прибуток = (нова продуктивність) * ціна вовни"
	^ effectiveProductivity * 100
]

{ #category : 'initialization' }
Sheep >> initialize [
	super initialize.
	isHotSummer := false
]

{ #category : 'accessing' }
Sheep >> isHotSummer: aBoolean [
	isHotSummer := aBoolean
]

{ #category : 'printing' }
Sheep >> printOn: aStream [
	super printOn: aStream.
	aStream 
		nextPutAll: ' (Sheep';
		nextPutAll: (isHotSummer ifTrue: [ ', HOT Summer' ] ifFalse: [ '' ]);
		nextPutAll: ')'
]

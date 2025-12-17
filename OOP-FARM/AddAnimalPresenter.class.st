Class {
	#name : 'AddAnimalPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'typeDropList',
		'nameInput',
		'ageInput',
		'weightInput',
		'productivityInput',
		'specificLabel',
		'specificInput',
		'resultAnimal'
	],
	#category : 'OOP-FARM-OOP-Farm-UI',
	#package : 'OOP-FARM',
	#tag : 'OOP-Farm-UI'
}

{ #category : 'accessing' }
AddAnimalPresenter >> createAnimal [
	| name age weight prod specific type |
	type := typeDropList selectedItem.
	name := nameInput text.
	age := ageInput number.
	weight := weightInput number.
	prod := productivityInput number.
	specific := specificInput number.
	
	type = 'Cow' ifTrue: [ 
		^ Cow new name: name; age: age; weight: weight; productivity: prod; milkFat: specific; yourself.
	].
	type = 'Sheep' ifTrue: [ 
		^ Sheep new name: name; age: age; weight: weight; productivity: prod; isHotSummer: (specific > 0); yourself.
	].
	^ nil
]

{ #category : 'layout' }
AddAnimalPresenter >> defaultLayout [

	^ SpGridLayout new
		  add: 'Type:' atPoint: 1 @ 1;
		  add: typeDropList atPoint: 2 @ 1;
		  add: 'Name:' atPoint: 1 @ 2;
		  add: nameInput atPoint: 2 @ 2;
		  add: 'Age:' at: 1 @ 3;
		  add: ageInput at: 2 @ 3;
		  add: 'Weight:' at: 1 @ 4;
		  add: weightInput at: 2 @ 4;
		  add: 'Productivity:' at: 1 @ 5;
		  add: productivityInput at: 2 @ 5;
		  add: specificLabel at: 1 @ 6;
		  add: specificInput at: 2 @ 6;
		  yourself
]

{ #category : 'initialization' }
AddAnimalPresenter >> initializePresenters [
	typeDropList := self newDropList.
	typeDropList 
		items: #('Cow' 'Sheep');
		selectIndex: 1;
		whenSelectedItemChangedDo: [ :item | self updateSpecificField: item ].

	nameInput := self newTextInput placeholder: 'Borka'.
	ageInput := self newNumberInput placeholder: '5'.
	weightInput := self newNumberInput placeholder: '100.0'.
	productivityInput := self newNumberInput placeholder: '10.5'.
	
	specificLabel := self newLabel label: 'Milk Fat (%):'.
	specificInput := self newNumberInput placeholder: '3.5'.
	
	self updateSpecificField: 'Cow'.
]

{ #category : 'initialization' }
AddAnimalPresenter >> initializeWindow: aWindow [
	aWindow 
		title: 'Add New Animal';
		initialExtent: 400@350.
]

{ #category : 'private' }
AddAnimalPresenter >> updateSpecificField: type [
	type = 'Cow' ifTrue: [ 
		specificLabel label: 'Milk Fat (%):'. 
		specificInput := self newNumberInput placeholder: '3.5'.
	].
	type = 'Sheep' ifTrue: [ 
		specificLabel label: 'Hot Summer? (1=Yes, 0=No):'. 
		specificInput := self newNumberInput placeholder: '0'.
	].
	self layout: self defaultLayout.
]

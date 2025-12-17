Class {
	#name : 'FarmPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'farm',
		'animalList',
		'addButton',
		'removeButton',
		'refreshButton',
		'totalProfitLabel'
	],
	#category : 'OOP-FARM-OOP-Farm-UI',
	#package : 'OOP-FARM',
	#tag : 'OOP-Farm-UI'
}

{ #category : 'layout' }
FarmPresenter >> defaultLayout [
	^ SpBoxLayout newTopToBottom
		add: animalList;
		add: (SpBoxLayout newLeftToRight 
				add: addButton; 
				add: removeButton; 
				add: refreshButton; 
				yourself) expand: false;
		add: totalProfitLabel expand: false;
		yourself
]

{ #category : 'initialization' }
FarmPresenter >> initializePresenters [
	animalList := self newTable.
	animalList
		addColumn: (SpStringTableColumn title: 'Type' evaluated: [ :a | a class name ]);
		addColumn: (SpStringTableColumn title: 'Name' evaluated: [ :a | a name ]);
		addColumn: (SpStringTableColumn title: 'Age' evaluated: [ :a | a age asString ]);
		addColumn: (SpStringTableColumn title: 'Profit' evaluated: [ :a | a calculateProfit asString, ' UAH' ]).
		
	addButton := self newButton label: 'Add Animal'; icon: (self iconNamed: #add).
	removeButton := self newButton label: 'Remove Selected'; icon: (self iconNamed: #remove).
	refreshButton := self newButton label: 'Next Year'; icon: (self iconNamed: #calendar).
	
	totalProfitLabel := self newLabel label: 'Total Profit: 0 UAH'.
	
	addButton action: [ self openAddDialog ].
	removeButton action: [ self removeSelected ].
	refreshButton action: [ self passYear ].
]

{ #category : 'initialization' }
FarmPresenter >> initializeWindow: aWindow [
	aWindow 
		title: 'Farm Management System';
		initialExtent: 600@450.
]

{ #category : 'actions' }
FarmPresenter >> openAddDialog [
	| dialog window newAnimal |
	dialog := AddAnimalPresenter new.
	
	window := dialog openModal.
	
	window isOk ifTrue: [ 
		newAnimal := dialog createAnimal.
		newAnimal ifNotNil: [ 
			farm add: newAnimal. 
			self updateList 
		]
	].
]

{ #category : 'actions' }
FarmPresenter >> passYear [
	farm yearPassed.
	self updateList.
]

{ #category : 'actions' }
FarmPresenter >> removeSelected [
	| selected |
	selected := animalList selection selectedItem.
	selected ifNotNil: [ 
		farm remove: selected.
		self updateList.
	].
]

{ #category : 'initialization' }
FarmPresenter >> setModel: aFarm [
	farm := aFarm.
	self updateList.
]

{ #category : 'private' }
FarmPresenter >> updateList [
	animalList items: (farm instVarNamed: 'animals').
	totalProfitLabel label: 'Total Profit: ', farm totalProfit asString, ' UAH'.
]

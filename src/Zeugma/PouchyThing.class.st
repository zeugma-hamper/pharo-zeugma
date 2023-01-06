Class {
	#name : #PouchyThing,
	#superclass : #Zeubject,
	#instVars : [
		'chirrens'
	],
	#classVars : [
		'empty_kid_coll'
	],
	#category : #'Zeugma-Foundation'
}

{ #category : #initialization }
PouchyThing class >> initialize [

	empty_kid_coll := OrderedCollection new.
]

{ #category : #children }
PouchyThing >> appendChild: zeub [

	zeub ifNil: [ ^ false ].
	chirrens ifNil: [ chirrens := OrderedCollection new ].
	chirrens addIfNotPresent: zeub.
	^ true
]

{ #category : #children }
PouchyThing >> children [

	^ chirrens
		ifNil: [ empty_kid_coll ]
		ifNotNil: [ chirrens ].
]

{ #category : #children }
PouchyThing >> findChild: nameStr [

	chirrens ifNil: [ ^ nil ].
	^ chirrens detect: [ :z | z name = nameStr ] ifNone: [ nil ]
]

{ #category : #children }
PouchyThing >> findChildRecursively: nameStr [
	| ch |

	chirrens ifNil: [ ^ nil ].
	(ch := self findChild: nameStr)
		ifNotNil: [ ^ ch ].
	chirrens do: [ :child |
		(ch := child findChildRecursively: nameStr)
			ifNotNil: [ ^ ch ].
	].
	^ nil
]

{ #category : #children }
PouchyThing >> indexForChild: zeub [

	(chirrens isNil or: [ zeub isNil ])
		ifTrue: [ ^ -1 ].
	chirrens doWithIndex: [ :z :ind | z == zeub ifTrue: [ ^ ind ] ].
	^ -1
]

{ #category : #children }
PouchyThing >> insertChild: zeub at: ind [

	zeub ifNil: [ ^ false ].
	chirrens ifNil: [ chirrens := OrderedCollection new ].
	(chirrens includes: zeub) ifTrue: [ ^ false ].
	chirrens add: zeub beforeIndex: ind.
	^ true
]

{ #category : #testing }
PouchyThing >> isZeugmallyPouchful [

	^ true
]

{ #category : #children }
PouchyThing >> nthChild: ind [

	^ chirrens
		ifNil: [ nil ]
		ifNotNil: [ chirrens at: ind ifAbsent: [ nil ] ]
]

{ #category : #children }
PouchyThing >> numChildren [

	^ chirrens
		ifNil: [ 0 ]
		ifNotNil: [ chirrens size ]
]

{ #category : #children }
PouchyThing >> removeChild: zeub [

	(chirrens isNil or: [ zeub isNil ])
		ifTrue: [ ^ false ].
	chirrens remove: zeub ifAbsent: [ ^ false ].
	^ true
]

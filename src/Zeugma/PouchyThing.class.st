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

{ #category : #accessing }
PouchyThing >> children [

	^ chirrens
		ifNil: [ empty_kid_coll ]
		ifNotNil: [ chirrens ].
]

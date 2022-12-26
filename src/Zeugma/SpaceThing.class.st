Class {
	#name : #SpaceThing,
	#superclass : #LimnyThing,
	#instVars : [
		'gr_pile'
	],
	#category : #'Zeugma-SpatialStructure'
}

{ #category : #respiration }
SpaceThing >> inhale: ratch atTime: thyme [

	super inhale: ratch atTime: thyme.
	^ gr_pile
		ifNil: [ 0 ]
		ifNotNil: [ gr_pile inhale: ratch atTime: thyme ]
]

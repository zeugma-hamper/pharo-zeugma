Class {
	#name : #OSCWandsSump,
	#superclass : #OSCCommsSump,
	#instVars : [
		'point_mat',
		'direc_mat'
	],
	#category : #'Zeugma-Events'
}

{ #category : #initialization }
OSCWandsSump >> initialize [

	super initialize.
"	self setPositionTransform: Matrix44 new."
"	self setDirectionTransform: Matrix44 new."
	self forAddress: '/events/spatial'
			setRawExtractor: [ :oscmess | self oscToWandArgs: oscmess ].
]

{ #category : #'data-xform' }
OSCWandsSump >> oscToWandArgs: osc [
	| prov butts pos aim ovr |

	osc size = 11 ifFalse: [ ^ nil ].
	prov := osc at: 1.
	butts := osc at: 2.
	pos := Vect newx: (osc at: 3) y: (osc at: 4) z: (osc at: 5).
	aim := Vect newx: (osc at: 6) y: (osc at: 7) z: (osc at: 8).
	ovr := Vect newx: (osc at: 9) y: (osc at: 10) z: (osc at: 11).

	(point_mat isNotNil  &  direc_mat isNotNil) ifTrue: [
		pos := point_mat xformVect: pos.
		aim := direc_mat xformVect: aim.
		ovr := direc_mat xformVect: ovr
	].

	^ { prov . butts . nil . pos . aim . ovr }
]

{ #category : #initialization }
OSCWandsSump >> setDirectionTransform: mat [

	direc_mat := mat.
]

{ #category : #initialization }
OSCWandsSump >> setPositionTransform: mat [

	point_mat := mat.
]

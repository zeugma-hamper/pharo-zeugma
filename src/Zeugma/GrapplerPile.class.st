Class {
	#name : #GrapplerPile,
	#superclass : #Grappler,
	#classVars : [
		'graps',
		'inm',
		'ipm',
		'nm',
		'pm'
	],
	#category : #'Zeugma-SpatialStructure'
}

{ #category : #assembling }
GrapplerPile >> appendGrappler: gr [

	gr ifNotNil: [ graps addIfNotPresent: gr ].
]

{ #category : #respiration }
GrapplerPile >> inhale: ratch atTime: thyme [
	| gr num |

	super inhale: ratch atTime: thyme.
	(num := graps size) < 1
		ifTrue: [ ^ 0 ].

	gr := graps at: 1.
	gr inhale: ratch atTime: thyme.
	pm := gr pntMat.
	ipm := gr invPntMat.
	nm := gr nrmMat.
	inm := gr invNrmMat.

	2 to num do: [ :q |
		gr := graps at: q.
		gr inhale: ratch atTime: thyme.
		pm multAccum: gr pntMat.
		ipm preMultAccum: gr invPntMat.
		nm multAccum: gr nrmMat.
		inm preMultAccum: gr invNrmMat.
	].

	^ 0
]

{ #category : #initialization }
GrapplerPile >> initialize [

	super initialize.
	pm := Matrix44 new.
	ipm := Matrix44 new.
	nm := Matrix44 new.
	inm := Matrix44 new.
	graps := OrderedCollection new.
]

{ #category : #'matrix-access' }
GrapplerPile >> invNrmMat [

	^ inm
]

{ #category : #'matrix-access' }
GrapplerPile >> invPntMat [

	^ ipm
]

{ #category : #'matrix-access' }
GrapplerPile >> nrmMat [

	^ nm
]

{ #category : #'matrix-access' }
GrapplerPile >> pntMat [

	^ pm
]

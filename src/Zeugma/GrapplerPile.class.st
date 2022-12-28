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

{ #category : #assemby }
GrapplerPile >> appendGrappler: gr [

	gr ifNotNil: [ graps addIfNotPresent: gr ].
]

{ #category : #initialization }
GrapplerPile >> clearMats [

	pm := Matrix44 new.
	ipm := Matrix44 new.
	nm := Matrix44 new.
	inm := Matrix44 new.

]

{ #category : #assemby }
GrapplerPile >> findGrappler: nameStr [

	^ graps detect: [ :g | g name = nameStr] ifNone: [ nil ]
]

{ #category : #assemby }
GrapplerPile >> grapplerCount [

	^ graps size
]

{ #category : #assemby }
GrapplerPile >> indexForGrappler: gr [

	graps doWithIndex: [ :g :ind | g == gr ifTrue: [ ^ ind ] ].
	^ -1
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
	self clearMats.
	graps := OrderedCollection new.
]

{ #category : #assemby }
GrapplerPile >> insertGrappler: gr atInd: ind [

	gr ifNotNil: [ graps add: gr beforeIndex: ind ].
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

{ #category : #assemby }
GrapplerPile >> nthGrappler [

	^ graps size
]

{ #category : #assemby }
GrapplerPile >> nthGrappler: ind [

	^ (ind between: 1 and: graps size)
			ifTrue: [ graps at: ind ]
			ifFalse: [ nil ]
]

{ #category : #'matrix-access' }
GrapplerPile >> pntMat [

	^ pm
]

{ #category : #assemby }
GrapplerPile >> prependGrappler: gr [

	gr ifNotNil: [ graps addFirst: gr ].
]

{ #category : #assemby }
GrapplerPile >> removeAllGrapplers [

	graps removeAll.
	self clearMats.
]

{ #category : #assemby }
GrapplerPile >> removeGrappler: gr [

	gr ifNotNil: [ graps remove: gr ifAbsent: [ ] ].
	gr size < 1
		ifTrue: [ self clearMats ].
]

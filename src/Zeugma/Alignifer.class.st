Class {
	#name : #Alignifer,
	#superclass : #SpaceThing,
	#instVars : [
		'loc_zft',
		'sca_zft',
		'ovr',
		'upp',
		'nrm'
	],
	#category : #'Zeugma-SpatialStructure'
}

{ #category : #alignment }
Alignifer >> alignOver: ov andUp: up [

	ovr := ov norm.
	upp := up norm.
	nrm := ovr cross: upp.
	self alignmentGrappler
		setViaNormalizedBasisVectors0: ovr and1: upp and2: nrm.
]

{ #category : #alignment }
Alignifer >> alignToOther: alig [

	alig ifNotNil:
		[ self alignOver: alig curOver andUp: alig curUp ].
]

{ #category : #alignment }
Alignifer >> alignmentGrappler [

	^ self findGrappler: 'alignment'
]

{ #category : #accessing }
Alignifer >> curLoc [

	^ loc_zft val
]

{ #category : #accessing }
Alignifer >> curNorm [

	^ nrm
]

{ #category : #accessing }
Alignifer >> curOver [

	^ ovr
]

{ #category : #accessing }
Alignifer >> curScale [

	^ sca_zft val
]

{ #category : #accessing }
Alignifer >> curUp [

	^ upp
]

{ #category : #initialization }
Alignifer >> initialize [
	| gr |

	super initialize.
	loc_zft := Zoft newWith: (Vect zeroOfDim: 3).
	sca_zft := Zoft newWith: (Vect onesOfDim: 3).
	ovr := Vect copyOf: Vect xAxis.
	upp := Vect copyOf: Vect yAxis.
	nrm := Vect copyOf: Vect zAxis.

	self appendGrappler: (gr := CoGrappler new setName: 'alignment').
	self appendGrappler: (gr := ScGrappler new setName: 'scale').
	gr installScale: sca_zft.
	self appendGrappler: (gr := TrGrappler new setName: 'loc').
	gr installTranslation: loc_zft.

]

{ #category : #accessing }
Alignifer >> installLocGrapplerZoft: lz [

	lz ifNil: [ self error: 'ye dassn''t install a nil zoft...' ].
	self locGrappler installTranslation: lz.
	loc_zft becomeLike: lz.
]

{ #category : #accessing }
Alignifer >> installScaleGrapplerZoft: sz [

	sz ifNil: [ self error: 'ye dassn''t install a nil zoft...' ].
	self scaleGrappler installScale: sz.
	sca_zft becomeLike: sz.
]

{ #category : #accessing }
Alignifer >> locGrappler [

	^ self findGrappler: 'loc'
]

{ #category : #accessing }
Alignifer >> locZoft [

	^ loc_zft
]

{ #category : #accessing }
Alignifer >> scaleGrappler [

	^ self findGrappler: 'scale'
]

{ #category : #accessing }
Alignifer >> scaleZoft [

	^ sca_zft
]

{ #category : #accessing }
Alignifer >> setLoc: l [

	loc_zft set: l.
]

{ #category : #accessing }
Alignifer >> setScale: s [

	sca_zft set: s.
]

Class {
	#name : #ScGrappler,
	#superclass : #Grappler,
	#instVars : [
		'scale_zoft',
		'center_zoft',
		'pm',
		'ipm',
		'nm',
		'inm'
	],
	#category : #'Zeugma-SpatialStructure'
}

{ #category : #accessing }
ScGrappler >> center [

	^ center_zoft val
]

{ #category : #accessing }
ScGrappler >> centerZoft [

	^ center_zoft
]

{ #category : #respiration }
ScGrappler >> inhale: ratch atTime: thyme [
	| sc cn |

	super inhale: ratch atTime: thyme.
	(scale_zoft isFreshFor: ratch) "just in case. right?"
		ifFalse: [ scale_zoft inhale: ratch atTime: thyme ].
	(center_zoft isFreshFor: ratch) "ditto. also right?"
		ifFalse: [ center_zoft inhale: ratch atTime: thyme ].

	sc := scale_zoft val.
	cn := center_zoft val.
	pm loadScale: sc about: cn.
	ipm loadScaleX: ((sc x = 0) ifTrue: [ 1 ] ifFalse: [ 1.0 / (sc x) ])
					Y: ((sc y = 0) ifTrue: [ 1 ] ifFalse: [ 1.0 / (sc y) ])
					Z: ((sc z = 0) ifTrue: [ 1 ] ifFalse: [ 1.0 / (sc z) ])
					about: cn.
	"we're still demurring, note, regaridng what to do with normals..."
	^ 0
]

{ #category : #accessing }
ScGrappler >> installCenter: cz [

	center_zoft becomeLike: cz.
]

{ #category : #accessing }
ScGrappler >> installScale: sz [

	scale_zoft becomeLike: sz.
]

{ #category : #'matrix-access' }
ScGrappler >> invNrmMat [

	^ inm
]

{ #category : #'matrix-access' }
ScGrappler >> invPntMat [

	^ ipm
]

{ #category : #'matrix-access' }
ScGrappler >> nrmMat [

	^ nm
]

{ #category : #'matrix-access' }
ScGrappler >> pntMat [

	^ pm
]

{ #category : #accessing }
ScGrappler >> scale [

	^ scale_zoft val
]

{ #category : #accessing }
ScGrappler >> scaleZoft [

	^ scale_zoft
]

{ #category : #initialization }
ScGrappler >> setCenter: cnVect [

	center_zoft set: cnVect
]

{ #category : #initialization }
ScGrappler >> setScale: scVect [

	scale_zoft set: scVect
]

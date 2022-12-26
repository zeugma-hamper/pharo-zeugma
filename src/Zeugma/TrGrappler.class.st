Class {
	#name : #TrGrappler,
	#superclass : #Grappler,
	#instVars : [
		'trans_zoft',
		'pm',
		'ipm'
	],
	#category : #'Zeugma-SpatialStructure'
}

{ #category : #'instance creation' }
TrGrappler class >> newWithVect: vectOrZoft [
	| novo |

	novo := self basicNew.
	novo initialize.
	
	
]

{ #category : #respiration }
TrGrappler >> inhale: ratch atTime: thyme [
	| tr |

	super inhale: ratch atTime: thyme.
	tr := trans_zoft val.
	pm loadTranslation: tr.
	ipm loadTranslation: tr neg.
	^ 0
]

{ #category : #initialization }
TrGrappler >> initialize [

	super initialize.
	pm := Matrix44 newIdent.
	ipm := Matrix44 newIdent.
	trans_zoft := Zoft newWith: (Vect zeroOfDim: 3).
]

{ #category : #accessing }
TrGrappler >> installTranslation: tz [

	trans_zoft becomeLike: tz.
]

{ #category : #'matrix-access' }
TrGrappler >> invPntMat [

	^ ipm
]

{ #category : #'matrix-access' }
TrGrappler >> pntMat [

	^ pm
]

{ #category : #accessing }
TrGrappler >> setTranslation: trVect [

	trans_zoft set: trVect.
]

{ #category : #accessing }
TrGrappler >> translation [

	^ trans_zoft val
]

{ #category : #accessing }
TrGrappler >> translationZoft [

	^ trans_zoft
]

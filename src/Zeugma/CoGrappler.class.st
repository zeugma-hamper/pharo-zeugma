Class {
	#name : #CoGrappler,
	#superclass : #Grappler,
	#instVars : [
		'o_zft',
		'u_zft',
		'n_zft',
		'pm',
		'ipm',
		'nm',
		'inm'
	],
	#category : #'Zeugma-SpatialStructure'
}

{ #category : #respiration }
CoGrappler >> inhale: ratch atTime: thyme [
	| o u n |

	super inhale: ratch atTime: thyme.
	o_zft
		ifNil: [
			(u_zft isNil or: [ n_zft isNil ]) ifTrue: [ ^ 0 ].
			u_zft inhale: ratch atTime: thyme.
			n_zft inhale: ratch atTime: thyme.
			u := u_zft val norm.
			n := n_zft val norm.
			o := u cross: n.
		]
		ifNotNil: [
			(u_zft isNil and: [ n_zft isNil ]) ifTrue: [ ^ 0 ].
			o_zft inhale: ratch atTime: thyme.
			o := o_zft val norm.
			u_zft
				ifNotNil: [
					u_zft inhale: ratch atTime: thyme.
					u := u_zft val norm.
					n := o cross: u.
				]
				ifNil: [
					n_zft inhale: ratch atTime: thyme.
					n := n_zft val norm.
					u := n cross: o.
				].
		].
	self setViaNormalizedBasisVectors0: o and1: u and2: n.
	^ 0
]

{ #category : #initialization }
CoGrappler >> initialize [

	super initialize.
	pm := Matrix44 new.
	ipm := Matrix44 new.
	nm := Matrix44 new.
	inm := Matrix44 new.
	"*_zft rmaining for the nonce all nil..."

]

{ #category : #'matrix-access' }
CoGrappler >> invNrmMat [

	^ inm
]

{ #category : #'matrix-access' }
CoGrappler >> invPntMat [

	^ ipm
]

{ #category : #'matrix-access' }
CoGrappler >> nrmMat [

	^ nm
]

{ #category : #'matrix-access' }
CoGrappler >> pntMat [

	^ pm
]

{ #category : #'matrix-access' }
CoGrappler >> setViaNorm: nVect andUp: uVect [
	| o u n |

	n := nVect norm.
	u := uVect norm.
	o := u cross: n.
	self setViaNormalizedBasisVectors0: o and1: u and2: n.
]

{ #category : #initialization }
CoGrappler >> setViaNormalizedBasisVectors0: e0 and1: e1 and2: e2 [

	pm := Matrix44 newFrom:
		{ e0 x  .  e0 y  .  e0 z  .  0  .
		  e1 x  .  e1 y  .  e1 z  .  0  .
		  e2 x  .  e2 y  .  e2 z  .  0  .
		    0   .    0   .    0   .  1
		}.
	ipm := pm transpose.
	nm := pm.
	inm := ipm.
]

{ #category : #'matrix-access' }
CoGrappler >> setViaOver: oVect andNorm: nVect [
	| o u n |

	o := oVect norm.
	n := nVect norm.
	u := n cross: o.
	self setViaNormalizedBasisVectors0: o and1: u and2: n.
]

{ #category : #'matrix-access' }
CoGrappler >> setViaOver: oVect andUp: uVect [
	| o u n |

	o := oVect norm.
	u := uVect norm.
	n := o cross: u.
	self setViaNormalizedBasisVectors0: o and1: u and2: n.
]

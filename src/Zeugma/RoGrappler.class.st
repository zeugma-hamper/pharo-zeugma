Class {
	#name : #RoGrappler,
	#superclass : #Grappler,
	#instVars : [
		'axis_zoft',
		'angle_zoft',
		'center_zoft',
		'phase_zoft',
		'pm',
		'ipm',
		'nm',
		'inm'
	],
	#category : #'Zeugma-SpatialStructure'
}

{ #category : #'instance creation' }
RoGrappler class >> new [

	^ self newWithAxis: Vect zAxis andAngle: 0.0 
]

{ #category : #'instance creation' }
RoGrappler class >> newWithAxis: ax andAngle: an [
	| novo |

	novo := self basicNew.
	novo initialize.
	novo installAxisZoft: (Zoft newWith: ax).
	novo installAngleZoft: (Zoft newWith: an).

	^ novo
]

{ #category : #'instance creation' }
RoGrappler class >> newWithAxis: ax andAngle: an andCenter: ce [
	| novo |

	novo := self newWithAxis: ax andAngle: an.
	novo installCenterZoft: (Zoft newWith: ce).

	^ novo
]

{ #category : #'instance creation' }
RoGrappler class >> newWithAxis: ax andAngle: an andCenter: ce andPhase: ph [
	| novo |

	novo := self newWithAxis: ax andAngle: an.
	novo installCenterZoft: (Zoft newWith: ce).
	novo installPhaseZoft: (Zoft newWith: ph).

	^ novo
]

{ #category : #'instance creation' }
RoGrappler class >> newWithAxis: ax andAngle: an andPhase: ph [
	| novo |

	novo := self newWithAxis: ax andAngle: an.
	novo installPhaseZoft: (Zoft newWith: ph).

	^ novo
]

{ #category : #accessing }
RoGrappler >> angle [

	^ angle_zoft val
]

{ #category : #accessing }
RoGrappler >> angleZoft [

	^ angle_zoft
]

{ #category : #accessing }
RoGrappler >> axis [

	^ axis_zoft val
]

{ #category : #accessing }
RoGrappler >> axisZoft [

	^ axis_zoft
]

{ #category : #accessing }
RoGrappler >> center [

	^ center_zoft
		ifNil: [ Vect zeroOfDim: 3 ]
		ifNotNil: [ center_zoft val ]
]

{ #category : #accessing }
RoGrappler >> centerZoft [

	^ center_zoft
]

{ #category : #respiration }
RoGrappler >> inhale: ratch atTime: thyme [
	| ax an ce ph |

	super inhale: ratch atTime: thyme.
	axis_zoft inhale: ratch atTime: thyme.
	ax := axis_zoft val normed.
	angle_zoft inhale: ratch atTime: thyme.
	an := angle_zoft val.

	center_zoft ifNotNil: [ center_zoft inhale: ratch atTime: thyme. ].
	phase_zoft
		ifNil: [ ph := 0.0 ]
		ifNotNil: [ phase_zoft inhale: ratch atTime: thyme.  ph := phase_zoft val ].

	nm := Matrix44 rotationNormedAxis: ax angle: an + ph.
	inm := Matrix44 rotationNormedAxis: ax negated angle: an + ph.

	center_zoft ifNil: [
		pm := nm.  ipm := inm.
	] ifNotNil: [
		ce := center_zoft val.
		pm := Matrix44 rotationNormedAxis: ax angle: an + ph about: ce.
		ipm := Matrix44 rotationNormedAxis: ax negated angle: an + ph about: ce.
	].

	^ 0
]

{ #category : #accessing }
RoGrappler >> installAngleZoft: az [

	angle_zoft
		ifNil: [ angle_zoft := Zoft newWith: az ]
		ifNotNil: [ angle_zoft becomeLike: az ].
]

{ #category : #accessing }
RoGrappler >> installAxisZoft: az [

	axis_zoft
		ifNil: [ axis_zoft := Zoft newWith: az ]
		ifNotNil: [ axis_zoft becomeLike: az ].
]

{ #category : #accessing }
RoGrappler >> installCenterZoft: cz [

	center_zoft
		ifNil: [ center_zoft := Zoft newWith: cz ]
		ifNotNil: [ center_zoft becomeLike: cz ].
]

{ #category : #accessing }
RoGrappler >> installPhaseZoft: pz [

	phase_zoft
		ifNil: [ phase_zoft := Zoft newWith: pz ]
		ifNotNil: [ phase_zoft becomeLike: pz ].
]

{ #category : #'matrix-access' }
RoGrappler >> invNrmMat [

	^ inm
]

{ #category : #'matrix-access' }
RoGrappler >> invPntMat [

	^ ipm
]

{ #category : #'matrix-access' }
RoGrappler >> nrmMat [

	^ nm
]

{ #category : #accessing }
RoGrappler >> phase [

	^ phase_zoft
		ifNil: [ 0.0 ]
		ifNotNil: [ phase_zoft val ]
]

{ #category : #accessing }
RoGrappler >> phaseZoft [

	^ phase_zoft
]

{ #category : #'matrix-access' }
RoGrappler >> pntMat [

	^ pm
]

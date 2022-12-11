Class {
	#name : #ZESpatialEvent,
	#superclass : #ZeEvent,
	#instVars : [
		'loc',
		'aim',
		'ovr',
		'pressures',
		'caresses',
		'reinterps'
	],
	#category : #'Zeugma-Events'
}

{ #category : #'event-routing' }
ZESpatialEvent class >> classSideDeliverySelector [

	^ #zeSpatial:
]

{ #category : #'bulk-setting' }
ZESpatialEvent >> adoptParticularsFrom: otha [

	self adoptSpatialEventParticularsFrom: otha.
	^ self
]

{ #category : #'bulk-setting' }
ZESpatialEvent >> adoptSpatialEventParticularsFrom: otha [

	self adoptEventParticularsFrom: otha.
	self setLoc: otha loc.
	self setAim: otha aim.
	self setOver: otha over.
	self setPressures: otha pressures.
	self setCaresses: otha caresses.
	^ self
]

{ #category : #accessing }
ZESpatialEvent >> aim [

	^ aim
]

{ #category : #accessing }
ZESpatialEvent >> careessForID: id [

	caresses ifNil: [ ^ nil ].
	^ caresses at: id ifAbsent: [ nil ]
]

{ #category : #accessing }
ZESpatialEvent >> caresses [

	^ caresses
]

{ #category : #accessing }
ZESpatialEvent >> loc [

	^ loc
]

{ #category : #accessing }
ZESpatialEvent >> over [

	^ ovr
]

{ #category : #accessing }
ZESpatialEvent >> pressureForID: id [

	pressures ifNil: [ ^ nil ].
	^ pressures at: id ifAbsent: [ nil ]
]

{ #category : #accessing }
ZESpatialEvent >> pressures [

	^ pressures copy
]

{ #category : #accessing }
ZESpatialEvent >> reinterps [

	^ reinterps
]

{ #category : #accessing }
ZESpatialEvent >> setAim: a [

	aim := a.
]

{ #category : #accessing }
ZESpatialEvent >> setCaress: aVect forID: anInt [

	caresses ifNil: [ caresses := Dictionary new ].
	caresses at: anInt put: aVect.
]

{ #category : #accessing }
ZESpatialEvent >> setCaresses: crss [

	caresses := crss.
]

{ #category : #accessing }
ZESpatialEvent >> setLoc: l [

	loc := l.
]

{ #category : #'bulk-setting' }
ZESpatialEvent >> setLoc: l aim: a over: o [

	self setLoc: l.
	self setAim: a.
	self setOver: o.
	^ self
]

{ #category : #'bulk-setting' }
ZESpatialEvent >> setLoc: l aim: a over: o caresses: crss [

	self setLoc: l aim: a over: o.
	self setCaresses: crss.
	^ self
]

{ #category : #'bulk-setting' }
ZESpatialEvent >> setLoc: l aim: a over: o pressures: prss caresses: crss [

	self setLoc: l aim: a over: o.
	self setPressures: prss.
	self setCaresses: crss.
	^ self
]

{ #category : #accessing }
ZESpatialEvent >> setOver: o [

	ovr := o.
]

{ #category : #accessing }
ZESpatialEvent >> setPressure: aFloat forID: anInt [

	pressures ifNil: [ pressures := Dictionary new ].
	pressures at: anInt put: aFloat.
]

{ #category : #accessing }
ZESpatialEvent >> setPressures: prss [

	pressures := prss.
]

{ #category : #accessing }
ZESpatialEvent >> setReinterps: reis [

	reinterps := reis.
]

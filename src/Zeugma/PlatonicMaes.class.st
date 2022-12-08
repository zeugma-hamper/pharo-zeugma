Class {
	#name : #PlatonicMaes,
	#superclass : #SpaceThing,
	#instVars : [
		'loc',
		'ovr',
		'upp',
		'wid',
		'hei',
		'layers'
	],
	#category : #'Zeugma-SpaceAndGeom'
}

{ #category : #'hit-testing' }
PlatonicMaes class >> closestAmongAllMaesesFromRay: frm aim: aim [

	^ self closestAmongMaeses: (self allInstances) fromRay: frm aim: aim restrictToMaesExtent: true
]

{ #category : #'hit-testing' }
PlatonicMaes class >> closestAmongAllMaesesFromRay: frm aim: aim restrictToMaesExtent: strict [

	^ self closestAmongMaeses: (self allInstances) fromRay: frm aim: aim restrictToMaesExtent: strict
]

{ #category : #'hit-testing' }
PlatonicMaes class >> closestAmongMaeses: maesColl fromRay: frm aim: aim [

	^ self closestAmongMaeses: maesColl fromRay: frm aim: aim restrictToMaesExtent: true
]

{ #category : #'hit-testing' }
PlatonicMaes class >> closestAmongMaeses: maesColl fromRay: frm aim: aim restrictToMaesExtent: strict [

	| clsHit clsMaes clsDst |

	clsMaes := nil.
	clsDst := -1.0.
	maesColl do: [ : m |
		| d hit |
		hit := strict
			ifTrue: [ Geom intersectRay: frm aim: aim withRect: m loc
									over: m over up: m up wid: m wid hei: m hei ]
			ifFalse: [ Geom intersectRay: frm aim: aim withPlane: m loc norm: (m over cross: m up) ].
		hit ifNotNil: [
			d := (hit - frm) normSquared.
			(clsDst < 0.0  or:  [ d < clsDst ])
				ifTrue: [ clsDst := d.  clsHit := hit.  clsMaes := m ].
		].
	].

	clsMaes ifNil: [ ^ nil ].
	^ { clsMaes . clsHit }
]

{ #category : #accessing }
PlatonicMaes >> hei [

	^ hei
]

{ #category : #accessing }
PlatonicMaes >> hei: h [

	hei := h
]

{ #category : #accessing }
PlatonicMaes >> layers [

	^ layers
]

{ #category : #accessing }
PlatonicMaes >> loc [

	^ loc
]

{ #category : #accessing }
PlatonicMaes >> loc: aVect [

	loc := aVect
]

{ #category : #accessing }
PlatonicMaes >> over [

	^ ovr
]

{ #category : #accessing }
PlatonicMaes >> over: aVect [

	ovr := aVect
]

{ #category : #accessing }
PlatonicMaes >> up [

	^ upp
]

{ #category : #accessing }
PlatonicMaes >> up: aVect [

	upp := aVect
]

{ #category : #accessing }
PlatonicMaes >> wid [

	^ wid
]

{ #category : #accessing }
PlatonicMaes >> wid: w [

	wid := w
]

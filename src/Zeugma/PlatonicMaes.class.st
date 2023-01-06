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
	#category : #'Zeugma-SpatialStructure'
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
									over: m over up: m up wid: m width hei: m height ]
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

{ #category : #'instance creation' }
PlatonicMaes class >> newFromDict: map [

	^ self new
		setName: (map at: #name);
		setLoc: (Vect new: (map at: #location));
		setOver: (Vect new: (map at: #over));
		setUp: (Vect new: (map at: #up));
		setWidth: (map at: #width);
		setHeight: (map at: #height);
		itself
]

{ #category : #configuring }
PlatonicMaes class >> sampleMaesConfig [

	^ STONJSON fromStream: (self sampleMaesConfigJSON readStream)
]

{ #category : #configuring }
PlatonicMaes class >> sampleMaesConfigJSON [

^ '[
    { "name" : "front",
      "location" : [0.0, 2186.0, -2670.0],
      "over" : [1.0, 0.0, 0.0],
      "up" : [0.0, 1.0, 0.0],
      "width" : 7772.4,
      "height" : 4372.0,
      "ideal-pixwid" : 3840,
      "ideal-pixhei" : 2160
    },

    { "name" : "left",
      "location" : [-3886.2, 1502.0, 0.0],
      "over" : [0.0, 0.0, -1.0],
      "up" : [0.0, 1.0, 0.0],
      "width" : 5340.0,
      "height" : 3004.0,
      "ideal-pixwid" : 3840,
      "ideal-pixhei" : 2160
    },

    { "name" : "table",
      "location" : [0.0, 1028.0, -60.0],
      "over" : [1.0, 0.0, 0.0],
      "up" : [0.0, 0.422618, -0.906308],
      "width" : 1327.6,
      "height" : 746.8,
      "ideal-pixwid" : 3840,
      "ideal-pixhei" : 2160
    }
]'
]

{ #category : #layers }
PlatonicMaes >> appendLayer: lay [

	lay ifNil: [ ^ false ].
	layers
		ifNil: [ layers := OrderedCollection new ]
		ifNotNil: [ (layers includes: lay) ifTrue: [ ^ false ] ].
	layers add: lay.
	^ true
]

{ #category : #layers }
PlatonicMaes >> findLayer: nameStr [

	layers ifNil: [ ^ nil ].
	^ layers detect: [ :lay | lay name = nameStr ] ifNone: [ nil ]
]

{ #category : #accessing }
PlatonicMaes >> height [

	^ hei
]

{ #category : #layers }
PlatonicMaes >> indexForLayer: lay [

	(layers isNil or: [ lay isNil ])
		ifTrue: [ ^ -1 ].
	layers doWithIndex: [ :l :ind | l == lay ifTrue: [^ ind ] ].
	^ -1
]

{ #category : #layers }
PlatonicMaes >> insertLayer: lay at: ind [

	lay ifNil: [ ^ false ].
	layers
		ifNil: [ layers := OrderedCollection new ]
		ifNotNil: [ (layers includes: lay) ifTrue: [ ^ false ] ].
	layers add: lay beforeIndex: ind.
	^ true
]

{ #category : #accessing }
PlatonicMaes >> layerCount [

	^ layers
			ifNil: [ 0 ]
			ifNotNil: [ layers size ]
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
PlatonicMaes >> over [

	^ ovr
]

{ #category : #layers }
PlatonicMaes >> removeLayer: lay [

	(layers isNil or: [ lay isNil ])
		ifTrue: [ ^ false ].
	layers remove: lay ifAbsent: [ ^ false ].
	^ true
]

{ #category : #accessing }
PlatonicMaes >> setHeight: h [

	hei := h
]

{ #category : #accessing }
PlatonicMaes >> setLoc: aVect [

	loc := aVect
]

{ #category : #accessing }
PlatonicMaes >> setOver: aVect [

	ovr := aVect
]

{ #category : #accessing }
PlatonicMaes >> setUp: aVect [

	upp := aVect
]

{ #category : #accessing }
PlatonicMaes >> setWidth: w [

	wid := w
]

{ #category : #accessing }
PlatonicMaes >> up [

	^ upp
]

{ #category : #accessing }
PlatonicMaes >> width [

	^ wid
]

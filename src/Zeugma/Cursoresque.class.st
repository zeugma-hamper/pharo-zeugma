Class {
	#name : #Cursoresque,
	#superclass : #Alignifer,
	#instVars : [
		'num_verts',
		'verts_lrg',
		'verts_sml',
		'poly_lrg',
		'poly_sml'
	],
	#classVars : [
		'randy'
	],
	#category : #'Zeugma-UI'
}

{ #category : #'class initialization' }
Cursoresque class >> initialize [

	randy := Random new.
]

{ #category : #'instance creation' }
Cursoresque class >> new: nVerts [

	^ self new: nVerts size: 100.0
]

{ #category : #'instance creation' }
Cursoresque class >> new: nVerts size: sz [
	| novo |

	novo := self basicNew.
	novo initialize: nVerts size: sz.
	^ novo
]

{ #category : #'instance creation' }
Cursoresque class >> newOfSize: sz [

	^ self new: 6 size: sz
]

{ #category : #drawing }
Cursoresque >> drawSelfAtRatch: ratch withCumuMats: cm andAdjColor: adjc [
	| vees |

	vees := Array new: num_verts.
	verts_lrg withIndexDo: [ :vzft :i | vees at: i put: (cm xformPointLocalToWorld: vzft val) ].
	vees withIndexDo: [ :v :i | vees at: i put: ((v x) @ (v y)) ].
	poly_lrg setVertices: vees.

	vees := Array new: num_verts.
	verts_sml withIndexDo: [ :vzft :i | vees at: i put: (cm xformPointLocalToWorld: vzft val) ].
	vees withIndexDo: [ :v :i | vees at: i put: ((v x) @ (v y)) ].
	poly_sml setVertices: vees.

	^ 0
]

{ #category : #respiration }
Cursoresque >> inhale: ratch atTime: thyme [
	| vees |

	super inhale: ratch atTime: thyme.
"
	vees := Array new: num_verts.
	verts_lrg withIndexDo: [ :v :i | vees at: i put: ((v val x) @ (v val y)) ].
	poly_lrg setVertices: vees.

	vees := Array new: num_verts.
	verts_sml withIndexDo: [ :v :i | vees at: i put: ((v val x) @ (v val y)) ].
	poly_sml setVertices: vees.
"
	^ 0
]

{ #category : #initialization }
Cursoresque >> initialize: nVerts size: sz [
	| theeta radial arm |
 
	super initialize.
	num_verts := nVerts.
	verts_lrg := Array new: nVerts.
	verts_sml := Array new: nVerts.

	poly_lrg := PolygonMorph new.
	poly_lrg addMorph: (poly_sml := PolygonMorph new).

	poly_lrg beStraightSegments.
	poly_sml beStraightSegments.

	0 to: 1 do: [ :w |
		0 to: nVerts - 1 do: [ :q |
			theeta := 2.0 * Float pi / nVerts * q + (w * 2 * Float pi / nVerts).
			radial := (Vect xAxis * theeta cos + (Vect yAxis * theeta sin))
				* 0.5 * (0.85 * w + 1).
			arm := SinuZoft
				newWithAmplitude: radial * sz * 0.065
				andFrequency: 0.8 + (0.11 * randy next)
				andCenter: radial * sz * 0.24 * (1 + (3 * (q % 2))).
			(w > 0  ifTrue: [ verts_lrg ]  ifFalse: [ verts_sml ])
				at: q+1 put: arm.
		]
	].
]

{ #category : #accessing }
Cursoresque >> morph [

	^ poly_lrg
]

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
Cursoresque class >> new: nSpikes [
	| novo |

	novo := self basicNew.
	novo initialize: nSpikes.
	^ novo
]

{ #category : #'instance creation' }
Cursoresque class >> new: nSpikes size: sz [
	| novo |

	novo := self basicNew.
	novo initialize: nSpikes size: sz.
	^ novo
]

{ #category : #initialization }
Cursoresque >> initialize [

	super initialize.
	loc_zft := Zoft newWith: (Vect zeroOfDim: 3).
	sca_zft := Zoft newWith: (Vect onesOfDim: 3).
	ovr := Vect xAxis.
	upp := Vect yAxis.
	nrm := Vect zAxis.
]

{ #category : #initialization }
Cursoresque >> initialize: nVerts size: sz [
	| theeta radial arm |
 
	super initialize.
	num_verts := nVerts.
	verts_lrg := Array new: nVerts.
	verts_sml := Array new: nVerts.
	poly_lrg := PolygonMorph new.
	poly_sml := PolygonMorph new.
	poly_lrg addMorph: poly_sml.

	0 to: 1 do: [ :w |
		0 to: 2 * nVerts - 1 do: [ :q |
			theeta := 2 * Float pi / nVerts * q + (w * Float pi).
			radial := (Vect xAxis * theeta cos + (Vect yAxis * theeta sin))
				* 0.5 * (w + 1).
			arm := SinuZoft
				newWithAmplitude: radial * sz * 0.065
				andFrequency: 0.8 + (0.11 * randy next)
				andCenter: radial * sz * 0.24 * (1 + (3 * (q % 2))).
			(w > 0  ifTrue: [ verts_lrg ]  ifFalse: [ verts_sml ])
				at: q put: arm.
		]
	].
]

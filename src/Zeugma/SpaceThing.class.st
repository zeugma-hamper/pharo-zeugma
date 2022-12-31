Class {
	#name : #SpaceThing,
	#superclass : #LimnyThing,
	#instVars : [
		'gr_pile'
	],
	#category : #'Zeugma-SpatialStructure'
}

{ #category : #grapplers }
SpaceThing >> appendGrappler: gr [

	gr ifNotNil: [ self assuredGrapplerPile appendGrappler: gr ].
]

{ #category : #grapplers }
SpaceThing >> assuredGrapplerPile [

	gr_pile ifNil: [ gr_pile := GrapplerPile new ].
	^ gr_pile
]

{ #category : #'cumulative transforms' }
SpaceThing >> dependCumuMatsFrom: cmAbove [

	gr_pile ifNil:
		[ ^ (cumu_mats := cmAbove) ].
	cumu_mats ifNil:
		[ cumu_mats := CumuMats new: false ].
	cmAbove
		ifNil: [ cumu_mats freshenVia: gr_pile pntMat
										and: gr_pile nrmMat
										and: gr_pile invPntMat
										and: gr_pile invNrmMat]
		ifNotNil: [ cumu_mats freshenVia: (gr_pile pntMat * cmAbove pntMat)
										and: (gr_pile nrmMat * cmAbove nrmMat)
										and: (cmAbove invPntMat * gr_pile invPntMat)
										and: (cmAbove invNrmMat * gr_pile invNrmMat) ].
	^ cumu_mats
]

{ #category : #grapplers }
SpaceThing >> findGrappler: nameStr [

	gr_pile ifNotNil: [ ^ gr_pile findGrappler: nameStr ].
	^ nil
]

{ #category : #respiration }
SpaceThing >> inhale: ratch atTime: thyme [

	super inhale: ratch atTime: thyme.
	gr_pile ifNotNil:
		[ gr_pile inhale: ratch atTime: thyme ].
	^ 0
]

{ #category : #grapplers }
SpaceThing >> prependGrappler: gr [

	gr ifNotNil: [ self assuredGrapplerPile prependGrappler: gr ].
]

{ #category : #grapplers }
SpaceThing >> unsecuredGrapplerPile [

	^ gr_pile
]

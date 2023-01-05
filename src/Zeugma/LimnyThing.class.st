Class {
	#name : #LimnyThing,
	#superclass : #PouchyThing,
	#traits : 'Limnable',
	#classTraits : 'Limnable classTrait',
	#instVars : [
		'limn_flags',
		'cumu_mats',
		'adj_iro',
		'cumu_adjc'
	],
	#category : #'Zeugma-SpatialStructure'
}

{ #category : #'cumulative transforms' }
LimnyThing >> currentCumuMats [

	^ cumu_mats
]

{ #category : #'cumulative transforms' }
LimnyThing >> dependCumuMatsFrom: cm_above [

	^ (cumu_mats := cm_above)
]

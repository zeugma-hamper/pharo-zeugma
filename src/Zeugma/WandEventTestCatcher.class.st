Class {
	#name : #WandEventTestCatcher,
	#superclass : #Zeubject,
	#traits : 'ZESpatialPhagy',
	#classTraits : 'ZESpatialPhagy classTrait',
	#category : #'Zeugma-Events'
}

{ #category : #'event-phagy' }
WandEventTestCatcher >> passTheBuckUpPhageHierarchy [

	^ true.
]

{ #category : #'event-phagy' }
WandEventTestCatcher >> zeSpatial: evt [

	Transcript show: evt; cr.
	^ 0
]

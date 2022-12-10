Trait {
	#name : #ZESpatialPressurePhage,
	#traits : 'ZESpatialPhage',
	#classTraits : 'ZESpatialPhage classTrait',
	#category : #'Zeugma-EventPhageTraits'
}

{ #category : #'event-phagy' }
ZESpatialPressurePhage >> zeSpatialPressure: evt [

	^ (self passTheBuckUpPhageHierarchy)
		ifTrue: [ self zeSpatial: evt ]
		ifFalse: [ -1 ]
]

Trait {
	#name : #ZESpatialHardenPhage,
	#traits : 'ZESpatialPressurePhage',
	#classTraits : 'ZESpatialPressurePhage classTrait',
	#category : #'Zeugma-EventPhageTraits'
}

{ #category : #'event-phagy' }
ZESpatialHardenPhage >> zeSpatialHarden: evt [

	^ (self passTheBuckUpPhageHierarchy)
		ifTrue: [ self zeSpatialPressure: evt ]
		ifFalse: [ -1 ]
]

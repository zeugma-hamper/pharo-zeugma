Trait {
	#name : #ZESpatialCaressPhage,
	#traits : 'ZESpatialPhage',
	#classTraits : 'ZESpatialPhage classTrait',
	#category : #'Zeugma-EventPhageTraits'
}

{ #category : #'event-phagy' }
ZESpatialCaressPhage >> zeSpatialCaress: evt [

	^ (self passTheBuckUpPhageHierarchy)
		ifTrue: [ self zeSpatial: evt ]
		ifFalse: [ -1 ]
]

Trait {
	#name : #ZESpatialAppearPhage,
	#traits : 'ZESpatialPhage',
	#classTraits : 'ZESpatialPhage classTrait',
	#category : #'Zeugma-EventPhageTraits'
}

{ #category : #'event-phagy' }
ZESpatialAppearPhage >> zeSpatialAppear: evt [

	^ (self passTheBuckUpPhageHierarchy)
		ifTrue: [ self zeSpatial: evt ]
		ifFalse: [ -1 ]
]

Trait {
	#name : #ZESpatialMovePhage,
	#traits : 'ZESpatialPhage',
	#classTraits : 'ZESpatialPhage classTrait',
	#category : #'Zeugma-EventPhageTraits'
}

{ #category : #'event-phagy' }
ZESpatialMovePhage >> zeSpatialMove: evt [

	^ (self passTheBuckUpPhageHierarchy)
		ifTrue: [ self zeSpatial: evt ]
		ifFalse: [ -1 ]
]

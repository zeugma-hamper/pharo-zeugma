Trait {
	#name : #ZESpatialPhage,
	#traits : 'ZEPhage',
	#classTraits : 'ZEPhage classTrait',
	#category : #'Zeugma-EventPhageTraits'
}

{ #category : #'event-phagy' }
ZESpatialPhage >> zeSpatial: evt [

	^ (self passTheBuckUpPhageHierarchy)
		ifTrue: [ self ze: evt ]
		ifFalse: [ -1 ]
]

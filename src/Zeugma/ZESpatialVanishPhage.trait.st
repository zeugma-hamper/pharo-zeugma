Trait {
	#name : #ZESpatialVanishPhage,
	#traits : 'ZESpatialPhage',
	#classTraits : 'ZESpatialPhage classTrait',
	#category : #'Zeugma-EventPhageTraits'
}

{ #category : #'event-phagy' }
ZESpatialVanishPhage >> zeSpatialVanish: evt [

	^ (self passTheBuckUpPhageHierarchy)
		ifTrue: [ self zeSpatial: evt ]
		ifFalse: [ -1 ]
]

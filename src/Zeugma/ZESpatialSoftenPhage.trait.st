Trait {
	#name : #ZESpatialSoftenPhage,
	#traits : 'ZESpatialPressurePhage',
	#classTraits : 'ZESpatialPressurePhage classTrait',
	#category : #'Zeugma-EventPhageTraits'
}

{ #category : #'event-phagy' }
ZESpatialSoftenPhage >> zeSpatialSoften: evt [

	^ (self passTheBuckUpPhageHierarchy)
		ifTrue: [ self zeSpatialPressure: evt ]
		ifFalse: [ -1 ]
]

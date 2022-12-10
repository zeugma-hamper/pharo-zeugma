Trait {
	#name : #ZEYowlAppearPhage,
	#traits : 'ZEYowlPhage',
	#classTraits : 'ZEYowlPhage classTrait',
	#category : #'Zeugma-EventPhageTraits'
}

{ #category : #'event-phagy' }
ZEYowlAppearPhage >> zeYowlAppear: evt [

	^ (self passTheBuckUpPhageHierarchy)
		ifTrue: [ self zeYowl: evt ]
		ifFalse: [ -1 ]
]

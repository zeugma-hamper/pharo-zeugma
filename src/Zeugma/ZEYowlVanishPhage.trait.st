Trait {
	#name : #ZEYowlVanishPhage,
	#traits : 'ZEYowlPhage',
	#classTraits : 'ZEYowlPhage classTrait',
	#category : #'Zeugma-EventPhageTraits'
}

{ #category : #'event-phagy' }
ZEYowlVanishPhage >> zeYowlVanish: evt [

	^ (self passTheBuckUpPhageHierarchy)
		ifTrue: [ self zeYowl: evt ]
		ifFalse: [ -1 ]
]

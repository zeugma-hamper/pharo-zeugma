Trait {
	#name : #ZEYowlPhage,
	#traits : 'ZEPhage',
	#classTraits : 'ZEPhage classTrait',
	#category : #'Zeugma-EventPhageTraits'
}

{ #category : #'event-phagy' }
ZEYowlPhage >> zeYowl: evt [

	^ (self passTheBuckUpPhageHierarchy)
		ifTrue: [ self ze: evt ]
		ifFalse: [ -1 ]
]

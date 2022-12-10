Trait {
	#name : #ZEYowlRepeatPhage,
	#traits : 'ZEYowlPhage',
	#classTraits : 'ZEYowlPhage classTrait',
	#category : #'Zeugma-EventPhageTraits'
}

{ #category : #'event-phagy' }
ZEYowlRepeatPhage >> zeYowlRepeat: evt [

	^ (self passTheBuckUpPhageHierarchy)
		ifTrue: [ self zeYowl: evt ]
		ifFalse: [ -1 ]
]

Class {
	#name : #IronLung,
	#superclass : #Zeubject,
	#instVars : [
		'breathees',
		'aspirants',
		'expirees'
	],
	#classVars : [
		'globalIronLungs'
	],
	#category : #'Zeugma-TemporalStructure'
}

{ #category : #participants }
IronLung >> appendBreathee: zeub [

	^ self appendBreathee: zeub recordSelfInBreathee: true 
]

{ #category : #participants }
IronLung >> appendBreathee: zeub recordSelfInBreathee: rsib [

	zeub ifNil: [ ^ false ].
	((aspirants contents includes: zeub)
		or: [ breathees includes: zeub ])
			ifTrue: [ ^ false ].
	aspirants nextPut: zeub.
	rsib ifTrue: [ zeub setBreather: self ].
	^ true
]

{ #category : #respiration }
IronLung >> inhale: ratch atTime: thyme [
	| dedcnt |

	[ expirees isEmpty ] whileFalse:
		[ breathees remove: expirees next ].
	[ aspirants isEmpty ] whileFalse:
		[ breathees add: aspirants next ].

	dedcnt := 0.
	breathees do: [ :z |
		z ifNil: [ dedcnt := dedcnt + 1 ]
			ifNotNil: [ z inhale: ratch atTime: thyme ]
	].

	(dedcnt  >  (breathees size / 2))
		ifTrue: [  ].  "compact?"

	[ expirees isEmpty ] whileFalse:
		[ breathees remove: expirees next ].
	[ aspirants isEmpty ] whileFalse:
		[ breathees add: aspirants next ].

	^ 0
]

{ #category : #initialization }
IronLung >> initialize [

	super initialize.
	breathees := WeakOrderedCollection new.
	aspirants := SharedQueue new.
	expirees := SharedQueue new.
]

{ #category : #participants }
IronLung >> removeBreathee: zeub [
	| urn |

	urn := false.
	zeub ifNil: [ ^ false ].
	(aspirants contents includes: zeub) ifTrue: [ | tmp |
		"aspirants remove: zeub."  "no #remove: for a SharedQueue... so,"
		tmp := aspirants contents.
		aspirants removeAll.
		tmp remove: zeub.
		tmp do: [ :z | aspirants nextPut: z ].
		urn := true
	].

	(breathees includes: zeub) ifFalse: [ ^ urn ].

	urn := true.
	expirees nextPut: zeub.
	zeub unsecuredSac ifNotNil: [ zeub setBreather: nil ].
	^ urn
]

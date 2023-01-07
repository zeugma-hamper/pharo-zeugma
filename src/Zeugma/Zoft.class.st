Class {
	#name : #Zoft,
	#superclass : #Zeubject,
	#instVars : [
		'val',
		'guts'
	],
	#classVars : [
		'default_lung'
	],
	#category : #'Zeugma-Zofts'
}

{ #category : #respiration }
Zoft class >> defaultLung [

	^ default_lung
]

{ #category : #creating }
Zoft class >> new [

	self shouldNotImplement
]

{ #category : #creating }
Zoft class >> newWith: aZoftOrPlainVal [
	| newz |

	(aZoftOrPlainVal isKindOf: Zoft)
		ifFalse: [ ^ LatchZoft newWith: aZoftOrPlainVal ].

	newz := self privateNew.
	newz becomeLike: aZoftOrPlainVal.
	newz privatelySetVal: aZoftOrPlainVal val.
	^ newz
]

{ #category : #private }
Zoft class >> privateNew [
	| novo |

	novo := super new.
	default_lung ifNotNil:
		[ default_lung appendBreathee: novo ].
	^ novo
]

{ #category : #respiration }
Zoft class >> setDefaultLung: pulmo [

	default_lung := pulmo
]

{ #category : #promoting }
Zoft class >> zoftenIfNotOne: maybeZoft [

	^ (maybeZoft isKindOf: self)
			ifTrue: [ maybeZoft ]
			ifFalse: [ self newWith: maybeZoft ]
]

{ #category : #behavior }
Zoft >> becomeLike: othazoft [

	othazoft == self ifTrue: [ ^ self ].
	othazoft guts == guts ifTrue: [ ^ self ].
	othazoft guts appendHost: self.
	guts ifNotNil:
		[ guts removeHost: self ].
	guts := othazoft guts.
	^ self
]

{ #category : #'reflective operations' }
Zoft >> doesNotUnderstand: mess [

	guts ifNotNil: [ (guts respondsTo: mess selector)
								ifTrue: [ ^ mess sendTo: guts ] ].
	^ super doesNotUnderstand: mess
]

{ #category : #accessing }
Zoft >> guts [

	^ guts
]

{ #category : #respiration }
Zoft >> inhale: ratch atTime: thyme [

	(guts isFreshFor: ratch) ifFalse: [
		guts inhale: ratch atTime: thyme.
	].
	self setRatchet: ratch.
	^ 0
]

{ #category : #private }
Zoft >> privatelySetGuts: g [

	(guts := g)
		ifNotNil: [ g appendHost: self ].
	^ self
]

{ #category : #private }
Zoft >> privatelySetVal: v [

	val := v.
	^ self
]

{ #category : #accessing }
Zoft >> val [

	^ val
]

{ #category : #accessing }
Zoft >> value [

	^ val
]

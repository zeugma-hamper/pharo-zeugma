Class {
	#name : #ZoftThing,
	#superclass : #Zeubject,
	#instVars : [
		'val',
		'guts'
	],
	#category : #'Zeugma-Zofts'
}

{ #category : #behavior }
ZoftThing >> becomeLike: othazoft [

	othazoft == self ifTrue: [ ^ self ].
	othazoft guts appendHost: self.
	self guts removeHost: self.
	guts := othazoft guts.
]

{ #category : #'reflective operations' }
ZoftThing >> doesNotUnderstand: mess [

	guts ifNotNil: [ (guts respondsTo: mess selector)
								ifTrue: [ ^ mess sendTo: guts ] ].
	^ super doesNotUnderstand: mess
]

{ #category : #accessing }
ZoftThing >> guts [

	^ guts
]

{ #category : #respiration }
ZoftThing >> inhale: ratch atTime: thyme [

	(guts isFreshFor: ratch) ifFalse: [
		guts inhale: ratch atTime: thyme.
	].
	self setRatchet: ratch.
	^ 0
]

{ #category : #private }
ZoftThing >> privatelySetGuts: g [

	(guts := g) ifNotNil: [ g appendHost: self ].
	^ self
]

{ #category : #accessing }
ZoftThing >> setVal: v [

	val := v.
]

{ #category : #accessing }
ZoftThing >> val [

	^ val
]

Class {
	#name : #ZoftThing,
	#superclass : #Zeubject,
	#instVars : [
		'val',
		'guts'
	],
	#category : #'Zeugma-Zofts'
}

{ #category : #creating }
ZoftThing class >> new [

	self shouldNotImplement
]

{ #category : #creating }
ZoftThing class >> newWith: aZoftOrPlainVal [
	| newz |

	(aZoftOrPlainVal isKindOf: ZoftThing)
		ifFalse: [ ^ LatchZoft newWith: aZoftOrPlainVal ].

	newz := self privateNew.
	newz becomeLike: aZoftOrPlainVal.
	newz privatelySetVal: aZoftOrPlainVal val.
	^ newz
]

{ #category : #private }
ZoftThing class >> privateNew [

	^ super new
]

{ #category : #behavior }
ZoftThing >> becomeLike: othazoft [

	othazoft == self ifTrue: [ ^ self ].
	othazoft guts == guts ifTrue: [ ^ self ].
	othazoft guts appendHost: self.
	guts ifNotNil:
		[ guts removeHost: self ].
	guts := othazoft guts.
	^ self
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

	(guts := g)
		ifNotNil: [ g appendHost: self ].
	^ self
]

{ #category : #private }
ZoftThing >> privatelySetVal: v [

	val := v.
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

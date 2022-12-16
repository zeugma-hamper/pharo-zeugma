Class {
	#name : #LatchZoftGuts,
	#superclass : #ZoftGuts,
	#instVars : [
		'latchval'
	],
	#category : #'Zeugma-Zofts-Guts'
}

{ #category : #respiration }
LatchZoftGuts >> inhale: ratch atTime: thyme [

	(self isFreshFor: ratch) ifTrue: [ ^ 0 ].

	self puppeteerHosts: latchval.
	rat_fresh := ratch.
	^ 0
]

{ #category : #accessing }
LatchZoftGuts >> latchVal [

	^ latchval
]

{ #category : #private }
LatchZoftGuts >> privatelySetLatchVal: v [

	latchval := v.
]

{ #category : #setting }
LatchZoftGuts >> set: v [

	self privatelySetLatchVal: v.
]

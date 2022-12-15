Class {
	#name : #ZoftLatchGuts,
	#superclass : #ZoftGuts,
	#instVars : [
		'latchval'
	],
	#category : #'Zeugma-Zofts'
}

{ #category : #respiration }
ZoftLatchGuts >> inhale: ratch atTime: thyme [

	(self isFreshFor: ratch) ifTrue: [ ^ 0 ].

	self puppeteerHosts: latchval.
	rat_fresh := ratch.
	^ 0
]

{ #category : #accessing }
ZoftLatchGuts >> latchVal [

	^ latchval
]

{ #category : #private }
ZoftLatchGuts >> privatelySetLatchVal: v [

	latchval := v.
]

{ #category : #setting }
ZoftLatchGuts >> set: v [

	self privatelySetLatchVal: v.
]

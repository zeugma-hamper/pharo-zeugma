Class {
	#name : #ZoftSumGuts,
	#superclass : #ZoftGuts,
	#instVars : [
		'zoft_a',
		'zoft_b'
	],
	#category : #'Zeugma-Zofts'
}

{ #category : #respiration }
ZoftSumGuts >> inhale: ratch atTime: thyme [
	| aval bval v |

	(self isFreshFor: ratch) ifTrue: [ ^ 0 ].

	zoft_a ifNotNil: [
		(zoft_a isFreshFor: ratch)
			ifFalse: [ zoft_a inhale: ratch atTime: thyme ].
		aval := zoft_a val.
	].

	zoft_b ifNotNil: [
		(zoft_b isFreshFor: ratch)
			ifFalse: [ zoft_b inhale: ratch atTime: thyme ].
		bval := zoft_b val.
	].

	v := (aval isNotNil  &  bval isNotNil)
				ifTrue: [ aval + bval ]
				ifFalse: [ aval ifNotNil: [ aval ]
									ifNil: [ bval ifNotNil: [ bval ]
														ifNil: [ nil ] ]
							].
	self puppeteerHosts: v.
	self setRatchet: ratch.
	^ 0
]

{ #category : #private }
ZoftSumGuts >> privatelySetSummandAZoft: az [

	zoft_a := az.
	^ self
]

{ #category : #private }
ZoftSumGuts >> privatelySetSummandBZoft: bz [

	zoft_b := bz.
	^ self
]

{ #category : #accessing }
ZoftSumGuts >> summandAZoft [

	^ zoft_a
]

{ #category : #accessing }
ZoftSumGuts >> summandBZoft [

	^ zoft_b
]

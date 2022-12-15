Class {
	#name : #ZoftDiffGuts,
	#superclass : #ZoftGuts,
	#instVars : [
		'zoft_a',
		'zoft_b'
	],
	#category : #'Zeugma-Zofts'
}

{ #category : #accessing }
ZoftDiffGuts >> aZoft [

	^ self minuendZoft
]

{ #category : #accessing }
ZoftDiffGuts >> bZoft [

	^ self subtrahendZoft
]

{ #category : #respiration }
ZoftDiffGuts >> inhale: ratch atTime: thyme [
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
				ifTrue: [ aval - bval ]
				ifFalse: [ aval ifNotNil: [ aval ]
									ifNil: [ bval ifNotNil: [ bval negated ]
														ifNil: [ nil ] ]
							].
	self puppeteerHosts: v.
	self setRatchet: ratch.
	^ 0
]

{ #category : #accessing }
ZoftDiffGuts >> minuendZoft [

	^ zoft_a
]

{ #category : #private }
ZoftDiffGuts >> privatelySetMinuendZoft: az [

	zoft_a := az.
	^ self
]

{ #category : #private }
ZoftDiffGuts >> privatelySetSubtrahendZoft: bz [

	zoft_b := bz.
	^ self
]

{ #category : #accessing }
ZoftDiffGuts >> subtrahendZoft [

	^ zoft_b
]

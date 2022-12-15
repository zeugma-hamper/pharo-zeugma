Class {
	#name : #ZoftProdGuts,
	#superclass : #ZoftGuts,
	#instVars : [
		'zoft_a',
		'zoft_b'
	],
	#category : #'Zeugma-Zofts'
}

{ #category : #accessing }
ZoftProdGuts >> aZoft [

	^ self multiplicandZoft
]

{ #category : #accessing }
ZoftProdGuts >> bZoft [

	^ self multiplierZoft
]

{ #category : #respiration }
ZoftProdGuts >> inhale: ratch atTime: thyme [
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
				ifTrue: [ aval * bval ]
				ifFalse: [ 0].
	self puppeteerHosts: v.
	self setRatchet: ratch.
	^ 0
]

{ #category : #accessing }
ZoftProdGuts >> multiplicandZoft [

	^ zoft_a
]

{ #category : #accessing }
ZoftProdGuts >> multiplierZoft [

	^ zoft_b
]

{ #category : #private }
ZoftProdGuts >> privatelySetMultiplicandZoft: az [

	zoft_a := az.
	^ self
]

{ #category : #private }
ZoftProdGuts >> privatelySetMultiplierZoft: bz [

	zoft_b := bz.
	^ self
]

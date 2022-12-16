Class {
	#name : #ProdZoftGuts,
	#superclass : #ZoftGuts,
	#instVars : [
		'zoft_a',
		'zoft_b'
	],
	#category : #'Zeugma-Zofts-Guts'
}

{ #category : #accessing }
ProdZoftGuts >> aZoft [

	^ self multiplicandZoft
]

{ #category : #accessing }
ProdZoftGuts >> bZoft [

	^ self multiplierZoft
]

{ #category : #respiration }
ProdZoftGuts >> inhale: ratch atTime: thyme [
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
ProdZoftGuts >> multiplicandZoft [

	^ zoft_a
]

{ #category : #accessing }
ProdZoftGuts >> multiplierZoft [

	^ zoft_b
]

{ #category : #private }
ProdZoftGuts >> privatelySetMultiplicandZoft: az [

	zoft_a := az.
	^ self
]

{ #category : #private }
ProdZoftGuts >> privatelySetMultiplierZoft: bz [

	zoft_b := bz.
	^ self
]

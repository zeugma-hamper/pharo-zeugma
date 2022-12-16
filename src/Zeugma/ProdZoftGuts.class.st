Class {
	#name : #ProdZoftGuts,
	#superclass : #ArithZoftGuts,
	#category : #'Zeugma-Zofts-Guts'
}

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

{ #category : #private }
ProdZoftGuts >> installMultiplicandZoft: az [

	self installAZoft: az.
	^ self
]

{ #category : #private }
ProdZoftGuts >> installMultiplierZoft: bz [

	self installBZoft: bz.
	^ self
]

{ #category : #accessing }
ProdZoftGuts >> multiplicandZoft [

	^ self aZoft
]

{ #category : #accessing }
ProdZoftGuts >> multiplierZoft [

	^ self bZoft
]

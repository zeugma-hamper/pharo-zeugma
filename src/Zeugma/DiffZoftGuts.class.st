Class {
	#name : #DiffZoftGuts,
	#superclass : #ArithZoftGuts,
	#category : #'Zeugma-Zofts-Guts'
}

{ #category : #respiration }
DiffZoftGuts >> inhale: ratch atTime: thyme [
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

{ #category : #private }
DiffZoftGuts >> installMinuendZoft: az [

	self installAZoft: az.
	^ self
]

{ #category : #private }
DiffZoftGuts >> installSubtrahendZoft: bz [

	self installBZoft: bz.
	^ self
]

{ #category : #accessing }
DiffZoftGuts >> minuendZoft [

	^ self aZoft
]

{ #category : #accessing }
DiffZoftGuts >> subtrahendZoft [

	^ self bZoft
]

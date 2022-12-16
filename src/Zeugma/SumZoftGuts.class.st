Class {
	#name : #SumZoftGuts,
	#superclass : #ArithZoftGuts,
	#category : #'Zeugma-Zofts-Guts'
}

{ #category : #respiration }
SumZoftGuts >> inhale: ratch atTime: thyme [
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
SumZoftGuts >> installSummandAZoft: az [

	self installAZoft: az.
	^ self
]

{ #category : #private }
SumZoftGuts >> installSummandBZoft: bz [

	self installBZoft: bz.
	^ self
]

{ #category : #accessing }
SumZoftGuts >> summandAZoft [

	^ self aZoft
]

{ #category : #accessing }
SumZoftGuts >> summandBZoft [

	^ self bZoft
]

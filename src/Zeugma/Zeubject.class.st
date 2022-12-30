Class {
	#name : #Zeubject,
	#superclass : #Object,
	#instVars : [
		'sac',
		'rat_fresh'
	],
	#category : #'Zeugma-Foundation'
}

{ #category : #sac }
Zeubject >> assureddSac [

	sac ifNil: [ sac := Dictionary new ].
	^ sac
]

{ #category : #respiration }
Zeubject >> breather [

	^ self saccess: #irlu
]

{ #category : #respiration }
Zeubject >> inhale: ratch atTime: thyme [

	rat_fresh := ratch.
	^ 0
]

{ #category : #initialization }
Zeubject >> initialize [

	super initialize.
	rat_fresh := -1.
]

{ #category : #respiration }
Zeubject >> isFreshFor: ratch [

	^ rat_fresh = ratch
]

{ #category : #sac }
Zeubject >> name [

	^ self saccess: #name
]

{ #category : #respiration }
Zeubject >> ratchet [

	^ rat_fresh.
]

{ #category : #sac }
Zeubject >> sacHas: key [

	^ sac ifNotNil: [sac includesKey: key] ifNil:  [ false ]
]

{ #category : #sac }
Zeubject >> saccess: key [

	^ sac ifNotNil: [sac at: key ifAbsent: nil] ifNil:  [ nil ]
]

{ #category : #sac }
Zeubject >> saccess: key put: val [

	self assureddSac at: key put: val
]

{ #category : #respiration }
Zeubject >> setBreather: br [

	self saccess: #irlu put: br.
	^ self
]

{ #category : #sac }
Zeubject >> setName: nm [

	self saccess: #name put: nm.
	^ self
]

{ #category : #respiration }
Zeubject >> setRatchet: rat [

	rat_fresh := rat.
	^ self
]

{ #category : #toiling }
Zeubject >> travail: ratch atTime: thyme [
	| oneOrMany |

	(self sacHas: #anonymousToiler) ifFalse: [ ^ self ].

	oneOrMany := self saccess: #anonymousToiler.
	(oneOrMany isKindOf: BlockClosure)
		ifTrue: [ ^ oneOrMany value: ratch value: thyme ].

	(oneOrMany isKindOf: Collection) ifFalse: [ ^ self ].
	^ oneOrMany do: [ :ler | ler value: ratch value: thyme ]
]

{ #category : #sac }
Zeubject >> unsecuredSac [

	^ sac
]

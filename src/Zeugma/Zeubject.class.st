Class {
	#name : #Zeubject,
	#superclass : #Object,
	#instVars : [
		'sac',
		'ratFresh'
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
Zeubject >> inhale: ratch attime: thyme [

	^ 0
]

{ #category : #sac }
Zeubject >> name [

	^ self saccess: #name
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

	self saccess: #irlu put: br
]

{ #category : #sac }
Zeubject >> setName: nm [

	self saccess: #name put: nm
]

{ #category : #respiration }
Zeubject >> travail: ratch atTime: thyme [
	| toi |

	(self sacHas: #anonymousToiler) ifFalse: [ ^ self ].

	toi := self saccess: #anonymousToiler.
	(toi isKindOf: BlockClosure)
		ifTrue: [ ^ toi value: ratch value: thyme ].

	(toi isKindOf: Collection) ifFalse: [ ^ self ].
	^ toi do: [ :ler | ler value: ratch value: thyme ]
]

{ #category : #sac }
Zeubject >> unsecuredSac [

	^ sac
]

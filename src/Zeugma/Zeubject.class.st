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
Zeubject >> saccess: key [

	^ sac ifNotNil: [sac at: key ifAbsent: nil] ifNil:  [ nil ]
]

{ #category : #sac }
Zeubject >> saccess: key set: val [

	self assureddSac at: key put: val
]

{ #category : #respiration }
Zeubject >> setBreather: br [

	self saccess: #irlu set: br
]

{ #category : #sac }
Zeubject >> setName: nm [

	self saccess: #name set: nm
]

{ #category : #sac }
Zeubject >> travail: ratch atTime: thyme [

	^ self
]

{ #category : #sac }
Zeubject >> unsecuredSac [

	^ sac
]

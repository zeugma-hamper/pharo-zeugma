Class {
	#name : #ZeWholeShebang,
	#superclass : #Zeubject,
	#instVars : [
		'looper',
		'maeses'
	],
	#category : #'Zeugma-TemporalStructure'
}

{ #category : #initialization }
ZeWholeShebang >> initialize [

	super initialize.
	looper := Loopervisor new.
	
]

{ #category : #accessing }
ZeWholeShebang >> loopervisor [

	^ looper
]

{ #category : #accessing }
ZeWholeShebang >> maeses [

	^ maeses copy
]

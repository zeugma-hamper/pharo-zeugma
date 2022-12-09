Class {
	#name : #CommsSump,
	#superclass : #Zeubject,
	#instVars : [
		'slctr_by_address',
		'ducts_by_address',
		'rawex_by_address'
	],
	#category : #'Zeugma-Events'
}

{ #category : #'processing-and-dispatch' }
CommsSump >> dispatch: pyld viaAddr: addr [
	| sel aqs |

	sel := slctr_by_address at: addr ifAbsent: [ ^ self ].
	aqs := ducts_by_address at: addr ifAbsent: [ ^ self ].
	aqs do: [ :aq |
		aq perform: sel withArguments: pyld
	].
]

{ #category : #accessing }
CommsSump >> forAddress: addr setRawExtractor: rwex [

	rawex_by_address at: addr put: rwex.
]

{ #category : #accessing }
CommsSump >> forAddress: addr setSelector: sel [

	slctr_by_address at: addr put: sel.
]

{ #category : #initialization }
CommsSump >> initialize [

	super initialize.
	ducts_by_address := Dictionary new.
	slctr_by_address := Dictionary new.
	rawex_by_address := Dictionary new.
]

{ #category : #'processing-and-dispatch' }
CommsSump >> processSump [

	self subclassResponsibility
]

{ #category : #'processing-and-dispatch' }
CommsSump >> rawExtractionViaAddr: addr payload: pyld [

	(rawex_by_address includesKey: addr)
		ifTrue: [ ^ (rawex_by_address at: addr) value: pyld ].

	^ pyld
]

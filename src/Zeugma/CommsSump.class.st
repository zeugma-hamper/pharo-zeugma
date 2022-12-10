Class {
	#name : #CommsSump,
	#superclass : #Zeubject,
	#instVars : [
		'rawex_by_address',
		'synth_by_address',
		'ducts_by_address'
	],
	#category : #'Zeugma-EventImport'
}

{ #category : #'processing-and-dispatch' }
CommsSump >> dispatch: evt viaAddr: addr [
	| aqs |

	aqs := ducts_by_address at: addr ifAbsent: [ ^ self ].
	aqs do: [ :aq |
		aq appendEvent: evt.
	].
]

{ #category : #accessing }
CommsSump >> forAddress: addr appendAqueduct: aq [
	| coll |

	coll := ducts_by_address at: addr ifAbsentPut: [ OrderedCollection new ].
	(coll includes: aq)
		ifFalse: [ coll add: aq ].
]

{ #category : #accessing }
CommsSump >> forAddress: addr setRawExtractor: rwex [

	rawex_by_address at: addr put: rwex.
]

{ #category : #accessing }
CommsSump >> forAddress: addr setSynthObject: obj andSelector: sel [

	synth_by_address at: addr put: { obj . sel }.
]

{ #category : #initialization }
CommsSump >> initialize [

	super initialize.
	rawex_by_address := Dictionary new.
	synth_by_address := Dictionary new.
	ducts_by_address := Dictionary new.
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

{ #category : #'processing-and-dispatch' }
CommsSump >> synthesizeEventViaAddr: addr fromArgs: args [
	| synther |

	synther := synth_by_address at: addr ifAbsent: [ ^ nil ].
	^ synther first perform: synther second withArguments: args
]

Class {
	#name : #OSCCommsSump,
	#superclass : #CommsSump,
	#instVars : [
		'oscerizer',
		'port'
	],
	#category : #'Zeugma-Events'
}

{ #category : #'instance creation' }
OSCCommsSump class >> newOnPort: p [

	^ self new setPort: p
]

{ #category : #running }
OSCCommsSump >> attendToIncoming [

	oscerizer ifNotNil:
		[ Transcript show: 'OSCCommsSump>>attendToIncoming -- already running'. ^ self].
	(port isInteger) ifFalse:
		[ ^ self error: '#attendToIncoming -- set the port first, won''t you?' ].
	oscerizer := OSCServer listenOnPort: port.
]

{ #category : #initialization }
OSCCommsSump >> initialize [

	super initialize.

]

{ #category : #'processing-and-dispatch' }
OSCCommsSump >> processSump [
	| cnt |

	oscerizer ifNil: [ ^ self ].

	cnt := 	oscerizer messageCount.
	[ (cnt > 0) and: [ oscerizer hasMessage ] ]
		whileTrue: [ | mess addr |
			mess := oscerizer nextMessage.
			addr := mess first.
			mess := self rawExtractionViaAddr: addr payload: mess allButFirst.
			self dispatch: mess viaAddr: addr.
			cnt := cnt - 1.
		]
]

{ #category : #initialization }
OSCCommsSump >> setPort: p [

	port := p.
]

{ #category : #running }
OSCCommsSump >> suspendAttention [

	oscerizer ifNotNil: [ oscerizer terminate ].
]

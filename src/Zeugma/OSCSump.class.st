Class {
	#name : #OSCSump,
	#superclass : #CommsSump,
	#instVars : [
		'oscerizer',
		'port'
	],
	#category : #'Zeugma-EventImport'
}

{ #category : #'instance creation' }
OSCSump class >> newOnPort: p [

	^ self new setPort: p
]

{ #category : #running }
OSCSump >> attendToIncoming [

	oscerizer ifNotNil:
		[ Transcript show: 'OSCCommsSump>>attendToIncoming -- already running'. ^ self].
	(port isInteger) ifFalse:
		[ ^ self error: '#attendToIncoming -- set the port first, won''t you?' ].
	oscerizer := OSCServer listenOnPort: port.
]

{ #category : #initialization }
OSCSump >> initialize [

	super initialize.

]

{ #category : #'processing-and-dispatch' }
OSCSump >> processSump [
	| cnt |

	oscerizer ifNil: [ ^ self ].

	cnt := 	oscerizer messageCount.
	[ (cnt > 0) and: [ oscerizer hasMessage ] ]
		whileTrue: [ | mess addr args vent |
			mess := oscerizer nextMessage.
			addr := mess first.
			args := self rawExtractionViaAddr: addr payload: mess allButFirst.
			vent := self synthesizeEventViaAddr: addr fromArgs: args.
			self dispatch: vent viaAddr: addr.
			cnt := cnt - 1.
		]
]

{ #category : #initialization }
OSCSump >> setPort: p [

	port := p.
]

{ #category : #running }
OSCSump >> suspendAttention [

	oscerizer ifNotNil: [ oscerizer terminate ].
]

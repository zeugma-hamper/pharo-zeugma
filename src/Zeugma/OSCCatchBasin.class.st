Class {
	#name : #OSCCatchBasin,
	#superclass : #CatchBasin,
	#instVars : [
		'oscerizer',
		'port'
	],
	#category : #'Zeugma-Events'
}

{ #category : #'processing-and-dispatch' }
OSCCatchBasin >> processSump [
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

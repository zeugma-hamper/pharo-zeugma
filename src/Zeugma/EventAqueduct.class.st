Class {
	#name : #EventAqueduct,
	#superclass : #Zeubject,
	#instVars : [
		'phages',
		'drams'
	],
	#category : #'Zeugma-EventTransport'
}

{ #category : #accessing }
EventAqueduct >> appendEvent: evt [

	drams nextPut: evt.
]

{ #category : #accessing }
EventAqueduct >> appendPhage: phg [

	phages nextPut: phg.
]

{ #category : #'event-distribution' }
EventAqueduct >> drainReservoir [
	| cnt evt sel |

	cnt := drams size.
	[ cnt > 0  and:  [ drams isEmpty not ] ]
		whileTrue: [
			evt := drams next.
			sel := evt deliverySelector.
			phages do: [ :phg | phg perform: sel with: evt ].
			cnt := cnt -1.
		]
]

{ #category : #initialization }
EventAqueduct >> initialize [

	super initialize.
	drams := SharedQueue new.
	phages := OrderedCollection new.
]

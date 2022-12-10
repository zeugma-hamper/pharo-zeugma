Class {
	#name : #ZeEvent,
	#superclass : #Zeubject,
	#instVars : [
		'prov',
		'tstamp',
		'tratch',
		'foreEvt'
	],
	#classVars : [
		'deliv_selector'
	],
	#category : #'Zeugma-Events'
}

{ #category : #'event-routing' }
ZeEvent class >> classSideDeliverySelector [

	^ #ze:
]

{ #category : #'event-routing' }
ZeEvent >> deliverySelector [

	self class classSideDeliverySelector
]

{ #category : #accessing }
ZeEvent >> forebearEvent [

	^ foreEvt
]

{ #category : #accessing }
ZeEvent >> provenance [

	^ prov
]

{ #category : #accessing }
ZeEvent >> timeRatchet [

	^ tratch
]

{ #category : #accessing }
ZeEvent >> timestamp [

	^ tstamp
]

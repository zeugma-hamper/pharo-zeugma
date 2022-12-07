Class {
	#name : #ZeEvent,
	#superclass : #Object,
	#instVars : [
		'prov',
		'tstamp',
		'tratch',
		'foreEvt'
	],
	#category : #'Zeugma-Events'
}

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

Class {
	#name : #ZEYowlEvent,
	#superclass : #ZeEvent,
	#instVars : [
		'utt',
		'rept_ord',
		'modfrs',
		'prox_ent'
	],
	#category : #'Zeugma-Events'
}

{ #category : #'event-routing' }
ZEYowlEvent class >> classSideDeliverySelector [

	^ #zeYowl:
]

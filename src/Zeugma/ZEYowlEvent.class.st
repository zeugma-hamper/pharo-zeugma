Class {
	#name : #ZEYowlEvent,
	#superclass : #ZeEvent,
	#instVars : [
		'utt',
		'reptOrd',
		'modfrs',
		'proxEnt'
	],
	#category : #'Zeugma-Events'
}

{ #category : #'event-routing' }
ZEYowlEvent class >> classSideDeliverySelector [

	^ #zeYowl:
]

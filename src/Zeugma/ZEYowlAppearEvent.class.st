Class {
	#name : #ZEYowlAppearEvent,
	#superclass : #ZEYowlEvent,
	#category : #'Zeugma-Events'
}

{ #category : #'event-routing' }
ZEYowlAppearEvent class >> classSideDeliverySelector [

	^ #zeYowlAppear:
]

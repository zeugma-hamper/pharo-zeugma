Class {
	#name : #ZEYowlRepeatEvent,
	#superclass : #ZEYowlEvent,
	#category : #'Zeugma-Events'
}

{ #category : #'event-routing' }
ZEYowlRepeatEvent class >> classSideDeliverySelector [

	^ #zeYowlRepeat:
]

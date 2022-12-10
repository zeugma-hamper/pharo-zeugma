Class {
	#name : #ZESpatialPressureEvent,
	#superclass : #ZESpatialEvent,
	#instVars : [
		'whichPressor',
		'pressureValue'
	],
	#category : #'Zeugma-Events'
}

{ #category : #'event-routing' }
ZESpatialPressureEvent class >> classSideDeliverySelector [

	^ #zeSpatialPressure:
]

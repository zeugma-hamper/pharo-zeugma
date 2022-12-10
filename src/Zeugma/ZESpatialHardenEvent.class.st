Class {
	#name : #ZESpatialHardenEvent,
	#superclass : #ZESpatialPressureEvent,
	#category : #'Zeugma-Events'
}

{ #category : #'event-routing' }
ZESpatialHardenEvent class >> classSideDeliverySelector [

	^ #zeSpatialHarden:
]

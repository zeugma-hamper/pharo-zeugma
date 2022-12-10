Class {
	#name : #ZESpatialSoftenEvent,
	#superclass : #ZESpatialPressureEvent,
	#category : #'Zeugma-Events'
}

{ #category : #'event-routing' }
ZESpatialSoftenEvent class >> classSideDeliverySelector [

	^ #zeSpatialSoften:
]

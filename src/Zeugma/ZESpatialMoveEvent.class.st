Class {
	#name : #ZESpatialMoveEvent,
	#superclass : #ZESpatialEvent,
	#category : #'Zeugma-Events'
}

{ #category : #'event-routing' }
ZESpatialMoveEvent class >> classSideDeliverySelector [

	^ #zeSpatialMove:
]

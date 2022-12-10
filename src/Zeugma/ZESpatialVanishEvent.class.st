Class {
	#name : #ZESpatialVanishEvent,
	#superclass : #ZESpatialEvent,
	#category : #'Zeugma-Events'
}

{ #category : #'event-routing' }
ZESpatialVanishEvent class >> classSideDeliverySelector [

	^ #zeSpatialVanish:
]

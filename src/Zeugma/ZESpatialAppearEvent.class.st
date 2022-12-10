Class {
	#name : #ZESpatialAppearEvent,
	#superclass : #ZESpatialEvent,
	#category : #'Zeugma-Events'
}

{ #category : #'event-routing' }
ZESpatialAppearEvent class >> classSideDeliverySelector [

	^ #zeSpatialAppear:
]

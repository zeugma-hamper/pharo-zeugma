Class {
	#name : #ZESpatialCaressEvent,
	#superclass : #ZESpatialEvent,
	#instVars : [
		'which_caressor',
		'caress_value'
	],
	#category : #'Zeugma-Events'
}

{ #category : #'event-routing' }
ZESpatialCaressEvent class >> classSideDeliverySelector [

	^ #zeSpatialCaress:
]

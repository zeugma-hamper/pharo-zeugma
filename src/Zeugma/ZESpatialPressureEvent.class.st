Class {
	#name : #ZESpatialPressureEvent,
	#superclass : #ZESpatialEvent,
	#instVars : [
		'whichPressor',
		'pressureValue'
	],
	#category : #'Zeugma-Events'
}

{ #category : #initialization }
ZESpatialPressureEvent class >> initialize [

	deliv_selector := #zeSpatialPressure:.
]

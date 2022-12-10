Class {
	#name : #ZESpatialCaressEvent,
	#superclass : #ZESpatialEvent,
	#instVars : [
		'which_caressor',
		'caress_value'
	],
	#category : #'Zeugma-Events'
}

{ #category : #initialization }
ZESpatialCaressEvent class >> initialize [

	deliv_selector := #zeSpatialCaress:.
]

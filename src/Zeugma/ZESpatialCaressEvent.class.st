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

{ #category : #'bulk-setting' }
ZESpatialCaressEvent >> adoptParticularsFrom: otha [

	self adoptSpatialCaressEventParticularsFrom: otha.
	^ self
]

{ #category : #'bulk-setting' }
ZESpatialCaressEvent >> adoptSpatialCaressEventParticularsFrom: otha [

	self adoptSpatialEventParticularsFrom: otha.
	self setWhichCaressor: otha whichCaressor.
	self setCaressValue: otha caressValue.
	^ self.
]

{ #category : #accessing }
ZESpatialCaressEvent >> caressValue [

	^ caress_value
]

{ #category : #accessing }
ZESpatialCaressEvent >> setCaressValue: aVect [

	caress_value := aVect.
]

{ #category : #'bulk-setting' }
ZESpatialCaressEvent >> setCaressor: anInt value: aVect [

	self setWhichCaressor: anInt.
	self setCaressValue: aVect.
	^ self
]

{ #category : #accessing }
ZESpatialCaressEvent >> setWhichCaressor: anInt [

	which_caressor := anInt.
]

{ #category : #accessing }
ZESpatialCaressEvent >> whichCaressor [

	^ which_caressor
]

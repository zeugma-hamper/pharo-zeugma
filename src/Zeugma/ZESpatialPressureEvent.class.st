Class {
	#name : #ZESpatialPressureEvent,
	#superclass : #ZESpatialEvent,
	#instVars : [
		'which_pressor',
		'pressure_value'
	],
	#category : #'Zeugma-Events'
}

{ #category : #'event-routing' }
ZESpatialPressureEvent class >> classSideDeliverySelector [

	^ #zeSpatialPressure:
]

{ #category : #'bulk-setting' }
ZESpatialPressureEvent >> adoptParticularsFrom: otha [

	self adoptSpatialPressureEventParticularsFrom: otha.
	^ self
]

{ #category : #'bulk-setting' }
ZESpatialPressureEvent >> adoptSpatialPressureEventParticularsFrom: otha [

	self adoptSpatialEventParticularsFrom: otha.
	self setWhichPressor: otha whichPressor.
	self setPressureValue: otha pressureValue.
	^ self
]

{ #category : #accessing }
ZESpatialPressureEvent >> pressureValue [

	^ pressure_value
]

{ #category : #'bulk-setting' }
ZESpatialPressureEvent >> setPressor: p value: v [

	self setWhichPressor: p.
	self setPressureValue: v.
	^ self
]

{ #category : #accessing }
ZESpatialPressureEvent >> setPressureValue: pv [

	pressure_value := pv.
]

{ #category : #accessing }
ZESpatialPressureEvent >> setWhichPressor: pr [

	which_pressor := pr.
]

{ #category : #accessing }
ZESpatialPressureEvent >> whichPressor [

	^ which_pressor
]

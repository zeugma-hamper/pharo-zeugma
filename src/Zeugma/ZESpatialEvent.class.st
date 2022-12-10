Class {
	#name : #ZESpatialEvent,
	#superclass : #ZeEvent,
	#instVars : [
		'loc',
		'aim',
		'ovr',
		'pressures',
		'caresses',
		'reinterps'
	],
	#category : #'Zeugma-Events'
}

{ #category : #initialization }
ZESpatialEvent class >> initialize [

	deliv_selector := #zeSpatial:.
]

{ #category : #accessing }
ZESpatialEvent >> aim [
	
	^ aim
]

{ #category : #accessing }
ZESpatialEvent >> loc [
	
	^ loc
]

{ #category : #accessing }
ZESpatialEvent >> over [
	
	^ ovr
]

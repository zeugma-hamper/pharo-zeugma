Class {
	#name : #DiffZoft,
	#superclass : #ArithZoft,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
DiffZoft class >> newWithA: aZoft andB: bZoft [

	^ self superclass newWithA: aZoft andB: bZoft andGutsClass: DiffZoftGuts
]

{ #category : #'instance creation' }
DiffZoft class >> newWithMinuendA: aZoft andSubtrahendB: bZoft [

	^ self newWithA: aZoft andB: bZoft
]

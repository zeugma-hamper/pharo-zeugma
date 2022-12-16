Class {
	#name : #SumZoft,
	#superclass : #ArithZoft,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
SumZoft class >> newWithA: aZoft andB: bZoft [

	^ self superclass newWithA: aZoft andB: bZoft andGutsClass: SumZoftGuts
]

{ #category : #'instance creation' }
SumZoft class >> newWithSummandA: aZoft andSummandB: bZoft [

	^ self newWithA: aZoft andB: bZoft
]

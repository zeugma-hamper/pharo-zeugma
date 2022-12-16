Class {
	#name : #ProdZoft,
	#superclass : #ArithZoft,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
ProdZoft class >> newWithA: aZoft andB: bZoft [

	^ self superclass newWithA: aZoft andB: bZoft andGutsClass: ProdZoftGuts
]

{ #category : #'instance creation' }
ProdZoft class >> newWithMultiplicandA: aZoft andMultiplierB: bZoft [

	^ self newWithA: aZoft andB: bZoft
]

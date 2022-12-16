Class {
	#name : #ArithZoftGuts,
	#superclass : #ZoftGuts,
	#instVars : [
		'zoft_a',
		'zoft_b'
	],
	#category : #'Zeugma-Zofts-Guts'
}

{ #category : #accessing }
ArithZoftGuts >> aZoft [

	^ zoft_a
]

{ #category : #accessing }
ArithZoftGuts >> bZoft [

	^ zoft_b
]

{ #category : #assembling }
ArithZoftGuts >> installAZoft: az [

	zoft_a := az.
	^ self
]

{ #category : #assembling }
ArithZoftGuts >> installBZoft: bz [

	zoft_b := bz.
	^ self
]

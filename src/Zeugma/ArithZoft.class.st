Class {
	#name : #ArithZoft,
	#superclass : #ZoftGenerator,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
ArithZoft class >> newWithA: aZoft andB: bZoft andGutsClass: gclass [
	| z g |

	z := Zoft privateNew.
	g := gclass new
			installAZoft: (Zoft zoftenIfNotOne: aZoft);
			installBZoft: (Zoft zoftenIfNotOne: bZoft).
	z privatelySetGuts: g.
	^ z
]

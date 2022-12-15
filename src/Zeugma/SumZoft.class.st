Class {
	#name : #SumZoft,
	#superclass : #ZoftGenerator,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
SumZoft class >> newWithA: azft andB: bzft [
	| z g |

	z := ZoftThing privateNew.
	g := ZoftSumGuts new
			privatelySetSummandAZoft: azft;
			privatelySetSummandBZoft: bzft.
	z privatelySetGuts: g.
	^ z
]

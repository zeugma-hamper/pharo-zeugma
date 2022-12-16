Class {
	#name : #SumZoft,
	#superclass : #ZoftGenerator,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
SumZoft class >> newWithA: aZoft andB: bZoft [
	| z g |

	z := ZoftThing privateNew.
	g := SumZoftGuts new
			privatelySetSummandAZoft: aZoft;
			privatelySetSummandBZoft: bZoft.
	z privatelySetGuts: g.
	^ z
]

{ #category : #'instance creation' }
SumZoft class >> newWithSummandA: aZoft andSummandB: bZoft [
	| z g |

	z := ZoftThing privateNew.
	g := SumZoftGuts new
			privatelySetSummandAZoft: aZoft;
			privatelySetSummandBZoft: bZoft.
	z privatelySetGuts: g.
	^ z
]

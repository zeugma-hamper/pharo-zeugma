Class {
	#name : #DiffZoft,
	#superclass : #ZoftGenerator,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
DiffZoft class >> newWithA: aZoft andB: bZoft [
	| z g |

	z := ZoftThing privateNew.
	g := DiffZoftGuts new
			privatelySetMinuendZoft: aZoft;
			privatelySetSubtrahendZoft: bZoft.
	z privatelySetGuts: g.
	^ z
]

{ #category : #'instance creation' }
DiffZoft class >> newWithMinuendA: aZoft andSubtrahendB: bZoft [
	| z g |

	z := ZoftThing privateNew.
	g := DiffZoftGuts new
			privatelySetMinuendZoft: aZoft;
			privatelySetSubtrahendZoft: bZoft.
	z privatelySetGuts: g.
	^ z
]

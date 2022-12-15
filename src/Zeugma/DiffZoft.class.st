Class {
	#name : #DiffZoft,
	#superclass : #ZoftGenerator,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
DiffZoft class >> newWithA: azft andB: bzft [
	| z g |

	z := ZoftThing privateNew.
	g := ZoftDiffGuts new
			privatelySetMinuendZoft: azft;
			privatelySetSubtrahendZoft: bzft.
	z privatelySetGuts: g.
	^ z
]

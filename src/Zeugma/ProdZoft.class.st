Class {
	#name : #ProdZoft,
	#superclass : #ZoftGenerator,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
ProdZoft class >> newWithA: aZoft andB: bZoft [
	| z g |

	z := ZoftThing privateNew.
	g := ZoftProdGuts new
			privatelySetMultiplicandZoft: aZoft;
			privatelySetMultiplierZoft: bZoft.
	z privatelySetGuts: g.
	^ z
]

{ #category : #'instance creation' }
ProdZoft class >> newWithMultiplicandA: aZoft andMultiplierB: bZoft [
	| z g |

	z := ZoftThing privateNew.
	g := ZoftProdGuts new
			privatelySetMultiplicandZoft: aZoft;
			privatelySetMultiplierZoft: bZoft.
	z privatelySetGuts: g.
	^ z
]

Class {
	#name : #ProdZoft,
	#superclass : #ZoftGenerator,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
ProdZoft class >> newWithA: azft andB: bzft [
	| z g |

	z := ZoftThing privateNew.
	g := ZoftProdGuts new
			privatelySetMultiplicandZoft: azft;
			privatelySetMultiplierZoft: bzft.
	z privatelySetGuts: g.
	^ z
]

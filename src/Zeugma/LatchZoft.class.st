Class {
	#name : #LatchZoft,
	#superclass : #ZoftGenerator,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
LatchZoft class >> newWith: aNonZoft [
	| z g |

	z := Zoft privateNew.
	g := LatchZoftGuts new
			privatelySetLatchVal: aNonZoft.
	z privatelySetGuts: g.
	z privatelySetVal: aNonZoft.
	^ z
]

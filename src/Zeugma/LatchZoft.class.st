Class {
	#name : #LatchZoft,
	#superclass : #ZoftGenerator,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
LatchZoft class >> newWith: aNonZoft [
	| z g |

	z := ZoftThing privateNew.
	g := ZoftLatchGuts new
			privatelySetLatchVal: aNonZoft.
	z privatelySetGuts: g.
	z privatelySetVal: aNonZoft.
	^ z
]

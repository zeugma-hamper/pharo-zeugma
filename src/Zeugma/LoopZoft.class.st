Class {
	#name : #LoopZoft,
	#superclass : #ZoftGenerator,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
LoopZoft class >> newWithStart: stZoft andDXDT: dxdtZoft andLoopDur: ldurZoft [
	| z g |

	z := ZoftThing privateNew.
	g := LoopZoftGuts new
			privatelySetStartZoft: stZoft;
			privatelySetDXDTZoft: dxdtZoft;
			privatelySetLoopDurZoft: ldurZoft.
	z privatelySetGuts: g.
	^ z
]

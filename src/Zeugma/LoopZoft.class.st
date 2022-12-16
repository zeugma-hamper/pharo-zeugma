Class {
	#name : #LoopZoft,
	#superclass : #ZoftGenerator,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
LoopZoft class >> newWithStart: stZoft andDXDT: dxdtZoft andLoopDur: ldurZoft [
	| z g |

	z := Zoft privateNew.
	g := LoopZoftGuts new
			installStartZoft: (Zoft zoftenIfNotOne: stZoft);
			installDXDTZoft: (Zoft zoftenIfNotOne: dxdtZoft);
			installLoopDurZoft: (Zoft zoftenIfNotOne: ldurZoft).
	z privatelySetGuts: g.
	^ z
]

Class {
	#name : #InterpZoft,
	#superclass : #ZoftGenerator,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
InterpZoft class >> newWithPointA: aZoft andPointB: bZoft [
	| z g |

	z := Zoft privateNew.
	g := InterpZoftGuts new
			installPointAZoft: (Zoft zoftenIfNotOne: aZoft);
			installPointBZoft: (Zoft zoftenIfNotOne: bZoft).
	z privatelySetGuts: g.
	^ z
]

{ #category : #'instance creation' }
InterpZoft class >> newWithPointA: aZoft andPointB: bZoft andInterpFunc: f [
	| z g |

	z := Zoft privateNew.
	g := InterpZoftGuts new
			installPointAZoft: (Zoft zoftenIfNotOne: aZoft);
			installPointBZoft: (Zoft zoftenIfNotOne: bZoft);
			setInterpFunc: f.
	z privatelySetGuts: g.
	^ z
]

{ #category : #'instance creation' }
InterpZoft class >> newWithPointA: aZoft andPointB: bZoft andInterpTime: t [
	| z g |

	z := Zoft privateNew.
	g := InterpZoftGuts new
			installPointAZoft: (Zoft zoftenIfNotOne: aZoft);
			installPointBZoft: (Zoft zoftenIfNotOne: bZoft);
			setInterpTime: t.
	z privatelySetGuts: g.
	^ z
]

{ #category : #'instance creation' }
InterpZoft class >> newWithPointA: aZoft andPointB: bZoft andInterpTime: t andInterpFunc: f [
	| z g |

	z := Zoft privateNew.
	g := InterpZoftGuts new
			installPointAZoft: (Zoft zoftenIfNotOne: aZoft);
			installPointBZoft: (Zoft zoftenIfNotOne: bZoft);
			setInterpTime: t;
			setInterpFunc: f.
	z privatelySetGuts: g.
	^ z
]

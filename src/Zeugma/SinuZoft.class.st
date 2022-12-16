Class {
	#name : #SinuZoft,
	#superclass : #ZoftGenerator,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
SinuZoft class >> newWithAmplitude: amplZoft andFrequency: freqZoft [
	| z g |

	z := Zoft privateNew.
	g := SinuZoftGuts new
			installAmplitudeZoft: (Zoft zoftenIfNotOne: amplZoft);
			installFrequencyZoft: (Zoft zoftenIfNotOne: freqZoft).
	z privatelySetGuts: g.
	^ z
]

{ #category : #'instance creation' }
SinuZoft class >> newWithAmplitude: amplZoft andFrequency: freqZoft andCenter: centZoft [
	| z g |

	z := Zoft privateNew.
	g := SinuZoftGuts new
			installAmplitudeZoft: (Zoft zoftenIfNotOne: amplZoft);
			installFrequencyZoft: (Zoft zoftenIfNotOne: freqZoft);
			installCenterZoft: (Zoft zoftenIfNotOne: centZoft).
	z privatelySetGuts: g.
	^ z
]

{ #category : #'instance creation' }
SinuZoft class >> newWithAmplitude: amplZoft andFrequency: freqZoft andCenter: centZoft andPhase: phasZoft [
	| z g |

	z := Zoft privateNew.
	g := SinuZoftGuts new
			installAmplitudeZoft: (Zoft zoftenIfNotOne: amplZoft);
			installFrequencyZoft: (Zoft zoftenIfNotOne: freqZoft);
			installCenterZoft: (Zoft zoftenIfNotOne: centZoft);
			installPhaseZoft: (Zoft zoftenIfNotOne: phasZoft).
	z privatelySetGuts: g.
	^ z
]

{ #category : #'instance creation' }
SinuZoft class >> newWithAmplitude: amplZoft andFrequency: freqZoft andPhase: phasZoft [
	| z g |

	z := Zoft privateNew.
	g := SinuZoftGuts new
			installAmplitudeZoft: (Zoft zoftenIfNotOne: amplZoft);
			installFrequencyZoft: (Zoft zoftenIfNotOne: freqZoft);
			installPhaseZoft: (Zoft zoftenIfNotOne: phasZoft).
	z privatelySetGuts: g.
	^ z
]

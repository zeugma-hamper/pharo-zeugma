Class {
	#name : #SinuZoft,
	#superclass : #ZoftGenerator,
	#category : #'Zeugma-Zofts'
}

{ #category : #'instance creation' }
SinuZoft class >> newWithAmplitude: amplZoft andFrequency: freqZoft [
	| z g |

	z := ZoftThing privateNew.
	g := ZoftSinuGuts new
			privatelySetAmplitudeZoft: amplZoft;
			privatelySetFrequencyZoft: freqZoft.
	z privatelySetGuts: g.
	^ z
]

{ #category : #'instance creation' }
SinuZoft class >> newWithAmplitude: amplZoft andFrequency: freqZoft andCenter: centZoft [
	| z g |

	z := ZoftThing privateNew.
	g := ZoftSinuGuts new
			privatelySetAmplitudeZoft: amplZoft;
			privatelySetFrequencyZoft: freqZoft;
			privatelySetCenterZoft: centZoft.
	z privatelySetGuts: g.
	^ z
]

{ #category : #'instance creation' }
SinuZoft class >> newWithAmplitude: amplZoft andFrequency: freqZoft andCenter: centZoft andPhase: phasZoft [
	| z g |

	z := ZoftThing privateNew.
	g := ZoftSinuGuts new
			privatelySetAmplitudeZoft: amplZoft;
			privatelySetFrequencyZoft: freqZoft;
			privatelySetCenterZoft: centZoft;
			privatelySetPhaseZoft: phasZoft.
	z privatelySetGuts: g.
	^ z
]

{ #category : #'instance creation' }
SinuZoft class >> newWithAmplitude: amplZoft andFrequency: freqZoft andPhase: phasZoft [
	| z g |

	z := ZoftThing privateNew.
	g := ZoftSinuGuts new
			privatelySetAmplitudeZoft: amplZoft;
			privatelySetFrequencyZoft: freqZoft;
			privatelySetPhaseZoft: phasZoft.
	z privatelySetGuts: g.
	^ z
]

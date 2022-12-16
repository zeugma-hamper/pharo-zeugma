Class {
	#name : #SinuZoftGuts,
	#superclass : #ZoftGuts,
	#instVars : [
		'ampl',
		'freq',
		'cent',
		'phas'
	],
	#category : #'Zeugma-Zofts-Guts'
}

{ #category : #accessing }
SinuZoftGuts >> amplitudeZoft [

	^ ampl
]

{ #category : #accessing }
SinuZoftGuts >> centerZoft [

	^ cent
]

{ #category : #accessing }
SinuZoftGuts >> frequencyZoft [

	^ freq
]

{ #category : #respiration }
SinuZoftGuts >> inhale: ratch atTime: thyme [
	| v |

	(self isFreshFor: ratch) ifTrue: [ ^ 0 ].

	ampl inhale: ratch atTime: thyme.
	freq inhale: ratch atTime: thyme.
	cent ifNotNil: [ cent inhale: ratch atTime: thyme ].
	phas ifNotNil: [ ampl inhale: ratch atTime: thyme ].

	v := 2.0 * Float pi * freq val.
	phas ifNotNil: [ v := v + phas val ].
	v := v sin.
	cent ifNotNil: [ v := v + cent val ].

	self puppeteerHosts: v.
	self setRatchet: ratch.
	^ 0
]

{ #category : #accessing }
SinuZoftGuts >> phaseZoft [

	^ phas
]

{ #category : #private }
SinuZoftGuts >> privatelySetAmplitudeZoft: z [

	ampl := z.
	^ self
]

{ #category : #private }
SinuZoftGuts >> privatelySetCenterZoft: z [

	cent := z.
	^ self
]

{ #category : #private }
SinuZoftGuts >> privatelySetFrequencyZoft: z [

	freq := z.
	^ self
]

{ #category : #private }
SinuZoftGuts >> privatelySetPhaseZoft: z [

	phas := z.
	^ self
]

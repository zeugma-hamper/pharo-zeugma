Class {
	#name : #ZoftSinuGuts,
	#superclass : #ZoftGuts,
	#instVars : [
		'ampl',
		'freq',
		'cent',
		'phas'
	],
	#category : #'Zeugma-Zofts'
}

{ #category : #accessing }
ZoftSinuGuts >> amplitudeZoft [

	^ ampl
]

{ #category : #accessing }
ZoftSinuGuts >> centerZoft [

	^ cent
]

{ #category : #accessing }
ZoftSinuGuts >> frequencyZoft [

	^ freq
]

{ #category : #respiration }
ZoftSinuGuts >> inhale: ratch atTime: thyme [
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
ZoftSinuGuts >> phaseZoft [

	^ phas
]

{ #category : #private }
ZoftSinuGuts >> privatelySetAmplitudeZoft: z [

	ampl := z.
	^ self
]

{ #category : #private }
ZoftSinuGuts >> privatelySetCenterZoft: z [

	cent := z.
	^ self
]

{ #category : #private }
ZoftSinuGuts >> privatelySetFrequencyZoft: z [

	freq := z.
	^ self
]

{ #category : #private }
ZoftSinuGuts >> privatelySetPhaseZoft: z [

	phas := z.
	^ self
]

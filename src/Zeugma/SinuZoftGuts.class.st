Class {
	#name : #SinuZoftGuts,
	#superclass : #ZoftGuts,
	#instVars : [
		'z_ampl',
		'z_freq',
		'z_cent',
		'z_phas'
	],
	#category : #'Zeugma-Zofts-Guts'
}

{ #category : #accessing }
SinuZoftGuts >> amplitudeZoft [

	^ z_ampl
]

{ #category : #accessing }
SinuZoftGuts >> centerZoft [

	^ z_cent
]

{ #category : #accessing }
SinuZoftGuts >> frequencyZoft [

	^ z_freq
]

{ #category : #respiration }
SinuZoftGuts >> inhale: ratch atTime: thyme [
	| v |

	(self isFreshFor: ratch) ifTrue: [ ^ 0 ].

	z_ampl inhale: ratch atTime: thyme.
	z_freq inhale: ratch atTime: thyme.
	z_cent ifNotNil: [ z_cent inhale: ratch atTime: thyme ].
	z_phas ifNotNil: [ z_ampl inhale: ratch atTime: thyme ].

	v := 2.0 * Float pi * z_freq val * thyme.
	z_phas ifNotNil: [ v := v + z_phas val ].
	v := z_ampl val * v sin.
	z_cent ifNotNil: [ v := v + z_cent val ].

	self puppeteerHosts: v.
	self setRatchet: ratch.
	^ 0
]

{ #category : #private }
SinuZoftGuts >> installAmplitudeZoft: z [

	z_ampl := z.
	^ self
]

{ #category : #private }
SinuZoftGuts >> installCenterZoft: z [

	z_cent := z.
	^ self
]

{ #category : #private }
SinuZoftGuts >> installFrequencyZoft: z [

	z_freq := z.
	^ self
]

{ #category : #private }
SinuZoftGuts >> installPhaseZoft: z [

	z_phas := z.
	^ self
]

{ #category : #accessing }
SinuZoftGuts >> phaseZoft [

	^ z_phas
]

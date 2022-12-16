Class {
	#name : #ZoftInterpGuts,
	#superclass : #ZoftGuts,
	#instVars : [
		'pnt_a',
		'pnt_b',
		'interp_time',
		'interp_func',
		'start_time',
		'recent_time',
		'natal',
		'replete'
	],
	#category : #'Zeugma-Zofts'
}

{ #category : #'interp-functions' }
ZoftInterpGuts class >> ASYMP: t [
	"same as #ASYMP_B:"
	^ 1.0 - (-7.62462 * t) exp
]

{ #category : #'interp-functions' }
ZoftInterpGuts class >> ASYMP_A: t [

	^ (-7.62462 * (1.0 - t)) exp
]

{ #category : #'interp-functions' }
ZoftInterpGuts class >> ASYMP_AB: t [

	^ self JANUSIZE: t lftFunc: #ASYMP_A: rgtFunc: #ASYMP_B:
]

{ #category : #'interp-functions' }
ZoftInterpGuts class >> ASYMP_B: t [

	^ 1.0 - (-7.62462 * t) exp
]

{ #category : #'interp-functions' }
ZoftInterpGuts class >> CUBIC: t [
	"same as #CUBIC_B:"
	^ t * (3.0 - (t * (3.0 - t)))
]

{ #category : #'interp-functions' }
ZoftInterpGuts class >> CUBIC_A: t [

	^ t * t * t
]

{ #category : #'interp-functions' }
ZoftInterpGuts class >> CUBIC_AB: t [

	^ self JANUSIZE: t lftFunc: #CUBIC_A: rgtFunc: #CUBIC_B:
]

{ #category : #'interp-functions' }
ZoftInterpGuts class >> CUBIC_B: t [

	^ t * (3.0 - (t * (3.0 - t)))
]

{ #category : #'interp-functions' }
ZoftInterpGuts class >> JANUSIZE: t lftFunc: f_lef rgtFunc: f_rig [

	^ (t < 0.5)
		ifTrue: [ 0.5 * (self perform: f_lef with: (2.0 * t)) ]
		ifFalse: [ 0.5  +  0.5 * (self perform: f_rig with: (2.0 * t - 1)) ]
]

{ #category : #'interp-functions' }
ZoftInterpGuts class >> LINEAR: t [

	^ t
]

{ #category : #'interp-functions' }
ZoftInterpGuts class >> QUADRATIC: t [
	"same as #QUADRATIC_B:"
	^ t * (2.0 - t)
]

{ #category : #'interp-functions' }
ZoftInterpGuts class >> QUADRATIC_A: t [

	^ t * t
]

{ #category : #'interp-functions' }
ZoftInterpGuts class >> QUADRATIC_AB: t [

	^ self JANUSIZE: t lftFunc: #QUADRATIC_A: rgtFunc: #QUADRATIC_B:
]

{ #category : #'interp-functions' }
ZoftInterpGuts class >> QUADRATIC_B: t [

	^ t * (2.0 - t)
]

{ #category : #controlling }
ZoftInterpGuts >> commenceInterp [

	natal := true.
	replete := false.
	recent_time := 0.0.
	^ self
]

{ #category : #controlling }
ZoftInterpGuts >> finishInterp [

	recent_time := interp_time.
	^ self
]

{ #category : #respiration }
ZoftInterpGuts >> inhale: ratch atTime: thyme [
	| t v |

	(self isFreshFor: ratch) ifTrue: [ ^ 0 ].

	pnt_a inhale: ratch atTime: thyme.
	pnt_b inhale: ratch atTime: thyme.

	natal ifTrue: [
		start_time := thyme.
		natal := false.
	].

	(recent_time >= interp_time) ifTrue: [
		self puppeteerHosts: pnt_b val.
		replete := true.
		^ 0
	].
	"the following does not precede the foregoing because #finishInterp might"
	"have been called in the interim and, thus, changed recent_time in a way we"
	"need to heed."
	recent_time := thyme - start_time.

	t := recent_time / interp_time.
	t := ZoftInterpGuts perform: interp_func with: t.
	(t > 1.0) ifTrue: [ t := 1.0 ].
	v := (pnt_a val * (1.0 - t)) + (pnt_b val * t).

	self puppeteerHosts: v.
	self setRatchet: ratch.
	^ 0
]

{ #category : #initialization }
ZoftInterpGuts >> initialize [

	super initialize.
	interp_time := 1.0.
	interp_func := #ASYMP_B:.
	self commenceInterp.
]

{ #category : #private }
ZoftInterpGuts >> installPointAZoft: aZoft [

	pnt_a := aZoft.
	^ self
]

{ #category : #private }
ZoftInterpGuts >> installPointBZoft: bZoft [

	pnt_b := bZoft.
	^ self
]

{ #category : #accessing }
ZoftInterpGuts >> interpFunc [

	^ interp_func
]

{ #category : #accessing }
ZoftInterpGuts >> interpTime [

	^ interp_time
]

{ #category : #accessing }
ZoftInterpGuts >> pointAZoft [

	^ pnt_a
]

{ #category : #accessing }
ZoftInterpGuts >> pointBZoft [

	^ pnt_b
]

{ #category : #controlling }
ZoftInterpGuts >> reverseInterp [
	| tmp |

	tmp := pnt_a.
	pnt_a := pnt_b.
	pnt_b := tmp.
	replete
		ifTrue: [ self commenceInterp ]
		ifFalse: [ recent_time := interp_time - recent_time ].
	^ self
]

{ #category : #accessing }
ZoftInterpGuts >> setInterpFunc: ifunc [

	interp_func :=
		(ifunc endsWith: ':')
			ifTrue: [ ifunc ]
			ifFalse: [ ifunc , ':' ]. "everyone forgets, you know?"
	^ self
]

{ #category : #accessing }
ZoftInterpGuts >> setInterpTime: itime [

	interp_time := itime.
	^ self
]

Class {
	#name : #ZoftLoopGuts,
	#superclass : #ZoftGuts,
	#instVars : [
		'prev_val',
		'start',
		'dx_dt',
		'loop_dur',
		'prev_time',
		'loop_time',
		'natal'
	],
	#category : #'Zeugma-Zofts'
}

{ #category : #accessing }
ZoftLoopGuts >> dxdtZoft [

	^ dx_dt
]

{ #category : #respiration }
ZoftLoopGuts >> inhale: ratch atTime: thyme [
	| dt v t  |

	(self isFreshFor: ratch) ifTrue: [ ^ 0 ].

	natal ifTrue: [
		prev_val := start val.
		prev_time := thyme.
		loop_time := 0.0.
		natal := false.
	].

	start inhale: ratch atTime: thyme.
	dx_dt inhale: ratch atTime: thyme.
	loop_dur inhale: ratch atTime: thyme.
	dt := thyme - prev_time.
	prev_time := thyme.
	loop_time := loop_time + dt.

	v := prev_val + (dt * dx_dt val).
	t := loop_dur val.
	((t > 0.0) and: [ loop_time > loop_dur val]) ifTrue: [
		[ loop_time := loop_time - t.  loop_time > t ] whileTrue.
		v := start val + (loop_time * dx_dt val).
	].

	prev_val := v.
	self puppeteerHosts: v.
	rat_fresh := ratch.
	^ 0
]

{ #category : #initialization }
ZoftLoopGuts >> initialize [

	super initialize.
	natal := true.
]

{ #category : #accessing }
ZoftLoopGuts >> loopDurZoft [

	^ loop_dur
]

{ #category : #private }
ZoftLoopGuts >> privatelySetDXDTZoft: dxdtZoft [

	dx_dt := dxdtZoft.
	^ self
]

{ #category : #private }
ZoftLoopGuts >> privatelySetLoopDurZoft: ldurZoft [

	loop_dur := ldurZoft.
	^ self
]

{ #category : #private }
ZoftLoopGuts >> privatelySetStartZoft: stZoft [

	start := stZoft.
	^ self
]

{ #category : #controlling }
ZoftLoopGuts >> restartLoop [

	natal := true.
]

{ #category : #accessing }
ZoftLoopGuts >> startZoft [

	^ start
]

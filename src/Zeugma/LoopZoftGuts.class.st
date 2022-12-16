Class {
	#name : #LoopZoftGuts,
	#superclass : #ZoftGuts,
	#instVars : [
		'z_start',
		'z_dxdt',
		'z_loop_dur',
		'prev_val',
		'prev_time',
		'loop_time',
		'natal'
	],
	#category : #'Zeugma-Zofts-Guts'
}

{ #category : #accessing }
LoopZoftGuts >> dxdtZoft [

	^ z_dxdt
]

{ #category : #respiration }
LoopZoftGuts >> inhale: ratch atTime: thyme [
	| dt v t  |

	(self isFreshFor: ratch) ifTrue: [ ^ 0 ].

	natal ifTrue: [
		prev_val := z_start val.
		prev_time := thyme.
		loop_time := 0.0.
		natal := false.
	].

	z_start inhale: ratch atTime: thyme.
	z_dxdt inhale: ratch atTime: thyme.
	z_loop_dur inhale: ratch atTime: thyme.
	dt := thyme - prev_time.
	prev_time := thyme.
	loop_time := loop_time + dt.

	v := prev_val + (dt * z_dxdt val).
	t := z_loop_dur val.
	((t > 0.0) and: [ loop_time > z_loop_dur val]) ifTrue: [
		[ loop_time := loop_time - t.  loop_time > t ] whileTrue.
		v := z_start val + (loop_time * z_dxdt val).
	].

	prev_val := v.
	self puppeteerHosts: v.
	rat_fresh := ratch.
	^ 0
]

{ #category : #initialization }
LoopZoftGuts >> initialize [

	super initialize.
	natal := true.
]

{ #category : #private }
LoopZoftGuts >> installDXDTZoft: dxdtZoft [

	z_dxdt := dxdtZoft.
	^ self
]

{ #category : #private }
LoopZoftGuts >> installLoopDurZoft: ldurZoft [

	z_loop_dur := ldurZoft.
	^ self
]

{ #category : #private }
LoopZoftGuts >> installStartZoft: stZoft [

	z_start := stZoft.
	^ self
]

{ #category : #accessing }
LoopZoftGuts >> loopDurZoft [

	^ z_loop_dur
]

{ #category : #controlling }
LoopZoftGuts >> restartLoop [

	natal := true.
]

{ #category : #accessing }
LoopZoftGuts >> startZoft [

	^ z_start
]

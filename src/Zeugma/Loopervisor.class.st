Class {
	#name : #Loopervisor,
	#superclass : #Zeubject,
	#instVars : [
		'grand_ratchet',
		'recentest_time',
		'start_t',
		'active_sumps',
		'active_aqueducts',
		'active_lungs',
		'active_toilers',
		'proc',
		'now_looping',
		'target_loop_dur'
	],
	#category : #'Zeugma-TemporalStructure'
}

{ #category : #'tempus-fugit' }
Loopervisor class >> absoluteTime [

	^ (DateAndTime now - DateAndTime unixEpoch) totalSeconds asFloat
]

{ #category : #accessing }
Loopervisor >> appendAqueduct: aq [

	aq ifNil: [ ^self ].
	active_aqueducts addIfNotPresent: aq.
]

{ #category : #accessing }
Loopervisor >> appendLung: ell [

	ell ifNil: [ ^self ].
	active_lungs addIfNotPresent: ell.
]

{ #category : #accessing }
Loopervisor >> appendSump: s [

	s ifNil: [ ^self ].
	active_sumps addIfNotPresent: s.
]

{ #category : #accessing }
Loopervisor >> appendToiler: ler [

	ler	 ifNil: [ ^self ].
	active_toilers addIfNotPresent: ler.
]

{ #category : #accessing }
Loopervisor >> aqueductNamed: nm [

	^ active_aqueducts detect: [ :du | du name = nm ] ifNone: nil
]

{ #category : #accessing }
Loopervisor >> aqueducts [

	^ active_aqueducts copy
]

{ #category : #accessing }
Loopervisor >> assuredDefaultLung [
	| zl |

	(zl := self lungNamed: 'omni-lung')
		ifNotNil: [ ^ zl ].
	(zl := IronLung new) setName: 'omni-lung'.
	self appendLung: zl.
	^ zl
]

{ #category : #accessing }
Loopervisor >> assuredZoftLung [
	| zl |

	(zl := self lungNamed: 'velvet-lung')
		ifNotNil: [ ^ zl ].
	(zl := IronLung new) setName: 'velvet-lung'.
	self appendLung: zl.
	^ zl
]

{ #category : #looping }
Loopervisor >> brakeSpin [

	now_looping := false.
]

{ #category : #looping }
Loopervisor >> breakSpin [

	self brakeSpin
]

{ #category : #'time-handling' }
Loopervisor >> elapsedTime [

	^ (DateAndTime now - start_t) totalSeconds asFloat
]

{ #category : #'time-handling' }
Loopervisor >> freshenTimestamps [

	grand_ratchet := grand_ratchet + 8.
	recentest_time := self elapsedTime.
]

{ #category : #initialization }
Loopervisor >> initialize [

	super initialize.

	grand_ratchet := 0.
	recentest_time := -1.0.
	start_t := DateAndTime now.
	now_looping := false.

	active_aqueducts := OrderedCollection new.
	active_lungs := OrderedCollection new.
	active_sumps := OrderedCollection new.
	active_toilers := OrderedCollection new.
]

{ #category : #looping }
Loopervisor >> isLooping [

	^ now_looping
]

{ #category : #accessing }
Loopervisor >> lungNamed: nm [

	^ active_lungs detect: [ :lu | lu name = nm ] ifNone: nil
]

{ #category : #accessing }
Loopervisor >> lungs [

	^ active_lungs copy
]

{ #category : #looping }
Loopervisor >> onceMoreUntoTheBreath [

	active_sumps do: [ :sump | sump processSump ].
	active_aqueducts do: [ :duct | duct drainReservoir ].

	self freshenTimestamps.

	active_lungs do: [ :lung |
		lung inhale: grand_ratchet atTime: recentest_time
	].
]

{ #category : #looping }
Loopervisor >> oneDelightfulTurn [

	self onceMoreUntoTheBreath.
	self travail: grand_ratchet atTime: recentest_time.
]

{ #category : #'time-handling' }
Loopervisor >> recentestRatchet [

	^ grand_ratchet
]

{ #category : #'time-handling' }
Loopervisor >> recentestTime [

	^ recentest_time
]

{ #category : #accessing }
Loopervisor >> removeAqueduct: aq [

	active_aqueducts remove: aq ifAbsent: [ nil ].
]

{ #category : #accessing }
Loopervisor >> removeLung: ell [

	active_lungs remove: ell ifAbsent: [ nil ].
]

{ #category : #accessing }
Loopervisor >> removeSump: s [

	active_sumps remove: s ifAbsent: [ nil ].
]

{ #category : #accessing }
Loopervisor >> removeToiler: toi [

	active_toilers remove: toi ifAbsent: [ nil ].
]

{ #category : #looping }
Loopervisor >> setTargetLoopDur: tld [

	target_loop_dur := tld
]

{ #category : #looping }
Loopervisor >> spinGloriously: targetLDur [

	now_looping ifTrue: [ ^ self ].

	target_loop_dur := targetLDur.
	proc := [
		now_looping := true.
		[ now_looping ]
			whileTrue: [ | befo_t dt |
				befo_t := self class absoluteTime.
				self oneDelightfulTurn.
				dt := self class absoluteTime - befo_t.
				dt := target_loop_dur - dt.
				(dt > 0)
					ifTrue: [ (Delay forSeconds: dt) wait ].
			].
		now_looping := false.
		proc := nil.
	] forkAt: Processor userBackgroundPriority.
]

{ #category : #accessing }
Loopervisor >> sumpNamed: nm [

	^ active_sumps detect: [ :um | um name = nm ] ifNone: nil
]

{ #category : #accessing }
Loopervisor >> sumps [

	^ active_sumps copy
]

{ #category : #looping }
Loopervisor >> targetLoopDur [

	^ target_loop_dur
]

{ #category : #accessing }
Loopervisor >> toilerNamed: nm [

	^ active_toilers detect: [ :oi | oi name = nm ] ifNone: nil
]

{ #category : #accessing }
Loopervisor >> toilers [

	^ active_toilers copy
]

{ #category : #toiling }
Loopervisor >> travail: ratch atTime: thyme [

	active_toilers ifNotNil: [
		active_toilers do: [ :wrkr | wrkr travail: ratch atTime: thyme ]
	].
]

{ #category : #accessing }
Loopervisor >> unsecuredDefaultLung [

	^ self lungNamed: 'omni-lung'
]

{ #category : #accessing }
Loopervisor >> unsecuredZoftLung [

	^ self lungNamed: 'velvet-lung'
]

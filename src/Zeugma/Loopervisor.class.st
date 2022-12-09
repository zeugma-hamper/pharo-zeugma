Class {
	#name : #Loopervisor,
	#superclass : #Zeubject,
	#instVars : [
		'grand_ratchet',
		'recentest_time',
		'start_t',
		'active_aqueducts',
		'active_lungs',
		'active_sumps',
		'arbeiters'
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

	active_aqueducts := OrderedCollection new.
	active_lungs := OrderedCollection new.
	active_sumps := OrderedCollection new.
	arbeiters := OrderedCollection new.
]

{ #category : #looping }
Loopervisor >> onceMoreUntoTheBreath [

	active_sumps do: [ :sump | sump processSump ].
	active_aqueducts do: [ :duct | duct drainReservoir ].

	self freshenTimestamps.

	active_lungs do: [ :lung |
		lung inhale: grand_ratchet attime: recentest_time
	].
]

{ #category : #looping }
Loopervisor >> oneGloriousTurn [

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

{ #category : #looping }
Loopervisor >> travail: ratch atTime: thyme [

	arbeiters ifNotNil: [
		arbeiters do: [ :wrkr | wrkr travail: ratch atTime: thyme ]
	].
]

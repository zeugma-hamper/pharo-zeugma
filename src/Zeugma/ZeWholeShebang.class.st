"
**eventual arena class: a drome within which all else can romp**

_for now, the below sets up a running set of zeugmic organs:_

""
loo := Loopervisor new.
loo.

spa := SpatialAqueduct new.
loo appendAqueduct: spa.

owa := OSCWandsSump newOnPort: 54345.
owa setDirectionTransform: (Matrix44 newFrom: (SpatialAqueduct sampleWandTransform at: #direc_mat)).
owa setPositionTransform: (Matrix44 newFrom: (SpatialAqueduct sampleWandTransform at: #point_mat)).
owa forAddress: '/events/spatial' appendAqueduct: spa.
owa forAddress: '/events/spatial' setSynthObject: WandEventSynth new andSelector: #interpretRawWandish:buttonBits:caressDict:pos:aim:over: .
loo appendSump: owa.

cat := WandEventTestCatcher new.
spa appendPhage: cat.

loo spinGloriously: (0.016).
loo brakeSpin.
owa attendToIncoming.
owa suspendAttention.

loo oneDelightfulTurn.
""

"
Class {
	#name : #ZeWholeShebang,
	#superclass : #Zeubject,
	#traits : 'ZESpatialPhagy',
	#classTraits : 'ZESpatialPhagy classTrait',
	#instVars : [
		'looper',
		'maeses',
		'auto_attend'
	],
	#classVars : [
		'canonical_instance'
	],
	#category : #'Zeugma-TemporalStructure'
}

{ #category : #'instance creation' }
ZeWholeShebang class >> canonicalInstance [
	| novo ma spa owa |

	canonical_instance ifNotNil: [ ^ canonical_instance ].

	novo := self new.
	PlatonicMaes sampleMaesConfig do: [ :mdic |
		ma := PlatonicMaes newFromDict: mdic.
		novo appendMaes: ma.
	].

	spa := SpatialAqueduct new.
	spa appendPhage: novo.
	novo loopervisor appendAqueduct: spa.

	owa := OSCWandsSump newOnPort: 54345.
	owa setDirectionTransform:
		(Matrix44 newFrom: (SpatialAqueduct sampleWandTransform at: #direc_mat)).
	owa setPositionTransform:
		(Matrix44 newFrom: (SpatialAqueduct sampleWandTransform at: #point_mat)).
	owa forAddress: '/events/spatial'
		setSynthObject: WandEventSynth new
		andSelector: #interpretRawWandish:buttonBits:caressDict:pos:aim:over:.
	owa forAddress: '/events/spatial' appendAqueduct: spa.
	novo loopervisor appendSump: owa.

	canonical_instance := novo.
	^ novo
]

{ #category : #husbanding }
ZeWholeShebang >> appendMaes: ma [

	ma ifNotNil:
		[ maeses addIfNotPresent: ma ]
]

{ #category : #attention }
ZeWholeShebang >> attendToIncomingComms [

	self loopervisor sumps do: [ :smp |
		smp attendToIncoming
	]
]

{ #category : #initialization }
ZeWholeShebang >> initialize [

	super initialize.

	looper := Loopervisor new.
	maeses := OrderedCollection new.

	auto_attend := true.
]

{ #category : #accessing }
ZeWholeShebang >> loopervisor [

	^ looper
]

{ #category : #accessing }
ZeWholeShebang >> maeses [

	^ maeses copy
]

{ #category : #'event-phagy' }
ZeWholeShebang >> passTheBuckUpPhageHierarchy [

	^ true
]

{ #category : #running }
ZeWholeShebang >> runAndRun [

	self runAndRun: 0.016
]

{ #category : #running }
ZeWholeShebang >> runAndRun: frameDur [

	self loopervisor spinGloriously: frameDur.
	auto_attend ifTrue:
		[ self attendToIncomingComms ].
]

{ #category : #running }
ZeWholeShebang >> skidToAHalt [

	auto_attend ifTrue:
		[ self suspendIncomingCommsAttention ].
	self loopervisor brakeSpin.

]

{ #category : #attention }
ZeWholeShebang >> suspendIncomingCommsAttention [

	self loopervisor sumps do: [ :smp |
		smp suspendAttention
	]
]

{ #category : #'event-phagy' }
ZeWholeShebang >> zeSpatial: evt [

	Transcript show: evt; cr.
	^ 0
]

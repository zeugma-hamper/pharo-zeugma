Class {
	#name : #WandEventSynth,
	#superclass : #Zeubject,
	#instVars : [
		'state_by_prov'
	],
	#category : #'Zeugma-EventImport'
}

{ #category : #initialization }
WandEventSynth >> initialize [

	super initialize.
	state_by_prov := Dictionary new.
]

{ #category : #synthesizing }
WandEventSynth >> interpretRawWandish: pntrNm buttonBits: bbits caressDict: crss pos: p aim: a over: o [

	^ self interpretRawWandish: pntrNm buttonBits: bbits caressDict: crss
								pos: p aim: a over: o
								naes: nil camera: nil hit: nil.
]

{ #category : #synthesizing }
WandEventSynth >> interpretRawWandish: pntrNm buttonBits: bbits caressDict: crsdct
						pos: p aim: a over: o
						naes: m camera: cam hit: hVect [
	| spatst smev butts mask outevs prevb |

	spatst := state_by_prov at: pntrNm ifAbsentPut: [ #(0 false) ].

	smev := ZESpatialMoveEvent new
		setProvenance: pntrNm;
		setLoc: p aim: a over: o.

	butts := bbits.  mask := 16r01.
	[ butts ~= 0 ]
		whileTrue: [
			(butts bitAnd: mask) ~= 0
				ifTrue: [ smev setPressure: 1.0 forID: mask.
							 butts := butts bitXor: mask. ].
			mask := mask bitShift: 1.
		].

	"attach reinterpretations to smev in the fullness of time"
	outevs := OrderedCollection new.
	outevs add: smev.

	((prevb := spatst first) ~= bbits )
			&  (spatst second)
		ifTrue: [
			mask := 16r01.  butts := bbits.
			[ (prevb bitXor: butts) ~= 0 ]
				whileTrue: [ | spev curstate |
					curstate := butts bitAnd: mask.
					(prevb bitAnd: mask) ~= curstate
						ifTrue: [
							spev := (curstate > 0)
								ifTrue: [
									ZESpatialHardenEvent new
										adoptSpatialEventParticularsFrom: smev;
										setPressor: mask value: 1.0.
								]
								ifFalse: [
									ZESpatialSoftenEvent new
										adoptSpatialEventParticularsFrom: smev;
										setPressor: mask value: 0.0.
								].
							"likewise, attach reinterps here..."
							outevs add: spev.
							prevb := prevb bitXor: (prevb bitAnd: mask).
							butts := butts bitXor: (butts bitAnd: mask).
						].
					mask := mask bitShift: 1.
				]
		].

	crsdct ifNotNil: [
		crsdct keysAndValuesDo: [ :cid :cvl |  | scev |
			scev := ZESpatialCaressEvent new
				adoptSpatialEventParticularsFrom: smev;
				setCaressor: cid value: cvl.
			outevs add: scev.
			" if #reinterps > 0 ..."
		]
	].

	state_by_prov at: pntrNm put: { bbits . true }.
	^ outevs.
]

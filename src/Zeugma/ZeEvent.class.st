Class {
	#name : #ZeEvent,
	#superclass : #Zeubject,
	#instVars : [
		'prov',
		'tstamp',
		'tratch',
		'fore_evt'
	],
	#classVars : [
		'C_deliv_selector'
	],
	#category : #'Zeugma-Events'
}

{ #category : #'event-routing' }
ZeEvent class >> classSideDeliverySelector [

	^ #ze:
]

{ #category : #'bulk-setting' }
ZeEvent >> adoptEventParticularsFrom: otha [

	self setProvenance: otha provenance.
	self setTimeRatchet: otha timeRatchet.
	self setTimestamp: otha timestamp.
	self setForebearEvent: otha forebearEvent.
	^ self
]

{ #category : #'bulk-setting' }
ZeEvent >> adoptParticularsFrom: otha [

	self adoptEventParticularsFrom: otha.
	^ self
]

{ #category : #'event-routing' }
ZeEvent >> deliverySelector [

	^ self class classSideDeliverySelector
]

{ #category : #accessing }
ZeEvent >> forebearEvent [

	^ fore_evt
]

{ #category : #initialization }
ZeEvent >> initialize [

	super initialize.
	tratch := -1.
	tstamp := -1.0.
]

{ #category : #accessing }
ZeEvent >> provenance [

	^ prov
]

{ #category : #accessing }
ZeEvent >> setForebearEvent: fe [

	fore_evt := fe.
]

{ #category : #'bulk-setting' }
ZeEvent >> setProv: pr ratch: ra tstamp: ts foreEvent: fe [

	self setProvenance: pr.
	self setTimeRatchet: ra.
	self setTimestamp: ts.
	self setForebearEvent: fe.
	^ self
]

{ #category : #accessing }
ZeEvent >> setProvenance: pr [

	prov := pr.
]

{ #category : #accessing }
ZeEvent >> setTimeRatchet: tr [

	tratch := tr.
]

{ #category : #accessing }
ZeEvent >> setTimestamp: ts [

	tstamp := ts.
]

{ #category : #accessing }
ZeEvent >> timeRatchet [

	^ tratch
]

{ #category : #accessing }
ZeEvent >> timestamp [

	^ tstamp
]

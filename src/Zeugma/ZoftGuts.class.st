Class {
	#name : #ZoftGuts,
	#superclass : #Object,
	#instVars : [
		'rat_fresh',
		'zt_hosts'
	],
	#category : #'Zeugma-Zofts'
}

{ #category : #'zoft-hosts' }
ZoftGuts >> appendHost: aZoft [

	(aZoft isNil or: [ zt_hosts includes: aZoft ])
		ifTrue: [ ^ self ].

	zt_hosts add: aZoft.
]

{ #category : #initialization }
ZoftGuts >> initialize [

	super initialize.
	rat_fresh := -1.
	zt_hosts := WeakOrderedCollection new.
]

{ #category : #testing }
ZoftGuts >> isFreshFor: ratch [

	^ rat_fresh = ratch
]

{ #category : #'zoft-hosts' }
ZoftGuts >> puppeteerHosts: v [

	zt_hosts do: [ :zth |
		zth ifNotNil: [ zth setVal: v ]
	].
]

{ #category : #respiration }
ZoftGuts >> ratchet [

	^ rat_fresh.
]

{ #category : #'zoft-hosts' }
ZoftGuts >> removeHost: aZoft [

	(aZoft isNil or: [ (zt_hosts includes: aZoft) not ])
		ifTrue: [ ^ self ].

	zt_hosts remove: aZoft.
]

{ #category : #respiration }
ZoftGuts >> setRatchet: rat [

	rat_fresh := rat.
]

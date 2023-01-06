Class {
	#name : #CumuMats,
	#superclass : #Object,
	#instVars : [
		'pmat',
		'nmat',
		'ipmat',
		'inmat',
		'rat_fresh',
		'valid'
	],
	#category : #'Zeugma-Foundation'
}

{ #category : #'instance creation' }
CumuMats class >> new [

	^ self new: true
]

{ #category : #'instance creation' }
CumuMats class >> new: people_the_isle_with_calibans [
	| novo idm |
	"the boolean argument controls whether to initialize the
	 four component matrices (with identity) or leave them as
	 nil and naked as the day they were born, which is today."

	novo := self basicNew initialize.
	people_the_isle_with_calibans ifTrue: [
		idm := Matrix44 new.
		novo freshenVia: idm and: idm and: idm and: idm
	].
	^ novo
]

{ #category : #initialization }
CumuMats >> freshenVia: pm and: nm and: ipm and: inm [

	pmat := pm.
	nmat := nm.
	ipmat := ipm.
	inmat := inm.
]

{ #category : #initialization }
CumuMats >> initialize [

	super initialize.
	rat_fresh := -1.
]

{ #category : #transforming }
CumuMats >> xformPointLocalToWorld: p [

	^ pmat
		ifNil: [ p ]
		ifNotNil: [ pmat xformVect: p ]
]

{ #category : #transforming }
CumuMats >> xformPointWorldToLocal: p [

	^ ipmat
		ifNil: [ p ]
		ifNotNil: [ ipmat xformVect: p ]
]

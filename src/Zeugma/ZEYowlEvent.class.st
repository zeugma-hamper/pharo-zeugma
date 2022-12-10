Class {
	#name : #ZEYowlEvent,
	#superclass : #ZeEvent,
	#instVars : [
		'utt',
		'reptOrd',
		'modfrs',
		'proxEnt'
	],
	#category : #'Zeugma-Events'
}

{ #category : #initialization }
ZEYowlEvent class >> initialize [

	deliv_selector := #zeYowl:.
]

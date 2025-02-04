Class {
	#name : #Geom,
	#superclass : #Object,
	#category : #'Zeugma-Foundation'
}

{ #category : #intersection }
Geom class >> intersectLine: lpt dir: dir withPlane: cnt norm: nrm [
			
	| t |
	t := dir scp: nrm.
	t ~= 0 ifTrue: [
		t := ((cnt - lpt) scp: nrm) / t.
		^ lpt + (dir scaleBy: t).
	].
	^ nil
]

{ #category : #intersection }
Geom class >> intersectRay: frm aim: aim withPlane: cnt norm: nrm [
			
	| t |
	t := aim scp: nrm.
	t ~= 0 ifTrue: [
		t := ((cnt - frm) scp: nrm) / t.
		(t >= 0.0) ifTrue: [ ^ frm + (aim scaleBy: t) ].
	].
	^ nil
]

{ #category : #intersection }
Geom class >> intersectRay: frm aim: aim withRect: cnt over: ovr up: upp wid: wid hei: hei [
			
	| nrm pee p t |
	nrm := ovr cross: upp.
	pee := self intersectRay: frm aim: aim withPlane: cnt norm: nrm.
	pee ifNil: [ ^ nil ].
	p := pee - cnt.

	t := 2.0 * (p scp: ovr).
	(t < (0-wid)  or: [ t > wid ])
		ifTrue: [ ^ nil ].

	t := 2.0 * (p scp: upp).
	(t < (0-hei)  or: [ t > hei ])
		ifTrue: [ ^ nil ].

	^ pee
]

{ #category : #projection }
Geom class >> projectPoint: pnt ontoLine: lpt dir: dir [
			
	| d prj |
	d := dir normed.
	prj := lpt + (d scaleBy: (d scp: (pnt - lpt))).
	^ prj
]

{ #category : #projection }
Geom class >> projectPoint: pnt ontoPlane: cnt norm: nrm [
			
	| n prj |
	n := nrm normed.
	prj := pnt - (n scaleBy: (n scp: (pnt - cnt))).
	^ prj
]

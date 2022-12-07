Class {
	#name : #Geom,
	#superclass : #Object,
	#category : #'Zeugma-Foundation'
}

{ #category : #intersection }
Geom class >> intersectLine: lpt dir: dir withPlane: cnt norm: nrm [
			
	| t |
	t := dir <> nrm.
	t ~= 0 ifTrue: [
		t := ((cnt - lpt) <> nrm) / t.
		^ lpt + (dir scaleBy: t).
	].
	^ nil
]

{ #category : #intersection }
Geom class >> intersectRay: frm aim: aim withPlane: cnt norm: nrm [
			
	| t |
	t := aim <> nrm.
	t ~= 0 ifTrue: [
		t := ((frm - cnt) <> nrm) / t.
		(t >= 0.0) ifTrue: [ ^ frm + (aim scaleBy: t) ].
	].
	^ nil
]

{ #category : #projection }
Geom class >> projectPoint: pnt ontoLine: lpt dir: dir [
			
	| d prj |
	d := dir normed.
	prj := lpt + (d scaleBy: (d <> (pnt - lpt))).
	^ prj
]

{ #category : #projection }
Geom class >> projectPoint: pnt ontoPlane: cnt norm: nrm [
			
	| n prj |
	n := nrm normed.
	prj := pnt - (n scaleBy: (n <> (pnt - cnt))).
	^ prj
]

Trait {
	#name : #RecursiveLimner,
	#category : #'Zeugma-Rendering'
}

{ #category : #drawing }
RecursiveLimner >> recursivelyDraw: zeub atRatchet: ratch withCumuMats: cm_above andAdjColor: adjc_above [
	| cm |

	cm := cm_above.
	zeub isZeugmallyLimnable ifTrue: [ | lcl_cm |
		(lcl_cm := zeub currentCumuMats)
			ifNotNil: [ cm := lcl_cm dependCumuMatsFrom: cm ]. 
		zeub drawSelfAtRatch: ratch withCumuMats: cm andAdjColor: adjc_above.
	].

	zeub isZeugmallyPouchful ifTrue: [
		zeub children do: [ : ch |
			self recursivelyDraw: ch atRatchet: ratch
					withCumuMats: cm andAdjColor: adjc_above
		].
	].
]

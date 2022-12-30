Class {
	#name : #Matrix44,
	#superclass : #Object,
	#instVars : [
		'm'
	],
	#category : #'Zeugma-Foundation'
}

{ #category : #'instance creation' }
Matrix44 class >> newFrom: arr [

	^ self basicNew setGutsArray: arr
]

{ #category : #'instance creation' }
Matrix44 class >> newIdent [

	^ self new
]

{ #category : #'instance creation' }
Matrix44 class >> newZero [

	^ self basicNew alloc16
]

{ #category : #transformations }
Matrix44 class >> rotationAxis: axs angle: ang [

	^ self basicNew loadRotationAxis: axs angle: ang
]

{ #category : #transformations }
Matrix44 class >> rotationAxis: axs angle: ang about: cnt [

	^ self basicNew loadRotationAxis: axs angle: ang about: cnt
]

{ #category : #transformations }
Matrix44 class >> rotationNormedAxis: axs angle: ang [

	^ self basicNew loadRotationNormedAxis: axs angle: ang
]

{ #category : #transformations }
Matrix44 class >> rotationNormedAxis: axs angle: ang about: cnt [

	^ self basicNew loadRotationNormedAxis: axs angle: ang about: cnt
]

{ #category : #transformations }
Matrix44 class >> scale: s [

	^ self basicNew loadScale: s
]

{ #category : #transformations }
Matrix44 class >> scale: s about: cntr [

	^ self basicNew loadScale: s about: cntr
]

{ #category : #transformations }
Matrix44 class >> scaleX: sx Y: sy Z: sz [

	^ self basicNew loadScaleX: sx Y: sy Z: sz
]

{ #category : #transformations }
Matrix44 class >> scaleX: sx Y: sy Z: sz about: cntr [

	^ self basicNew loadScaleX: sx Y: sy Z: sz about: cntr
]

{ #category : #transformations }
Matrix44 class >> translation: v [

	^ self basicNew loadTranslation: v
]

{ #category : #transformations }
Matrix44 class >> translationX: tx Y: ty Z: tz [

	^ self basicNew loadTranslationX: tx Y: ty Z: tz
]

{ #category : #arithmetic }
Matrix44 >> * otha [

	^ otha isNumber
		ifTrue: [ self scale: otha ]
		ifFalse: [ self mult: otha ].
]

{ #category : #arithmetic }
Matrix44 >> + othaMat [

	^ self add: othaMat
]

{ #category : #arithmetic }
Matrix44 >> - othaMat [

	^ self sub: othaMat
]

{ #category : #arithmetic }
Matrix44 >> add: b [

	| a arr |
	a := self.
	arr :=
		 {   (a m00 + b m00)  .  (a m01 + b m01)  .  (a m02 + b m02)  .  (a m03 + b m03)
		  .  (a m10 + b m10)  .  (a m11 + b m11)  .  (a m12 + b m12)  .  (a m13 + b m13)
		  .  (a m20 + b m20)  .  (a m21 + b m21)  .  (a m22 + b m22)  .  (a m23 + b m23)
		  .  (a m30 + b m30)  .  (a m31 + b m31)  .  (a m32 + b m32)  .  (a m33 + b m33)
		 }.
	^ self class newFrom: arr
]

{ #category : #arithmetic }
Matrix44 >> addAccum: b [

	| a arr |
	a := self.
	arr :=
		 {   (a m00 + b m00)  .  (a m01 + b m01)  .  (a m02 + b m02)  .  (a m03 + b m03)
		  .  (a m10 + b m10)  .  (a m11 + b m11)  .  (a m12 + b m12)  .  (a m13 + b m13)
		  .  (a m20 + b m20)  .  (a m21 + b m21)  .  (a m22 + b m22)  .  (a m23 + b m23)
		  .  (a m30 + b m30)  .  (a m31 + b m31)  .  (a m32 + b m32)  .  (a m33 + b m33)
		 }.
	self setGutsArray: arr.
	^ self
]

{ #category : #initialization }
Matrix44 >> alloc16 [

	m := FloatArray new: 16.
	^ self
]

{ #category : #copying }
Matrix44 >> copy [

	^ self class newFrom: m copy
]

{ #category : #copying }
Matrix44 >> dup [

	^ self class newFrom: m copy
]

{ #category : #accessing }
Matrix44 >> gutsArray [

	^ m
]

{ #category : #initialization }
Matrix44 >> initialize [

	m := FloatArray new: 16.
	m at: 1 put: 1.0;  at: 6 put: 1.0;  at: 11 put: 1.0;  at: 16 put: 1.0.
]

{ #category : #'transformations-preident' }
Matrix44 >> loadAtopIdentRotationAxis: axs angle: ang [

	^ self loadAtopIdentRotationNormedAxis: (axs normed) angle: ang
]

{ #category : #'transformations-preident' }
Matrix44 >> loadAtopIdentRotationAxis: axs angle: ang about: cnt [
	| emm |

	self loadAtopIdentTranslation: cnt neg.
	emm := Matrix44 rotationAxis: axs angle: ang.
	self multAccum: emm.
	emm := Matrix44 translation: cnt.
	^ self
]

{ #category : #'transformations-preident' }
Matrix44 >> loadAtopIdentRotationNormedAxis: axs angle: ang [

	| co si omc t1 t2 |

	((ang isZero) or: [ axs isZero ])
		ifTrue: [ ^ self loadIdent ].
	
	co := ang cos.  si := ang sin.  omc := 1 - co.

	self m00: co + (axs x squared * omc).
	self m11: co + (axs y squared * omc).
	self m22: co + (axs z squared * omc).

	t1 := axs x * axs y * omc.
	t2 := axs z * si.
	self m10: t1 - t2.
	self m01: t1 + t2.

	t1 := axs x * axs z * omc.
	t2 := axs y * si.
	self m20: t1 + t2.
	self m02: t1 - t2.

	t1 := axs y * axs z * omc.
	self m21: t1 - t2.
	self m12: t1 + t2.

	^ self
]

{ #category : #'transformations-preident' }
Matrix44 >> loadAtopIdentRotationNormedAxis: axs angle: ang about: cnt [
	| emm |

	self loadAtopIdentTranslation: cnt neg.
	emm := Matrix44 rotationNormedAxis: axs angle: ang.
	self multAccum: emm.
	emm := Matrix44 translation: cnt.
	^ self
]

{ #category : #'transformations-preident' }
Matrix44 >> loadAtopIdentScale: s [

	self m00: s;  m11: s;  m22: s.
	^ self


]

{ #category : #'transformations-preident' }
Matrix44 >> loadAtopIdentScale: s about: cnt [
	| t |
	t := 1 - s.

	self m00: s;  m11: s;  m22: s.
	self m30: cnt x * t.
	self m31: cnt y * t.
	self m32: cnt z * t.
	^ self


]

{ #category : #'transformations-preident' }
Matrix44 >> loadAtopIdentScaleX: sx Y: sy Z: sz [

	self m00: sx;  m11: sy;  m22: sz.
	^ self


]

{ #category : #'transformations-preident' }
Matrix44 >> loadAtopIdentScaleX: sx Y: sy Z: sz about: cnt [

	self m00: sx;  m11: sy;  m22: sz.
	self m30: cnt x * (1 - sx).
	self m31: cnt y * (1 - sy).
	self m32: cnt z * (1 - sz).
	^ self


]

{ #category : #'transformations-preident' }
Matrix44 >> loadAtopIdentTranslation: v [

	self m30: v x;  m31: v y;  m32: v z.
	^ self


]

{ #category : #'transformations-preident' }
Matrix44 >> loadAtopIdentTranslationX: tx Y: ty Z: tz [

	self m30: tx;  m31: ty;  m32: tz.
	^ self


]

{ #category : #'ident-and-zero' }
Matrix44 >> loadIdent [

	self setGutsArray: #( 1.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0 1.0 ).
	^ self
]

{ #category : #transformations }
Matrix44 >> loadRotationAxis: axs angle: ang [

	^ self loadRotationNormedAxis: (axs normed) angle: ang
]

{ #category : #transformations }
Matrix44 >> loadRotationAxis: axs angle: ang about: cnt [
	| emm |

	self loadTranslation: cnt neg.
	emm := Matrix44 rotationAxis: axs angle: ang.
	self multAccum: emm.
	emm := Matrix44 translation: cnt.
	^ self
]

{ #category : #transformations }
Matrix44 >> loadRotationNormedAxis: axs angle: ang [

	| co si omc t1 t2 a00 a11 a22 a10 a01 a20 a02 a21 a12 |

	((ang isZero) or: [ axs isZero ])
		ifTrue: [ ^ self loadIdent ].
	
	co := ang cos.  si := ang sin.  omc := 1 - co.

	a00 := co + (axs x squared * omc).
	a11 := co + (axs y squared * omc).
	a22 := co + (axs z squared * omc).

	t1 := axs x * axs y * omc.
	t2 := axs z * si.
	a10 := t1 - t2.  a01 := t1 + t2.

	t1 := axs x * axs z * omc.
	t2 := axs y * si.
	a20 := t1 + t2.  a02 := t1 - t2.

	t1 := axs y * axs z * omc.
	a21 := t1 - t2.  a12 := t1 + t2.

	^ self setGutsArray:
		{ a00 . a01 . a02 . 0.0 .
		  a10 . a11 . a12 . 0.0 .
		  a20 . a21 . a22 . 0.0 .
		  0.0 . 0.0 . 0.0 . 1.0
		}
]

{ #category : #transformations }
Matrix44 >> loadRotationNormedAxis: axs angle: ang about: cnt [
	| emm |

	self loadTranslation: cnt neg.
	emm := Matrix44 rotationNormedAxis: axs angle: ang.
	self multAccum: emm.
	emm := Matrix44 translation: cnt.
	^ self
]

{ #category : #transformations }
Matrix44 >> loadScale: s [

	self loadIdent;
		m00: s;  m11: s;  m22: s.
	^ self


]

{ #category : #transformations }
Matrix44 >> loadScale: s about: cnt [
	| t |
	t := 1 - s.

	self loadIdent.
	self m00: s;  m11: s;  m22: s.
	self m30: cnt x * t.
	self m31: cnt y * t.
	self m32: cnt z * t.
	^ self


]

{ #category : #transformations }
Matrix44 >> loadScaleX: sx Y: sy Z: sz [

	self loadIdent;
		m00: sx;  m11: sy;  m22: sz.
	^ self


]

{ #category : #transformations }
Matrix44 >> loadScaleX: sx Y: sy Z: sz about: cnt [

	self loadIdent.
	self m00: sx;  m11: sy;  m22: sz.
	self m30: cnt x * (1 - sx).
	self m31: cnt y * (1 - sy).
	self m32: cnt z * (1 - sz).
	^ self


]

{ #category : #transformations }
Matrix44 >> loadTranslation: v [

	self loadIdent;
		m30: v x;  m31: v y;  m32: v z.
	^ self


]

{ #category : #transformations }
Matrix44 >> loadTranslationX: tx Y: ty Z: tz [

	self loadIdent;
		m30: tx;  m31: ty;  m32: tz.
	^ self


]

{ #category : #'ident-and-zero' }
Matrix44 >> loadZero [

	self setGutsArray: #( 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ).
	^ self
]

{ #category : #'single-element' }
Matrix44 >> m00 [
	^ m at: 1
]

{ #category : #'single-element' }
Matrix44 >> m00: f [
	^ m at: 1 put: f
]

{ #category : #'single-element' }
Matrix44 >> m01 [
	^ m at: 2
]

{ #category : #'single-element' }
Matrix44 >> m01: f [
	^ m at: 2 put: f
]

{ #category : #'single-element' }
Matrix44 >> m02 [
	^ m at: 3
]

{ #category : #'single-element' }
Matrix44 >> m02: f [
	^ m at: 3 put: f
]

{ #category : #'single-element' }
Matrix44 >> m03 [
	^ m at: 4
]

{ #category : #'single-element' }
Matrix44 >> m03: f [
	^ m at: 4 put: f
]

{ #category : #'single-element' }
Matrix44 >> m10 [
	^ m at: 5
]

{ #category : #'single-element' }
Matrix44 >> m10: f [
	^ m at: 5 put: f
]

{ #category : #'single-element' }
Matrix44 >> m11 [
	^ m at: 6
]

{ #category : #'single-element' }
Matrix44 >> m11: f [
	^ m at: 6 put: f
]

{ #category : #'single-element' }
Matrix44 >> m12 [
	^ m at: 7
]

{ #category : #'single-element' }
Matrix44 >> m12: f [
	^ m at: 7 put: f
]

{ #category : #'single-element' }
Matrix44 >> m13 [
	^ m at: 8
]

{ #category : #'single-element' }
Matrix44 >> m13: f [
	^ m at: 8 put: f
]

{ #category : #'single-element' }
Matrix44 >> m20 [
	^ m at: 9
]

{ #category : #'single-element' }
Matrix44 >> m20: f [
	^ m at: 9 put: f
]

{ #category : #'single-element' }
Matrix44 >> m21 [
	^ m at: 10
]

{ #category : #'single-element' }
Matrix44 >> m21: f [
	^ m at: 10 put: f
]

{ #category : #'single-element' }
Matrix44 >> m22 [
	^ m at: 11
]

{ #category : #'single-element' }
Matrix44 >> m22: f [
	^ m at: 11 put: f
]

{ #category : #'single-element' }
Matrix44 >> m23 [
	^ m at: 12
]

{ #category : #'single-element' }
Matrix44 >> m23: f [
	^ m at: 12 put: f
]

{ #category : #'single-element' }
Matrix44 >> m30 [
	^ m at: 13
]

{ #category : #'single-element' }
Matrix44 >> m30: f [
	^ m at: 13 put: f
]

{ #category : #'single-element' }
Matrix44 >> m31 [
	^ m at: 14
]

{ #category : #'single-element' }
Matrix44 >> m31: f [
	^ m at: 14 put: f
]

{ #category : #'single-element' }
Matrix44 >> m32 [
	^ m at: 15
]

{ #category : #'single-element' }
Matrix44 >> m32: f [
	^ m at: 15 put: f
]

{ #category : #'single-element' }
Matrix44 >> m33 [
	^ m at: 16
]

{ #category : #'single-element' }
Matrix44 >> m33: f [
	^ m at: 16 put: f
]

{ #category : #arithmetic }
Matrix44 >> mult: b [

	| a |
	a := self.
	^ self class newFrom:
		 {  (a m00 * b m00) + (a m01 * b m10) + (a m02 * b m20) + (a m03 * b m30)
		  . (a m00 * b m01) + (a m01 * b m11) + (a m02 * b m21) + (a m03 * b m31)
		  . (a m00 * b m02) + (a m01 * b m12) + (a m02 * b m22) + (a m03 * b m32)
		  . (a m00 * b m03) + (a m01 * b m13) + (a m02 * b m23) + (a m03 * b m33)

		  . (a m10 * b m00) + (a m11 * b m10) + (a m12 * b m20) + (a m13 * b m30)
		  . (a m10 * b m01) + (a m11 * b m11) + (a m12 * b m21) + (a m13 * b m31)
		  . (a m10 * b m02) + (a m11 * b m12) + (a m12 * b m22) + (a m13 * b m32)
		  . (a m10 * b m03) + (a m11 * b m13) + (a m12 * b m23) + (a m13 * b m33)

		  . (a m20 * b m00) + (a m21 * b m10) + (a m22 * b m20) + (a m23 * b m30)
		  . (a m20 * b m01) + (a m21 * b m11) + (a m22 * b m21) + (a m23 * b m31)
		  . (a m20 * b m02) + (a m21 * b m12) + (a m22 * b m22) + (a m23 * b m32)
		  . (a m20 * b m03) + (a m21 * b m13) + (a m22 * b m23) + (a m23 * b m33)

		  . (a m30 * b m00) + (a m31 * b m10) + (a m32 * b m20) + (a m33 * b m30)
		  . (a m30 * b m01) + (a m31 * b m11) + (a m32 * b m21) + (a m33 * b m31)
		  . (a m30 * b m02) + (a m31 * b m12) + (a m32 * b m22) + (a m33 * b m32)
		  . (a m30 * b m03) + (a m31 * b m13) + (a m32 * b m23) + (a m33 * b m33)
		 }
]

{ #category : #arithmetic }
Matrix44 >> multAccum: b [

	| a mm |
	a := self.
	mm :=
		 {  (a m00 * b m00) + (a m01 * b m10) + (a m02 * b m20) + (a m03 * b m30)
		  . (a m00 * b m01) + (a m01 * b m11) + (a m02 * b m21) + (a m03 * b m31)
		  . (a m00 * b m02) + (a m01 * b m12) + (a m02 * b m22) + (a m03 * b m32)
		  . (a m00 * b m03) + (a m01 * b m13) + (a m02 * b m23) + (a m03 * b m33)

		  . (a m10 * b m00) + (a m11 * b m10) + (a m12 * b m20) + (a m13 * b m30)
		  . (a m10 * b m01) + (a m11 * b m11) + (a m12 * b m21) + (a m13 * b m31)
		  . (a m10 * b m02) + (a m11 * b m12) + (a m12 * b m22) + (a m13 * b m32)
		  . (a m10 * b m03) + (a m11 * b m13) + (a m12 * b m23) + (a m13 * b m33)

		  . (a m20 * b m00) + (a m21 * b m10) + (a m22 * b m20) + (a m23 * b m30)
		  . (a m20 * b m01) + (a m21 * b m11) + (a m22 * b m21) + (a m23 * b m31)
		  . (a m20 * b m02) + (a m21 * b m12) + (a m22 * b m22) + (a m23 * b m32)
		  . (a m20 * b m03) + (a m21 * b m13) + (a m22 * b m23) + (a m23 * b m33)

		  . (a m30 * b m00) + (a m31 * b m10) + (a m32 * b m20) + (a m33 * b m30)
		  . (a m30 * b m01) + (a m31 * b m11) + (a m32 * b m21) + (a m33 * b m31)
		  . (a m30 * b m02) + (a m31 * b m12) + (a m32 * b m22) + (a m33 * b m32)
		  . (a m30 * b m03) + (a m31 * b m13) + (a m32 * b m23) + (a m33 * b m33)
		 }.
	self setGutsArray: mm.
	^ self
]

{ #category : #arithmetic }
Matrix44 >> preMult: b [

	^ b mult: self
]

{ #category : #arithmetic }
Matrix44 >> preMultAccum: b [

	| mm |
	mm := b mult: self.
	self setGutsArray: mm gutsArray.
	^ self.
]

{ #category : #arithmetic }
Matrix44 >> scale: s [

	| arr |
	arr := FloatArray basicNew: 16.
	m withIndexDo: [ :val :ind | arr at: ind put: s * val ].
	^ self class newFrom: arr
]

{ #category : #arithmetic }
Matrix44 >> scaleAccum: s [

	| arr |
	arr := FloatArray basicNew: 16.
	m withIndexDo: [ :val :ind | arr at: ind put: s * val ].
	self setGutsArray: arr.
	^ self
]

{ #category : #accessing }
Matrix44 >> setGutsArray: arr [

	m := arr asFloatArray.
	^ self
]

{ #category : #arithmetic }
Matrix44 >> sub: b [

	| a arr |
	a := self.
	arr :=
		 {   (a m00 - b m00)  .  (a m01 - b m01)  .  (a m02 - b m02)  .  (a m03 - b m03)
		  .  (a m10 - b m10)  .  (a m11 - b m11)  .  (a m12 - b m12)  .  (a m13 - b m13)
		  .  (a m20 - b m20)  .  (a m21 - b m21)  .  (a m22 - b m22)  .  (a m23 - b m23)
		  .  (a m30 - b m30)  .  (a m31 - b m31)  .  (a m32 - b m32)  .  (a m33 - b m33)
		 }.
	^ self class newFrom: arr
]

{ #category : #arithmetic }
Matrix44 >> subAccum: b [

	| a arr |
	a := self.
	arr :=
		 {   (a m00 - b m00)  .  (a m01 - b m01)  .  (a m02 - b m02)  .  (a m03 - b m03)
		  .  (a m10 - b m10)  .  (a m11 - b m11)  .  (a m12 - b m12)  .  (a m13 - b m13)
		  .  (a m20 - b m20)  .  (a m21 - b m21)  .  (a m22 - b m22)  .  (a m23 - b m23)
		  .  (a m30 - b m30)  .  (a m31 - b m31)  .  (a m32 - b m32)  .  (a m33 - b m33)
		 }.
	self setGutsArray: arr.
	^ self
]

{ #category : #arithmetic }
Matrix44 >> transpose [

	| a arr |
	a := self.
	arr := {   a m00  .  a m10  .  a m20  .  a m30
			  .  a m01  .  a m11  .  a m21  .  a m31
			  .  a m02  .  a m12  .  a m22  .  a m32
			  .  a m03  .  a m13  .  a m23  .  a m33
			 }.
	^ self class newFrom: arr
]

{ #category : #arithmetic }
Matrix44 >> transposeAccum [

	| a arr |
	a := self.
	arr := {   a m00  .  a m10  .  a m20  .  a m30
			  .  a m01  .  a m11  .  a m21  .  a m31
			  .  a m02  .  a m12  .  a m22  .  a m32
			  .  a m03  .  a m13  .  a m23  .  a m33
			 }.
	self setGutsArray: arr.
	^ self
]

{ #category : #arithmetic }
Matrix44 >> xformVect: v [

	| a |
	a := self.
	^ Vect newx: (a m00 * v x) + (a m10 * v y) + (a m20 * v z) + a m30
				y: (a m01 * v x) + (a m11 * v y) + (a m21 * v z) + a m31
				z: (a m02 * v x) + (a m12 * v y) + (a m22 * v z) + a m32

]

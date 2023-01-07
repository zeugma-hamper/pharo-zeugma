Class {
	#name : #Bolex,
	#superclass : #SpaceThing,
	#instVars : [
		'view_loc',
		'view_aim',
		'view_upp',
		'view_dist',
		'view_hrz_ang_d',
		'view_vrt_ang_d',
		'view_ortho_wid',
		'view_ortho_hei',
		'view_pln_off',
		'prj_typ',
		'near_clip_dst',
		'far_clip_dst'
	],
	#category : #'Zeugma-Rendering'
}

{ #category : #'string-giblets' }
Bolex class >> startOfUpperized: assayStr matchesAllOf: authoritativeStr [

	^ (assayStr asUppercase charactersExactlyMatching: authoritativeStr)
			>= authoritativeStr size
]

{ #category : #'camera-params' }
Bolex >> farClipDist [

	^ far_clip_dst value
]

{ #category : #'camera-params' }
Bolex >> farClipDistZoft [

	^ far_clip_dst
]

{ #category : #initialization }
Bolex >> initialize [

	super initialize.
	view_loc := Zoft newWith: (Vect x: 0.0 y: 0.0 z: 100.0).
	view_aim := Zoft newWith: Vect zAxis negated.
	view_upp := Zoft newWith: Vect yAxis.
	view_dist := Zoft newWith: 100.0.
	view_hrz_ang_d := Zoft newWith: 75.0.
	view_hrz_ang_d := Zoft newWith: 46.69.
	view_ortho_wid := Zoft newWith: 160.0.
	view_ortho_hei := Zoft newWith: 90.0.
	view_pln_off := Zoft newWith: (Vect x: 0.0 y: 0.0 z: 100.0).
	prj_typ := 'PERSPECTIVE'.
	near_clip_dst := Zoft newWith: 0.1.
	far_clip_dst := Zoft newWith: 100.0.
]

{ #category : #'camera-params' }
Bolex >> nearClipDist [

	^ near_clip_dst value
]

{ #category : #'camera-params' }
Bolex >> nearClipDistZoft [

	^ near_clip_dst
]

{ #category : #'camera-params' }
Bolex >> projectionType [

	^ prj_typ
]

{ #category : #'camera-params' }
Bolex >> projectionTypeIsOrthographic [

	^ Bolex startOfUpperized: prj_typ matchesAllOf: 'ORTH'
]

{ #category : #'camera-params' }
Bolex >> projectionTypeIsPerspective [

	^ Bolex startOfUpperized: prj_typ matchesAllOf: 'PERSP'
]

{ #category : #'camera-params' }
Bolex >> setClipDistsNear: nd andFar: fd [

	near_clip_dst set: nd.
	far_clip_dst set: fd.
]

{ #category : #'camera-params' }
Bolex >> setFarClipDist: d [

	far_clip_dst set: d.
]

{ #category : #'camera-params' }
Bolex >> setNearClipDist: d [

	near_clip_dst set: d.
]

{ #category : #'camera-params' }
Bolex >> setProjectionType: pt [

	prj_typ := pt.
]

{ #category : #'camera-params' }
Bolex >> setViewAim: a [

	view_loc set: a.
]

{ #category : #'camera-params' }
Bolex >> setViewDist: d [

	view_dist set: d.
]

{ #category : #'camera-params' }
Bolex >> setViewHorizAngle: ang [

	view_hrz_ang_d set: (ang * 180.0 / Float pi).
]

{ #category : #'camera-params' }
Bolex >> setViewHorizAngleD: angd [

	view_hrz_ang_d set: angd.
]

{ #category : #'camera-params' }
Bolex >> setViewLoc: l [

	view_loc set: l.
]

{ #category : #'camera-params' }
Bolex >> setViewOrthoHei: h [

	view_ortho_hei set: h.
]

{ #category : #'camera-params' }
Bolex >> setViewOrthoWid: w [

	view_ortho_wid set: w.
]

{ #category : #'camera-params' }
Bolex >> setViewPlaneOffset: o [

	view_pln_off set: o.
]

{ #category : #'camera-params' }
Bolex >> setViewUp: u [

	view_upp set: u.
]

{ #category : #'camera-params' }
Bolex >> setViewVertAngle: ang [

	view_vrt_ang_d set: (ang * 180.0 / Float pi).
]

{ #category : #'camera-params' }
Bolex >> setViewVertAngleD: angd [

	view_vrt_ang_d set: angd.
]

{ #category : #'camera-params' }
Bolex >> viewAim [

	^ view_aim value
]

{ #category : #'camera-params' }
Bolex >> viewAimZoft [

	^ view_aim
]

{ #category : #'camera-params' }
Bolex >> viewCOI [

	^ (view_dist value) * (view_aim value) + (view_loc value)
]

{ #category : #'camera-params' }
Bolex >> viewDist [

	^ view_dist value
]

{ #category : #'camera-params' }
Bolex >> viewDistZoft [

	^ view_dist
]

{ #category : #'camera-params' }
Bolex >> viewHorizAngle [

	^ view_hrz_ang_d value * Float pi / 180.0
]

{ #category : #'camera-params' }
Bolex >> viewHorizAngleD [

	^ view_hrz_ang_d value
]

{ #category : #'camera-params' }
Bolex >> viewHorizAngleDZoft [

	^ view_hrz_ang_d
]

{ #category : #'camera-params' }
Bolex >> viewLoc [

	^ view_loc value
]

{ #category : #'camera-params' }
Bolex >> viewLocZoft [

	^ view_loc
]

{ #category : #'camera-params' }
Bolex >> viewOrthoHei [

	^ view_ortho_hei
]

{ #category : #'camera-params' }
Bolex >> viewOrthoHeiZoft [

	^ view_ortho_hei
]

{ #category : #'camera-params' }
Bolex >> viewOrthoWid [

	^ view_ortho_wid
]

{ #category : #'camera-params' }
Bolex >> viewOrthoWidZoft [

	^ view_ortho_wid
]

{ #category : #'camera-params' }
Bolex >> viewPlaneHorizOffset [

	^ view_pln_off x
]

{ #category : #'camera-params' }
Bolex >> viewPlaneOffset [

	^ view_pln_off value
]

{ #category : #'camera-params' }
Bolex >> viewPlaneOffsetZoft [

	^ view_pln_off
]

{ #category : #'camera-params' }
Bolex >> viewPlaneVertOffset [

	^ view_pln_off y
]

{ #category : #'camera-params' }
Bolex >> viewUp [

	^ view_upp value
]

{ #category : #'camera-params' }
Bolex >> viewUpZoft [

	^ view_upp
]

{ #category : #'camera-params' }
Bolex >> viewVertAngle [

	^ view_vrt_ang_d value * Float pi / 180.0
]

{ #category : #'camera-params' }
Bolex >> viewVertAngleD [

	^ view_vrt_ang_d value
]

{ #category : #'camera-params' }
Bolex >> viewVertAngleDZoft [

	^ view_vrt_ang_d
]

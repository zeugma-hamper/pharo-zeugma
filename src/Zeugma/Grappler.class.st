Class {
	#name : #Grappler,
	#superclass : #Zeubject,
	#classVars : [
		'C_ident_mat'
	],
	#category : #'Zeugma-SpatialStructure'
}

{ #category : #initialization }
Grappler class >> initialize [

	C_ident_mat := Matrix44 newIdent.
]

{ #category : #'matrix-access' }
Grappler >> invNrmMat [

	^ C_ident_mat
]

{ #category : #'matrix-access' }
Grappler >> invPntMat [

	^ C_ident_mat
]

{ #category : #'matrix-access' }
Grappler >> nrmMat [

	^ C_ident_mat
]

{ #category : #'matrix-access' }
Grappler >> pntMat [

	^ C_ident_mat
]

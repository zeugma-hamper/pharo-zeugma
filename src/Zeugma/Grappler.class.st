Class {
	#name : #Grappler,
	#superclass : #Zeubject,
	#classVars : [
		'ident_mat'
	],
	#category : #'Zeugma-SpatialStructure'
}

{ #category : #initialization }
Grappler class >> initialize [

	ident_mat := Matrix44 newIdent.
]

{ #category : #'matrix-access' }
Grappler >> invNrmMat [

	^ ident_mat
]

{ #category : #'matrix-access' }
Grappler >> invPntMat [

	^ ident_mat
]

{ #category : #'matrix-access' }
Grappler >> nrmMat [

	^ ident_mat
]

{ #category : #'matrix-access' }
Grappler >> pntMat [

	^ ident_mat
]

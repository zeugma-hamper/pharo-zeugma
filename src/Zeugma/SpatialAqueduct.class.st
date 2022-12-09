Class {
	#name : #SpatialAqueduct,
	#superclass : #EventAqueduct,
	#category : #'Zeugma-Events'
}

{ #category : #configuration }
SpatialAqueduct class >> sampleWandTransform [

	^ STONJSON fromStream: (self sampleWandTransformJSON readStream)
]

{ #category : #configuration }
SpatialAqueduct class >> sampleWandTransformJSON [

	^
'{
  direc_mat : [
    -0.999983,  0.004270,  0.003954,  0.000000,
    0.004259,  0.999987,  -0.002680,  0.000000,
    -0.003965,  -0.002663,  -0.999989,  0.000000,
    0.000000,  0.000000,  0.000000,  1.000000
  ],
  point_mat : [
    -0.999983,  0.004270,  0.003954,  0.000000,
    0.004259,  0.999987,  -0.002680,  0.000000,
    -0.003965,  -0.002663,  -0.999989,  0.000000,
    122.249093,  -101.721171,  -961.508224,  1.000000
  ]
}'
]

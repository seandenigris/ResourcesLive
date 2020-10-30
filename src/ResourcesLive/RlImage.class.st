Class {
	#name : #RlImage,
	#superclass : #RlResource,
	#category : #'ResourcesLive-Core'
}

{ #category : #testing }
RlImage class >> isClassFor: file [
	"I'm abstract"
	^ self ~= RlImage and: [ super isClassFor: file ]
]

{ #category : #accessing }
RlImage >> extent [
	^ RlVisualDimensioner new
			input: self;
			extent
]

{ #category : #accessing }
RlImage >> gtFigureFor: aView [
	<gtView>
	^ aView pannable
		title: 'Picture';
		priority: 1;
		stencil: [ 
			| image |
			image := GtFileUtility imageElementFromFileReference: self file.
			BlElement new
				addChild: image;
				yourself ]
]
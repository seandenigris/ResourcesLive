importing
import: resourceable moving: shouldMove
	"Either move or copy the resource into the proper location"

	| destinationFile sourceFile resource |
	resource := resourceable asRlResource.
	sourceFile := resource file.
	destinationFile := self locationFor: sourceFile basename.	
	self assert: destinationFile exists not.
	shouldMove
		ifTrue: [	 sourceFile moveTo: destinationFile ]
		ifFalse: [ sourceFile copyTo: destinationFile ].
	resource
		file: destinationFile;
		originalFile: sourceFile asFileReference;
		importTimestamp: DateAndTime now translateToUTC.
	^ resources add: resource.
Extension { #name : #RlResourceLibrary }

{ #category : #'*ResourcesLive-GToolkit' }
RlResourceLibrary >> gtViewResourcesOn: aView [
	<gtView>
	^ aView columnedList
		title: 'Resources' translated;
		priority: 5;
		items: [ self resources ];
		column: 'Type' text: [ :res | (res class name allButFirst: 2) normalizeCamelCase ] width: 125;
		column: 'File' text: [ :res | res file fullName ]
]

{ #category : #'*ResourcesLive-GToolkit' }
RlResourceLibrary class >> gtViewSingletonOn: aView [
	<gtClassView>
	^ aView forward
		title: 'Singleton';
		priority: 100;
		object: [ self uniqueInstance ];
		view: #gtViewResourcesOn:
]

GT
gtInspectorResourcesIn: composite

	| list |
	list := composite list.
	list dynamicActionsOnSelection: [ :pres |
		| actions |
		actions := OrderedCollection new.
		pres selection magritteActionDescriptions do: [ :desc |
			| action |
			action := GLMGenericAction new
				action: [ pres selection perform: desc selector ];
				title: desc label;
				shortcut: desc label first lowercase;
				yourself.
			actions add: action ].
		actions ].
	^ list
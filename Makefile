genhl:
	haxe -cp generator  -lib webidl --macro "houdiniengine.Generator.generateCpp()"
	
genjs:
	haxe -cp generator -lib webidl --macro "houdiniengine.Generator.generateJs()"

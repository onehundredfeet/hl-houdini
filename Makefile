genhl:
	haxe -cp generator  -lib hl-idl --macro "houdiniengine.Generator.generateCpp()"
	
genjs:
	haxe -cp generator -lib hl-idl --macro "houdiniengine.Generator.generateJs()"

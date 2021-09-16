package houdini;

typedef Native = haxe.macro.MacroType<[webidl.Module.build({ idlFile : "generator/houdiniengine.idl", chopPrefix : "bt,t", autoGC : true, nativeLib : "houdiniengine" })]>;

package houdiniengine;

#if eval
class Generator {

	// Put any necessary includes in this string and they will be added to the generated files
	static var INCLUDE = "
#ifdef _WIN32
#pragma warning(disable:4305)
#pragma warning(disable:4244)
#pragma warning(disable:4316)
#endif

";


	static var options = { idlFile : "src/houdiniengine.idl", nativeLib : "houdiniengine", outputDir : "src", includeCode : INCLUDE, autoGC : true };

	public static function generateCpp() {
		webidl.Generate.generateCpp(options);
	}


//Not currently supported, but likely very easy to get going
	public static function generateJs() {
		// ammo.js params
		var debug = false;
		var defines = debug ? [] : ["NO_EXIT_RUNTIME=1", "NO_FILESYSTEM=1", "AGGRESSIVE_VARIABLE_ELIMINATION=1", "ELIMINATE_DUPLICATE_FUNCTIONS=1", "NO_DYNAMIC_EXECUTION=1"];
		var params = ["-O"+(debug?0:3), "--llvm-lto", "1", "-I", "../../include/houdiniengine/src"];
		for( d in defines ) {
			params.push("-s");
			params.push(d);
		}
		webidl.Generate.generateJs(options, getFiles(), params);
	}

}
#end
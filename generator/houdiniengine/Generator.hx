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

#include <HAPI/HAPI.h>
#include <HAPI/HAPI_API.h>
#include <HAPI/HAPI_Common.h>
#include <HAPI/HAPI_Helpers.h>
";


	static var options = { idlFile : "generator/houdiniengine.idl", nativeLib : "houdiniengine", outputDir : "src", includeCode : INCLUDE, autoGC : true };

	public static function generateCpp() {
		webidl.Generate.generateCpp(options);
	}



}
#end
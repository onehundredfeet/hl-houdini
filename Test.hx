package;

import houdini.Native;

class Test {

	public static function main() {

        trace("New");

        var x = new ServerOptions();
        trace("Set");
        
        x.autoClose = true;
        x.timeoutMs = 10000;

        trace("Start");
        
        x.startSocketServer(6010, null);        

        trace ("started");

        var s = new Session();
        trace("Session");
        s.connectBySocket("localhost", 6010);

        trace("Cook options");
        var co = new CookOptions();

        trace("Initializing");

        s.initialize(co, false, -1, null,null, null, null, null );

        //trace("load library");
        //var libId = s.loadAssetLibraryFromFile( "Path", true);

        trace("load HIP file");
        s.loadHIP( "assets/test.hiplc", true );

        trace("Cleanup");
        s.cleanup();

        trace("End");
    }

}


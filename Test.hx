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
        trace("End");
    }

}


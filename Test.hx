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
        
        var pid = x.startSocketServer(6010);        

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

        var mn = s.getManagerNode(HAPI_NodeType.HAPI_NODETYPE_OBJ);

        trace("Manager node " + mn);
       
        trace ("Node Type HAPI_NODETYPE_ANY " + (HAPI_NodeType.HAPI_NODETYPE_ANY).ToInt());
        trace ("Node Type HAPI_NODETYPE_OBJ" + (HAPI_NodeType.HAPI_NODETYPE_OBJ).ToInt());
        trace ("Node Type HAPI_NODETYPE_SOP" + (HAPI_NodeType.HAPI_NODETYPE_SOP).ToInt());
        
        var kids = s.getChildNodeList(mn,(HAPI_NodeType.HAPI_NODETYPE_OBJ).ToInt() , (HAPI_NodeFlags.HAPI_NODEFLAGS_ANY).ToInt(), false);
        trace("kids " + kids);

        trace("Cleanup");
        s.cleanup();

        trace("End");
    }

}


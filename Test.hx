package;

import houdini.Native;
using Lambda;

class Test {

	public static function main() {

        Session.cacheStringType("");
        
        trace("New");

        var x = new ServerOptions();
        trace("Set");
        
        x.autoClose = true;
        x.timeoutMs = 10000;

        trace("Start");
        
        var pid = x.startSocketServer(6012);        

        trace ("started");

        var s = new Session();
        trace("Session");
        s.connectBySocket("localhost", 6012);

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
       
        var mNode = new houdini.Node( s, mn);
        trace(mNode);

        var info = new NodeInfo();
        s.getNodeInfo(mn, info);
        trace("Is valid: " + info.isValid);
        trace("name = " + mNode.get_name());
        trace("parmCount: " + info.parmCount + " | " + mNode.parmCount());
        
        trace("childNodeCount: " + info.childNodeCount + " | " + mNode.childCount());
        trace("inputCount: " + info.inputCount);
        trace("outputCount: " + info.outputCount);


        // this paradigm needs to be changed
        var kids = s.getChildNodeList(mn,(HAPI_NodeType.HAPI_NODETYPE_OBJ).toValue() , (HAPI_NodeFlags.HAPI_NODEFLAGS_ANY).toValue(), false);
        var kidNodes = mNode.getChildren(true);

        trace("kids " + kids + " | " + kidNodes.map(function(x) x.get_name()));


        
        
        trace("Cleanup");
        s.cleanup();

        trace("End");
    }

}


package houdini;
using Lambda;

class Node {
    public function new(session : Native.Session, id : Int) {
        _id = id;
        _session = session;
    }

    public function get_name() : String {
        return _session.getString(nodeInfo().nameSH);
    }

    var _id : Int;
    var _session : Native.Session;
    var _info : Native.NodeInfo;

    function get_id() : Int {
        return _id;
    }
    function  nodeInfo( forceRefresh = false)  {
        if (!forceRefresh && _info != null) return _info;

        _info = new Native.NodeInfo();
        _session.getNodeInfo( _id, _info);
        return _info;
    }

    public function childCount() {
        return nodeInfo().childNodeCount;
    }
    public function parmCount() {
        return nodeInfo().parmCount;
    }

    public function getChildren(decendants = false) {
        var kids = _session.getChildNodeList(_id,(Native.HAPI_NodeType.HAPI_NODETYPE_ANY).ToInt() , (Native.HAPI_NodeFlags.HAPI_NODEFLAGS_ANY).ToInt(), decendants);

        var nodes : Array<Node> = [];
        for(i in 0...kids.length) {
            nodes.push(new Node(_session, kids[i]));
        }

        return nodes;
    }

}
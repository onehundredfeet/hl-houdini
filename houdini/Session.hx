package houdini;




function Connect() {
    var x = new Native.ServerOptions();

    x.autoClose = true;
    x.timeoutMs = 10000;

    x.startSocketServer(6010, null);

    var s = new Native.Session();
    s.connectBySocket();
}
module hunt.net.NetServer;

import hunt.net.AsynchronousTcpSession;
import hunt.net.NetEvent;
import hunt.net.Result;
import hunt.net.NetSocket;
import hunt.net.Server;
import hunt.net.Config;

import hunt.event.EventLoop;
import hunt.io;
import hunt.logging;
import std.conv;

alias ListenHandler = void delegate(Result!NetServer);

class NetServer : AbstractServer {
    private string _host = "0.0.0.0";
    private int _port = 8080;
    private int _sessionId;
    private Config _config;
    private NetEvent netEvent;
    private AsynchronousTcpSession tcpSession;
    private EventLoop _loop;
    private TcpListener _listener;
    private Handler _handler;

    protected bool _isStarted;

    int actualPort() {
        return to!int(_listener.localAddress.toPortString());
    }

    void close() {
        stop();
    }

    NetServer connectHandler(Handler handler) {
        _handler = handler;

        return this;
    }

    NetServer listen(int port = 0, string host = "0.0.0.0", ListenHandler handler = null) {
        // if (config == null)
        //     throw new NetException("server configuration is null");

        _host = host;
        _port = port;
        bool suc = true;
        Result!NetServer result = null;
        try {
            _listener = new TcpListener(_loop);
            _listener.bind(_host, cast(ushort) _port);
            _listener.listen(1024);

            _listener.onConnectionAccepted((TcpListener sender, TcpStream stream) {
                _sessionId++;
                AsynchronousTcpSession session = new AsynchronousTcpSession(_sessionId,
                    _config, netEvent, stream);
                if (_config !is null)
                    netEvent.notifySessionOpened(session);
                if (_handler !is null)
                    _handler(session);
            });

            _listener.start();
            _isStarted = true;
            result = new Result!NetServer(this);
        }
        catch (Exception e) {
            warning(e.message);
            result = new Result!NetServer(e);
            if (_config !is null)
                _config.getHandler().failedOpeningSession(0, e);
        }

        if (handler !is null)
            handler(result);

        return this;
    }

    void setConfig(Config config) {
        _config = config;
        netEvent = new DefaultNetEvent(config);
    }

    void listen(string host, int port) {
        listen(port, host);
    }

    override protected void initilize() {
        listen(_port, _host);
    }

    override protected void destroy() {
        if (_listener !is null)
            _listener.close();
    }

    EventLoop eventLoop() {
        return _loop;
    }

package:
    this(EventLoop loop) {
        _loop = loop;
    }

}

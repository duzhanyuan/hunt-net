module hunt.net.NetSocket;

import hunt.net.AsyncResult;
import hunt.collection.ByteBuffer;
import hunt.Functions;
import hunt.io.channel;
import hunt.io.TcpStream;
import hunt.logging.ConsoleLogger;
import hunt.util.Common;

import std.socket;

alias ConnectHandler = void delegate(AsyncResult!NetSocket);

alias NetEventHandler(E) = void delegate(E event);

alias Handler = void delegate(NetSocket sock);

///
class NetSocket {
    protected TcpStream _tcp;
    private SimpleEventHandler _closeHandler;
    private DataReceivedHandler _dataReceivedHandler;

    ///
    this(TcpStream tcp) {
        _tcp = tcp;
        _tcp.onClosed(&onClosed);
        _tcp.onReceived(&onDataReceived);
    }

    ///
    NetSocket handler(DataReceivedHandler handler) {
        _dataReceivedHandler = handler;
        return this;
    }

    protected void onDataReceived(ByteBuffer buffer) {
        version(HUNT_DEBUG) { 
            auto data = cast(ubyte[]) buffer.getRemaining();
            infof("data received (%d bytes): ", data.length); 
            version(HUNT_IO_MORE) {
            if(data.length<=64)
                infof("%(%02X %)", data[0 .. $]);
            else
                infof("%(%02X %) ...", data[0 .. 64]);
            }
        }      

        if(_dataReceivedHandler !is null) {
            _dataReceivedHandler(buffer);
        }
    }

    ///
    void close() {
        _tcp.close();
    }
    
    ////
    NetSocket closeHandler(SimpleEventHandler handler) {
        _tcp.closeHandler = &onClosed;
        _closeHandler = handler;
        return this;
    }

    protected void onClosed() {
        if(_closeHandler !is null)
            _closeHandler();
    }
    

    ///
    @property Address localAddress() {
        return _tcp.localAddress;
    }
    
    ////
    @property Address remoteAddress() {
        return _tcp.remoteAddress;
    }

    ////
    NetSocket write(const(ubyte)[] data) {
        version (HUNT_IO_MORE) {
            if (data.length <= 32)
                infof("%d bytes: %(%02X %)", data.length, data[0 .. $]);
            else
                infof("%d bytes: %(%02X %)", data.length, data[0 .. 32]);
        }
        _tcp.write(data);
        return this;
    }

    ////
    NetSocket write(string str) {
        return write(cast(ubyte[]) str);
    }

    NetSocket write(ByteBuffer buffer) {
        _tcp.write(buffer);
        return this;
    }

    TcpStream getTcpStream() {
        return _tcp;
    }

}



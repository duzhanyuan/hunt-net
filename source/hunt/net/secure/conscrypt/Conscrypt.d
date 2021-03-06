module hunt.net.secure.conscrypt.Conscrypt;

// dfmt off
version(WITH_HUNT_SECURITY):
// dfmt on

import hunt.net.secure.conscrypt.AbstractConscryptEngine;
import hunt.net.secure.conscrypt.ApplicationProtocolSelector;
import hunt.net.secure.conscrypt.NativeConstants;

import hunt.net.ssl.SSLEngine;


import hunt.net.Exceptions;
import hunt.Exceptions;

/**
 * Core API for creating and configuring all Conscrypt types.
 */

final class Conscrypt {
    private this() {}

    /**
     * Returns {@code true} if the Conscrypt native library has been successfully loaded.
     */
    static bool isAvailable() {
        try {
            checkAvailability();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * Checks that the Conscrypt support is available for the system.
     *
     * @throws UnsatisfiedLinkError if unavailable
     */
    static void checkAvailability() {
        // NativeCrypto.checkAvailability();
    }

    /**
     * Indicates whether the given {@link Provider} was created by this distribution of Conscrypt.
     */
    // static bool isConscrypt(Provider provider) {
    //     return provider instanceof OpenSSLProvider;
    // }

    /**
     * Constructs a new {@link Provider} with the default name.
     */
    // static Provider newProvider() {
    //     checkAvailability();
    //     return new OpenSSLProvider();
    // }

    /**
     * Constructs a new {@link Provider} with the given name.
     */
    // static Provider newProvider(string providerName) {
    //     checkAvailability();
    //     return new OpenSSLProvider(providerName);
    // }

    /**
     * Returns the maximum length (in bytes) of an encrypted packet.
     */
    static int maxEncryptedPacketLength() {
        return NativeConstants.SSL3_RT_MAX_PACKET_SIZE;
    }

    // /**
    //  * Gets the default X.509 trust manager.
    //  */
    // @ExperimentalApi
    // static X509TrustManager getDefaultX509TrustManager()  {
    //     checkAvailability();
    //     return SSLParametersImpl.getDefaultX509TrustManager();
    // }

    // /**
    //  * Indicates whether the given {@link SSLContext} was created by this distribution of Conscrypt.
    //  */
    // static bool isConscrypt(SSLContext context) {
    //     return context.getProvider() instanceof OpenSSLProvider;
    // }

    // /**
    //  * Constructs a new instance of the preferred {@link SSLContextSpi}.
    //  */
    // static SSLContextSpi newPreferredSSLContextSpi() {
    //     checkAvailability();
    //     return OpenSSLContextImpl.getPreferred();
    // }

    // /**
    //  * Sets the client-side persistent cache to be used by the context.
    //  */
    // static void setClientSessionCache(SSLContext context, SSLClientSessionCache cache) {
    //     SSLSessionContext clientContext = context.getClientSessionContext();
    //     if (!(clientContext instanceof ClientSessionContext)) {
    //         throw new IllegalArgumentException(
    //                 "Not a conscrypt client context: " ~ clientContext.getClass().getName());
    //     }
    //     ((ClientSessionContext) clientContext).setPersistentCache(cache);
    // }

    // /**
    //  * Sets the server-side persistent cache to be used by the context.
    //  */
    // static void setServerSessionCache(SSLContext context, SSLServerSessionCache cache) {
    //     SSLSessionContext serverContext = context.getServerSessionContext();
    //     if (!(serverContext instanceof ServerSessionContext)) {
    //         throw new IllegalArgumentException(
    //                 "Not a conscrypt client context: " ~ serverContext.getClass().getName());
    //     }
    //     ((ServerSessionContext) serverContext).setPersistentCache(cache);
    // }

    /**
     * Indicates whether the given {@link SSLSocketFactory} was created by this distribution of
     * Conscrypt.
     */
    // static bool isConscrypt(SSLSocketFactory factory) {
    //     return typeid(factory) == typeid(OpenSSLSocketFactoryImpl);
    // }

    // private static OpenSSLSocketFactoryImpl toConscrypt(SSLSocketFactory factory) {
    //     if (!isConscrypt(factory)) {
    //         throw new IllegalArgumentException(
    //                 "Not a conscrypt socket factory: " ~ factory.getClass().getName());
    //     }
    //     return (OpenSSLSocketFactoryImpl) factory;
    // }

    // /**
    //  * Configures the default socket to be created for all socket factory instances.
    //  */
    // @ExperimentalApi
    // static void setUseEngineSocketByDefault(bool useEngineSocket) {
    //     OpenSSLSocketFactoryImpl.setUseEngineSocketByDefault(useEngineSocket);
    //     OpenSSLServerSocketFactoryImpl.setUseEngineSocketByDefault(useEngineSocket);
    // }

    // /**
    //  * Configures the socket to be created for the given socket factory instance.
    //  */
    // @ExperimentalApi
    // static void setUseEngineSocket(SSLSocketFactory factory, bool useEngineSocket) {
    //     toConscrypt(factory).setUseEngineSocket(useEngineSocket);
    // }

    // /**
    //  * Indicates whether the given {@link SSLServerSocketFactory} was created by this distribution
    //  * of Conscrypt.
    //  */
    // static bool isConscrypt(SSLServerSocketFactory factory) {
    //     return factory instanceof OpenSSLServerSocketFactoryImpl;
    // }

    // private static OpenSSLServerSocketFactoryImpl toConscrypt(SSLServerSocketFactory factory) {
    //     if (!isConscrypt(factory)) {
    //         throw new IllegalArgumentException(
    //                 "Not a conscrypt server socket factory: " ~ factory.getClass().getName());
    //     }
    //     return (OpenSSLServerSocketFactoryImpl) factory;
    // }

    // /**
    //  * Configures the socket to be created for the given server socket factory instance.
    //  */
    // @ExperimentalApi
    // static void setUseEngineSocket(SSLServerSocketFactory factory, bool useEngineSocket) {
    //     toConscrypt(factory).setUseEngineSocket(useEngineSocket);
    // }

    // /**
    //  * Indicates whether the given {@link SSLSocket} was created by this distribution of Conscrypt.
    //  */
    // static bool isConscrypt(SSLSocket socket) {
    //     return socket instanceof AbstractConscryptSocket;
    // }

    // private static AbstractConscryptSocket toConscrypt(SSLSocket socket) {
    //     if (!isConscrypt(socket)) {
    //         throw new IllegalArgumentException(
    //                 "Not a conscrypt socket: " ~ socket.getClass().getName());
    //     }
    //     return (AbstractConscryptSocket) socket;
    // }

    // /**
    //  * This method enables Server Name Indication (SNI) and overrides the hostname supplied
    //  * during socket creation.  If the hostname is not a valid SNI hostname, the SNI extension
    //  * will be omitted from the handshake.
    //  *
    //  * @param socket the socket
    //  * @param hostname the desired SNI hostname, or null to disable
    //  */
    // static void setHostname(SSLSocket socket, string hostname) {
    //     toConscrypt(socket).setHostname(hostname);
    // }

    // /**
    //  * Returns either the hostname supplied during socket creation or via
    //  * {@link #setHostname(SSLSocket, string)}. No DNS resolution is attempted before
    //  * returning the hostname.
    //  */
    // static string getHostname(SSLSocket socket) {
    //     return toConscrypt(socket).getHostname();
    // }

    // /**
    //  * This method attempts to create a textual representation of the peer host or IP. Does
    //  * not perform a reverse DNS lookup. This is typically used during session creation.
    //  */
    // static string getHostnameOrIP(SSLSocket socket) {
    //     return toConscrypt(socket).getHostnameOrIP();
    // }

    // /**
    //  * This method enables session ticket support.
    //  *
    //  * @param socket the socket
    //  * @param useSessionTickets True to enable session tickets
    //  */
    // static void setUseSessionTickets(SSLSocket socket, bool useSessionTickets) {
    //     toConscrypt(socket).setUseSessionTickets(useSessionTickets);
    // }

    // /**
    //  * Enables/disables TLS Channel ID for the given server-side socket.
    //  *
    //  * <p>This method needs to be invoked before the handshake starts.
    //  *
    //  * @param socket the socket
    //  * @param enabled Whether to enable channel ID.
    //  * @throws IllegalStateException if this is a client socket or if the handshake has already
    //  * started.
    //  */
    // static void setChannelIdEnabled(SSLSocket socket, bool enabled) {
    //     toConscrypt(socket).setChannelIdEnabled(enabled);
    // }

    // /**
    //  * Gets the TLS Channel ID for the given server-side socket. Channel ID is only available
    //  * once the handshake completes.
    //  *
    //  * @param socket the socket
    //  * @return channel ID or {@code null} if not available.
    //  * @throws IllegalStateException if this is a client socket or if the handshake has not yet
    //  * completed.
    //  * @throws SSLException if channel ID is available but could not be obtained.
    //  */
    // static byte[] getChannelId(SSLSocket socket) {
    //     return toConscrypt(socket).getChannelId();
    // }

    // /**
    //  * Sets the {@link PrivateKey} to be used for TLS Channel ID by this client socket.
    //  *
    //  * <p>This method needs to be invoked before the handshake starts.
    //  *
    //  * @param socket the socket
    //  * @param privateKey private key (enables TLS Channel ID) or {@code null} for no key
    //  * (disables TLS Channel ID).
    //  * The private key must be an Elliptic Curve (EC) key based on the NIST P-256 curve (aka
    //  * SECG secp256r1 or ANSI
    //  * X9.62 prime256v1).
    //  * @throws IllegalStateException if this is a server socket or if the handshake has already
    //  * started.
    //  */
    // static void setChannelIdPrivateKey(SSLSocket socket, PrivateKey privateKey) {
    //     toConscrypt(socket).setChannelIdPrivateKey(privateKey);
    // }

    // /**
    //  * Returns the ALPN protocol agreed upon by client and server.
    //  *
    //  * @param socket the socket
    //  * @return the selected protocol or {@code null} if no protocol was agreed upon.
    //  */
    // static string getApplicationProtocol(SSLSocket socket) {
    //     return toConscrypt(socket).getApplicationProtocol();
    // }

    /**
     * Sets an application-provided ALPN protocol selector. If provided, this will override
     * the list of protocols set by {@link #setApplicationProtocols(SSLSocket, string[])}.
     *
     * @param socket the socket
     * @param selector the ALPN protocol selector
     */
    // static void setApplicationProtocolSelector(SSLSocket socket,
    //     ApplicationProtocolSelector selector) {
    //     toConscrypt(socket).setApplicationProtocolSelector(selector);
    // }

    // /**
    //  * Sets the application-layer protocols (ALPN) in prioritization order.
    //  *
    //  * @param socket the socket being configured
    //  * @param protocols the protocols in descending order of preference. If empty, no protocol
    //  * indications will be used. This array will be copied.
    //  * @throws IllegalArgumentException - if protocols is null, or if any element in a non-empty
    //  * array is null or an empty (zero-length) string
    //  */
    // static void setApplicationProtocols(SSLSocket socket, string[] protocols) {
    //     toConscrypt(socket).setApplicationProtocols(protocols);
    // }

    // /**
    //  * Gets the application-layer protocols (ALPN) in prioritization order.
    //  *
    //  * @param socket the socket
    //  * @return the protocols in descending order of preference, or an empty array if protocol
    //  * indications are not being used. Always returns a new array.
    //  */
    // static string[] getApplicationProtocols(SSLSocket socket) {
    //     return toConscrypt(socket).getApplicationProtocols();
    // }

    // /**
    //  * Returns the tls-unique channel binding value for this connection, per RFC 5929.  This
    //  * will return {@code null} if there is no such value available, such as if the handshake
    //  * has not yet completed or this connection is closed.
    //  */
    // static byte[] getTlsUnique(SSLSocket socket) {
    //     return toConscrypt(socket).getTlsUnique();
    // }

    // /**
    //  * Enables token binding parameter negotiation on this socket, or disables it if an
    //  * empty set of parameters are provided.
    //  *
    //  * <p>This method needs to be invoked before the handshake starts.
    //  *
    //  * <p>Token binding is currently an Internet Draft that's subject to change, so the
    //  * current implementation may not be compatible with future changes in the protocol.
    //  *
    //  * @param params a list of Token Binding key parameters in descending order of preference,
    //  * as described in draft-ietf-tokbind-negotiation-09.
    //  * @throws IllegalStateException if the handshake has already started.
    //  * @throws SSLException if the setting could not be applied.
    //  */
    // @ExperimentalApi
    // static void setTokenBindingParams(SSLSocket socket, int... params) {
    //     toConscrypt(socket).setTokenBindingParams(params);
    // }

    // /**
    //  * Returns the token binding parameters that were negotiated during the handshake, or -1 if
    //  * token binding parameters were not negotiated, the handshake has not yet completed,
    //  * or the connection has been closed.
    //  */
    // @ExperimentalApi
    // static int getTokenBindingParams(SSLSocket socket) {
    //     return toConscrypt(socket).getTokenBindingParams();
    // }

    // /**
    //  * Exports a value derived from the TLS master secret as described in RFC 5705.
    //  *
    //  * @param label the label to use in calculating the exported value.  This must be
    //  * an ASCII-only string.
    //  * @param context the application-specific context value to use in calculating the
    //  * exported value.  This may be {@code null} to use no application context, which is
    //  * treated differently than an empty byte array.
    //  * @param length the number of bytes of keying material to return.
    //  * @return a value of the specified length, or {@code null} if the handshake has not yet
    //  * completed or the connection has been closed.
    //  * @throws SSLException if the value could not be exported.
    //  */
    // static byte[] exportKeyingMaterial(SSLSocket socket, string label, byte[] context,
    //         int length) {
    //     return toConscrypt(socket).exportKeyingMaterial(label, context, length);
    // }

    /**
     * Indicates whether the given {@link SSLEngine} was created by this distribution of Conscrypt.
     */
    static bool isConscrypt(SSLEngine engine) {
        AbstractConscryptEngine e = cast(AbstractConscryptEngine)engine;
        return e !is null;
        // return typeid(engine) == typeid(AbstractConscryptEngine);
    }

    private static AbstractConscryptEngine toConscrypt(SSLEngine engine) {
        if (!isConscrypt(engine)) {
            throw new IllegalArgumentException(
                    "Not a conscrypt engine: " ~ typeid(engine).name);
        }
        return cast(AbstractConscryptEngine) engine;
    }

    // /**
    //  * Provides the given engine with the provided bufferAllocator.
    //  */
    // @ExperimentalApi
    // static void setBufferAllocator(SSLEngine engine, BufferAllocator bufferAllocator) {
    //     toConscrypt(engine).setBufferAllocator(bufferAllocator);
    // }

    // /**
    //  * Configures the default {@link BufferAllocator} to be used by all future
    //  * {@link SSLEngine} instances from this provider.
    //  */
    // @ExperimentalApi
    // static void setDefaultBufferAllocator(BufferAllocator bufferAllocator) {
    //     ConscryptEngine.setDefaultBufferAllocator(bufferAllocator);
    // }

    // /**
    //  * This method enables Server Name Indication (SNI) and overrides the hostname supplied
    //  * during engine creation.
    //  *
    //  * @param engine the engine
    //  * @param hostname the desired SNI hostname, or {@code null} to disable
    //  */
    // static void setHostname(SSLEngine engine, string hostname) {
    //     toConscrypt(engine).setHostname(hostname);
    // }

    // /**
    //  * Returns either the hostname supplied during socket creation or via
    //  * {@link #setHostname(SSLEngine, string)}. No DNS resolution is attempted before
    //  * returning the hostname.
    //  */
    // static string getHostname(SSLEngine engine) {
    //     return toConscrypt(engine).getHostname();
    // }

    // /**
    //  * Returns the maximum overhead, in bytes, of sealing a record with SSL.
    //  */
    // static int maxSealOverhead(SSLEngine engine) {
    //     return toConscrypt(engine).maxSealOverhead();
    // }

    /**
     * Sets a listener on the given engine for completion of the TLS handshake
     */
    static void setHandshakeListener(SSLEngine engine, HandshakeListener handshakeListener) {
        toConscrypt(engine).setHandshakeListener(handshakeListener);
    }

    // /**
    //  * Enables/disables TLS Channel ID for the given server-side engine.
    //  *
    //  * <p>This method needs to be invoked before the handshake starts.
    //  *
    //  * @param engine the engine
    //  * @param enabled Whether to enable channel ID.
    //  * @throws IllegalStateException if this is a client engine or if the handshake has already
    //  * started.
    //  */
    // static void setChannelIdEnabled(SSLEngine engine, bool enabled) {
    //     toConscrypt(engine).setChannelIdEnabled(enabled);
    // }

    // /**
    //  * Gets the TLS Channel ID for the given server-side engine. Channel ID is only available
    //  * once the handshake completes.
    //  *
    //  * @param engine the engine
    //  * @return channel ID or {@code null} if not available.
    //  * @throws IllegalStateException if this is a client engine or if the handshake has not yet
    //  * completed.
    //  * @throws SSLException if channel ID is available but could not be obtained.
    //  */
    // static byte[] getChannelId(SSLEngine engine) {
    //     return toConscrypt(engine).getChannelId();
    // }

    // /**
    //  * Sets the {@link PrivateKey} to be used for TLS Channel ID by this client engine.
    //  *
    //  * <p>This method needs to be invoked before the handshake starts.
    //  *
    //  * @param engine the engine
    //  * @param privateKey private key (enables TLS Channel ID) or {@code null} for no key
    //  * (disables TLS Channel ID).
    //  * The private key must be an Elliptic Curve (EC) key based on the NIST P-256 curve (aka
    //  * SECG secp256r1 or ANSI X9.62 prime256v1).
    //  * @throws IllegalStateException if this is a server engine or if the handshake has already
    //  * started.
    //  */
    // static void setChannelIdPrivateKey(SSLEngine engine, PrivateKey privateKey) {
    //     toConscrypt(engine).setChannelIdPrivateKey(privateKey);
    // }

    // /**
    //  * Extended unwrap method for multiple source and destination buffers.
    //  *
    //  * @param engine the target engine for the unwrap
    //  * @param srcs the source buffers
    //  * @param dsts the destination buffers
    //  * @return the result of the unwrap operation
    //  * @throws SSLException thrown if an SSL error occurred
    //  */
    // static SSLEngineResult unwrap(SSLEngine engine, final ByteBuffer[] srcs,
    //         final ByteBuffer[] dsts) {
    //     return toConscrypt(engine).unwrap(srcs, dsts);
    // }

    // /**
    //  * Exteneded unwrap method for multiple source and destination buffers.
    //  *
    //  * @param engine the target engine for the unwrap.
    //  * @param srcs the source buffers
    //  * @param srcsOffset the offset in the {@code srcs} array of the first source buffer
    //  * @param srcsLength the number of source buffers starting at {@code srcsOffset}
    //  * @param dsts the destination buffers
    //  * @param dstsOffset the offset in the {@code dsts} array of the first destination buffer
    //  * @param dstsLength the number of destination buffers starting at {@code dstsOffset}
    //  * @return the result of the unwrap operation
    //  * @throws SSLException thrown if an SSL error occurred
    //  */
    // static SSLEngineResult unwrap(SSLEngine engine, final ByteBuffer[] srcs, int srcsOffset,
    //         final int srcsLength, final ByteBuffer[] dsts, final int dstsOffset,
    //         final int dstsLength) {
    //     return toConscrypt(engine).unwrap(
    //             srcs, srcsOffset, srcsLength, dsts, dstsOffset, dstsLength);
    // }

    // /**
    //  * This method enables session ticket support.
    //  *
    //  * @param engine the engine
    //  * @param useSessionTickets True to enable session tickets
    //  */
    // static void setUseSessionTickets(SSLEngine engine, bool useSessionTickets) {
    //     toConscrypt(engine).setUseSessionTickets(useSessionTickets);
    // }

    // /**
    //  * Sets the application-layer protocols (ALPN) in prioritization order.
    //  *
    //  * @param engine the engine being configured
    //  * @param protocols the protocols in descending order of preference. If empty, no protocol
    //  * indications will be used.  This array will be copied.
    //  * @throws IllegalArgumentException - if protocols is null, or if any element in a non-empty
    //  * array is null or an empty (zero-length) string
    //  */
    static void setApplicationProtocols(SSLEngine engine, string[] protocols) {
        toConscrypt(engine).setApplicationProtocols(protocols);
    }

    /**
     * Gets the application-layer protocols (ALPN) in prioritization order.
     *
     * @param engine the engine
     * @return the protocols in descending order of preference, or an empty array if protocol
     * indications are not being used. Always returns a new array.
     */
    static string[] getApplicationProtocols(SSLEngine engine) {
        return toConscrypt(engine).getApplicationProtocols();
    }

    /**
     * Sets an application-provided ALPN protocol selector. If provided, this will override
     * the list of protocols set by {@link #setApplicationProtocols(SSLEngine, string[])}.
     *
     * @param engine the engine
     * @param selector the ALPN protocol selector
     */
    static void setApplicationProtocolSelector(SSLEngine engine,
        ApplicationProtocolSelector selector) {
        toConscrypt(engine).setApplicationProtocolSelector(selector);
    }

    /**
     * Returns the ALPN protocol agreed upon by client and server.
     *
     * @param engine the engine
     * @return the selected protocol or {@code null} if no protocol was agreed upon.
     */
    static string getApplicationProtocol(SSLEngine engine) {
        return toConscrypt(engine).getApplicationProtocol();
    }

    // /**
    //  * Returns the tls-unique channel binding value for this connection, per RFC 5929.  This
    //  * will return {@code null} if there is no such value available, such as if the handshake
    //  * has not yet completed or this connection is closed.
    //  */
    // static byte[] getTlsUnique(SSLEngine engine) {
    //     return toConscrypt(engine).getTlsUnique();
    // }

    // /**
    //  * Enables token binding parameter negotiation on this engine, or disables it if an
    //  * empty set of parameters are provided.
    //  *
    //  * <p>This method needs to be invoked before the handshake starts.
    //  *
    //  * @param params a list of Token Binding key parameters in descending order of preference,
    //  * as described in draft-ietf-tokbind-negotiation-09.
    //  * @throws IllegalStateException if the handshake has already started.
    //  * @throws SSLException if the setting could not be applied.
    //  */
    // static void setTokenBindingParams(SSLEngine engine, int... params) {
    //     toConscrypt(engine).setTokenBindingParams(params);
    // }

    // /**
    //  * Returns the token binding parameters that were negotiated during the handshake, or -1 if
    //  * token binding parameters were not negotiated, the handshake has not yet completed,
    //  * or the connection has been closed.
    //  */
    // static int getTokenBindingParams(SSLEngine engine) {
    //     return toConscrypt(engine).getTokenBindingParams();
    // }

    // /**
    //  * Exports a value derived from the TLS master secret as described in RFC 5705.
    //  *
    //  * @param label the label to use in calculating the exported value.  This must be
    //  * an ASCII-only string.
    //  * @param context the application-specific context value to use in calculating the
    //  * exported value.  This may be {@code null} to use no application context, which is
    //  * treated differently than an empty byte array.
    //  * @param length the number of bytes of keying material to return.
    //  * @return a value of the specified length, or {@code null} if the handshake has not yet
    //  * completed or the connection has been closed.
    //  * @throws SSLException if the value could not be exported.
    //  */
    // static byte[] exportKeyingMaterial(SSLEngine engine, string label, byte[] context,
    //         int length) {
    //     return toConscrypt(engine).exportKeyingMaterial(label, context, length);
    // }
}
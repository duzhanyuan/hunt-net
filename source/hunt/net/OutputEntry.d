module hunt.net.OutputEntry;

import hunt.net.OutputEntryType;

import hunt.collection.ByteBuffer;
import hunt.util.Common;

interface OutputEntry(T) {

    OutputEntryType getOutputEntryType();

    Callback getCallback();

    T getData();

    long remaining();
}



abstract class AbstractOutputEntry(T) : OutputEntry!T {
	
	protected Callback callback;
	protected T data;

	this(Callback callback, T data) {
		this.callback = callback;
		this.data = data;
	}

	Callback getCallback() {
		return callback;
	}

	T getData() {
		return data;
	}

}

/**
*/
class ByteBufferOutputEntry : AbstractOutputEntry!ByteBuffer {

	this(Callback callback, ByteBuffer data) {
		super(callback, data);
	}

	OutputEntryType getOutputEntryType() {
		return OutputEntryType.BYTE_BUFFER;
	}

	long remaining() {
		return data.remaining();
	}

}

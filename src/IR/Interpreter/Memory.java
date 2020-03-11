package IR.Interpreter;

import java.util.ArrayList;

// highlight: for simplicity, mem only increase, never decrease

class Memory {
    int heapTop;
    ArrayList<Byte> mem;

    Memory() {
        heapTop = 0;
        mem = new ArrayList<Byte>();
    }

    // alloc a space for
    int memAlloc(int allocSize) {
        int ret = heapTop;
        heapTop += allocSize;
        for (int i = 0; i < allocSize; ++i) {
            byte a = 0;
            mem.add(a);
        }
        return ret;
    }

    void memStore(int pos, byte[] toWrite) {
        if (pos >= heapTop)
            throw new RuntimeException("invalid mem store");
        for (int i = pos; i < pos + toWrite.length; i++)
            mem.set(i, toWrite[i - pos]);
    }

    byte[] memRead(int pos, int len) {
        var res = new byte[len];
        if (pos >= heapTop)
            throw new RuntimeException("invalid mem read");
        for (int i = 0; i < len; i++)
            res[i] = mem.get(pos + i);
        return res;
    }
}


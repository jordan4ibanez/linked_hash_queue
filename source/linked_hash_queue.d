module linked_hash_queue;

public import optibrev;
import std.array;
import std.container.array;
import std.container.dlist;

struct LinkedHashQueue(T) {
    // protected:
public:

    // These two are synchronized.
    bool[T] keys;
    DList!T queue;

public:

    /**
    Push element to the front of the queue. If it exists this has no effect.
    */
    void pushFront(T element) {
        if (element in keys) {
            return;
        }
        keys[element] = true;
        queue.insertFront(element);
    }

    /**
    Push element to the back of the queue. If it exists this has no effect.
    */
    void pushBack(T element) {
        if (element in keys) {
            return;
        }
        keys[element] = true;
        queue.insertBack(element);
    }

    /**
    Pop the front element off the front of the queue. If empty returns None.
    */
    Option!T popFront() {
        Option!T result;
        if (queue.empty()) {
            return result;
        }
        T gotten = queue.front();
        result = result.Some(gotten);
        queue.removeFront();
        keys.remove(gotten);
        return result;
    }

    /**
    Pop the back element off the back of the queue. If empty returns None.
    */
    Option!T popBack() {
        Option!T result;
        if (queue.empty()) {
            return result;
        }
        T gotten = queue.back();
        result = result.Some(gotten);
        queue.removeBack();
        keys.remove(gotten);
        return result;
    }

}

unittest {

}

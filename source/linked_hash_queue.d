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

    /*
    Push element to the back of the queue.
    */
    void push(T element) {
        if (element in keys) {
            return;
        }
        keys[element] = true;
        queue.insertBack(element);
    }

    Option!T pop() {
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

}

unittest {

}

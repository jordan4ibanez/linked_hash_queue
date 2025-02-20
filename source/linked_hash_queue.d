module linked_hash_queue;

public import optibrev;
import std.array;
import std.container.array;
import std.container.dlist;

struct LinkedHashQueue(T) {
protected:

    // These two are synchronized.
    bool[T] keys;
    DList!T queue;

public:

    /**
    Push element to the front of the queue. If it exists in the queue, this has no effect.
    */
    void pushFront(T element) {
        if (element in keys) {
            return;
        }
        keys[element] = true;
        queue.insertFront(element);
    }

    /**
    Push element to the back of the queue. If it exists in the queue, this has no effect.
    */
    void pushBack(T element) {
        if (element in keys) {
            return;
        }
        keys[element] = true;
        queue.insertBack(element);
    }

    /**
    Pop the front element off the front of the queue. If empty, it returns None.
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
    Pop the back element off the back of the queue. If empty, it returns None.
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
    import std.stdio;

    LinkedHashQueue!int blah;

    blah.pushBack(1);
    blah.pushBack(2);
    blah.pushBack(3);
    blah.pushBack(4);

    // int[] boof;
    foreach (i; blah.queue) {
        writeln(i);
    }

    writeln("====");

    Option!int boof = blah.popFront();

    if (boof.isSome()) {
        writeln("some!");
    }

    blah.pushBack(1);
    blah.pushFront(5);

    foreach (i; blah.queue) {
        writeln(i);
    }

    writeln("=====");

    blah.popBack();
    blah.popFront();

    foreach (i; blah.queue) {
        writeln(i);
    }

    blah.popFront();
    blah.popFront();
    blah.popFront();

    writeln("======");
    foreach (i; blah.queue) {
        writeln(i);
    }

    assert(blah.popBack().isNone());

    // FIFO

    blah.pushBack(1);
    blah.pushBack(2);
    blah.pushBack(3);

    assert(blah.popFront.unwrap == 1);
    assert(blah.popFront.unwrap == 2);
    assert(blah.popFront.unwrap == 3);

    // LILO

    blah.pushFront(1);
    blah.pushFront(2);
    blah.pushFront(3);

    assert(blah.popBack.unwrap == 1);
    assert(blah.popBack.unwrap == 2);
    assert(blah.popBack.unwrap == 3);

    // FILO/Stack

    blah.pushBack(1);
    blah.pushBack(2);
    blah.pushBack(3);

    assert(blah.popBack.unwrap == 3);
    assert(blah.popBack.unwrap == 2);
    assert(blah.popBack.unwrap == 1);

    // LIFO/Reverse Stack

    blah.pushFront(1);
    blah.pushFront(2);
    blah.pushFront(3);

    assert(blah.popFront.unwrap == 3);
    assert(blah.popFront.unwrap == 2);
    assert(blah.popFront.unwrap == 1);

    // I ran out of ideas for the unit test.

    blah.pushFront(1);
    blah.pushFront(2);
    blah.pushFront(3);

    writeln(blah.popBack());
    writeln(blah.popFront());
    writeln(blah.popBack());
    assert(blah.popFront().isNone());
}

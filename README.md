# linked_hash_queue
 A linked HashQueue for D.

This is specialized to act as a regular FIFO/FILO queue but disallows duplicates.

This uses [optibrev](https://code.dlang.org/packages/optibrev) optional return type to make your life easier. :D

How to use:

```D
import std.stdio;

void main() {

    LinkedHashQueue!int myCoolQueue;

    // FIFO

    myCoolQueue.pushBack(1);
    myCoolQueue.pushBack(2);
    myCoolQueue.pushBack(3);

    assert(myCoolQueue.popFront.unwrap == 1);
    assert(myCoolQueue.popFront.unwrap == 2);
    assert(myCoolQueue.popFront.unwrap == 3);

    // LILO

    myCoolQueue.pushFront(1);
    myCoolQueue.pushFront(2);
    myCoolQueue.pushFront(3);

    assert(myCoolQueue.popBack.unwrap == 1);
    assert(myCoolQueue.popBack.unwrap == 2);
    assert(myCoolQueue.popBack.unwrap == 3);

    // FILO/Stack

    myCoolQueue.pushBack(1);
    myCoolQueue.pushBack(2);
    myCoolQueue.pushBack(3);

    assert(myCoolQueue.popBack.unwrap == 3);
    assert(myCoolQueue.popBack.unwrap == 2);
    assert(myCoolQueue.popBack.unwrap == 1);

    // LIFO/Reverse Stack

    myCoolQueue.pushFront(1);
    myCoolQueue.pushFront(2);
    myCoolQueue.pushFront(3);

    assert(myCoolQueue.popFront.unwrap == 3);
    assert(myCoolQueue.popFront.unwrap == 2);
    assert(myCoolQueue.popFront.unwrap == 1);

    // I ran out of ideas for the unit test.

    myCoolQueue.pushFront(1);
    myCoolQueue.pushFront(2);
    myCoolQueue.pushFront(3);

    writeln(myCoolQueue.popBack());
    writeln(myCoolQueue.popFront());
    writeln(myCoolQueue.popBack());
    assert(myCoolQueue.popFront().isNone());
}
```
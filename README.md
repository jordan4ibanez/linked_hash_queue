# linked_hash_queue
 A linked HashQueue for D.

This is specialized to act as a regular FIFO/FILO queue but disallows duplicates.

How to use:

```D
import std.stdio;

void main() {

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
```
import std.stdio;

import linked_hash_queue;

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

}

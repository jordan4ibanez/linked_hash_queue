import std.stdio;

import linked_hash_queue;

void main() {

	LinkedHashQueue!int blah;

	blah.push(1);
	blah.push(2);
	blah.push(3);
	blah.push(4);

	// int[] boof;
	foreach (i; blah.queue) {
		writeln(i);
	}

	writeln("====");

	Option!int boof = blah.pop();

	if (boof.isSome()) {
		writeln("some!");
	}

	blah.push(1);

	foreach (i; blah.queue) {
		writeln(i);
	}

}

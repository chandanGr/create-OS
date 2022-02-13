#pragma once
#include "TypeDefs.cpp"


void outb (unit_16 port, unit_8 val) {
	asm volatile ("outb %0, %1" : : "a"(val), "Nd"(port));
}

unit_8 inb (unit_16 port) {
	unit_8 returnValue;
	asm volatile ("inb %1, %0"
	: "=a"(returnValue)
	: "Nd"(port)
	);
	return returnValue;
}

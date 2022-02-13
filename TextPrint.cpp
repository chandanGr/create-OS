#pragma once
#include "IO.cpp"
#include "TypeDefs.cpp"
#define VGA_MEMORY (unit_8*)0xb8000
#define VGA_WIDTH 80

void SetCursorPosition (unit_16 position) {
	unit_16 CursorPosition;
	outb(0x3D4, 0x0F);
	outb(0x3D5, (unit_8)(position & 0xFF));
	outb(0x3D4, 0x0E);
	outb(0x3D5, (unit_8)((position >> 8) & 0xFF));
	
	CursorPosition = position;
}

unit_16 PositionFromCords (unit_8 x, unit_8 y) {
	return y * VGA_WIDTH + x;
}

extern "C" void _start() {
	while(true);
	int* ptr = (int*)0xb8000;
	*ptr = 0x50505050;
	while(true);
	return;
}

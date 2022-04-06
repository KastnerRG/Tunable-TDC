MEMORY {
	mem : ORIGIN = 0x00000000, LENGTH = 0x00008000

}

SECTIONS {
	.memory : {
		. = 0x000000;
		_init*(.text);
		trap_vector*(.text);
		*(.text);
		*(*);
		end = .;
	} > mem
}

#include <system.h>
#include <boot.h>

enum color {
    BLACK = 0,
    BRIGHT = 7,
    LIGHTCYAN = 11
};

enum size {
    COLS = 80,
    ROWS = 25
};

uint16_t *const video = (uint16_t*) 0xB8000;

void putc(uint8_t x, uint8_t y, enum color fg, enum color bg, char c) {
    video[y * COLS + x] = (bg << 12) | (fg << 8) | c;
}

void puts(uint8_t x, uint8_t y, enum color fg, enum color bg, const char *s) {
    for (; *s; s++, x++)
        putc(x, y, fg, bg, *s);
}

void clear(enum color bg) {
    uint8_t x, y;
    for (y = 0; y < ROWS; y++)
        for (x = 0; x < COLS; x++)
            putc(x, y, bg, bg, ' ');
}

int _kernel_main(struct multiboot *mboot, uint32_t mboot_mag, uintptr_t esp) {

	if(mboot_mag == MULTIBOOT_EAX_MAGIC) {
		mboot_ptr = mboot;
	}
	
	clear(BLACK);
	puts(30,10, LIGHTCYAN, BLACK, "CYBORG Genesis");
	puts(25,15, BRIGHT, BLACK, "CYBORG OS is running on QEMU");
	return 0;
}

BITS 32
ALIGN 4

mboot:
	; Multiboot headers:
	MULTIBOOT_PAGE_ALIGN	equ 1<<0
	MULTIBOOT_MEMORY_INFO	equ 1<<1
	MULTIBOOT_USE_GFX	equ 1<<2
	MULTIBOOT_HEADER_MAGIC	equ 0x1BADB002
	MULTIBOOT_HEADER_FLAGS	equ MULTIBOOT_PAGE_ALIGN | MULTIBOOT_MEMORY_INFO | MULTIBOOT_USE_GFX
	MULTIBOOT_CHECKSUM	equ -(MULTIBOOT_HEADER_MAGIC + MULTIBOOT_HEADER_FLAGS)
	
	; Load the headers into binary image
	dd MULTIBOOT_HEADER_MAGIC
	dd MULTIBOOT_HEADER_FLAGS
	dd MULTIBOOT_CHECKSUM
	dd 0x00000000 ; header_addr
	dd 0x00000000 ; load_addr
	dd 0x00000000 ; load_end_addr
	dd 0x00000000 ; bss_end_addr
	dd 0x00000000 ; entry_addr
	; Graphics requests
	dd 0x00000000 ; 0 = linear graphics
	dd 0
	dd 0
	dd 32

extern code, bss, end
; Main entry point
global start
start:
	; Set up stack pointer
	mov esp, 0x7FFFF
	push esp
	; push incoming multiboot headers
	push eax ; Header magic
	push ebx ; Header pointer
	; Disable interrupts
	cli
	; Call the C entry
	extern _kernel_main
	call _kernel_main
	jmp $

; BSS Section
SECTION .bss
	resb 8192 ; 8KB of memory reserved

#include <system.h>
#include <boot.h>

int _kernel_main(struct multiboot *mboot, uint32_t mboot_mag, uintptr_t esp) {

	if(mboot_mag == MULTIBOOT_EAX_MAGIC) {
		mboot_ptr = mboot;
	}
	
	char * video_mem = (char *) 0xb8000;
	*video_mem = "SAXE OS";
	
	return 0;
}

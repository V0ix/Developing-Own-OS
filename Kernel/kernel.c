void kernel_main() {
    const char *message = "Hello from my own OS kernel";
    char *video_memory = (char *) 0xb8000;

    for (int i = 0; message[i] != '\0'; i++) {
        video_memory[i * 2] = message[i];      // printing character by character
        video_memory[i * 2 + 1] = 0x07;         // attribute-byte: light grey on black
    }

    while (1); // Halt the CPU 
}


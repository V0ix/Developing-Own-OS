// src/main.c
void print_test_message() {
    const char *msg = "Yeh now you are entered into My OS.....";
    char *video = (char *) 0xb8000;
    for (int i = 0; msg[i] != '\0'; i++) {
        video[(i+40) * 2] = msg[i];    // start printing from line 1
        video[(i+40) * 2 + 1] = 0x0A;  // green on black
    }
}
//Above function will be called from the kernel.c file

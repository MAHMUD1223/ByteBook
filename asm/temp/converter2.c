#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAX_CMD_LEN 256

// Function to find the dot (.) in the filename and truncate the string
void remove_extension(char *filename) {
    char *dot = strchr(filename, '.');
    if (dot != NULL) {
        *dot = '\0'; // Truncate the string at the first dot
    }
}

// Function to execute a shell command and check if it succeeds
int execute_command(const char *command) {
    int ret = system(command);
    if (ret != 0) {
        printf("Error: Command failed - %s\n", command);
        return 0;
    }
    return 1;
}

int main(int argc, char *argv[]) {
    char command[MAX_CMD_LEN];

    // Check if the source file argument is provided
    if (argc != 2) {
        printf("Usage: %s <source_file_without_extension_or_with_extension>\n", argv[0]);
        return 1;
    }

    // Get a copy of the source file name and remove the extension if it exists
    char source_file[MAX_CMD_LEN];
    strncpy(source_file, argv[1], MAX_CMD_LEN - 1);
    source_file[MAX_CMD_LEN - 1] = '\0';  // Ensure the string is null-terminated

    // Remove extension if any
    remove_extension(source_file);

    // Assemble the source file using NASM
    printf("Assembling %s.s...\n", source_file);
    snprintf(command, MAX_CMD_LEN, "nasm -f elf -o %s.o %s.s", source_file, source_file);
    if (!execute_command(command)) {
        return 1;
    }

    // Link the object file using the linker
    printf("Linking %s.o...\n", source_file);
    snprintf(command, MAX_CMD_LEN, "ld -m elf_i386 -o %s %s.o", source_file, source_file);
    if (!execute_command(command)) {
        return 1;
    }

    // Cleanup: Remove the object file after successful linking
    snprintf(command, MAX_CMD_LEN, "rm %s.o", source_file);
    if (!execute_command(command)) {
        return 1;
    }

    printf("Build successful: %s is ready to run.\n", source_file);
    return 0;
}

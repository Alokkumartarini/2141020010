#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid = fork(); // Create child process

    if (pid < 0) {
        // Fork failed
        perror("fork failed");
        return 1;
    }
    else if (pid == 0) {
        // Child process
        printf("Child process: Executing 'ls' command...\n");

        char *args[] = {"ls", "-l", NULL}; // Command and arguments
        execvp(args[0], args); // Replace child process with ls

        // If execvp returns, it must have failed
        perror("execvp failed");
        exit(1);
    }
    else {
        // Parent process
        int status;
        waitpid(pid, &status, 0); // Wait for child to finish

        if (WIFEXITED(status)) {
            printf("Parent process: Child terminated with status %d\n", WEXITSTATUS(status));
        } else {
            printf("Parent process: Child terminated abnormally\n");
        }
    }

    return 0;
}

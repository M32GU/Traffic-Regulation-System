#include <iostream>
#include <unistd.h>
#include <sys/wait.h>
#include <vector>
#include <iostream>
#include <stdlib.h>
using namespace std;
int main (int argc, char **argv) {

    int pipe1[2];
    int pipe2[2];

    pipe(pipe1);
    pipe(pipe2);
    pid_t process_t;
    process_t = fork ();

    if (process_t == 0) {
	dup2(pipe1[1], STDOUT_FILENO);
	close(pipe1[1]);
	execv ("rgen", argv);
    }

	pid_t process_t1 = fork();
	if(process_t1 == 0){
		dup2(pipe1[0], STDIN_FILENO);
	        close(pipe1[0]);
		dup2(pipe2[1], STDOUT_FILENO);
		close(pipe2[1]);
		char *pyarg[2];
		pyarg[0] = (char *)"python";
		pyarg[1] = (char *)"a1-ece650.py";
		execvp("python",pyarg);
	}

	pid_t process_t2 = fork();
	if(process_t2 == 0){
		dup2(pipe2[0], STDIN_FILENO);
        	close(pipe2[0]);
	        execv("a2-ece650",argv);
	}

	dup2(pipe2[1], STDOUT_FILENO);
	close(pipe2[1]);
	string line;
	while(!cin.eof()){
		getline(cin, line);
		if(line.size() > 0) cout << line << endl;
	}

	int tmp1,tmp2,tmp3;
  	kill (process_t, SIGTERM);
  	waitpid(process_t, &tmp1, 0);
	kill (process_t1, SIGTERM);
  	waitpid(process_t1, &tmp2, 0);
	kill (process_t2, SIGTERM);
  	waitpid(process_t2, &tmp3, 0);

	return 0;
}

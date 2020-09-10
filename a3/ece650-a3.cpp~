#include <iostream>
#include <unistd.h>
#include <sys/wait.h>
#include <vector>
#include <iostream>
#include <stdlib.h>

int readSCommand(){
		while(!std::cin.eof()){
			std::string line;
			std::getline(std::cin, line);
			if(line.size() > 0){
				std::cout << line << std::endl;
			}
		}
		return 0;
}


int main (int argc, char **argv) {

    int rgentoa1[2];
    int a1toa2[2];

    pipe(rgentoa1);
    pipe(a1toa2);
    pid_t kid;
    kid = fork ();

    if (kid == 0) {
			dup2(rgentoa1[1], STDOUT_FILENO);
		  close(rgentoa1[0]);
			close(rgentoa1[1]);
			execv ("rgen", argv);
   }

	pid_t kid1 = fork();
	if(kid1 == 0){
		dup2(rgentoa1[0], STDIN_FILENO);
	        close(rgentoa1[0]);
        	close(rgentoa1[1]);

		dup2(a1toa2[1], STDOUT_FILENO);
		close(a1toa2[0]);
		close(a1toa2[1]);

		char *argvn[3];
		argvn[0] = (char *)"python";
		argvn[1] = (char *)"ece650-a1.py";
		argvn[2] = nullptr;

		execvp("python",argvn);
	}

	pid_t kid2 = fork();
	if(kid2 == 0){
		dup2(a1toa2[0], STDIN_FILENO);
        	close(a1toa2[0]);
	        close(a1toa2[1]);
	        execv("a2-ece650",argv);
	}

	dup2(a1toa2[1], STDOUT_FILENO);
	close(a1toa2[0]);
	close(a1toa2[1]);

	int a2 = readSCommand();

	int status1;
  kill (kid, SIGTERM);
  waitpid(kid, &status1, 0);

	int status2;
	kill (kid1, SIGTERM);
  waitpid(kid1, &status2, 0);

	int status3;
	kill (kid2, SIGTERM);
  waitpid(kid2, &status3, 0);

	return a2;
}

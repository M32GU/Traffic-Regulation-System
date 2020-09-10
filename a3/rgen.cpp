#include <iostream>
#include <fstream>
#include <unistd.h>
#include <cstdlib>
#include <cstring>
#include <vector>
#include <map>
#include <string>
#include <cmath>
#include <algorithm>
#include "geometry.hpp" // point and segment
using namespace std;
enum argtype {arg_s, arg_n, arg_l, arg_c};
int int_value[4] = {10, 5, 5, 20};
char arg_list[5] = "snlc";

typedef std::vector<Point> Line;
typedef std::map<std::string, Line> MAP;
MAP roadmap;

int getopt (int argc, char **argv)
{
    std::string param;
    int command;
    opterr = 0;

    // expected options are '-s value', '-n value', '-l value' and '-c value'
    while ((command = getopt (argc, argv, "s:n:l:c:")) != -1) {
        switch (command){
     	case 's':
            param = optarg;
            int_value[arg_s] = atoi(param.c_str());
            if(int_value[arg_s] < 2) {
            	std::cerr << "Error: option -s requires >= 2." << std::endl;
            	return 1;
            }
            break;
        case 'n':
            param = optarg;
            int_value[arg_n] = atoi(param.c_str());
            if(int_value[arg_s] < 1) {
            	std::cerr << "Error: option -n requires >= 1." << std::endl;
            	return 1;
            }
            break;
        case 'l':
            param = optarg;
            int_value[arg_l] = atoi(param.c_str());
            if(int_value[arg_s] < 5) {
            	std::cerr << "Error: option -l requires >= 5." << std::endl;
            	return 1;
            }
            break;
        case 'c':
            param = optarg;
            int_value[arg_c] = atoi(param.c_str());
            if(int_value[arg_s] < 1) {
            	std::cerr << "Error: option -c requires >= 1." << std::endl;
            	return 1;
            }
            break;
        case '?':
        	for(int i = 0;i < 4;i++)
        		if(optopt == arg_list[i]) {
        			std::cerr << "Error: option -" << (char)optopt
                          << " requires an argument." << std::endl;
                    return 1;
                }
            std::cerr << "Error: unknown option: " << (char)optopt << std::endl;
            return 1;
        default:
            return -1;
        }
    }

    if (optind < argc) {
        std::cout << "Found positional arguments\n";
        for (int index = optind; index < argc; index++)
            std::cout << "Non-option argument: " << argv[index] << "\n";
        return 1;
    }
    // for(int i = 0;i < 4;i++)
    	// std::cout << arg_list[i] << "=" << int_value[i] << std::endl;	

    return 0;
}


int gran(int start, int end) {
	// open /dev/urandom to read
    std::ifstream urandom("/dev/urandom");

    // check that it did not fail
    if (urandom.fail()) {
        std::cerr << "Error: cannot open /dev/urandom\n";
        return 1;
    }

    char ch = 'a';
    urandom.read(&ch, 1);

    urandom.close();

    return (unsigned)ch % (end-start+1) + start;
}

bool genname(int len, std::string &ret) {
	ret = "";
	for(int i = 0;i < len;i++)
		ret += gran(0, 25)+'a';
	for(MAP::iterator it = roadmap.begin();it != roadmap.end();it++) {
    	if(it->first == ret) 
    		return false;
    }
   	return true;
}

bool testjoint(Line line, Point d) {
	if(line.size() < 2)
		return false;
	Point a, b, c, cross;
	Segment segu, segv;
	for(size_t i = 1;i < line.size();i++) {
		a = line[i-1];
		b = line[i];
		c = line[line.size()-1];
		segu = Segment(a, b);
		segv = Segment(c, d);
		if(segu.joint(segv, cross))
			return true;
	}
	return false;
}
bool genline(Line &line, int n) {
	int x, y, count;
	Point p;
	line.clear();
	for(int i = 0;i < n+1;i++) {
		count = 0;
		do {
			x = gran(-int_value[arg_c], int_value[arg_c]);
			y = gran(-int_value[arg_c], int_value[arg_c]);
			p = Point(x, y);
			count++;
		} while(testjoint(line, p) && count < 25);
		if(count >= 25) {
			fprintf(stderr, "Error: failed to generate valid input for 25 simultaneous attempts.\n");
			exit(0);
		}
		fprintf(stdout, " (%d,%d)", x, y);
	}
	fprintf(stdout, "\n");
	return true;
}

int randomset() {
    int rand_value[4];
    rand_value[arg_s] = gran(2, int_value[arg_s]);
    rand_value[arg_n] = gran(1, int_value[arg_n]);
    rand_value[arg_l] = gran(5, int_value[arg_l]);
    rand_value[arg_c] = gran(-int_value[arg_c], int_value[arg_c]);

    // for(int i = 0;i < 4;i++)
    	// std::cout << "random-" << arg_list[i] << "=" << rand_value[i] << std::endl;

    // Line line;
    // roadmap["hah"] = line;
    for(MAP::iterator it = roadmap.begin();it != roadmap.end();it++) {
    	fprintf(stdout, "r \"%s\"\n", it->first.c_str());
    }

    //char ch = 'a';
    std::string street_name;
    Line line;
    // Line street()
    for(int i = 0;i < rand_value[arg_s];i++) {
    	while(!genname(3, street_name));
    	fprintf(stdout, "a \"%s\"", street_name.c_str());
    	rand_value[arg_n] = gran(1, int_value[arg_n]);
    	genline(line, rand_value[arg_n]);
    	roadmap[street_name] = line;
    }
    cout << "g" << endl;
    return 0;
}

int main(int argc, char *argv[])
{
	roadmap.clear();
	if(getopt(argc, argv))
		return 0;
	randomset();
	return 0;
}

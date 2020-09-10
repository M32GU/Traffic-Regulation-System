#include <sstream>
#include <list>
#include <climits>
#include <queue>
#include <memory>
#include "minisat/core/SolverTypes.h"
#include "minisat/core/Solver.h"
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

#define VERTICAL_CHAR 'V'
#define EDGE_CHAR 'E'
int Num_vertices=0;
vector<int> Edge;


int dig(string s) {
    int ret = 0;
    for(int i = 0;i < s.length();i++) {
        ret *= 10;
        ret += s[i] - '0';
    }
    // cout << ret << " ";
    return ret;
}
bool init(string s) {
    int len = s.length();
    int p = 0, q = 0, r = 0;
    for(int i = 0;i < len;i++)
        if(s[i] == '<')
            p = i+1;
        else if(s[i] == ',')
            q = i;
        else if(s[i] == '>') {
            int u = dig(s.substr(p, q-p));
            int v = dig(s.substr(q+1, i-q-1));
            if(u < 0 || u >=Num_vertices || v < 0 || v >= Num_vertices)
                return false;
            Edge.push_back(v);
            Edge.push_back(u);
        }
    return true;
}

void reduction() {
    int k=0,j=0,i=0;
    while (1) {
        Minisat::Solver* solver=new Minisat::Solver();
        vector<vector<Minisat::Lit>> clause_vec;
        for (j = 0; j < k; j++) {
            vector<Minisat::Lit> temp;
            for (i = 0; i < Num_vertices; i++) {
                temp.push_back(Minisat::mkLit(solver->newVar()));
            }
            clause_vec.push_back(temp);
        }
        for (int a = 0; a < k; a++) {
            for (int b = 0; b < Num_vertices; b++) {
                for (int c = b + 1; c < Num_vertices; c++) {
                    solver->addClause(~clause_vec[a][b], ~clause_vec[a][c]);
                }
            }
        }
        for (int a = 0; a < k; a++) {
            Minisat::vec<Minisat::Lit> clause;
            for (int b = 0; b < Num_vertices; b++) {
                clause.push(clause_vec[a][b]);
            }
            solver->addClause(clause);
        }
        for (int x = 0; x < Num_vertices; x++) {
            for (int y = 0; y < k; y++) {
                for (int z = y + 1; z < k; z++) {
                    solver->addClause(~clause_vec[y][x], ~clause_vec[z][x]);
                }
            }
        }
        for (int a = 0; a < Edge.size(); a += 2) {
            Minisat::vec<Minisat::Lit> clause;
            for (int b = 0; b < k; b++) {
                clause.push(clause_vec[b][Edge[a + 1]]);
                clause.push(clause_vec[b][Edge[a]]);
            }
            solver->addClause(clause);
        }
        if (solver->solve()) {
            vector<int> result;
            for (int a = 0; a < k; a++) {
                for (int b = 0; b < Num_vertices; b++) {
                    if(Minisat::toInt(solver->modelValue(clause_vec[a][b])) == 0)
                        result.push_back(b);
                }
            }
            sort(result.begin(), result.end());
            for (int i = 0; i < result.size(); i++)
            {
                cout << result[i] << " ";
            }
            cout << endl;
            Edge.clear();
            break;
        }
        k++;
        delete(solver);
    }
}

int main() {
    string str;
    string tmp;
    while(cin >> str) {
        if(str[0] == VERTICAL_CHAR) {
            cin >> Num_vertices;
        } else if(str[0] == EDGE_CHAR) {
            cin >> tmp;
            if(!init(tmp)){
                cerr << "Error: failed to initialize the map" << endl;
                break;
            }
            reduction();
        }
    }
    return 0;
}

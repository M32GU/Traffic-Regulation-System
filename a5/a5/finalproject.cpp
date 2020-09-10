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
#include <time.h>
#include <pthread.h>
using namespace std;

#define VERTICAL_CHAR 'V'
#define EDGE_CHAR 'E'
int Num_vertices;
vector<int> Edge;
vector<int> result[3];
int flag[3][3],ioflag;

int dig(string s) {
    int ret = 0;
    for(unsigned int i = 0;i < s.length();i++) {
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
            Edge.push_back(u);
            Edge.push_back(v);
        }
    return true;
}

void* reduction(void*) {
    while(1){
        if(flag[0][0]){
        }else{

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

                    for (int a = 0; a < k; a++) {
                        for (int b = 0; b < Num_vertices; b++) {
                            if(Minisat::toInt(solver->modelValue(clause_vec[a][b])) == 0)
                                result[0].push_back(b);
                        }
                    }

                    flag[0][1]=0;
                    flag[0][0]=1;
                    delete(solver);
                    break;
                }
                k++;
                delete(solver);
            }
            while(flag[0][2]){};
            flag[0][2]=1;
        }
    }
}

void * algorithm2(void*){
    while(1){
        if(flag[1][0]){

        }else{
            int tmpE[Edge.size()],Num_edges=Edge.size()/2;
            int degree[Num_vertices],exist[Num_vertices];
            for(int i=0;i<Num_vertices;i++){
                degree[i]=0;
                exist[i]=1;
            }

            for(int i=0;i<Edge.size();i++){
                tmpE[i]=Edge[i];
                degree[Edge[i]]++;
            }
/*
for(int i=0;i<Edge.size();i++){cout<<" Edge "<<Edge[i]<<" tmpE "<<tmpE[i];}
cout<<endl;
for(int i=0;i<Num_vertices;i++){cout<<i<<" : "<<degree[i];}
cout<<endl;
*/
// Above is just for debugging
            while(Num_edges){
                int temp=0,i;
                for(i=0;i<Num_vertices;i++){
                    if(degree[temp]<degree[i]){
                        temp=i;
                    }
                }
                degree[temp]=-1;
                //exist[temp]=0;
                result[1].push_back(temp);

                for(int j=0;j<Edge.size();j++){
                    if(tmpE[j]==temp){
                        tmpE[j]=-1;
                        if(j%2){
                            degree[j-1]--;
                            tmpE[j-1]=-1;
                        }else{
                            degree[j+1]--;
                            tmpE[j+1]=-1;
                        }
                        Num_edges--;
                    }
                }
            }

            flag[1][1]=0; //tell main thread to get time
            flag[1][0]=1;
            while(flag[1][2]){}; //wait for exit thread
            flag[1][2]=1;
        }
    }
}
void * algorithm3(void*){
    while(1){
        if(flag[2][0]){

        }else{
            int tmpE[Edge.size()],Num_edges=Edge.size()/2;
            //int degree[Num_vertices],exist[Num_vertices];

            for(int i=0;i<Edge.size();i++){
                tmpE[i]=Edge[i];
                //degree[Edge[i]]++;
            }
/*
for(int i=0;i<Edge.size();i++){cout<<" Edge "<<Edge[i]<<" tmpE "<<tmpE[i];}
cout<<endl;
for(int i=0;i<Num_vertices;i++){cout<<i<<" : "<<degree[i];}
cout<<endl;
*/
// Above is just for debugging
            while(Num_edges){
                int temp,temp2,i;
                for(i=0;i<Edge.size();i+=2){
                    if(tmpE[i]!=-1){
                        temp=tmpE[i];
                        temp2=tmpE[i+1];
                        break;
                    }
                }
                //degree[temp]=-1;
                result[2].push_back(temp);
                result[2].push_back(temp2);

                for(int j=0;j<Edge.size();j++){
                    if(tmpE[j]==temp||tmpE[j]==temp2){
                        tmpE[j]=-1;
                        if(j%2){
                            tmpE[j-1]=-1;
                        }else{
                            tmpE[j+1]=-1;
                        }
                        Num_edges--;
                    }
                }
            }
            flag[2][1]=0; //tell main thread to get time
            flag[2][0]=1;
            while(flag[2][2]){}; //wait for next turn
            flag[2][2]=1;
        }
    }
}

int main(){
    string str;
    string tmp;
    string name[3]={"CNF-SAT-VC: ","APPROX-VC-1: ","APPROX-VC-2: "};
    pthread_t t[3],tio;
    clockid_t cid[3];
    int ret,i,j;
    struct timespec ts_s,ts_e;
    void*(*fn[3])(void*);
    fn[0]=reduction;
    fn[1]=algorithm2;
    fn[2]=algorithm3;
    double elapsed_time[3];
    for(i=0;i<3;i++){
        for(j=0;j<3;j++) flag[i][j]=1;
        ret=pthread_create(&t[i], NULL, fn[i], NULL);
        pthread_getcpuclockid(t[i], &cid[i]);
    }
    while(cin >> str) {
        if(str[0] == VERTICAL_CHAR) {
            cin >> Num_vertices;
        }else if(str[0] == EDGE_CHAR) {
            cin >> tmp;
            if(!init(tmp)){
                cerr << "Error: failed to initialize the map" << endl;
                break;
            }
            for(i=0;i<3;i++){
                elapsed_time[i]=0;
                flag[i][0]=1;
                flag[i][1]=1;
                flag[i][2]=1;

                for(j=0;j<10;j++){
                    //f[0][0]=0;
                    clock_gettime(cid[i], &ts_s);
                    flag[i][0]=0;
                    while(flag[i][1]){};
                    flag[i][1]=1;
                    clock_gettime(cid[i], &ts_e);
                    elapsed_time[i]+=1000000000*(ts_e.tv_sec-ts_s.tv_sec)+ts_e.tv_nsec-ts_s.tv_nsec;

                    flag[i][2]=0;
                }
                cout<<name[i];
                sort(result[i].begin(), result[i].end());
                result[i].erase(unique(result[i].begin(), result[i].end()), result[i].end());
                for (int k = 0; k < result[i].size(); k++){
                    cout << result[i][k];
                    if(k<result[i].size()-1){
                        cout<< ",";
                    }
                }
                cout << endl;
                result[i].clear();
                //pthread_join(t[i],NULL);
            }
            Edge.clear();
            // The following is to giveout elapsed time
            cout<<endl;
            for(i=0;i<3;i++){
                cout<<"time of "<<name[i]<<elapsed_time[i]/10<<" ns"<<endl;
            }
            // The above is to giveout elapsed time
        }
    }

    return 0;
}

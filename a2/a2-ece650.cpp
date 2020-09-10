#include <iostream>
#include <vector>
#include <queue>
#include <cstring>
#include <string>
using namespace std;
#define N 1000
#define INF 10000000
vector<int> mp[N];
queue <int> Q;
int n, dis[N], par[N];
bool vis[N];
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
    memset(mp, 0, sizeof(mp));
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
            if(u < 0 || u >= n || v < 0 || v >= n)
                return false;
            mp[u].push_back(v);
            mp[v].push_back(u);
        }
    return true;
}
void showpath(int s, int t) {
    if(s == t) {
        cout << s;
        return;
    }
    showpath(s, par[t]);
    cout << "-" << t;
}
bool solve(int s, int t) {
    if(s < 0 || s >= n || t < 0 || t >= n)
        return false;
    while(!Q.empty()) Q.pop();
    for(int i = 0;i < n;i++) {
        dis[i] = INF;
        par[i] = i;
    }
    memset(vis, false, sizeof(vis));
    dis[s] = 0;
    vis[s] = true;
    if(s == t)
        return true;
    Q.push(s);
    while(!Q.empty()) {
        int fr = Q.front();
        Q.pop();
        for(int i = 0;i < mp[fr].size();i++) {
            int j = mp[fr][i];
            if(!vis[j]) {
                dis[j] = dis[fr] + 1;
                vis[j] = true;
                par[j] = fr;
                if(j == t) return true;
                Q.push(j);
            }
        }
    }
    return false;
}
int main() {
    string str;
    while(cin >> str) {
        if(str[0] == 'V') {
            cin >> n;
        } else if(str[0] == 'E') {
            string tmp;
            cin >> tmp;
            if(!init(tmp))
                cout << "ERROR: failed to initialize the map" << endl;
        } else if(str[0] == 's') {
            int s, t;
            cin >> s >> t;
            if(solve(s, t)) {
                showpath(s, t);
                cout << endl;
            }
            else
                cout << "ERROR: do not exist node or path" << endl;
        }
    }
    return 0;
}

#include <iostream>
#include <vector>
#include <map>

using namespace std;

int main() {
    vector<int> P = {1,  2, 3,   4,  5};
    vector<int> Q = {2,  1, 0,  -1, -2, -3};
    vector<int> R = {5, -1, 10, 2};

    map<int, int> counts;

    for (vector<int>* v : {&P, &Q, &R}){
        const vector<int>& vec = *v;
        for (const int& el : vec) {
            auto it = counts.find(el);
            if (it == counts.end()){
                counts[el] = 1;
            }
            else {
                counts[el] += 1;
            }
        }
    }

    vector<int> res;
    for (auto& el : counts) {
        if (el.second == 2) {
            res.push_back(el.first);
        }
    }
}

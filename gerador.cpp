#include <bits/stdc++.h>
using namespace std;

int main(){
    int qtd;
    cin >> qtd;
    while(qtd--){
        string name;
        vector<string> att;
        int nat;
        cin >> name >> nat;
        for(int i=0; i<nat; i++){
            string s;
            cin >> s;
            att.push_back(s);
        }
        int nre;
        cin >> nre;
        while(nre--){
            cout << "INSERT INTO " << name << " (";
            for(int i=0; i<nat; i++){
                if(!(!i || i == nat-1))cout << ',';
                if(i)cout << " ";
                cout << att[i];
            }
            cout << ") Values();\n";
        }
        cout << endl;
    }
    return 0;
}

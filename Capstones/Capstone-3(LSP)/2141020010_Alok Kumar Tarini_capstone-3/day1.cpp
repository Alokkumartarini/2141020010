#include<iostream>
using namespace std;
#include<sys/sysinfo.h>

void display_Memory(){
    struct sysinfo info;
    if(sysinfo(&info) == 0){
        cout<<"Total ram: "<<info.totalram / (1024*1024)<<"MB\n";
        cout<<"Free Ram: "<<info.freeram / (1024*1024)<<"MB\n";
        cout<<"Shared Ram: "<<info.sharedram / (1024*1024)<<"MB\n";
    }
    
}
int main(){
    display_Memory();
    return 0;
}
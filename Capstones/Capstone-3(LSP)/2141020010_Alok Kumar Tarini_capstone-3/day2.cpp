#include<iostream>
#include<fstream>
#include<sstream>
#include<thread>
#include<chrono>

using namespace std;

struct CPU_Data {
    long user, nice, system, idle, iowait, irq, softirq, steal, guest, guest_nice;
};

CPU_Data getCpuData(){
    ifstream file("/proc/stat");
    string line;
    CPU_Data cpu = {};
    if(file.is_open()){
        getline(file, line);
        istringstream ss(line);
        string CPU_Label;
        ss>>CPU_Label>>cpu.user>>cpu.nice>>cpu.system>>cpu.idle>>cpu.iowait>>cpu.irq
        >>cpu.softirq>>cpu.steal>>cpu.guest>>cpu.guest_nice;
    }
    return cpu;
}

double cpu_use(CPU_Data prev, CPU_Data curr){
    long previdle = prev.idle + prev.iowait;
    long curridle = curr.idle + curr.iowait;

    long prevtotal = prev.user + prev.nice + prev.system + previdle + prev.irq 
    + prev.softirq + prev.steal;

    long currtotal = curr.user + curr.nice + curr.system + curridle + curr.irq 
    + curr.softirq + curr.steal;

    long totaldiff = currtotal - prevtotal;
    long idlediff = curridle - previdle;
    
    return (totaldiff - idlediff) * 100.0 / totaldiff;
}

int main(){
    CPU_Data cpu = getCpuData();
    cout<<"User Time: "<<cpu.user<<"\n";
    cout<<"Nice Time: "<<cpu.nice<<"\n";
    cout<<"System Time: "<<cpu.system<<"\n";
    cout<<"Idle Time: "<<cpu.idle<<"\n";
    cout<<"Iowait Time: "<<cpu.iowait<<"\n";
    cout<<"IRQ Time: "<<cpu.irq<<"\n";
    cout<<"Softirq Time: "<<cpu.softirq<<"\n";
    cout<<"Steal Time: "<<cpu.steal<<"\n";
    cout<<"guest Time: "<<cpu.guest<<"\n";
    cout<<"guest_nice Time: "<<cpu.guest_nice<<"\n";
    
    CPU_Data prevdata = getCpuData();
    this_thread::sleep_for(chrono::seconds(1));
    CPU_Data currdata = getCpuData();
    double cpuUsage = cpu_use(prevdata, currdata);
    cout<<"CPU Usage: "<<cpuUsage<<"%\n";
    return 0;
}
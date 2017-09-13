#include "hash-library\md5.h"
#include <iostream>
#include <fstream>
#include <time.h>

int main(int argc, char** argv) {
  MD5 result;
  time_t timer;
  double start = time(&timer);
  
  if(argc > 1) {
    std::ifstream targetfile;
    std::ifstream listtargetfile;
    std::fstream logfile;
    std::string listtargetfilename = argv[0];
    std::string logfilename = argv[0];
    
    if(logfilename.find_last_of("/\\") != std::string::npos) {
      logfilename = logfilename.substr(0,logfilename.find_last_of("/\\")+1);
    }
    
    if(listtargetfilename.find_last_of("/\\") != std::string::npos) {
      listtargetfilename = listtargetfilename.substr(0,listtargetfilename.find_last_of("/\\")+1);
    }
    
    logfilename += "log.txt";
    listtargetfilename += "list.txt";
    
    logfile.open(logfilename, std::ios::app);
    listtargetfile.open(listtargetfilename);
    if(listtargetfile.is_open() && logfile.is_open()) {
      std::string targetfilename;
      while(getline(listtargetfile, targetfilename)) {
        logfile << targetfilename << ":";
        targetfile.open(targetfilename);
        if (targetfile.is_open()) {
          const size_t BufferSize = 144*7*1024;
          char* buffer = new char[BufferSize];
          std::ifstream* ptr = &targetfile;
          while(*ptr) {
            ptr->read(buffer, BufferSize);
            std::size_t numBytesRead = size_t(ptr->gcount());
            result.add(buffer, numBytesRead);
          }
          targetfile.close();
          delete[] buffer;
          logfile << result.getHash();
        }
        else {
          logfile << "ERROR";
        }
        logfile << std::endl;
      }
    }
    std::cout << "Time: " << time(&timer) - start << " sec" << std::endl;
  }
}
#include <iostream> 
#include <fstream>
#include <stdio.h>
#include <unistd.h>
#include <ctime>

int main(int argc, char** argv) {
  std::time_t result = std::time(nullptr);
  std::string now = std::asctime(std::localtime(&result));
  now = now.substr(0,now.find_last_of("\n"));
  std::string targetexe(argv[0]);
  if(targetexe.find_last_of(".") != std::string::npos) {
      targetexe = targetexe.substr(0,targetexe.find_last_of("."));
  }
  targetexe += "IJED.exe";
  
  std::string logfilename = argv[0];
  if(logfilename.find_last_of(".") != std::string::npos) {
      logfilename = logfilename.substr(0,logfilename.find_last_of("."));
  }
  logfilename += "LOG.txt";
  std::fstream logfile;
  
  std::string args = "";
  for(int i = 1;i < argc;i++) {
    std::string c(argv[i]);
    args += c + " ";
  }
  
  logfile.open(logfilename, std::ios::app);
  logfile << now << "|" << args << std::endl;
  logfile.close();
  system(("start /B " + targetexe + " " + args).c_str());

  exit(0);
}
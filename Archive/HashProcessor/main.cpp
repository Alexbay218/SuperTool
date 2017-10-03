#include <iostream>
#include <fstream>
#include <string>
#include <time.h>
#include <vector>

#ifndef _WIN32
  #include <thread>
#endif
#ifdef _WIN32
  #include <mingw.thread.h>
#endif

int main(int argc, char** argv) {
  time_t timer;
  double start = time(&timer);
  
  std::ifstream fileOne;
  std::ifstream fileTwo;
  std::fstream fileOut;
  
  std::vector<std::string> fileOneP;
  std::vector<std::string> fileOneH;
  std::vector<std::string> fileTwoP;
  std::vector<std::string> fileTwoH;
  std::string logfilename = argv[0];
    
  if(logfilename.find_last_of("/\\") != std::string::npos) {
    logfilename = logfilename.substr(0,logfilename.find_last_of("/\\")+1);
  }
  logfilename += "log.txt";
  
  std::cout << logfilename << std::endl;
  std::cin >> logfilename;
  fileOne.open(argv[1], std::ios::in);
  fileTwo.open(argv[2], std::ios::in);
  fileOut.open(logfilename, std::ios::trunc);
  fileOut << "Test\n";
  if(fileOne.is_open() && fileTwo.is_open()) {
    auto fileOneLambda = [&]{
      std::string fileOneLine;
      while(getline(fileOne,fileOneLine)) {
        fileOneP.push_back(fileOneLine.substr(0,fileOneLine.find_last_of(":")));
        fileOneH.push_back(fileOneLine.substr(fileOneLine.find_last_of(":")+1));
      }
    };
    
    auto fileTwoLambda = [&]  {
      std::string fileOneLine;
      while(getline(fileOne,fileOneLine)) {
        fileOneP.push_back(fileOneLine.substr(0,fileOneLine.find_last_of(":")));
        fileOneH.push_back(fileOneLine.substr(fileOneLine.find_last_of(":")+1));
      }
    };
    std::thread fileOneThread(fileOneLambda);
    std::thread fileTwoThread(fileTwoLambda);
    fileOneThread.join();
    fileTwoThread.join();
    fileOut << fileOneP[0] << std::endl;
  }
}
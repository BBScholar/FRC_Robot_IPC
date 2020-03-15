#include "main.h"

#include <iostream>

#include "units.h"
#include "yaml-cpp/parser.h"

TalonSRX talon{1};

int main() {
  YAML::Parser parser;
  std::cout << "Yeet" << std::endl;

  return 0;
}
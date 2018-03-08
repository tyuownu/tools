#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

struct kalman_filter {
  double A;      // 模型的系数矩阵
  double r;      // 模型的方差
  double H;      // 观测方程系数
  double q;      // 观测方程的方差
  double p;      // covariance matrix
  double g;      // kalman filter's gain
  double x;      // output of kalman filter
};

int main(int argc, char* argv[]) {
  std::ifstream file;
  file.open(argv[1]);
  std::vector<double> data;

  if ( !file.is_open() )
    std::cout << "Error open file" << std::endl;

  std::string str;
  while ( getline(file, str) ) {
    std::stringstream ss;
    ss << str;
    double temp;
    ss >> temp;
    data.push_back(temp);
  }

  struct kalman_filter kf = {
    .A = 1,
    .r = 5e2,
    .H = 1,
    .q = 2e2,
    .p = 5e2,
    .g = 0,
    .x = data[1]};

  for ( int index = 2; index < data.size(); index++ ) {
    kf.x = kf.A * kf.x;
    kf.p = kf.A * kf.p * kf.A + kf.q;

    kf.g = kf.H * kf.p / (kf.H * kf.p * kf.H + kf.r);
    kf.x = kf.x + kf.g * ( data[index] - kf.H * kf.x );
    kf.p = (1 - kf.g * kf.H) * kf.p;
    std::cout << data[index] << ", " << kf.x << std::endl;

  }
  return 0;
}

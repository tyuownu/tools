#include <iostream>
#include <vector>

#include <opencv2/core/core.hpp>

#include <ceres/ceres.h>

struct CERES_CURVE_FITTING {
  CERES_CURVE_FITTING(double x, double y) : x_(x), y_(y) {}

  template <typename T>
  bool operator()(const T* const abc, T* resudial) const {
    resudial[0] = T(y_) - exp(abc[0]*T(x_)*T(x_) + abc[1]*T(x_) + abc[2] );
    return true;
  }

  double x_, y_;
};

int main()
{

  cv::RNG rng;
  double abc[3] = {0, 0, 0};
  std::vector<double> Xs;
  std::vector<double> Ys;

  for ( float f = 0.0; f < 1.0; f += 0.01 ) {
    Xs.push_back(f);
    // a = 1, b = 2, c = 3
    Ys.push_back(exp(f*f + 2*f + 3) + rng.gaussian(1.0));
  }

  ceres::Problem problem;
  for ( int i = 0; i < Xs.size(); ++i ) {
    problem.AddResidualBlock(
        new ceres::AutoDiffCostFunction<CERES_CURVE_FITTING, 1, 3>(
            new CERES_CURVE_FITTING(Xs[i], Ys[i])),
        NULL,
        abc);
  }

  ceres::Solver::Options options;
  options.linear_solver_type = ceres::DENSE_QR;
  options.minimizer_progress_to_stdout = true;
  ceres::Solver::Summary summary;
  ceres::Solve(options, &problem, &summary);

  std::cout << summary.BriefReport() << std::endl;

  std::cout << "a = " << abc[0]
      << ", b = " << abc[1]
      << ", c = " << abc[2] << std::endl;

  return 0;
}

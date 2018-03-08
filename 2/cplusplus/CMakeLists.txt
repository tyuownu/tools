cmake_minimum_required( VERSION 2.8 )
project(kalman_filter)

set( CMAKE_BUILD_TYPE "Release" )
set( CMAKE_CXX_FLAGS "-std=c++11 -O3" )

find_package(Eigen3 REQUIRED)

include_directories(${EIGEN3_INCLUDE_DIR})
add_executable(kalman_filter1 kalman_filter1.cpp)
add_executable(kalman_filter2 kalman_filter2.cpp)

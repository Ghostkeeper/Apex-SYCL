cmake_minimum_required(VERSION 3.10.2) #Lowest version it has been tested on.
project(apex)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules")

#Global dependencies.
find_package(SYCL REQUIRED)

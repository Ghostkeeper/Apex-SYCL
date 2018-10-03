find_package(sycl QUIET NO_MODULE NO_CMAKE_PACKAGE_REGISTRY NO_CMAKE_BUILDS_PATH)
find_path(SYCL_INCLUDE_DIR
	NAMES "CL/sycl.hpp")
if(sycl_FOUND)
	message(STATUS "Found implementation of SYCL: ${sycl_DIR}")
else()
	message(FATAL_ERROR "Failed to find implementation of SYCL.")
endif()
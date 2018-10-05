#Apex library for performing parallel geometric algorithms on polygons.
#Copyright (C) 2018 Ghostkeeper
#This library is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for details.
#You should have received a copy of the GNU Affero General Public License along with this library. If not, see <https://gnu.org/licenses/>.

#Find module for any SYCL implementation.
#
#This module attempts to find any SYCL library implementation by looking for CL/sycl.hpp.
#The following variables will be exported:
# - SYCL_FOUND: True if a SYCL implementation was found, or False if none were found.
# - SYCL_INCLUE_DIRS: The location of the SYCL implementation, if found.

find_package(SYCL QUIET NO_MODULE NO_CMAKE_PACKAGE_REGISTRY NO_CMAKE_BUILDS_PATH)

set(_programfilesx86 PROGRAMFILES(x86)) #Hack because this variable is defined but CMake syntax doesn't allow us to request it.
set(_sycl_find_hints
	/usr/local/include #Unix systems.
	/usr/include #Unix systems if they were to install it by default.
	/usr/local/homebrew/include #MacOS.
	/opt/local/var/macports/software #MacOS if it gets ported.
	/opt/local/include #Unix via alternative package managers.
	"$ENV{PROGRAMFILES}" #Windows.
	"$ENV{${_programfilesx86}}" #Windows 32-bit.
)

find_path(SYCL_INCLUDE_DIRS
	HINTS ${_sycl_find_hints}
	NAMES "CL/sycl.hpp"
)
if(sycl_FOUND)
	message(STATUS "Found implementation of SYCL: ${SYCL_INCLUDE_DIRS}")
else()
	message(FATAL_ERROR "Failed to find implementation of SYCL.")
endif()

#Clean-up of local variables.
unset(_programfilesx86)
unset(_sycl_find_hints)
# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zhuguangxu/product/minico-rpc

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zhuguangxu/product/minico-rpc/build

# Include any dependencies generated for this target.
include example/CMakeFiles/minico_test.dir/depend.make

# Include the progress variables for this target.
include example/CMakeFiles/minico_test.dir/progress.make

# Include the compile flags for this target's objects.
include example/CMakeFiles/minico_test.dir/flags.make

example/CMakeFiles/minico_test.dir/main.cc.o: example/CMakeFiles/minico_test.dir/flags.make
example/CMakeFiles/minico_test.dir/main.cc.o: ../example/main.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhuguangxu/product/minico-rpc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object example/CMakeFiles/minico_test.dir/main.cc.o"
	cd /home/zhuguangxu/product/minico-rpc/build/example && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/minico_test.dir/main.cc.o -c /home/zhuguangxu/product/minico-rpc/example/main.cc

example/CMakeFiles/minico_test.dir/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/minico_test.dir/main.cc.i"
	cd /home/zhuguangxu/product/minico-rpc/build/example && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhuguangxu/product/minico-rpc/example/main.cc > CMakeFiles/minico_test.dir/main.cc.i

example/CMakeFiles/minico_test.dir/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/minico_test.dir/main.cc.s"
	cd /home/zhuguangxu/product/minico-rpc/build/example && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhuguangxu/product/minico-rpc/example/main.cc -o CMakeFiles/minico_test.dir/main.cc.s

# Object files for target minico_test
minico_test_OBJECTS = \
"CMakeFiles/minico_test.dir/main.cc.o"

# External object files for target minico_test
minico_test_EXTERNAL_OBJECTS =

../bin/minico_test: example/CMakeFiles/minico_test.dir/main.cc.o
../bin/minico_test: example/CMakeFiles/minico_test.dir/build.make
../bin/minico_test: ../lib/libminico-rpc.so
../bin/minico_test: example/CMakeFiles/minico_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zhuguangxu/product/minico-rpc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/minico_test"
	cd /home/zhuguangxu/product/minico-rpc/build/example && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/minico_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
example/CMakeFiles/minico_test.dir/build: ../bin/minico_test

.PHONY : example/CMakeFiles/minico_test.dir/build

example/CMakeFiles/minico_test.dir/clean:
	cd /home/zhuguangxu/product/minico-rpc/build/example && $(CMAKE_COMMAND) -P CMakeFiles/minico_test.dir/cmake_clean.cmake
.PHONY : example/CMakeFiles/minico_test.dir/clean

example/CMakeFiles/minico_test.dir/depend:
	cd /home/zhuguangxu/product/minico-rpc/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhuguangxu/product/minico-rpc /home/zhuguangxu/product/minico-rpc/example /home/zhuguangxu/product/minico-rpc/build /home/zhuguangxu/product/minico-rpc/build/example /home/zhuguangxu/product/minico-rpc/build/example/CMakeFiles/minico_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : example/CMakeFiles/minico_test.dir/depend

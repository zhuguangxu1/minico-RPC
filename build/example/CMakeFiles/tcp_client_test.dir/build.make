# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zgx/Desktop/Repository

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zgx/Desktop/Repository/build

# Include any dependencies generated for this target.
include example/CMakeFiles/tcp_client_test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include example/CMakeFiles/tcp_client_test.dir/compiler_depend.make

# Include the progress variables for this target.
include example/CMakeFiles/tcp_client_test.dir/progress.make

# Include the compile flags for this target's objects.
include example/CMakeFiles/tcp_client_test.dir/flags.make

example/CMakeFiles/tcp_client_test.dir/tcp_client_test.cc.o: example/CMakeFiles/tcp_client_test.dir/flags.make
example/CMakeFiles/tcp_client_test.dir/tcp_client_test.cc.o: ../example/tcp_client_test.cc
example/CMakeFiles/tcp_client_test.dir/tcp_client_test.cc.o: example/CMakeFiles/tcp_client_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zgx/Desktop/Repository/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object example/CMakeFiles/tcp_client_test.dir/tcp_client_test.cc.o"
	cd /home/zgx/Desktop/Repository/build/example && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT example/CMakeFiles/tcp_client_test.dir/tcp_client_test.cc.o -MF CMakeFiles/tcp_client_test.dir/tcp_client_test.cc.o.d -o CMakeFiles/tcp_client_test.dir/tcp_client_test.cc.o -c /home/zgx/Desktop/Repository/example/tcp_client_test.cc

example/CMakeFiles/tcp_client_test.dir/tcp_client_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tcp_client_test.dir/tcp_client_test.cc.i"
	cd /home/zgx/Desktop/Repository/build/example && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zgx/Desktop/Repository/example/tcp_client_test.cc > CMakeFiles/tcp_client_test.dir/tcp_client_test.cc.i

example/CMakeFiles/tcp_client_test.dir/tcp_client_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tcp_client_test.dir/tcp_client_test.cc.s"
	cd /home/zgx/Desktop/Repository/build/example && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zgx/Desktop/Repository/example/tcp_client_test.cc -o CMakeFiles/tcp_client_test.dir/tcp_client_test.cc.s

# Object files for target tcp_client_test
tcp_client_test_OBJECTS = \
"CMakeFiles/tcp_client_test.dir/tcp_client_test.cc.o"

# External object files for target tcp_client_test
tcp_client_test_EXTERNAL_OBJECTS =

../bin/tcp_client_test: example/CMakeFiles/tcp_client_test.dir/tcp_client_test.cc.o
../bin/tcp_client_test: example/CMakeFiles/tcp_client_test.dir/build.make
../bin/tcp_client_test: ../lib/libminico-rpc.so
../bin/tcp_client_test: example/CMakeFiles/tcp_client_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zgx/Desktop/Repository/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/tcp_client_test"
	cd /home/zgx/Desktop/Repository/build/example && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tcp_client_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
example/CMakeFiles/tcp_client_test.dir/build: ../bin/tcp_client_test
.PHONY : example/CMakeFiles/tcp_client_test.dir/build

example/CMakeFiles/tcp_client_test.dir/clean:
	cd /home/zgx/Desktop/Repository/build/example && $(CMAKE_COMMAND) -P CMakeFiles/tcp_client_test.dir/cmake_clean.cmake
.PHONY : example/CMakeFiles/tcp_client_test.dir/clean

example/CMakeFiles/tcp_client_test.dir/depend:
	cd /home/zgx/Desktop/Repository/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zgx/Desktop/Repository /home/zgx/Desktop/Repository/example /home/zgx/Desktop/Repository/build /home/zgx/Desktop/Repository/build/example /home/zgx/Desktop/Repository/build/example/CMakeFiles/tcp_client_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : example/CMakeFiles/tcp_client_test.dir/depend


# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_SOURCE_DIR = /home/oct/Desktop/2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/oct/Desktop/2

# Include any dependencies generated for this target.
include CMakeFiles/a3-ece650.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/a3-ece650.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/a3-ece650.dir/flags.make

CMakeFiles/a3-ece650.dir/a3-ece650.cpp.o: CMakeFiles/a3-ece650.dir/flags.make
CMakeFiles/a3-ece650.dir/a3-ece650.cpp.o: a3-ece650.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/oct/Desktop/2/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/a3-ece650.dir/a3-ece650.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/a3-ece650.dir/a3-ece650.cpp.o -c /home/oct/Desktop/2/a3-ece650.cpp

CMakeFiles/a3-ece650.dir/a3-ece650.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/a3-ece650.dir/a3-ece650.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/oct/Desktop/2/a3-ece650.cpp > CMakeFiles/a3-ece650.dir/a3-ece650.cpp.i

CMakeFiles/a3-ece650.dir/a3-ece650.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/a3-ece650.dir/a3-ece650.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/oct/Desktop/2/a3-ece650.cpp -o CMakeFiles/a3-ece650.dir/a3-ece650.cpp.s

CMakeFiles/a3-ece650.dir/a3-ece650.cpp.o.requires:
.PHONY : CMakeFiles/a3-ece650.dir/a3-ece650.cpp.o.requires

CMakeFiles/a3-ece650.dir/a3-ece650.cpp.o.provides: CMakeFiles/a3-ece650.dir/a3-ece650.cpp.o.requires
	$(MAKE) -f CMakeFiles/a3-ece650.dir/build.make CMakeFiles/a3-ece650.dir/a3-ece650.cpp.o.provides.build
.PHONY : CMakeFiles/a3-ece650.dir/a3-ece650.cpp.o.provides

CMakeFiles/a3-ece650.dir/a3-ece650.cpp.o.provides.build: CMakeFiles/a3-ece650.dir/a3-ece650.cpp.o

# Object files for target a3-ece650
a3__ece650_OBJECTS = \
"CMakeFiles/a3-ece650.dir/a3-ece650.cpp.o"

# External object files for target a3-ece650
a3__ece650_EXTERNAL_OBJECTS =

a3-ece650: CMakeFiles/a3-ece650.dir/a3-ece650.cpp.o
a3-ece650: CMakeFiles/a3-ece650.dir/build.make
a3-ece650: CMakeFiles/a3-ece650.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable a3-ece650"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/a3-ece650.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/a3-ece650.dir/build: a3-ece650
.PHONY : CMakeFiles/a3-ece650.dir/build

CMakeFiles/a3-ece650.dir/requires: CMakeFiles/a3-ece650.dir/a3-ece650.cpp.o.requires
.PHONY : CMakeFiles/a3-ece650.dir/requires

CMakeFiles/a3-ece650.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/a3-ece650.dir/cmake_clean.cmake
.PHONY : CMakeFiles/a3-ece650.dir/clean

CMakeFiles/a3-ece650.dir/depend:
	cd /home/oct/Desktop/2 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/oct/Desktop/2 /home/oct/Desktop/2 /home/oct/Desktop/2 /home/oct/Desktop/2 /home/oct/Desktop/2/CMakeFiles/a3-ece650.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/a3-ece650.dir/depend


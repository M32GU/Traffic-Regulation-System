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
CMAKE_SOURCE_DIR = /home/oct/Desktop/a5

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/oct/Desktop/a5

# Include any dependencies generated for this target.
include minisat/CMakeFiles/minisat-lib-shared.dir/depend.make

# Include the progress variables for this target.
include minisat/CMakeFiles/minisat-lib-shared.dir/progress.make

# Include the compile flags for this target's objects.
include minisat/CMakeFiles/minisat-lib-shared.dir/flags.make

minisat/CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o: minisat/CMakeFiles/minisat-lib-shared.dir/flags.make
minisat/CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o: minisat/utils/Options.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/oct/Desktop/a5/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object minisat/CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o"
	cd /home/oct/Desktop/a5/minisat && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o -c /home/oct/Desktop/a5/minisat/utils/Options.cc

minisat/CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.i"
	cd /home/oct/Desktop/a5/minisat && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/oct/Desktop/a5/minisat/utils/Options.cc > CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.i

minisat/CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.s"
	cd /home/oct/Desktop/a5/minisat && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/oct/Desktop/a5/minisat/utils/Options.cc -o CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.s

minisat/CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o.requires:
.PHONY : minisat/CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o.requires

minisat/CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o.provides: minisat/CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o.requires
	$(MAKE) -f minisat/CMakeFiles/minisat-lib-shared.dir/build.make minisat/CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o.provides.build
.PHONY : minisat/CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o.provides

minisat/CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o.provides.build: minisat/CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o

minisat/CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o: minisat/CMakeFiles/minisat-lib-shared.dir/flags.make
minisat/CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o: minisat/utils/System.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/oct/Desktop/a5/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object minisat/CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o"
	cd /home/oct/Desktop/a5/minisat && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o -c /home/oct/Desktop/a5/minisat/utils/System.cc

minisat/CMakeFiles/minisat-lib-shared.dir/utils/System.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/minisat-lib-shared.dir/utils/System.cc.i"
	cd /home/oct/Desktop/a5/minisat && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/oct/Desktop/a5/minisat/utils/System.cc > CMakeFiles/minisat-lib-shared.dir/utils/System.cc.i

minisat/CMakeFiles/minisat-lib-shared.dir/utils/System.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/minisat-lib-shared.dir/utils/System.cc.s"
	cd /home/oct/Desktop/a5/minisat && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/oct/Desktop/a5/minisat/utils/System.cc -o CMakeFiles/minisat-lib-shared.dir/utils/System.cc.s

minisat/CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o.requires:
.PHONY : minisat/CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o.requires

minisat/CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o.provides: minisat/CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o.requires
	$(MAKE) -f minisat/CMakeFiles/minisat-lib-shared.dir/build.make minisat/CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o.provides.build
.PHONY : minisat/CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o.provides

minisat/CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o.provides.build: minisat/CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o

minisat/CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o: minisat/CMakeFiles/minisat-lib-shared.dir/flags.make
minisat/CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o: minisat/core/Solver.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/oct/Desktop/a5/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object minisat/CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o"
	cd /home/oct/Desktop/a5/minisat && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o -c /home/oct/Desktop/a5/minisat/core/Solver.cc

minisat/CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.i"
	cd /home/oct/Desktop/a5/minisat && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/oct/Desktop/a5/minisat/core/Solver.cc > CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.i

minisat/CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.s"
	cd /home/oct/Desktop/a5/minisat && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/oct/Desktop/a5/minisat/core/Solver.cc -o CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.s

minisat/CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o.requires:
.PHONY : minisat/CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o.requires

minisat/CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o.provides: minisat/CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o.requires
	$(MAKE) -f minisat/CMakeFiles/minisat-lib-shared.dir/build.make minisat/CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o.provides.build
.PHONY : minisat/CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o.provides

minisat/CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o.provides.build: minisat/CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o

minisat/CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o: minisat/CMakeFiles/minisat-lib-shared.dir/flags.make
minisat/CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o: minisat/simp/SimpSolver.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/oct/Desktop/a5/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object minisat/CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o"
	cd /home/oct/Desktop/a5/minisat && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o -c /home/oct/Desktop/a5/minisat/simp/SimpSolver.cc

minisat/CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.i"
	cd /home/oct/Desktop/a5/minisat && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/oct/Desktop/a5/minisat/simp/SimpSolver.cc > CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.i

minisat/CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.s"
	cd /home/oct/Desktop/a5/minisat && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/oct/Desktop/a5/minisat/simp/SimpSolver.cc -o CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.s

minisat/CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o.requires:
.PHONY : minisat/CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o.requires

minisat/CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o.provides: minisat/CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o.requires
	$(MAKE) -f minisat/CMakeFiles/minisat-lib-shared.dir/build.make minisat/CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o.provides.build
.PHONY : minisat/CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o.provides

minisat/CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o.provides.build: minisat/CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o

# Object files for target minisat-lib-shared
minisat__lib__shared_OBJECTS = \
"CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o" \
"CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o" \
"CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o" \
"CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o"

# External object files for target minisat-lib-shared
minisat__lib__shared_EXTERNAL_OBJECTS =

minisat/libminisat.so.2.1.0: minisat/CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o
minisat/libminisat.so.2.1.0: minisat/CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o
minisat/libminisat.so.2.1.0: minisat/CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o
minisat/libminisat.so.2.1.0: minisat/CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o
minisat/libminisat.so.2.1.0: minisat/CMakeFiles/minisat-lib-shared.dir/build.make
minisat/libminisat.so.2.1.0: /usr/local/lib/libz.so
minisat/libminisat.so.2.1.0: minisat/CMakeFiles/minisat-lib-shared.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library libminisat.so"
	cd /home/oct/Desktop/a5/minisat && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/minisat-lib-shared.dir/link.txt --verbose=$(VERBOSE)
	cd /home/oct/Desktop/a5/minisat && $(CMAKE_COMMAND) -E cmake_symlink_library libminisat.so.2.1.0 libminisat.so.2 libminisat.so

minisat/libminisat.so.2: minisat/libminisat.so.2.1.0

minisat/libminisat.so: minisat/libminisat.so.2.1.0

# Rule to build all files generated by this target.
minisat/CMakeFiles/minisat-lib-shared.dir/build: minisat/libminisat.so
.PHONY : minisat/CMakeFiles/minisat-lib-shared.dir/build

# Object files for target minisat-lib-shared
minisat__lib__shared_OBJECTS = \
"CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o" \
"CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o" \
"CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o" \
"CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o"

# External object files for target minisat-lib-shared
minisat__lib__shared_EXTERNAL_OBJECTS =

minisat/CMakeFiles/CMakeRelink.dir/libminisat.so.2.1.0: minisat/CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o
minisat/CMakeFiles/CMakeRelink.dir/libminisat.so.2.1.0: minisat/CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o
minisat/CMakeFiles/CMakeRelink.dir/libminisat.so.2.1.0: minisat/CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o
minisat/CMakeFiles/CMakeRelink.dir/libminisat.so.2.1.0: minisat/CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o
minisat/CMakeFiles/CMakeRelink.dir/libminisat.so.2.1.0: minisat/CMakeFiles/minisat-lib-shared.dir/build.make
minisat/CMakeFiles/CMakeRelink.dir/libminisat.so.2.1.0: /usr/local/lib/libz.so
minisat/CMakeFiles/CMakeRelink.dir/libminisat.so.2.1.0: minisat/CMakeFiles/minisat-lib-shared.dir/relink.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library CMakeFiles/CMakeRelink.dir/libminisat.so"
	cd /home/oct/Desktop/a5/minisat && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/minisat-lib-shared.dir/relink.txt --verbose=$(VERBOSE)
	cd /home/oct/Desktop/a5/minisat && $(CMAKE_COMMAND) -E cmake_symlink_library CMakeFiles/CMakeRelink.dir/libminisat.so.2.1.0 CMakeFiles/CMakeRelink.dir/libminisat.so.2 CMakeFiles/CMakeRelink.dir/libminisat.so

minisat/CMakeFiles/CMakeRelink.dir/libminisat.so.2: minisat/CMakeFiles/CMakeRelink.dir/libminisat.so.2.1.0

minisat/CMakeFiles/CMakeRelink.dir/libminisat.so: minisat/CMakeFiles/CMakeRelink.dir/libminisat.so.2.1.0

# Rule to relink during preinstall.
minisat/CMakeFiles/minisat-lib-shared.dir/preinstall: minisat/CMakeFiles/CMakeRelink.dir/libminisat.so
.PHONY : minisat/CMakeFiles/minisat-lib-shared.dir/preinstall

minisat/CMakeFiles/minisat-lib-shared.dir/requires: minisat/CMakeFiles/minisat-lib-shared.dir/utils/Options.cc.o.requires
minisat/CMakeFiles/minisat-lib-shared.dir/requires: minisat/CMakeFiles/minisat-lib-shared.dir/utils/System.cc.o.requires
minisat/CMakeFiles/minisat-lib-shared.dir/requires: minisat/CMakeFiles/minisat-lib-shared.dir/core/Solver.cc.o.requires
minisat/CMakeFiles/minisat-lib-shared.dir/requires: minisat/CMakeFiles/minisat-lib-shared.dir/simp/SimpSolver.cc.o.requires
.PHONY : minisat/CMakeFiles/minisat-lib-shared.dir/requires

minisat/CMakeFiles/minisat-lib-shared.dir/clean:
	cd /home/oct/Desktop/a5/minisat && $(CMAKE_COMMAND) -P CMakeFiles/minisat-lib-shared.dir/cmake_clean.cmake
.PHONY : minisat/CMakeFiles/minisat-lib-shared.dir/clean

minisat/CMakeFiles/minisat-lib-shared.dir/depend:
	cd /home/oct/Desktop/a5 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/oct/Desktop/a5 /home/oct/Desktop/a5/minisat /home/oct/Desktop/a5 /home/oct/Desktop/a5/minisat /home/oct/Desktop/a5/minisat/CMakeFiles/minisat-lib-shared.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : minisat/CMakeFiles/minisat-lib-shared.dir/depend


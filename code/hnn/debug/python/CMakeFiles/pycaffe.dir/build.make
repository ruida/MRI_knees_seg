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

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/cmake-gui

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/rothhr/Code/HED/hed-globalweight

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/rothhr/Code/HED/hed-globalweight/debug

# Include any dependencies generated for this target.
include python/CMakeFiles/pycaffe.dir/depend.make

# Include the progress variables for this target.
include python/CMakeFiles/pycaffe.dir/progress.make

# Include the compile flags for this target's objects.
include python/CMakeFiles/pycaffe.dir/flags.make

python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o: python/CMakeFiles/pycaffe.dir/flags.make
python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o: ../python/caffe/_caffe.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/rothhr/Code/HED/hed-globalweight/debug/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o"
	cd /home/rothhr/Code/HED/hed-globalweight/debug/python && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o -c /home/rothhr/Code/HED/hed-globalweight/python/caffe/_caffe.cpp

python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.i"
	cd /home/rothhr/Code/HED/hed-globalweight/debug/python && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/rothhr/Code/HED/hed-globalweight/python/caffe/_caffe.cpp > CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.i

python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.s"
	cd /home/rothhr/Code/HED/hed-globalweight/debug/python && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/rothhr/Code/HED/hed-globalweight/python/caffe/_caffe.cpp -o CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.s

python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o.requires:
.PHONY : python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o.requires

python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o.provides: python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o.requires
	$(MAKE) -f python/CMakeFiles/pycaffe.dir/build.make python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o.provides.build
.PHONY : python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o.provides

python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o.provides.build: python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o

# Object files for target pycaffe
pycaffe_OBJECTS = \
"CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o"

# External object files for target pycaffe
pycaffe_EXTERNAL_OBJECTS =

lib/_caffe-d.so: python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o
lib/_caffe-d.so: python/CMakeFiles/pycaffe.dir/build.make
lib/_caffe-d.so: lib/libcaffe-d.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libpython2.7.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libboost_python.so
lib/_caffe-d.so: lib/libproto-d.a
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libboost_system.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libpthread.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libglog.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libgflags.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libprotobuf.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libglog.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libgflags.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libprotobuf.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libhdf5_hl.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libhdf5.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/liblmdb.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libleveldb.so
lib/_caffe-d.so: /usr/lib/libsnappy.so
lib/_caffe-d.so: /usr/local/cuda/lib64/libcudart.so
lib/_caffe-d.so: /usr/local/cuda/lib64/libcurand.so
lib/_caffe-d.so: /usr/local/cuda/lib64/libcublas.so
lib/_caffe-d.so: /usr/local/cuda/lib64/libcudnn.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
lib/_caffe-d.so: /usr/lib/liblapack_atlas.so
lib/_caffe-d.so: /usr/lib/libcblas.so
lib/_caffe-d.so: /usr/lib/libatlas.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libpython2.7.so
lib/_caffe-d.so: /usr/lib/x86_64-linux-gnu/libboost_python.so
lib/_caffe-d.so: python/CMakeFiles/pycaffe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library ../lib/_caffe-d.so"
	cd /home/rothhr/Code/HED/hed-globalweight/debug/python && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pycaffe.dir/link.txt --verbose=$(VERBOSE)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Creating symlink /home/rothhr/Code/HED/hed-globalweight/python/caffe/_caffe.so -> /home/rothhr/Code/HED/hed-globalweight/debug/lib/_caffe-d.so"
	cd /home/rothhr/Code/HED/hed-globalweight/debug/python && ln -sf /home/rothhr/Code/HED/hed-globalweight/debug/lib/_caffe-d.so /home/rothhr/Code/HED/hed-globalweight/python/caffe/_caffe.so
	cd /home/rothhr/Code/HED/hed-globalweight/debug/python && /usr/bin/cmake -E make_directory /home/rothhr/Code/HED/hed-globalweight/python/caffe/proto
	cd /home/rothhr/Code/HED/hed-globalweight/debug/python && touch /home/rothhr/Code/HED/hed-globalweight/python/caffe/proto/__init__.py
	cd /home/rothhr/Code/HED/hed-globalweight/debug/python && cp /home/rothhr/Code/HED/hed-globalweight/debug/include/caffe/proto/*.py /home/rothhr/Code/HED/hed-globalweight/python/caffe/proto/

# Rule to build all files generated by this target.
python/CMakeFiles/pycaffe.dir/build: lib/_caffe-d.so
.PHONY : python/CMakeFiles/pycaffe.dir/build

python/CMakeFiles/pycaffe.dir/requires: python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o.requires
.PHONY : python/CMakeFiles/pycaffe.dir/requires

python/CMakeFiles/pycaffe.dir/clean:
	cd /home/rothhr/Code/HED/hed-globalweight/debug/python && $(CMAKE_COMMAND) -P CMakeFiles/pycaffe.dir/cmake_clean.cmake
.PHONY : python/CMakeFiles/pycaffe.dir/clean

python/CMakeFiles/pycaffe.dir/depend:
	cd /home/rothhr/Code/HED/hed-globalweight/debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/rothhr/Code/HED/hed-globalweight /home/rothhr/Code/HED/hed-globalweight/python /home/rothhr/Code/HED/hed-globalweight/debug /home/rothhr/Code/HED/hed-globalweight/debug/python /home/rothhr/Code/HED/hed-globalweight/debug/python/CMakeFiles/pycaffe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : python/CMakeFiles/pycaffe.dir/depend


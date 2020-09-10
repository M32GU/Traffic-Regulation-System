cmake_minimum_required(VERSION 2.8)
project(a4-ece650)

if (EXISTS "${CMAKE_SOURCE_DIR}/minisat")
  add_subdirectory(minisat)
else()
  message ("${CMAKE_SOURCE_DIR}/minisat" dosen't exsit)
endif()

set (CMAKE_CXX_FLAGS "-std=c++11 -Wall ${CMAKE_CXX_FLAGS}")
include_directories(${CMAKE_SOURCE_DIR}/minisat)

# create the main executable
## add additional .cpp files if needed
add_executable(a4-ece650 a4-ece650.cpp)
# link MiniSAT libraries
target_link_libraries(a4-ece650 minisat-lib-static)

# create the executable for tests
#add_executable(test test.cpp)
# link MiniSAT libraries
target_link_libraries(minisat-lib-static)


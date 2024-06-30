cmake_minimum_required(VERSION 3.25)
project(test)

add_library(my_lib my_lib.cpp my_lib.h)
target_compile_features(my_lib PRIVATE cxx_std_23)

add_executable(my_test main.cpp)
target_link_libraries(my_test PUBLIC my_lib)

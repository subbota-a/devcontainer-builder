#include "my_lib.h"

#include <print>

void print_cpp_version()
{
    std::print("__cplusplus={}\n", __cplusplus);
}
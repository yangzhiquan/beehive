//
//  native_interface.cpp
//  Runner
//
//  Created by yvanyang on 2022/8/22.
//

#include "native_interface.hpp"

extern "C" __attribute__((visibility("default"))) __attribute__((used))
int32_t native_add(int32_t x, int32_t y) {
    return x + y;
}

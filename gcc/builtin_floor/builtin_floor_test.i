# 1 "builtin_floor_test.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 32 "<command-line>" 2
# 1 "builtin_floor_test.c"
enum { FE_DOWNWARD = 0x400 };

extern int fesetround(int rounding_direction);

__attribute__((noinline))
float builtin_floorf(float value)
{
    return __builtin_floorf(value);
}

int main()
{
    fesetround(FE_DOWNWARD);
    float result = builtin_floorf(0.25f);
    return __builtin_signbitf(result) != 0;
}

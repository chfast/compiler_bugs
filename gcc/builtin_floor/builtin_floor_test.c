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

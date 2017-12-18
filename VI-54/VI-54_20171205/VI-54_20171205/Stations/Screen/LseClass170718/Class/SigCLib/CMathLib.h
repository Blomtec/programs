#ifndef _CMathLibH
 #define _CMathLibH
  
  #include "DefineCompiler.h"

  #define sigclib_pi 3.14159265358979323846264338327
  #define sigclib_rad_to_grad(p) (((p)*180) / (sigclib_pi))
  #define sigclib_grad_to_rad(p) (((p)*sigclib_pi) / 180)

  #ifdef cCompile
    #define sigclib_sprintf LSL_POS->piCRT->sprintf

    #define sigclib_abs(A)    (((A) < 0)? -(A) : (A))
    #define sigclib_max(A, B) (((A) > (B))? (A) : (B))
    #define sigclib_isQNAN(A) ((A) != (A))
    
    cExtern float sigclib_sin(float alpha);
    cExtern float sigclib_cos(float alpha);
    cExtern float sigclib_tan(float alpha);
    cExtern float sigclib_asin(float alpha);
    cExtern float sigclib_acos(float alpha);
    cExtern float sigclib_atan(float alpha);
    cExtern float sigclib_atan2(float y, float x);
    cExtern float sigclib_sqrt(float value);
    cExtern float sigclib_pow(float value, float exponent);
    cExtern float sigclib_exp(float exponent);
    cExtern float sigclib_floor(float exponent);
    cExtern float sigclib_ceil(float exponent);
    cExtern float sigclib_fmod(float value, float divisor);
    cExtern float sigclib_hypot(float a, float b); // sqrt(a*a+b*b)
    cExtern float sigclib_log(float value);
    cExtern float sigclib_log10(float value);
    cExtern long  sigclib_ftol(float value);

  #else
  
    #define sigclib_sin(p)  sin(p)
    #define sigclib_cos(p)  cos(p)
    #define sigclib_tan(p)  tan(p)
    #define sigclib_asin(p) asin(p)
    #define sigclib_acos(p) acos(p)
    #define sigclib_atan(p) atan(p)
    
  #endif
  
#endif
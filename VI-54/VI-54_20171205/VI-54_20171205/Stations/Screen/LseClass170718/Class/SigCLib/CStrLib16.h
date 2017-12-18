#ifndef _CStrLib16H
 #define _CStrLib16H

  #include "DefineCompiler.h"

  #ifdef cCompile
  
    cExtern unsigned short* sigclib_tostr16(unsigned short *dst0, const char *src0);
    cExtern char*           sigclib_tostr08(char *dst0, const unsigned short *src0);
    cExtern unsigned long   sigclib_strlen16(const unsigned short* str);
    cExtern unsigned short* sigclib_strcpy16(unsigned short* dst0, const unsigned short* src0);
    cExtern long            sigclib_strcmp16(const unsigned short *src1, const unsigned short *src2);
    cExtern unsigned short* sigclib_strcat16(unsigned short *src1, const unsigned short *src2);
    cExtern unsigned short* sigclib_strchr16(const unsigned short *src1, unsigned long i);
    cExtern unsigned short* sigclib_strupr16(unsigned short *src);
    cExtern unsigned short* sigclib_strlwr16(unsigned short *src);
    cExtern unsigned short* sigclib_strstr16(const unsigned short* searchee, const unsigned short* lookfor);
    
  #else
  
    function global __cdecl sigclib_tostr16 var_input dst0:^uint; src0:^char; end_var var_output retcode:^uint; end_var;
    function global __cdecl sigclib_tostr08 var_input dst0:^char; src0:^uint; end_var var_output retcode:^char; end_var;
    function global __cdecl sigclib_strlen16 var_input str:^uint; end_var var_output retcode : udint; end_var;
    function global __cdecl sigclib_strcpy16 var_input dst0:^uint; src0:^uint; end_var var_output retcode:^uint; end_var;
    function global __cdecl sigclib_strcmp16 var_input src1:^uint; src2:^uint; end_var var_output retcode:dint; end_var;
    function global __cdecl sigclib_strcat16 var_input ps1:^uint; ps2:^uint; end_var var_output retcode:^uint; end_var;
    function global __cdecl sigclib_strchr16 var_input ps1:^uint; i:udint; end_var var_output retcode:^uint; end_var;
    function global __cdecl sigclib_strupr16 var_input src:^uint; end_var var_output retcode:^uint; end_var;
    function global __cdecl sigclib_strlwr16 var_input src:^uint; end_var var_output retcode:^uint; end_var;
    function global __cdecl sigclib_strstr16 var_input searchee:^uint; lookfor:^uint; end_var var_output retcode:^uint; end_var;
    
  #endif
#endif  

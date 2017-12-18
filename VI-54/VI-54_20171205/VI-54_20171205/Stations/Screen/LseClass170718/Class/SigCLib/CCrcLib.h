#ifndef _CCrcLibH
 #define _CCrcLibH
  
  #include "DefineCompiler.h"

  #ifdef cCompile
    cExtern unsigned long sigclib_crc32(unsigned long initval, void *psrc, unsigned long length);
  #else
    function global __cdecl sigclib_crc32 var_input initval:udint; psrc:^void; length:udint; end_var var_output retcode:udint; end_var;
  #endif
  
#endif

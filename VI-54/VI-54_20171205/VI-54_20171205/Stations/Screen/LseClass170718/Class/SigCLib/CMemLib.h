#ifndef _CMemLibH
 #define _CMemLibH

  #include "DefineCompiler.h"

  #ifdef cCompile

    // alloc memory
    cExtern void* sigclib_malloc(unsigned long size);

    // calloc memory (alloc + memset(0))
    cExtern void* sigclib_calloc(unsigned long num, unsigned long size);
  
    // realloc memory
    cExtern void* sigclib_realloc(void* ptr, unsigned long size);
  
    // free memory
    cExtern void  sigclib_free(void* ptr);
  
    // alloc, realloc and free memory
    cExtern unsigned long sigclib_memory(void **pptr, unsigned long size);

  #else
  
    // alloc memory
    function global __cdecl sigclib_malloc var_input size : udint; end_var var_output retcode : ^void; end_var;
  
    // calloc memory (alloc + memset(0))
    function global __cdecl sigclib_calloc var_input num : udint; size : udint; end_var var_output retcode : ^void; end_var;
  
    // realloc memory
    function global __cdecl sigclib_realloc var_input ptr : ^void; size : udint; end_var var_output retcode : ^void; end_var;
  
    // free memory
    function global __cdecl sigclib_free var_input ptr : ^void; end_var;
  
    // alloc, realloc and free memory
    function global __cdecl sigclib_memory var_input pptr : ^pvoid; size : udint; end_var var_output retcode : udint; end_var;
  
  #endif
 
#endif


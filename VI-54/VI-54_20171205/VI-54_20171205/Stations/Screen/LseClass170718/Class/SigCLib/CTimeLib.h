#ifndef _CTimeLibH
  #define _CTimeLibH

  #include "DefineCompiler.h"

  #ifdef cCompile
    #include "lsl_c_ifssr.h"
//    #include "RTOS_C_interfaces.h"
//    #include "file_iotypes.h"

    #pragma pack (push, 1) 
      typedef long time_t;
      typedef struct
      {
        int tm_sec;   // 0-59
        int tm_min;   // 0-59
        int tm_hour;  // 0-23
        int tm_mday;  // 1-31
        int tm_mon;   // 0-11
        int tm_year;  // years since 1970
        int tm_wday;  // days since sunday, 0..sunday, 1..monday
        int tm_yday;  // 0-366
        int tm_isdst; // daylight saving flag
      }
      sigclib_tm;
  
      typedef struct
      {
        time_t         time;
        unsigned short millitm;
        short          timezone;
        short          dstflag;
      }
      sigclib_timeb;
    #pragma pack (pop)

    extern const unsigned long sigclib_crc23table[];

    // get unixtimestamp (seconds till 1.Jan.1970) of actual sysdate and systime
    cExtern time_t sigclib_time(time_t *source);
  
    // get date and time from given unixtimestamp
    cExtern sigclib_tm* sigclib_gmtime(time_t *timet);
  
    // get unixtimestamp from given date and time
    cExtern time_t sigclib_timegm(sigclib_tm *tm);

    // check tm and return unixtimestamp (if tm is not correct, tm will be corrected and -1 is returned)
    cExtern time_t sigclib_mktime(sigclib_tm *tm);
  
    // fill given structure with actual unixtimestamp
    cExtern long sigclib_ftime(sigclib_timeb *tb);
  
    // function to seed sigclib_rand()
    cExtern void sigclib_srand(unsigned long seed);
  
    // get pseudorandomvalue (0-32767), use sigclib_srand() to seed random.
    // each time when using same seed you'll get same chronologic pseudorandomvalues
    cExtern long sigclib_rand(void);
  
    // get randomvalue from (0 to max-1)
    cExtern unsigned long sigclib_random(unsigned long max);
  
    // get tabsolute in milliseconds
    cExtern unsigned long sigclib_tabsolute(void);
  
    // get uptime in microseconds
    cExtern unsigned long sigclib_getmicrotime(void);
    
    // get systemtime
    cExtern void sigclib_getsystime(SYSTIME *ptime);

    // get systemdate
    cExtern void sigclib_getsysdate(SYSDATE *pdate);
  
    // set systime
    cExtern void sigclib_setsystime(SYSTIME *ptime);
    
    // set sysdate
    cExtern void sigclib_setsysdate(SYSDATE *pdate);
  
    // format time to string
    cExtern unsigned long   sigclib_strftime(char* s, unsigned long maxsize, char* format, sigclib_tm* tm);
  
  #else

    #include "lsl_st_ifssr.h"

    type
        time_t : dint;
      #pragma pack(push, 1)
        sigclib_tm : struct
          tm_sec   : dint;
          tm_min   : dint;
          tm_hour  : dint;
          tm_mday  : dint;
          tm_mon   : dint;
          tm_year  : dint; 
          tm_wday  : dint;
          tm_yday  : dint;
          tm_isdst : dint;
        end_struct;
        
        sigclib_timeb : struct
          b_time     : time_t;
          b_millitm  : uint;
          b_timezone : int;
          b_dstflag  : int;
        end_struct;
      #pragma pack(pop)      
    end_type


    // get unixtimestamp (seconds till 1.Jan.1970) of actual sysdate and systime
    function global __cdecl sigclib_time var_input pdst : ^time_t; end_var var_output retcode : time_t; end_var;
  
    // get date and time from given unixtimestamp
    function global __cdecl sigclib_gmtime var_input timet : ^time_t; end_var var_output retcode : ^sigclib_tm; end_var;
  
    // get unixtimestamp from given date and time
    function global __cdecl sigclib_timegm var_input tm : ^sigclib_tm; end_var var_output retcode : time_t; end_var;
  
    // check tm and return unixtimestamp (if tm is not correct, tm will be corrected and -1 is returned)
    function global __cdecl sigclib_mktime var_input tm : ^sigclib_tm; end_var var_output retcode : time_t; end_var;
  
    // fill given structure with actual unixtimestamp
    function global __cdecl sigclib_ftime var_input tb : ^sigclib_timeb; end_var var_output retcode : dint; end_var;
  
    // function to seed sigclib_rand()
    function global __cdecl sigclib_srand var_input seed : udint; end_var;
  
    // get pseudorandomvalue (0-32767), use sigclib_srand() to seed random.
    // each time when using same seed you'll get same chronologic pseudorandomvalues
    function global __cdecl sigclib_rand var_output retcode : dint; end_var;
  
    // get randomvalue from (0 to max-1)
    function global __cdecl sigclib_random var_input max : udint; end_var var_output retcode : udint; end_var;
  
    // get tabsolute in milliseconds
    function global __cdecl sigclib_tabsolute var_output retcode : udint; end_var;
  
    // get uptime in microseconds
    function global __cdecl sigclib_getmicrotime var_output retcode : udint; end_var;
    
    // get systemtime
    function global __cdecl sigclib_getsystime var_input ptime : ^SYSTIME; end_var;

    // get systemdate
    function global __cdecl sigclib_getsysdate var_input pdate : ^SYSDATE; end_var;

    // set systime
    function global __cdecl sigclib_setsystime var_input ptime : ^SYSTIME; end_var;
    
    // set sysdate
    function global __cdecl sigclib_setsysdate var_input pdate : ^SYSDATE; end_var;

    // format time to string
    function global __cdecl sigclib_strftime var_input dst0 : ^char; maxsize : udint; format : ^char; tm : ^void; end_var var_output retcode : dint; end_var;

  #endif

  
#endif

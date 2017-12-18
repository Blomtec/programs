#ifndef __LSLPRJ_UNITS_H__
  #include <Units.h>
#endif


// codes
#define Guest                     1
#define Opperator                 2
#define Technician                3

// tijden
#define _1ms                      1
#define _10ms                     10
#define _100ms                    100
#define _1s                       1000
#define _1min                     60000  
#define _Min                      60 // seconde

//task tijden
#define cRT                       4
#define cCT                       cRT * 3
#define cBT                       cRT * 25
#define cVaranManagerT            cRT * 1000000 

// recept positie
#define  ReceptDir                "C:\product\"
#define  MakeReceptDir            "C:\product"
#define MaxNbrRecipeList          100


#define _T0delay                  1000
#define Max_Scoop_size            200
#define cRegister                 50 
#define Max_Scoop_name_lenght     40

// Code Sleegers
#define _SaveCode                 2468
#define cSettings                 2105
#define cUnlockCode               31422076
#define cGeenCode                 16#FFFFFFF
#define cConfigCode               15071955
#define cConfigName               "Sleegers"

// Assen algemeen60     
#define _T0delay                  1000
#define cIntUnitsTo_xx            100   // alles via het display 1 digit achter de komma xxxx,x
#define cUnitsResulution          1000
#define _MperMin                  100000/6
#define cCleaningSpeed            150000  // 50mm per sec    
#define cIntUnitsTo_mm            1000.0
#define ToMperMin                 * 6.0 / 10000.0
#define ToMMperSec                * 10000.0 / 6.0
#define ToMperSec2                / 100000
#define ToMMperSec2               * 100000


#define cResolutionFactor         1.0
#define cNbrOfMachinesInLine      2

#ifndef __LSLPRJ_UNITS_H__
  #include <Units.h>
#endif

#define MachineType               54 // VI-54

#define HwRequired                0

#define Phi                       3.1415926535897932384626433832795

#define _1ms                      1
#define _10ms                     10
#define _100ms                    100
#define _1s                       1000
#define _1min                     60000  
#define cMin                      60 // seconde

//task tijden
#define cRT                       4
#define cCT                       cRT * 4
#define cBT                       cRT * 25
#define cVaranManagerT            cRT * 1000000 
#define cFeederSCurve             40

// Assen algemeen
#define _MperMin                  100000/60     
#define cIntUnitsTo_xx            100
#define cIntUnitsTo_mm            1000.0
#define ToMperMin                 * 6.0 / 10000.0
#define ToMMperSec                * 10000.0 / 6.0
#define ToMperSec2                / 100000
#define ToMMperSec2               * 100000
#define _T0delay                  1000
#define _IntUnitsTommMul100       * 100.0
#define _IntUnitsTommDiv100       / 100.0
#define _mps2TOmmps2              * 1000000.0 / 6.0
#define cResolutionFactor         1

// Define max camera's
#define MaxCameras    4

// maximale en minimale waardes bereik servo
#define _LMCAXIS_MIN_POS                      -16#07000000  // default MINPOS when INITvalue=0
#define _LMCAXIS_MAX_POS                      16#07000000   // default MAXPOS when INITvalue=0



// ------------------------------- DRIVE 1 ------------------------------- //
// InfeedConv, AKM22C-ANBNR-00 i.c.m. Alphira CP060-MX1-10-111
#define cInfeedConvMaxRpm                 6000.0  // rpm  ivm reductie kastjes.....
#define cInfeedConvResolution             cResolutionFactor 
#define cInfeedConvCircumference          ((60.8 * phi * cIntUnitsTo_mm) / cInfeedConvResolution)
#define cInfeedConvRatio                  10.0     // i ratio 
#define cInfeedConvIntUnits               (cInfeedConvCircumference *  cInfeedConvResolution)
#define cInfeedConvExtUnits               - 65536 * cInfeedConvRatio 
#define cInfeedConvVmax                   ((cInfeedConvMaxRpm / cInfeedConvRatio / 60.0 / cInfeedConvResolution) * cInfeedConvIntUnits)// units/sec
#define cInfeedConvVmax95proc             cInfeedConvVmax * 98 / 100
#define cInfeedConvAmax                   cInfeedConvVmax * 10
#define cInfeedConvWidth                  650 * cIntUnitsTo_mm // width of infeed conveyor

// RejectorConv, AKM22C-ANBNR-00 i.c.m. Alphira CP060-MX1-10-111
#define cRejectorConvMaxRpm               6000.0  // rpm  ivm reductie kastjes.....
#define cRejectorConvResolution           cResolutionFactor 
#define cRejectorConvCircumference        ((60.8 * phi * cIntUnitsTo_mm) / cRejectorConvResolution)
#define cRejectorConvRatio                10.0     // i ratio 
#define cRejectorConvIntUnits             (cRejectorConvCircumference *  cRejectorConvResolution)
#define cRejectorConvExtUnits             - 65536 * cRejectorConvRatio 
#define cRejectorConvVmax                 ((cRejectorConvMaxRpm / cRejectorConvRatio / 60.0 / cRejectorConvResolution) * cRejectorConvIntUnits)// units/sec
#define cRejectorConvVmax95proc           cRejectorConvVmax * 98 / 100
#define cRejectorConvAmax                 cRejectorConvVmax * 10
#define cRejectorConvWidth                650 * cIntUnitsTo_mm // width of Rejector conveyor

// Rejector, AKM22C-ANBNR-00 i.c.m. Alphira CP060-MX1-10-111






// Y-Conveyor, AKM22C-ANBNR-00 i.c.m. Alphira CP060-MX1-10-111
#define cYconveyorMaxRpm                  6000.0  // rpm  ivm reductie kastjes.....
#define cYconveyorResolution              cResolutionFactor 
#define cYconveyorCircumference           ((60.8 * phi * cIntUnitsTo_mm) / cYconveyorResolution)
#define cYconveyorRatio                   10.0     // i ratio 
#define cYconveyorIntUnits                (cYconveyorCircumference *  cYconveyorResolution)
#define cYconveyorExtUnits                - 65536 * cYconveyorRatio 
#define cYconveyorVmax                    ((cYconveyorMaxRpm / cYconveyorRatio / 60.0 / cYconveyorResolution) * cYconveyorIntUnits)// units/sec
#define cYconveyorVmax95proc              cYconveyorVmax * 98 / 100
#define cYconveyorAmax                    cYconveyorVmax * 10
#define cYconveyorWidth                   650 * cIntUnitsTo_mm // width of Rejector conveyor

// Outfeed conveyor, AKM22C-ANBNR-00 i.c.m. Alphira CP060-MX1-10-111
#define cOutfeedConvMaxRpm                6000.0  // rpm  ivm reductie kastjes.....
#define cOutfeedConvResolution            cResolutionFactor 
#define cOutfeedConvCircumference         ((60.8 * phi * cIntUnitsTo_mm) / cOutfeedConvResolution)
#define cOutfeedConvRatio                 10.0     // i ratio 
#define cOutfeedConvIntUnits              (cOutfeedConvCircumference *  cOutfeedConvResolution)
#define cOutfeedConvExtUnits              - 65536 * cOutfeedConvRatio 
#define cOutfeedConvVmax                  ((cOutfeedConvMaxRpm / cOutfeedConvRatio / 60.0 / cOutfeedConvResolution) * cOutfeedConvIntUnits)// units/sec
#define cOutfeedConvVmax95proc            cOutfeedConvVmax * 98 / 100
#define cOutfeedConvAmax                  cOutfeedConvVmax * 10
#define cOutfeedConvWidth                 650 * cIntUnitsTo_mm // width of Rejector conveyor


// ------------------------------- DRIVE 2 ------------------------------- //
// X-Axle 1, AKM22C-ANBNR-00 i.c.m. Alphira CP060-MX1-10-111
#define cXaxle1MaxRpm                     8000.0  // rpm  ivm reductie kastjes.....
#define cXaxle1Resolution                 cResolutionFactor 
#define cXaxle1Circumference              ((60.8 * phi * cIntUnitsTo_mm) / cXaxle1Resolution)
#define cXaxle1Ratio                      10.0     // i ratio 
#define cXaxle1IntUnits                   (cXaxle1Circumference *  cXaxle1Resolution)
#define cXaxle1ExtUnits                   -65536 * cXaxle1Ratio 
#define cXaxle1Vmax                       ((cXaxle1MaxRpm / cXaxle1Ratio / 60.0 / cXaxle1Resolution) * cXaxle1IntUnits)// units/sec
#define cXaxle1Vmax95proc                 cXaxle1Vmax * 98 / 100
#define cXaxle1Amax                       cXaxle1Vmax * 10
// X-Axle 2, AKM22C-ANBNR-00 i.c.m. Alphira CP060-MX1-10-111
#define cXaxle2MaxRpm                     8000.0  // rpm  ivm reductie kastjes.....
#define cXaxle2Resolution                 cResolutionFactor 
#define cXaxle2Circumference              ((60.8 * phi * cIntUnitsTo_mm) / cXaxle2Resolution)
#define cXaxle2Ratio                      10.0     // i ratio 
#define cXaxle2IntUnits                   (cXaxle2Circumference *  cXaxle2Resolution)
#define cXaxle2ExtUnits                   -65536 * cXaxle2Ratio 
#define cXaxle2Vmax                       ((cXaxle2MaxRpm / cXaxle2Ratio / 60.0 / cXaxle2Resolution) * cXaxle2IntUnits)// units/sec
#define cXaxle2Vmax95proc                 cXaxle2Vmax * 98 / 100
#define cXaxle2Amax                       cXaxle2Vmax * 10
// X-Axle 3, AKM22C-ANBNR-00 i.c.m. Alphira CP060-MX1-10-111
#define cXaxle3MaxRpm                     8000.0  // rpm  ivm reductie kastjes.....
#define cXaxle3Resolution                 cResolutionFactor 
#define cXaxle3Circumference              ((60.8 * phi * cIntUnitsTo_mm) / cXaxle3Resolution)
#define cXaxle3Ratio                      10.0     // i ratio 
#define cXaxle3IntUnits                   (cXaxle3Circumference *  cXaxle3Resolution)
#define cXaxle3ExtUnits                   -65536 * cXaxle3Ratio 
#define cXaxle3Vmax                       ((cXaxle3MaxRpm / cXaxle3Ratio / 60.0 / cXaxle3Resolution) * cXaxle3IntUnits)// units/sec
#define cXaxle3Vmax95proc                 cXaxle3Vmax * 98 / 100
#define cXaxle3Amax                       cXaxle3Vmax * 10
// X-Axle 4, AKM22C-ANBNR-00 i.c.m. Alphira CP060-MX1-10-111
#define cXaxle4MaxRpm                     8000.0  // rpm  ivm reductie kastjes.....
#define cXaxle4Resolution                 cResolutionFactor 
#define cXaxle4Circumference              ((60.8 * phi * cIntUnitsTo_mm) / cXaxle4Resolution)
#define cXaxle4Ratio                      10.0     // i ratio 
#define cXaxle4IntUnits                   (cXaxle4Circumference *  cXaxle4Resolution)
#define cXaxle4ExtUnits                   -65536 * cXaxle4Ratio 
#define cXaxle4Vmax                       ((cXaxle4MaxRpm / cXaxle4Ratio / 60.0 / cXaxle4Resolution) * cXaxle4IntUnits)// units/sec
#define cXaxle4Vmax95proc                 cXaxle4Vmax * 98 / 100
#define cXaxle4Amax                       cXaxle4Vmax * 10


// Y-Axle 1, AKM22C-ANBNR-00 i.c.m. Alphira CP060-MX1-10-111
#define cYaxles1MaxRpm                     8000.0  // rpm  ivm reductie kastjes.....
#define cYaxles1Resolution                 cResolutionFactor 
#define cYaxles1Circumference              ((60.8 * phi * cIntUnitsTo_mm) / cYaxles1Resolution)
#define cYaxles1Ratio                      10.0     // i ratio 
#define cYaxles1IntUnits                   (cYaxles1Circumference *  cYaxles1Resolution)
#define cYaxles1ExtUnits                   -65536 * cYaxles1Ratio 
#define cYaxles1Vmax                       ((cYaxles1MaxRpm / cYaxles1Ratio / 60.0 / cYaxles1Resolution) * cYaxles1IntUnits)// units/sec
#define cYaxles1Vmax95proc                 cYaxles1Vmax * 98 / 100
#define cYaxles1Amax                       cYaxles1Vmax * 10
#define cYAxles1MinPos                     (-2 * cIntUnitsTo_mm)
#define cYAxles1MaxPos                     (2 * cIntUnitsTo_mm)
#define cYAxles1CenterPosInfeedConv        (100 * cIntUnitsTo_mm) // Center position towards width of infeed conveyor
// Y-Axle 2, AKM22C-ANBNR-00 i.c.m. Alphira CP060-MX1-10-111
#define cYaxles2MaxRpm                     8000.0  // rpm  ivm reductie kastjes.....
#define cYaxles2Resolution                 cResolutionFactor 
#define cYaxles2Circumference              ((60.8 * phi * cIntUnitsTo_mm) / cYaxles2Resolution)
#define cYaxles2Ratio                      10.0     // i ratio 
#define cYaxles2IntUnits                   (cYaxles2Circumference *  cYaxles2Resolution)
#define cYaxles2ExtUnits                   -65536 * cYaxles2Ratio 
#define cYaxles2Vmax                       ((cYaxles2MaxRpm / cYaxles2Ratio / 60.0 / cYaxles2Resolution) * cYaxles2IntUnits)// units/sec
#define cYaxles2Vmax95proc                 cYaxles2Vmax * 98 / 100
#define cYaxles2Amax                       cYaxles2Vmax * 10
#define cYAxles2MinPos                     (-2 * cIntUnitsTo_mm)
#define cYAxles2MaxPos                     (2 * cIntUnitsTo_mm)
#define cYAxles2CenterPosInfeedConv        (250 * cIntUnitsTo_mm) // Center position towards width of infeed conveyor
// Y-Axle 3, AKM22C-ANBNR-00 i.c.m. Alphira CP060-MX1-10-111
#define cYaxles3MaxRpm                     8000.0  // rpm  ivm reductie kastjes.....
#define cYaxles3Resolution                 cResolutionFactor 
#define cYaxles3Circumference              ((60.8 * phi * cIntUnitsTo_mm) / cYaxles3Resolution)
#define cYaxles3Ratio                      10.0     // i ratio 
#define cYaxles3IntUnits                   (cYaxles3Circumference *  cYaxles3Resolution)
#define cYaxles3ExtUnits                   -65536 * cYaxles3Ratio 
#define cYaxles3Vmax                       ((cYaxles3MaxRpm / cYaxles3Ratio / 60.0 / cYaxles3Resolution) * cYaxles3IntUnits)// units/sec
#define cYaxles3Vmax95proc                 cYaxles3Vmax * 98 / 100
#define cYaxles3Amax                       cYaxles3Vmax * 10
#define cYAxles3MinPos                     (-2 * cIntUnitsTo_mm)
#define cYAxles3MaxPos                     (2 * cIntUnitsTo_mm)
#define cYAxles3CenterPosInfeedConv        (400 * cIntUnitsTo_mm) // Center position towards width of infeed conveyor
// Y-Axle 4, AKM22C-ANBNR-00 i.c.m. Alphira CP060-MX1-10-111
#define cYaxles4MaxRpm                     8000.0  // rpm  ivm reductie kastjes.....
#define cYaxles4Resolution                 cResolutionFactor 
#define cYaxles4Circumference              ((60.8 * phi * cIntUnitsTo_mm) / cYaxles4Resolution)
#define cYaxles4Ratio                      10.0     // i ratio 
#define cYaxles4IntUnits                   (cYaxles4Circumference *  cYaxles4Resolution)
#define cYaxles4ExtUnits                   -65536 * cYaxles4Ratio 
#define cYaxles4Vmax                       ((cYaxles4MaxRpm / cYaxles4Ratio / 60.0 / cYaxles4Resolution) * cYaxles4IntUnits)// units/sec
#define cYaxles4Vmax95proc                 cYaxles4Vmax * 98 / 100
#define cYaxles4Amax                       cYaxles4Vmax * 10
#define cYAxles4MinPos                     (-2 * cIntUnitsTo_mm)
#define cYAxles4MaxPos                     (2 * cIntUnitsTo_mm)
#define cYAxles4CenterPosInfeedConv        (550 * cIntUnitsTo_mm) // Center position towards width of infeed conveyor


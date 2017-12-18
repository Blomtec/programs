#ifndef SAFETYBASE_H
#pragma once
#define SAFETYBASE_H

#ifndef SAFETY_PROTOCOL_ANALYZER_ACTIVATED
//  #define SAFETY_PROTOCOL_ANALYZER_ACTIVATED
  #ifdef SAFETY_PROTOCOL_ANALYZER_ACTIVATED
    #pragma message("Safety Protocol Analyzer activated! Needs more CPU ressources!")
  #endif
#endif

// maximum number of input PDOs (modules from which this module gets PDOs)
#define SB_PDO_MAX_NUMBER  100

// maximum number of routing elements for one object
#define SB_MAX_NUMBER_ROUT_ELEMENTS  100

// define input filter in cycles (waits 5 cycles before status 0 is overtaken from firmware)
#define SB_SAFETY_INPUT_FILTER     5 // put this line under comment if you don't want a filter in software

// sync delay times in �s (the cdias sync will be delayed for some safety modules to start working at a time where data are consistent) should work fine for all cycle times
// 125�s has to be added to get to the cdias sync (according to FPGA department)
#define SB_SYNC_OFFSET_NO_DELAY          125
#define SB_SYNC_OFFSET_DELAY_OUTPUTS     625


//define offsets for address mapping of FPGA registers

// READ
#define SB_OFFSET_SPDO_DATA_RD      16#000
#define SB_OFFSET_SPDO_IF_DATA_RD   16#080
#define SB_OFFSET_STDO_STATUS       16#100
#define SB_OFFSET_STDO_STATUS_WRITE 16#101
#define SB_OFFSET_SPDO_LENGTH       16#102
#define SB_OFFSET_SPDO_IF_LENGTH    16#103
#define SB_OFFSET_GPDR2_RD          16#104 // fast unsafe outputs
#define SB_OFFSET_GPDR1_RD          16#108 // time sync handshake
#define SB_OFFSET_IO_STATES         16#109 // former LED register, which contains state of the LEDs and all safe IOs
#define SB_OFFSET_STDO_DATA_RD      16#150
#define SB_OFFSET_UNSAFE_VAR_RD     16#168
#define SB_OFFSET_SSDO_DATA_RD      16#188
#define SB_OFFSET_SSDO_STATUS       16#1D0
#define SB_OFFSET_SSDO_STATUS_WRITE 16#1D1
#define SB_OFFSET_SYNC_IRQ_DELAY_RD 16#1D2
#define SB_OFFSET_IO_MODULE_IDS     16#1D4

// WRITE
#define SB_OFFSET_SPDO_DATA_WR      16#000
#define SB_OFFSET_GPDR1_WR          16#080 // time sync handshake
#define SB_OFFSET_GPDR2_WR          16#084 // fast unsafe inputs
#define SB_OFFSET_UNSAFE_VAR_WR     16#088 // enable signals
#define SB_OFFSET_STDO_DATA_WR      16#0A8
#define SB_OFFSET_SSDO_DATA_WR      16#0C0
#define SB_OFFSET_SYNC_IRQ_DELAY_WR 16#108



(*
OFFSET_TIMESYNC_HANDSHAKE
Bit0: 1 = HWK start the time synchronisation (is 0 if any of the modules doesn't support this feature, which can be detected via FPGA & FW Version)
Bit1: 1 = HWK wants the module to start it's synchronisation (the module resets this bit after the synchronisation is finished)
*)
#define SB_OFFSET_TIMESYNC_HANDSHAKE 16#EE
#define SB_OFFSET_FAST_UNSAFE_IOS    16#EF

#define SB_OFFSET_PLL_CONFIG_STATUS  16#F8
#define SB_OFFSET_PLL_CONFIG2        16#F9
#define SB_OFFSET_FPGA_VERSION       16#FB


// if an interface frame has to be written to all possible targets, this will be it's destination path
#define SB_INTERFACE_FRAME_BROADCAST 16#FFFF0002


//define order / priority of update tasks
//lowest priority = 3, highest priority = 1
#define SB_PRIORITY_SAFE_IN             1
#define SB_PRIORITY_SAFE_CPU            2
#define SB_PRIORITY_SAFE_OUT            3

//errornumber of communication timeout
#define SB_COMM_TIMEOUT_ERROR         199

//max. unsafe write packages in one message
#define SB_MAX_UNSAFE_WRITE_PACKAGES    6

//max. unsafe BDINT write values per write values access (to ensure constant firmware load)
#define SB_MAX_UNSAFE_BDINTS_PER_WRITE  3

//max. length of SDO
#define SB_SDO_MAX_LENGTH              72

//max. length of PDOs
#define SB_SPDO_MAX_LENGTH            128

// length of TDO
#define SB_STDO_LENGTH                 24

// length of unsafe output access
#define SB_UNSAFE_OUT_LENGTH            2

// blocksize for getting log data
#define SB_LOG_DATA_BLOCK_SIZE         16

// size of config to send to the manager (the same amount well be added every time the memory wouldn't last out)
#define SB_CONFIG_MEMORY_BLOCK_SIZE   512


//SDO specific data

// Type definitions: Bit0 = communication for configuration
//                   Bit1 = communication over topology path
//                   Bit2 = Standard frame
//                   Bit3 = PDO
//                   Bit4 = TDO
//                   Bit5 = reserved
//                   Bit6 = reserved
//                   Bit7 = is the frame a Response
//#define SDO_TYPE_CFG             2#001 = 16#01
//#define SDO_TYPE_CFG_TP          2#011 = 16#03
//#define SDO_TYPE_MOD             2#000 = 16#00
//#define SDO_TYPE_MOD_TP          2#010 = 16#02
//#define SDO_TYPE_STD             2#101 = 16#05

(* Frame Typen sind im Frame folgendermassen codiert:
 0     0     0     0     1     0     0     0      SPDO Frame - 1ms Zeiteinheit
 0     0     1     0     0     0     0     0      SPDO Interace-Frame - 1ms Zeiteinheit
 x     0     0     1     0     0     0     0      STDO Frame - 1ms Zeiteinheit
 0     1     0     0     1     0     0     0      SPDO Frame - 1/16ms Zeiteinheit
 0     1     1     0     0     0     0     0      SPDO Interace-Frame - 1/16ms Zeiteinheit
 x     1     0     1     0     0     0     0      STDO Frame - 1/16ms Zeiteinheit
 x     0     0     0     0     0     0     1      SSDO-Cfg Frame
 0     0     0     0     0     0     1     1      SSDO-Cfg Frame - Topology-Pfad als Ziel
 x     0     0     0     0     0     0     0      SSDO-Mod Frame
 0     0     0     0     0     0     1     0      SSDO-Mod Frame - Topology-Pfad als Ziel
 x     0     0     0     0     1     0     1      Standard-Frame
*)
(*
// SSDO-Cfg-Type (mit Safety-Nummer als Zieladresse)
#define FRM_TYPECODE_SSDO_CFG         0x01  // Resp = 0x81
// SSDO-Cfg-Type (mit Topology-Pfad als Zieladresse)
#define FRM_TYPECODE_SSDO_CFG_TP      0x03
// SSDO-Mod-Type (mit Safety-Nummer als Zieladresse)
#define FRM_TYPECODE_SSDO_MOD         0x00  // Resp = 0x80
// SSDO-Mod-Type (mit Topology-Pfad als Zieladresse)
#define FRM_TYPECODE_SSDO_MOD_TP      0x02
// Standard Frame
#define FRM_TYPECODE_STD              0x05  // Resp = 0x85
// STDO Frame - 1ms Zeiteinheit
#define FRM_TYPECODE_STDO_LORES       0x10  // Resp = 0x90
// STDO Frame - 1/16ms Zeiteinheit
#define FRM_TYPECODE_STDO_HIRES       0x50  // Resp = 0xD0
// ID f�r SPDO Frame - 1ms Zeiteinheit
#define FRM_ID_SPDO_LORES             0x08
// ID f�r SPDO Frame - 1/16ms Zeiteinheit
#define FRM_ID_SPDO_HIRES             0x48
// ID f�r SPDO Interfaace-Frame - 1ms Zeiteinheit
#define FRM_ID_SPDO_INTERFACE_LORES   0x20
// ID f�r SPDO Interfaace-Frame (- 1/16ms Zeiteinheit
#define FRM_ID_SPDO_INTERFACE_HIRES   0x60
*)
// Wert zum Ausmaskieren des Typs
#define SB_SSDO_MASK_TYPE                0x7F
// Wert zum Ausmaskieren des Response Bits
#define SB_SSDO_MASK_RESPONSE            0x80


//returncodes of SDO response
#define SB_SDO_RETCODE_OK              0   // everything is fine
#define SB_SDO_MICROCTRL_DIFFER      219   // The content of a SSDO response is different between the two controllers. Happens most likely when we try to read out the configuration while the safety designer is writing it

//end-command of interpreter list
#define SB_SDO_CONFIG_END_CMD          2

//commands

//command to read data from module
#define SB_SDO_COMMAND_READ            0
//command to read data from module
#define SB_SDO_COMMAND_WRITE           1
//command to get state of a module
#define SB_SDO_COMMAND_GET_STATE       4
//command to get the diag info of a module
#define SB_SDO_COMMAND_GET_DIAG_INFO   6
//command to get the log header of a module
#define SB_SDO_COMMAND_GET_LOG_HDR     8
//command to quit all errors in a safety module
#define SB_SDO_COMMAND_QUIT_ERROR     14
//command to get safety number of module
#define SB_SDO_COMMAND_GET_SAFENBR    15
//command to get firmware version of module
#define SB_SDO_COMMAND_GET_FW_VERSION 17
//command to read values from different addresses (to update multiple unsafe variables from different memory areas) => write the addresses in the read_values command
#define SB_SDO_COMMAND_READ_VALUES    28
//command to set bus ready for this module
#define SB_SDO_COMMAND_SET_BUS_READY  29
//command to write addresses and values (to update multiple unsafe variables)
#define SB_SDO_COMMAND_WRITE_VALUES   30


// possible config states of cpu
#define SB_CFG_STATE_UNKNOWN                                   0   // FW answers this, e.g. if FW-download is running
#define SB_CFG_STATE_INVALID                                   1
#define SB_CFG_STATE_NOT_CONFIGURED                            2
#define SB_CFG_STATE_CONFIGURED_NOT_DEPLOYED_NOT_VERIFIED      4
#define SB_CFG_STATE_CONFIGURED_AND_VERIFIED                   8
#define SB_CFG_STATE_CONFIGURED_DEPLOYED_NOT_VERIFIED         16
#define SB_CFG_STATE_CONFIGURED_NOT_DEPLOYED_NOT_VERIFIED_DEV 36
#define SB_CFG_STATE_CONFIGURED_DEPLOYED_NOT_VERIFIED_DEV     48



// block type constants

// Bitmasken f�r Flags in den Blocktyp-Konstanten
#define SB_SLAVE_FLAG      0x80000000
#define SB_OPTIONAL_FLAG   0x40000000

// Blocktyp eines Safe CPU Headers = Blocktyp der Gesamtkonfiguration (enth�lt Modulkonfigurationen)
#define SB_BLKTYPE_CFG_CONTAINER  		               0
// Blocktyp einer Modulkonfiguration
#define SB_BLKTYPE_CFG_MODULE                        1
// Blocktyp Bootsektor
#define SB_BLKTYPE_BOOTSECTOR                        2
// Blocktyp Betriebssystem Image
#define SB_BLKTYPE_OSIMAGE                           3
// Blocktyp Konfigurationszustand
#define SB_BLKTYPE_INFO                              4
// Blocktyp Log-Sektor
#define SB_BLKTYPE_LOG_SECTOR                        5
// Blocktyp SD-Karten Zusatzinfo
#define SB_BLKTYPE_SD_INFO                           6
// Blocktyp einer externen CPU, an die nichts verteilt wird (enth�lt nur die
// IO-Liste aber keine FUBs und keinen Interpretercode)
#define SB_BLKTYPE_CFG_CPU                           7 
// Blocktyp einer Modulkonfiguration - optionales Modul
#define SB_BLKTYPE_CFG_MODULE_OPTIONAL               8
// Blocktyp einer externen CPU, an die nichts verteilt wird (enth�lt nur die
// IO-Liste aber keine FUBs und keinen Interpretercode) - optionales Mdol
#define SB_BLKTYPE_CFG_CPU_OPTIONAL                  9
// Blocktyp einer Modulkonfiguration (inkl. Interface-CRC im Listenheader)
#define SB_BLKTYPE_CFG_MODULE_V2                    10
// Blocktyp eines externen Interfaces
#define SB_BLKTYPE_CFG_INTERFACE                    11
// Blocktyp eines externen optionalen Interfaces
#define SB_BLKTYPE_CFG_INTERFACE_OPTIONAL           12
// Blocktyp der Gesamtkonfiguration einer Slave-CPU (enth�lt Modulkonfigurationen)
#define SB_BLKTYPE_CFG_CONTAINER_SLAVE              13
// Blocktyp der Gesamtkonfiguration einer optionalen Slave-CPU (enth�lt Modulkonfigurationen) 
#define SB_BLKTYPE_CFG_CONTAINER_SLAVE_OPTIONAL     14
// Blocktyp einer Master-CPU
#define SB_BLKTYPE_CFG_MASTER_CPU                   15
// Blocktyp der �ber die komprimierte Gesamtkonfiguration einer Slave-CPU gegeben wird
#define SB_BLKTYPE_CFG_SLAVE_COMPR                  16
// Blocktyp der �ber die komprimierte Gesamtkonfiguration einer Slave-CPU gegeben wird - optional
#define SB_BLKTYPE_CFG_SLAVE_COMPR_OPTIONAL         17
// Blocktyp der als Flag verwendet wird um anzuzeigen, dass der alte Modus (1ms Zeiteinheit) verwendet werden muss
#define SB_BLKTYPE_OLD_MODE_FLAG                    18

// Blocktyp der Gesamtkonfiguration (enth�lt Modulkonfigurationen)
#define SB_BLKTYPE_CFG_CONTAINER_V3                 19
// Blocktyp der Gesamtkonfiguration einer Slave-CPU (enth�lt Modulkonfigurationen)
#define SB_BLKTYPE_CFG_CONTAINER_V3_SLAVE          (19 OR SB_SLAVE_FLAG)
// Blocktyp der Gesamtkonfiguration einer optionalen Slave-CPU (enth�lt Modulkonfigurationen)
#define SB_BLKTYPE_CFG_CONTAINER_V3_SLAVE_OPTIONAL (19 OR SB_SLAVE_FLAG OR SB_OPTIONAL_FLAG)

// * =========================
// * Die Nummern 20-39 sind f�r den Safety-Designer reserviert
// * =========================
// xml description: configuration for uploading the project to the safetydesigner (network placement information, names of bits,...)
#define SB_BLKTYPE_CFG_XML    	                    20
// revision information (safety designer project name and revision number string)
#define SB_BLKTYPE_CFG_REV    	                    21

// Blocktyp einer Modulkonfiguration V3
#define SB_BLKTYPE_CFG_MODULE_V3                    40
// Blocktyp einer Modulkonfiguration V3 - optionales Modul
#define SB_BLKTYPE_CFG_MODULE_V3_OPTIONAL          (40 OR SB_OPTIONAL_FLAG)



//virtual addresses of safety controller 

//base address of log memory of �C1
#define SB_SDO_ADDRESS_LOG_UC1         16#1000_0000

//base address of log memory of �C2
#define SB_SDO_ADDRESS_LOG_UC2         16#1800_0000

//base address config data
#define SB_SDO_ADDRESS_CONFIG_DATA     16#2000_0000

//base address safety numbers and serial numbers
#define SB_SDO_ADDRESS_SER_NR_DATA     16#2010_0000

//base address special safety info: pdo length, additional wr pdos, fast unsafe active?
#define SB_SDO_ADDRESS_SPECIAL_INFO    16#2030_0000

//base address for optional module settings
#define SB_SDO_ADDRESS_OPTIONAL_CFG    16#2070_0000

//base address application data        
#define SB_SDO_ADDRESS_APP_DATA        16#3000_0000

//base address unsafe BDINT variables
#define SB_SDO_ADDRESS_UNSAFE_BDINT    16#3400_0000

//base address error memory
#define SB_SDO_ADDRESS_ERROR_MEM       16#8000_0000

//base adress retry counter
#define SB_SDO_ADDRESS_RETRY_COUNTER   16#2040_0000
//length of data at retrycnt adress. 1byte amount of all retrycounters, 16 byte retrycnt �C1, 16byte retrycnt �C2
#define SB_SDO_LENGTH_RETRY_COUNTER    33



//offsets of config data

//offset crc of whole config data
#define SB_SDO_OFFSET_CONFIG_CRC_ALL   16#0
//offset length of whole config data
#define SB_SDO_OFFSET_CONFIG_LEN_ALL   16#4
//offset header blocktype
#define SB_SDO_OFFSET_CONFIG_BLOCKTYPE 16#8
//offset length of additional header data
#define SB_SDO_OFFSET_CONFIG_LEN_HEAD  16#C
//offset of time info depends on blocktype (it's 16#C on an old block type and 16#10 on a new block type)


// special place for the pdo length info in the dynamic parameters
#define SB_CONFIG_PDO_INFO_PLACE      1000

// mask to get the number of write PDOs
#define SB_PDO_WR_MASK                   2#11111

// mask to get if fast unsafe variables are enabled
#define SB_FAST_UNSAFE_MASK              16#80

#endif // SAFETYBASE_H



//**********************************************
//** Macros                                   **
//**********************************************
//for logging functions
#ifndef OS_KernelLog0

	FUNCTION __CDECL P_KernelLog0
	VAR_INPUT
	  msg	:^CHAR;
	END_VAR;

	#define OS_KernelLog0(p1) 					p_KernelLog $ P_KernelLog0(p1);

	FUNCTION __CDECL P_KernelLog1
	VAR_INPUT
	  msg	:^CHAR;
	  Var1	: DINT;
	END_VAR;

	#define OS_KernelLog1(p1,p2)				p_KernelLog $ P_KernelLog1(p1,p2);

	FUNCTION __CDECL P_KernelLog2
	VAR_INPUT
	  msg	:^CHAR;
	  Var1	: DINT;
	  Var2	: DINT;
	END_VAR;

	#define OS_KernelLog2(p1,p2,p3)				p_KernelLog $ P_KernelLog2(p1,p2,p3);

	FUNCTION __CDECL P_KernelLog3
	VAR_INPUT
	  msg	:^CHAR;
	  Var1	: DINT;
	  Var2	: DINT;
	  Var3	: DINT;
	END_VAR;

	#define OS_KernelLog3(p1,p2,p3,p4)				p_KernelLog $ P_KernelLog3(p1,p2,p3,p4);
#endif
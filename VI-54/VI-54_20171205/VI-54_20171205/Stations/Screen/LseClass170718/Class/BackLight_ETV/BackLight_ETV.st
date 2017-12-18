//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION
#include <.\lsl_st_pci.h>

(*!
<Class
	Name               = "BackLight_ETV"
	Revision           = "1.20"
	GUID               = "{DE6CE50A-4E1B-47D0-A00C-E779AB805325}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "true"
	DefBackground      = "always"
	Sigmatek           = "true"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	IconPath           = ".\Class\Tool.ico"
	SharedCommandTable = "true"
	Objectsize         = "(652,120)"
	Comment            = "Class to set graphic controller on/off">
	<Channels>
		<Server Name="Error" GUID="{E436C0CC-3872-4BBE-893E-304F26FBE8A1}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false" Comment="0..No Error (but maybe old FPGA version, if it doesn&apos;t work)&#13;&#10;1..function not available on this cpu"/>
		<Server Name="switchBacklight" GUID="{FB773A29-4F35-47AC-A046-4E1C594D6A85}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false" Comment="call write-method of this server to change state of backlight&#13;&#10;0..turn off backlight&#13;&#10;1..turn on backlight&#13;&#10;&#13;&#10;&#13;&#10;call read-method of this server to get actual state of backlight&#13;&#10;0..off&#13;&#10;1..on&#13;&#10;"/>
		<Client Name="To_Multitask" Required="false" Internal="false"/>
		<Client Name="To_OSKernel" Required="false" Internal="false"/>
		<Client Name="To_TaskObjectControl" Required="false" Internal="false"/>
	</Channels>
	<Dependencies>
		<Files>
			<File Path=".\lsl_st_pci.h" Include="true"/>
		</Files>
	</Dependencies>
	<RevDoku>
		<Owner Company="Sigmatek" Author="RamAnd"/>
		<Dokumentation Revision="1.20" Date="05.12.2013" Author="LanSte" Company="Sigmatek" Description="Added Missing Hader File."/>
		<Dokumentation Revision="1.10" Date="21.03.2013" Author="RamAnd" Company="Sigmatek" Description="Added background task instead of the parallel thread for the backlight handling of an EdgeETV. The class will activate or deactivate the background task independent of the background time settings."/>
		<Dokumentation Revision="1.3" Date="30.08.2012" Author="BleErn" Company="Sigmatek" Description="When used on CIPC instead of the display the fan was switched off."/>
		<Dokumentation Revision="1.2" Date="29.08.2012" Author="SpiMar" Company="Sigmatek" Description="Visualized flag of server switchBacklight set to true"/>
		<Dokumentation Revision="1.1" Date="14.07.2011" Author="BleErn" Company="Sigmatek" Description="Added support for ETV-Edge"/>
		<Dokumentation Revision="1.0" Date="14.10.2009" Author="RamAnd" Company="Sigmatek" Description="Initial version"/>
	</RevDoku>
</Class>
*)
BackLight_ETV : CLASS
	TYPE
	  PowerMngType : BSINT
	  [
	    1 SupplyEnable5V,
	    2 LVDSDriverEnable,
	    3 DisplayEnable,
	    4 DisplayBackLightEnable,
	    5 DisplayPowerOn,
	  ];
#pragma pack(push, 1)
	  PWMType : STRUCT
	    PreScaler : INT;
	    PWMPeriod : INT;
	    PWMOutputOnTime : INT;
	    Reserved : USINT;
	    ControlStatusReg : BSINT
	    [
	      1 SWEnable,
	      2 HWEnable,
	    ];
	  END_STRUCT;
#pragma pack(pop)
	END_TYPE
  //Servers:
	switchBacklight 	: SvrChCmd_DINT;
	Error 	: SvrCh_DINT;
  //Clients:
	To_OSKernel 	: CltChCmd__OSKernel;
	To_Multitask 	: CltChCmd__MultiTask;
	To_TaskObjectControl 	: CltChCmd__TaskObjectControl;
  //Variables:
		pPowerMng 	: ^PowerMngType;
		pPWM 	: ^PWMType;
		DisplayInternal 	: DINT;
		b_DisplayActionActive 	: BOOL;
		us_Firstscan 	: USINT;
  //Functions:
	
	FUNCTION BackLight_ETV
		VAR_OUTPUT
			ret_code 	: ConfStates;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL Init;
	
	FUNCTION VIRTUAL GLOBAL Background
		VAR_INPUT
			EAX 	: UDINT;
		END_VAR
		VAR_OUTPUT
			state (EAX) 	: UDINT;
		END_VAR;
				//! <Function Comment="returns state of backlight&#13;&#10;0..off&#13;&#10;1..on" Name="switchBacklight.Read"/>
	FUNCTION VIRTUAL GLOBAL switchBacklight::Read
		VAR_OUTPUT
			output (EAX) 	: DINT;
		END_VAR;
				//! <Function Comment="sets new state of backlight&#13;&#10;0..turn off backlight&#13;&#10;1..turn on backlight" Name="switchBacklight.Write"/>
	FUNCTION VIRTUAL GLOBAL switchBacklight::Write
		VAR_INPUT
			input (EAX) 	: DINT;
		END_VAR
		VAR_OUTPUT
			result (EAX) 	: DINT;
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

#pragma usingLtd _MultiTask
#pragma usingLtd _OSKernel
#pragma usingLtd _TaskObjectControl


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB BackLight_ETV::@CT_
0$UINT,
2#0100000000000000$UINT, //TY_BACKLIGHT_ETV
1$UINT, 20$UINT, (SIZEOF(::BackLight_ETV))$UINT, 
2$UINT, 3$UINT, 0$UINT, 
TO_UDINT(1211344162), "BackLight_ETV", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::BackLight_ETV.switchBacklight.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(2450537368), "switchBacklight", 
(::BackLight_ETV.Error.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(2861137601), "Error", 
//Clients:
(::BackLight_ETV.To_OSKernel.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000000$UINT, TO_UDINT(2681344549), "To_OSKernel", TO_UDINT(3045737964), "_OSKernel", 0$UINT, 4$UINT, 
(::BackLight_ETV.To_Multitask.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000000$UINT, TO_UDINT(2145650779), "To_Multitask", TO_UDINT(2641766936), "_MultiTask", 1$UINT, 1$UINT, 
(::BackLight_ETV.To_TaskObjectControl.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000000$UINT, TO_UDINT(2751224004), "To_TaskObjectControl", TO_UDINT(1584830088), "_TaskObjectControl", 1$UINT, 1$UINT, 
END_FUNCTION


#define USER_CNT_BackLight_ETV 1

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_BackLight_ETV] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION BackLight_ETV::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_BackLight_ETV, pCmd := #vmt.CmdTable);
	vmt.CmdTable.Read		:= #Read();
	vmt.CmdTable.Write		:= #Write();
	vmt.CmdTable.Init		:= #Init();
#pragma warning (disable : 74)
	vmt.UserFcts[0]		:= #Background();

#pragma warning (default : 74)
	switchBacklight.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF switchBacklight.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	ret_code	:= BackLight_ETV();

END_FUNCTION

//{{LSL_IMPLEMENTATION
#include <lsl_st_kernel.h>

FUNCTION BackLight_ETV::BackLight_ETV
	VAR_OUTPUT
		ret_code 	: ConfStates;
	END_VAR
  VAR
    pSPCIInfo     	: ^LSL_SPCIINFO;
    SigmaTekDevInfo : ^PCICONFDATA;
(*
    Index : DINT;
    SigmatTekDevs : DINT;
*)
  END_VAR	

	if OS_CILGET("PCICONFIG", #pSPCIInfo) = SYS_ERR_NONE then
(*  
    // DEVICE SCAN

    // Anzahl der Eintr�ge im InfoBlock 
    SigmatTekDevs := SPCIINFO_GETDEVICECOUNT();

    for Index := 1 to SigmatTekDevs do
      SigmaTekDevInfo := SPCIINFO_GETDEVICEBYINDEX( Index );
    end_for;
*)
    // device in ETV 8", 10", 12", 15", 17", 19"
    SigmaTekDevInfo := SPCIINFO_FINDDEVICE( 16#1405, 0 );
    if SigmaTekDevInfo then
      pPowerMng$^void := SPCIINFO_GETADDRESS( SigmaTekDevInfo );
      switchBacklight := (pPowerMng^ AND PowerMngType.DisplayBackLightEnable) <> 0;
    else
      // device in ETV 5"
      // Attention: Device 0xE28 has also been used for fan control (e.g. CIPC)!
      SigmaTekDevInfo := SPCIINFO_FINDDEVICE( 16#0E28, 0 ); 
      if (_whoami = DESTPLC_ETV) & SigmaTekDevInfo then
        pPWM$^void := SPCIINFO_GETADDRESS( SigmaTekDevInfo );
        switchBacklight := pPWM^.ControlStatusReg AND 1;
      else
        // device in edge-etv
        if _whoami = DESTPLC_ETVEDGE then
          DisplayInternal := switchBacklight := 1;
        else
          Error := 1;
        end_if;
      end_if;
    end_if;
  else
    Error := 1;
	end_if;
  
	ret_code := C_OK;

END_FUNCTION


FUNCTION VIRTUAL GLOBAL BackLight_ETV::switchBacklight::Write
	VAR_INPUT
		input (EAX) 	: DINT;
	END_VAR
	VAR_OUTPUT
		result (EAX) 	: DINT;
	END_VAR
	
  if pPowerMng then// device in ETV 8", 10", 12", 15", 17", 19"
    if input then
      pPowerMng^ := pPowerMng^ OR PowerMngType.DisplayBackLightEnable;
    else
      pPowerMng^ := pPowerMng^ AND (NOT PowerMngType.DisplayBackLightEnable);
    end_if;
    
    switchBacklight := (pPowerMng^ AND PowerMngType.DisplayBackLightEnable) <> 0;
  elsif pPWM then// device in ETV 5"
    if input then
      pPWM^.ControlStatusReg := pPWM^.ControlStatusReg OR 1;
    else
      pPWM^.ControlStatusReg := pPWM^.ControlStatusReg AND 2#11111110;
    end_if;

    switchBacklight := pPWM^.ControlStatusReg AND 1;
  elsif _whoami = DESTPLC_ETVEDGE then// device in edge-etv
    if input <> 0 then
      input := 1;
    end_if;
    
    DisplayInternal := input;
  end_if;
  
  result := switchBacklight;

END_FUNCTION


FUNCTION VIRTUAL GLOBAL BackLight_ETV::switchBacklight::Read
	VAR_OUTPUT
		output (EAX) 	: DINT;
	END_VAR
  
  if pPowerMng then
    switchBacklight := (pPowerMng^ AND PowerMngType.DisplayBackLightEnable) <> 0;
  elsif pPWM then
    switchBacklight := pPWM^.ControlStatusReg AND 1;
  end_if;

	output := switchBacklight;

END_FUNCTION


FUNCTION VIRTUAL GLOBAL BackLight_ETV::Init
  VAR
    sd_retval   : DINT;
    objInfo : LSLOBJ_INFO;
  END_VAR

  //first init
  if ( us_Firstscan = 0 ) then

    // Init done after this!
    us_Firstscan := 1;

    // edge etv needs background task
    if _whoami = DESTPLC_ETVEDGE then
      
      // if background task is not active => activate it with 100ms
      sd_retval := To_TaskObjectControl.GetObjectInfo(thispointer:=this, tasktype:=OBJ_BG, objinfo:=#objInfo);
      
      // if there is no background for this object
      if ( sd_retval = -5 ) then
        sd_retval := To_TaskObjectControl.ChangeObjectState(thispointer:=this, actioncmd:=ACTION_ADD, tasktype:=OBJ_BG, debugobj:=0, newtime:=100);
        
        // couldn't activate background task => class will not work
        if sd_retval <> 0 then
          Error := 1;
          return;
        end_if;
      end_if;
    else
      // if no edge etv, we don't need a background task time
			To_TaskObjectControl.ChangeObjectState( thispointer := this, actioncmd := ACTION_SUSPEND, tasktype := OBJ_BG, debugobj := 0, newtime := 0 );
    end_if;
  end_if;         
  
END_FUNCTION


FUNCTION VIRTUAL GLOBAL BackLight_ETV::Background
	VAR_INPUT
		EAX 	: UDINT;
	END_VAR
	VAR_OUTPUT
		state (EAX) 	: UDINT;
	END_VAR

  if DisplayInternal <> switchBacklight then
    if DisplayInternal then
      DisplayInternal := 1;
      // Attention: Standby command might not work if this was "a Salamander" & has been booted back to LasalOS
      // because of USB-Vendor ID change (0x228f vs 0x5112) --> has to be fixed in OS!
      To_OSKernel.AddToServiceProvider(command:="exec Standby 0", immediatly:=1);
    else
      To_OSKernel.AddToServiceProvider(command:="exec Standby 2", immediatly:=1);
    end_if;

    switchBacklight := DisplayInternal;    
  end_if;

	state := READY;

END_FUNCTION
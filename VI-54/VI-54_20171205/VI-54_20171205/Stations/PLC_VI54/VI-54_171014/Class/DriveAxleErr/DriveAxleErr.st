//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "DriveAxleErr"
	Revision           = "6.1"
	GUID               = "{CD27129B-BC2E-4E6E-B25B-914099C0ACF0}"
	RealtimeTask       = "false"
	CyclicTask         = "true"
	DefCyclictime      = "cCT"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(570,480)">
	<Channels>
		<Server Name="DriveOnline" GUID="{DC5BCDAE-9A68-422C-A453-940B80E3E621}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="DrivesEnabled" GUID="{5AF62CCC-2CE0-441F-8F8A-52C2DCC7699B}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="DrivesOk" GUID="{A7ED7955-F0FE-4C0A-B3AF-E6FF798D7976}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="I_StatusNbr" GUID="{9A42BC67-74D0-4212-B30C-F28039765C09}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="ManagerEnabled" GUID="{72B5F5A3-AA48-4584-8D62-38BA76953256}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
	</Channels>
	<Network Name="DriveAxleErr">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name       = "_base"
				GUID       = "{771D5D23-0D5D-409F-939C-13815D6C1F04}"
				Class      = "_DriveErrorHandling"
				Position   = "(339,120)"
				Visualized = "true"
				Remotely   = "true">
				<Channels>
					<Server Name="GetErrorInfo"/>
					<Server Name="I_DERROR"/>
					<Server Name="I_STATUS"/>
					<Server Name="State"/>
					<Client Name="DriveAxis"/>
					<Client Name="ErrorCode"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="_base.DriveAxis" Destination="this.DriveAxis" Vertices="(339,210),(38,210),"/>
			<Connection Source="_base.ErrorCode" Destination="this.ErrorCode" Vertices="(339,270),(38,270),"/>
			<Connection Source="this.State" Destination="_base.State" Vertices="(1067,210),(895,210),"/>
			<Connection Source="this.GetErrorInfo" Destination="_base.GetErrorInfo" Vertices="(1067,270),(895,270),"/>
			<Connection Source="this.I_STATUS" Destination="_base.I_STATUS" Vertices="(1067,330),(895,330),"/>
			<Connection Source="this.I_DERROR" Destination="_base.I_DERROR" Vertices="(1067,390),(895,390),"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
#pragma using _DriveErrorHandling

DriveAxleErr : CLASS
: _DriveErrorHandling
  //Servers:
	I_StatusNbr 	: SvrCh_DINT;
	DriveOnline 	: SvrCh_DINT;
	ManagerEnabled 	: SvrCh_DINT;
	DrivesOk 	: SvrCh_DINT;
	DrivesEnabled 	: SvrCh_DINT;
  //Clients:
  //Variables:
		cmdResetDrives 	: DINT;
		StateWord 	: DS402_State;
		DriveNoErrorOld 	: DINT;
		TestBits : BDINT
		[
		];

		TestNbr 	: DINT;
		DriveNoError 	: DINT;
		TmrReadStatus 	: UDINT;
		CntReadState 	: UDINT;
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL CyWork
		VAR_INPUT
			EAX 	: UDINT;
		END_VAR
		VAR_OUTPUT
			state (EAX) 	: UDINT;
		END_VAR;
	
	FUNCTION GLOBAL ResetDrives;
	
	FUNCTION GLOBAL ReadDriveState
		VAR_OUTPUT
			State 	: DS402_State;
		END_VAR;
	
	FUNCTION GLOBAL ReadDriveOk
		VAR_OUTPUT
			State 	: DINT;
		END_VAR;
	
	FUNCTION GLOBAL ReadDriveEnabled
		VAR_OUTPUT
			State 	: DINT;
		END_VAR;
	
	FUNCTION GLOBAL ReadDriveOnline
		VAR_OUTPUT
			State 	: DINT;
		END_VAR;
	
	FUNCTION CheckBitNbr
		VAR_INPUT
			StateBits 	: BDINT;
		END_VAR
		VAR_OUTPUT
			BitNbr 	: DINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL DrivesOk::Write
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

//}}LSL_DECLARATION


FUNCTION GLOBAL TAB DriveAxleErr::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_DRIVEAXLEERR
6$UINT, 1$UINT, (SIZEOF(::DriveAxleErr))$UINT, 
5$UINT, 0$UINT, 0$UINT, 
TO_UDINT(573136687), "DriveAxleErr", //Class
TO_UDINT(3110367410), "_DriveErrorHandling", 1$UINT, 13$UINT, //Baseclass
//Servers:
(::DriveAxleErr.I_StatusNbr.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(1965597314), "I_StatusNbr", 
(::DriveAxleErr.DriveOnline.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(2561949944), "DriveOnline", 
(::DriveAxleErr.ManagerEnabled.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(2227642440), "ManagerEnabled", 
(::DriveAxleErr.DrivesOk.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3076815131), "DrivesOk", 
(::DriveAxleErr.DrivesEnabled.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(108232900), "DrivesEnabled", 
//Clients:
END_FUNCTION


#define USER_CNT_DriveAxleErr 4

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_DriveAxleErr] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION DriveAxleErr::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
		nCmdSize	: UINT;
	END_VAR

	ret_code	:= _DriveErrorHandling::@STD();
	IF ret_code <> C_OK THEN
		RETURN;
	END_IF;
	nCmdSize		:= _DriveParaBase::State.pMeth^.nCmds$UINT*SIZEOF(pVoid) + CMDMETH.Init;

	_memcpy((#vmt.CmdTable)$^USINT, _DriveParaBase::State.pMeth, nCmdSize);
	vmt.CmdTable.nCmds		:= nSTDCMD + USER_CNT_DriveAxleErr;
	vmt.CmdTable.CyWork		:= #CyWork();
	_DriveParaBase::State.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF _DriveParaBase::State.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	DrivesOk.pMeth			:= StoreMethod( #M_RD_DIRECT(), #DrivesOk::Write() );
	IF DrivesOk.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION

FUNCTION VIRTUAL GLOBAL DriveAxleErr::CyWork
	VAR_INPUT
		EAX 	: UDINT;
	END_VAR
	VAR_OUTPUT
		state (EAX) 	: UDINT;
	END_VAR
  
  DriveOnline := (DriveAxis.IsOnline() = 1 & DriveAxis.Online.read() = 1);
  
  if DriveOnline = 1 then  
    StateWord     := DriveAxis.StateWord.Read();
    ManagerEnabled  := (StateWord.SwitchedOn = 1);
      
    DrivesOk := I_STATUS = 0 & I_DERROR = 0; // check if we have a  axle error
    DriveNoError := DrivesOk;
    if DrivesOk = 1 then
      DrivesEnabled := (DriveAxis.AxOkay() = 1 & StateWord.OperationEnabled = 1); // no errors and enabled  !!
    else
      if cmdResetDrives = 1 then
        DriveAxis.ErrorQuitHandling(input:=1);
        // end of reset signal !!
        cmdResetDrives := 0;
      end_if;  
      DrivesEnabled := 0;
    end_if;  
  else
    DrivesOk      := 1;// not connected no error
    DrivesEnabled := 1;
    DriveNoError  := DrivesOk;
  end_if;
    
  // read as state !!
  if ops.tAbsolute - TmrReadStatus >= 100 then
    CntReadState += 1;
    GetErrorInfo.Write(1);
    TmrReadStatus := ops.tAbsolute;
  end_if;  
  
  I_StatusNbr := CheckBitNbr(StateBits:= I_STATUS);

	state := READY;

END_FUNCTION

FUNCTION GLOBAL DriveAxleErr::ResetDrives

  cmdResetDrives := 1;  // give a reset command to de drives

END_FUNCTION

FUNCTION GLOBAL DriveAxleErr::ReadDriveState
	VAR_OUTPUT
		State 	: DS402_State;
	END_VAR
  
  State := StateWord;
  
END_FUNCTION

FUNCTION GLOBAL DriveAxleErr::ReadDriveOk
	VAR_OUTPUT
		State 	: DINT;
	END_VAR

  State := DrivesOk;

END_FUNCTION

FUNCTION GLOBAL DriveAxleErr::ReadDriveEnabled
	VAR_OUTPUT
		State 	: DINT;
	END_VAR
  
  State := DrivesEnabled;

END_FUNCTION

FUNCTION VIRTUAL GLOBAL DriveAxleErr::DrivesOk::Write
	VAR_INPUT
		input (EAX) 	: DINT;
	END_VAR
	VAR_OUTPUT
		result (EAX) 	: DINT;
	END_VAR

  if input = 1 then
    cmdResetDrives := input;
  end_if; 
  
 	result := input;

END_FUNCTION

FUNCTION GLOBAL DriveAxleErr::ReadDriveOnline
	VAR_OUTPUT
		State 	: DINT;
	END_VAR
  
  State := DriveOnline;

END_FUNCTION

FUNCTION DriveAxleErr::CheckBitNbr
	VAR_INPUT
		StateBits 	: BDINT;
	END_VAR
	VAR_OUTPUT
		BitNbr 	: DINT;
	END_VAR
  VAR
  	MijnBit : BDINT;
  END_VAR
  
  BitNbr := 0;
  if StateBits <> 0 then
    repeat
    MijnBit := (StateBits AND 2#00000000000000000000000000000001);
    StateBits := (StateBits SHR 1);
    BitNbr += 1;
    until MijnBit = 1 | StateBits = 0 end_repeat;
  end_if;  

END_FUNCTION
//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "DiagnosticUserFunction_PLC"
	Revision           = "1.0"
	GUID               = "{AA9E69C8-48C4-428E-A1C9-2583049765CB}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(540,120)"
	Comment            = "Use this class as base class for new functions of the diagnose.">
	<Channels>
		<Server Name="sStatus" GUID="{3563952B-2C94-444F-8952-D33EE50DDD23}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false" Comment="Actual status."/>
	</Channels>
	<RevDoku>
		<Owner Company="Sigmatek"/>
		<Dokumentation Revision="1.0" Date="2016-06-02" Author="H�tAnt" Company="Sigmatek" Description="Creation"/>
	</RevDoku>
</Class>
*)
DiagnosticUserFunction_PLC : CLASS
  //Servers:
	sStatus 	: SvrChCmd_iprStates;
  //Clients:
  //Variables:
  //Functions:
				//! <Function Comment="Is called when the diagnostic export starts." Name="StartWork"/>
	FUNCTION VIRTUAL GLOBAL StartWork
		VAR_OUTPUT
			retcode 	: iprStates;			//! <Variable Comment="Ready..Continue with the work methode&#13;&#10;Error..ssw is in a wrong step" Name="StartWork.retcode"/>
		END_VAR;
				//! <Function Comment="This method will be called cyclic when the diagnostic export is started." Name="WorkMethode"/>
	FUNCTION VIRTUAL GLOBAL WorkMethode;
				//! <Function Comment="Get the actual state of the function." Name="GetWorkState"/>
	FUNCTION VIRTUAL GLOBAL GetWorkState
		VAR_OUTPUT
			retcode 	: iprStates;			//! <Variable Comment="Actual state." Name="GetWorkState.retcode"/>
		END_VAR;
				//! <Function Comment="Method to get the actual error code." Name="GetErrorCode"/>
	FUNCTION VIRTUAL GLOBAL GetErrorCode
		VAR_OUTPUT
			retcode 	: _DiagErrorCode;			//! <Variable Comment="Error code." Name="GetErrorCode.retcode"/>
		END_VAR;
				//! <Function Comment="Method to get the size of the data which should be send." Name="GetDataSize"/>
	FUNCTION VIRTUAL GLOBAL GetDataSize
		VAR_OUTPUT
			retcode 	: UDINT;			//! <Variable Comment="Size of the data." Name="GetDataSize.retcode"/>
		END_VAR;
				//! <Function Comment="Method to get the pointer to the data of the user function." Name="GetDataPtr"/>
	FUNCTION VIRTUAL GLOBAL GetDataPtr
		VAR_OUTPUT
			dataPtr 	: ^void;			//! <Variable Comment="Pointer to the user data." Name="GetDataPtr.dataPtr"/>
		END_VAR;
				//! <Function Comment="Is called when the work method finished." Name="EndWork"/>
	FUNCTION VIRTUAL GLOBAL EndWork;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

//}}LSL_DECLARATION


FUNCTION GLOBAL TAB DiagnosticUserFunction_PLC::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_DIAGNOSTICUSERFUNCTION_PLC
1$UINT, 0$UINT, (SIZEOF(::DiagnosticUserFunction_PLC))$UINT, 
1$UINT, 0$UINT, 0$UINT, 
TO_UDINT(4200646535), "DiagnosticUserFunction_PLC", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::DiagnosticUserFunction_PLC.sStatus.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(3043700589), "sStatus", 
//Clients:
END_FUNCTION


#define USER_CNT_DiagnosticUserFunction_PLC 7

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_DiagnosticUserFunction_PLC] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION DiagnosticUserFunction_PLC::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_DiagnosticUserFunction_PLC, pCmd := #vmt.CmdTable);
#pragma warning (disable : 74)
	vmt.UserFcts[0]		:= #StartWork();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[1]		:= #WorkMethode();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[2]		:= #GetWorkState();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[3]		:= #GetErrorCode();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[4]		:= #GetDataSize();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[5]		:= #GetDataPtr();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[6]		:= #EndWork();

#pragma warning (default : 74)
	sStatus.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF sStatus.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION

#pragma warning(disable:73);
#pragma warning(disable:76);


FUNCTION VIRTUAL GLOBAL DiagnosticUserFunction_PLC::WorkMethode

END_FUNCTION


FUNCTION VIRTUAL GLOBAL DiagnosticUserFunction_PLC::GetWorkState
	VAR_OUTPUT
		retcode 	: iprStates;
	END_VAR

END_FUNCTION



FUNCTION VIRTUAL GLOBAL DiagnosticUserFunction_PLC::GetErrorCode
	VAR_OUTPUT
		retcode 	: _DiagErrorCode;
	END_VAR
  

END_FUNCTION


FUNCTION VIRTUAL GLOBAL DiagnosticUserFunction_PLC::GetDataSize
	VAR_OUTPUT
		retcode 	: UDINT;
	END_VAR

END_FUNCTION


FUNCTION VIRTUAL GLOBAL DiagnosticUserFunction_PLC::GetDataPtr
	VAR_OUTPUT
		dataPtr 	: ^void;
	END_VAR

END_FUNCTION




FUNCTION VIRTUAL GLOBAL DiagnosticUserFunction_PLC::StartWork
	VAR_OUTPUT
		retcode 	: iprStates;
	END_VAR

END_FUNCTION


FUNCTION VIRTUAL GLOBAL DiagnosticUserFunction_PLC::EndWork

END_FUNCTION
#pragma warning(default:73);
#pragma warning(default:76);
//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "Class0"
	Revision           = "0.0"
	GUID               = "{9F71D336-1400-4842-891B-8A00827D12B9}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(284,120)">
	<Channels>
		<Server Name="ClassSvr" GUID="{E5506445-94C1-4BC3-BA1D-DA3708E824B8}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
	</Channels>
</Class>
*)
Class0 : CLASS
  //Servers:
	ClassSvr 	: SvrChCmd_DINT;
  //Clients:
  //Variables:
  //Functions:
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

//}}LSL_DECLARATION


FUNCTION GLOBAL TAB Class0::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_CLASS0
0$UINT, 0$UINT, (SIZEOF(::Class0))$UINT, 
1$UINT, 0$UINT, 0$UINT, 
TO_UDINT(1594949027), "Class0", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::Class0.ClassSvr.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(619352855), "ClassSvr", 
//Clients:
END_FUNCTION


#define USER_CNT_Class0 0

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_Class0] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION Class0::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR

	ret_code := C_OK;

END_FUNCTION

//{{LSL_IMPLEMENTATION

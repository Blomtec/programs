//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "ReceptBase"
	Revision           = "0.0"
	GUID               = "{9BEE0893-8D57-4F08-ADCF-5EFA0870CD30}"
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
		<Server Name="Refresh" GUID="{E5BBE4B6-53D4-4AB0-B9E5-6925B29613ED}" Visualized="false" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="Size" GUID="{259889A4-11AD-474A-8612-E3AFD9561935}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Client Name="Data" Required="true" Internal="false"/>
	</Channels>
</Class>
*)
ReceptBase : CLASS
  //Servers:
	Refresh 	: SvrChCmd_DINT;
	Size 	: SvrCh_DINT;
  //Clients:
	Data 	: CltChCmd_MerkerEx;
  //Variables:
		ReceptPtr 	: ^DataRecipeStr;
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL Init;
	
	FUNCTION VIRTUAL GLOBAL DefaultPara;
	
	FUNCTION VIRTUAL GLOBAL RefreshPara;
	
	FUNCTION VIRTUAL GLOBAL Refresh::Write
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

#pragma usingLtd MerkerEx


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB ReceptBase::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_RECEPTBASE
0$UINT, 0$UINT, (SIZEOF(::ReceptBase))$UINT, 
2$UINT, 1$UINT, 0$UINT, 
TO_UDINT(1832340142), "ReceptBase", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::ReceptBase.Refresh.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(1606704865), "Refresh", 
(::ReceptBase.Size.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3243624926), "Size", 
//Clients:
(::ReceptBase.Data.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(2607161047), "Data", TO_UDINT(2225119864), "MerkerEx", 1$UINT, 21$UINT, 
END_FUNCTION


#define USER_CNT_ReceptBase 2

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_ReceptBase] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION ReceptBase::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_ReceptBase, pCmd := #vmt.CmdTable);
	vmt.CmdTable.Write		:= #Write();
	vmt.CmdTable.Init		:= #Init();
#pragma warning (disable : 74)
	vmt.UserFcts[0]		:= #DefaultPara();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[1]		:= #RefreshPara();

#pragma warning (default : 74)
	Refresh.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF Refresh.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION


FUNCTION VIRTUAL GLOBAL ReceptBase::Init

  // Set data size
  if Data.GetSize() <> sizeof(DataRecipeStr) then
    Data.SetSize(udSize:= sizeof(DataRecipeStr));
  end_if; 

  // Get pointer
  if _FirstScan = 1 then
    ReceptPtr$^Usint := Data.GetDataPtr();
    if ReceptPtr$^Usint = Data.GetDataPtr() then
      RefreshPara();
    end_if;
  end_if;

END_FUNCTION


FUNCTION VIRTUAL GLOBAL ReceptBase::DefaultPara

END_FUNCTION


FUNCTION VIRTUAL GLOBAL ReceptBase::RefreshPara

END_FUNCTION


FUNCTION VIRTUAL GLOBAL ReceptBase::Refresh::Write
	VAR_INPUT
		input (EAX) 	: DINT;
	END_VAR
	VAR_OUTPUT
		result (EAX) 	: DINT;
	END_VAR
  
  Refresh := input;
  if ReceptPtr <> 0 then
    RefreshPara();
  end_if;  
 	result := Refresh;

END_FUNCTION

//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "SafetyClass"
	Revision           = "0.0"
	GUID               = "{F7DC79D3-058E-49D9-8B16-E2C02091E55D}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(390,300)">
	<Channels>
		<Server Name="SafetyOut1" GUID="{DC92658A-65C0-4B77-9604-30F8FB1089E7}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="SafetyOut2" GUID="{A03249C7-D670-4ECC-8C6A-A46899F09420}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="SafetyOut3" GUID="{447795B0-4B45-418B-9623-BCA1801FF25C}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="SafetyOut4" GUID="{904EF3DB-03C7-48FE-80DF-1254199D8093}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Client Name="CleaningMode" Required="true" Internal="false"/>
		<Client Name="MasterOverrule" Required="true" Internal="false"/>
		<Client Name="SafetyInp1" Required="false" Internal="false"/>
		<Client Name="SafetyInp2" Required="false" Internal="false"/>
		<Client Name="SafetyInp3" Required="false" Internal="false"/>
		<Client Name="SafetyInp4" Required="false" Internal="false"/>
	</Channels>
</Class>
*)
SafetyClass : CLASS
  //Servers:
	SafetyOut1 	: SvrChCmd_DINT;
	SafetyOut2 	: SvrCh_DINT;
	SafetyOut3 	: SvrCh_DINT;
	SafetyOut4 	: SvrCh_DINT;
  //Clients:
	MasterOverrule 	: CltCh_DINT;
	CleaningMode 	: CltCh_DINT;
	SafetyInp1 	: CltCh_DINT;
	SafetyInp2 	: CltCh_DINT;
	SafetyInp3 	: CltCh_DINT;
	SafetyInp4 	: CltCh_DINT;
  //Variables:
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL SafetyOut1::Read
		VAR_OUTPUT
			output (EAX) 	: DINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL SafetyOut2::Read
		VAR_OUTPUT
			output (EAX) 	: DINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL SafetyOut3::Read
		VAR_OUTPUT
			output (EAX) 	: DINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL SafetyOut4::Read
		VAR_OUTPUT
			output (EAX) 	: DINT;
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

//}}LSL_DECLARATION


FUNCTION GLOBAL TAB SafetyClass::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_SAFETYCLASS
0$UINT, 0$UINT, (SIZEOF(::SafetyClass))$UINT, 
4$UINT, 6$UINT, 0$UINT, 
TO_UDINT(393242874), "SafetyClass", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::SafetyClass.SafetyOut1.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(93587660), "SafetyOut1", 
(::SafetyClass.SafetyOut2.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(2627557750), "SafetyOut2", 
(::SafetyClass.SafetyOut3.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3952765408), "SafetyOut3", 
(::SafetyClass.SafetyOut4.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(1979644995), "SafetyOut4", 
//Clients:
(::SafetyClass.MasterOverrule.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(480354513), "MasterOverrule", 
(::SafetyClass.CleaningMode.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(3810429396), "CleaningMode", 
(::SafetyClass.SafetyInp1.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(1424023173), "SafetyInp1", 
(::SafetyClass.SafetyInp2.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(3454635839), "SafetyInp2", 
(::SafetyClass.SafetyInp3.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(3136208809), "SafetyInp3", 
(::SafetyClass.SafetyInp4.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(613034506), "SafetyInp4", 
END_FUNCTION


#define USER_CNT_SafetyClass 0

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_SafetyClass] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION SafetyClass::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_SafetyClass, pCmd := #vmt.CmdTable);
	vmt.CmdTable.Read		:= #Read();
	SafetyOut1.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF SafetyOut1.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	SafetyOut2.pMeth			:= StoreMethod( #SafetyOut2::Read(), #M_NO_F() );
	IF SafetyOut2.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	SafetyOut3.pMeth			:= StoreMethod( #SafetyOut3::Read(), #M_NO_F() );
	IF SafetyOut3.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	SafetyOut4.pMeth			:= StoreMethod( #SafetyOut4::Read(), #M_NO_F() );
	IF SafetyOut4.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION


FUNCTION VIRTUAL GLOBAL SafetyClass::SafetyOut1::Read
	VAR_OUTPUT
		output (EAX) 	: DINT;
	END_VAR

  SafetyInp1 := SafetyInp1.Read();
  if MasterOverrule.Read() = 1 | CleaningMode.Read() = 1 then
	  SafetyOut1 := 1;
  else
    SafetyOut1 := SafetyInp1; 
  end_if;
  SafetyOut1.Write(input:= SafetyOut1);
  Output := SafetyOut1;

END_FUNCTION

FUNCTION VIRTUAL GLOBAL SafetyClass::SafetyOut2::Read
	VAR_OUTPUT
		output (EAX) 	: DINT;
	END_VAR

  SafetyInp2 := SafetyInp2.Read();
  if MasterOverrule.Read() =  1 | CleaningMode.Read() = 1 then
	  SafetyOut2 := 1;
  else
    SafetyOut2 := SafetyInp2;
  end_if;
  SafetyOut2.Write(input:= SafetyOut2);
  Output := SafetyOut2;

END_FUNCTION

FUNCTION VIRTUAL GLOBAL SafetyClass::SafetyOut3::Read
	VAR_OUTPUT
		output (EAX) 	: DINT;
	END_VAR

  SafetyInp3 := SafetyInp3.Read();
  if MasterOverrule.Read() = 1 | CleaningMode.Read() = 1 then
	  SafetyOut3 := 1;
  else
    SafetyOut3 := SafetyInp3;
  end_if;
  SafetyOut3.Write(input:= SafetyOut3);
  Output := SafetyOut3;

END_FUNCTION

FUNCTION VIRTUAL GLOBAL SafetyClass::SafetyOut4::Read
	VAR_OUTPUT
		output (EAX) 	: DINT;
	END_VAR

  SafetyInp4 := SafetyInp4.Read();
  if MasterOverrule.Read() = 1 | CleaningMode.Read() = 1 then
	  SafetyOut4 := 1;
  else
    SafetyOut4 := SafetyInp4;
  end_if;
  SafetyOut4.Write(input:= SafetyOut4);
  Output := SafetyOut4;

END_FUNCTION
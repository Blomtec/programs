//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "Vi54_Control"
	Revision           = "0.0"
	GUID               = "{476FAE80-91A3-4910-823E-F6AB624CA619}"
	RealtimeTask       = "true"
	CyclicTask         = "true"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(780,1020)">
	<Channels>
		<Server Name="__________" GUID="{36548C4F-E873-458C-BDE6-3A26E6C685F1}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="CleaningJog" GUID="{4E50E5B1-8301-4FDD-B35D-A06F1EB62B64}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="CleaningJogDistance" GUID="{6A4E7E3F-7ED6-401F-B2FB-28F3D9CA8066}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="File"/>
		<Server Name="CleaningJogOption" GUID="{9CAAEF9B-7839-43B3-83BF-E338D755DF84}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="File"/>
		<Server Name="CleaningMode" GUID="{14FFF27E-BC34-4D10-803B-A1B267A2C187}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="CleaningSpeed" GUID="{84B0A8E6-A881-41EA-94B0-27253F4A0D46}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="File"/>
		<Server Name="CPU_Load" GUID="{23A8E5C2-05EE-4D6D-9D1B-21CD686F33B6}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="ExternalPause" GUID="{6055945B-36F0-4B83-AA8A-0C5D0D6F0ACA}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="Gestart" GUID="{579A3755-A5B9-4D37-8D83-624951AD4D81}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="Gestopt" GUID="{9EEDAF44-B3FD-4ACE-B7D1-98EAA65F051C}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="InternalPause" GUID="{D8FE0231-E694-4E89-B692-EC9C6FE58D93}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="JogButtonVisual" GUID="{B045D376-B63D-4957-8D34-6F5014FDD0E8}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="MasterOverrule" GUID="{219DC17F-A080-496A-9E49-05E89157B2B6}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="PauseActive" GUID="{76F23305-407F-464D-A137-ACDEACC80461}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="File"/>
		<Server Name="PauseDelay" GUID="{DBA93405-63FE-414F-B710-1E4713268B73}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="File"/>
		<Server Name="PauseSignalOptions" GUID="{03640611-8CE3-4486-BE10-EAF264162E64}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="File"/>
		<Server Name="Reset" GUID="{64DA1C8C-2F98-49E8-82FE-9439D5D52AA0}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="ResetKnopVisual" GUID="{1880F2AD-FAB9-4B43-9DE9-DFEB4CA237F3}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="RunState" GUID="{9DAFE9F2-37B8-4FD7-B38A-089CB466F9C6}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="RunStateInfeedConv" GUID="{F2C6FFBC-A13C-4988-B199-68EB9904B05E}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="UseInpAnalogeSpeed" GUID="{01A604A8-BF62-44A1-BA95-23D1956C0DA1}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="File"/>
		<Client Name="ClaxonComm" Required="true" Internal="false"/>
		<Client Name="Comm_CameraMaster" Required="true" Internal="false"/>
		<Client Name="Comm_Conveyors" Required="true" Internal="false"/>
		<Client Name="Comm_Xaxles" Required="true" Internal="false"/>
		<Client Name="Comm_Yaxles" Required="true" Internal="false"/>
		<Client Name="iDrivesEnabled" Required="true" Internal="false"/>
		<Client Name="iDrivesOk" Required="true" Internal="false"/>
		<Client Name="iExternRelease" Required="true" Internal="false"/>
		<Client Name="iLineSpeed" Required="true" Internal="false"/>
		<Client Name="iSafetyOK" Required="true" Internal="false"/>
		<Client Name="iStart" Required="true" Internal="false"/>
		<Client Name="iStop" Required="true" Internal="false"/>
		<Client Name="LampComm" Required="true" Internal="false"/>
		<Client Name="MglobalData" Required="true" Internal="true"/>
		<Client Name="oMachineOK" Required="true" Internal="false"/>
		<Client Name="oPause" Required="true" Internal="false"/>
		<Client Name="oResetSignal" Required="true" Internal="false"/>
		<Client Name="Standard3" Required="true" Internal="true"/>
		<Client Name="vError" Required="true" Internal="false"/>
	</Channels>
	<Network Name="Vi54_Control">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name       = "_base"
				GUID       = "{8045C486-C63B-4822-AE04-634772500C83}"
				Class      = "RecipeBase"
				Position   = "(354,120)"
				Visualized = "false">
				<Channels>
					<Server Name="Comm"/>
					<Client Name="MainRecipe"/>
				</Channels>
			</Object>
			<Object
				Name       = "MglobalData"
				GUID       = "{F53754B8-4AF5-4C1C-8758-C558D147C870}"
				Class      = "MerkerEx"
				Position   = "(300,330)"
				Visualized = "true"
				Remotely   = "true">
				<Channels>
					<Server Name="m_udLength"/>
					<Client Name="ThreadSafe" Value="0"/>
				</Channels>
			</Object>
			<Object
				Name           = "Standard3"
				GUID           = "{829BA72E-FD05-437C-B75D-3A98B681E363}"
				Class          = "Standard"
				Position       = "(330,480)"
				Visualized     = "false"
				BackgroundTime = "1000 ms">
				<Channels>
					<Server Name="ClassSvr"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="this.MglobalData" Destination="MglobalData.m_udLength"/>
			<Connection Source="this.Standard3" Destination="Standard3.ClassSvr"/>
			<Connection Source="this.Comm" Destination="_base.Comm" Vertices="(938,210),(654,210),"/>
			<Connection Source="_base.MainRecipe" Destination="this.MainRecipe" Vertices="(354,210),(38,210),"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
#pragma using RecipeBase

Vi54_Control : CLASS
: RecipeBase
  //Servers:
	Gestart 	: SvrCh_DINT;
	Gestopt 	: SvrCh_DINT;
	InternalPause 	: SvrCh_DINT;
	ExternalPause 	: SvrCh_DINT;
	CPU_Load 	: SvrCh_DINT;
	Reset 	: SvrCh_DINT;
	MasterOverrule 	: SvrCh_DINT;
	CleaningMode 	: SvrCh_DINT;
	CleaningJogOption 	: SvrCh_OptiesEnum;
	CleaningJog 	: SvrCh_DINT;
	JogButtonVisual 	: SvrCh_DINT;
	CleaningSpeed 	: SvrCh_DINT;
	CleaningJogDistance 	: SvrCh_DINT;
	PauseSignalOptions 	: SvrCh_PauseFunctions;
	PauseActive 	: SvrCh_OptiesEnum;
	PauseDelay 	: SvrCh_DINT;
	ResetKnopVisual 	: SvrCh_DINT;
	UseInpAnalogeSpeed 	: SvrCh_OptiesEnum;
	__________ 	: SvrCh_DINT;
	RunState 	: SvrCh_RunningStateEnum;
	RunStateInfeedConv 	: SvrCh_RunningStateEnum;
  //Clients:
	Comm_Xaxles 	: CltChCmd_X_Axle_Correction;
	Comm_Yaxles 	: CltChCmd_Y_Axle_Correction;
	Comm_CameraMaster 	: CltChCmd_Camera_Master;
	Comm_Conveyors 	: CltChCmd_InfeedBelt;
	iLineSpeed 	: CltChCmd_SpeedInput;
	iStart 	: CltCh_DINT;
	iStop 	: CltCh_DINT;
	LampComm 	: CltChCmd_Banner_EZlight;
	ClaxonComm 	: CltChCmd_Claxon;
	iSafetyOK 	: CltCh_DINT;
	iExternRelease 	: CltCh_DINT;
	oMachineOK 	: CltCh_DINT;
	oPause 	: CltCh_DINT;
	iDrivesOk 	: CltCh_DINT;
	iDrivesEnabled 	: CltCh_DINT;
	oResetSignal 	: CltCh_DINT;
	vError 	: CltCh_DINT;
	MglobalData 	: CltChCmd_MerkerEx;
	Standard3 	: CltChCmd_Standard;
  //Variables:
		NoError 	: DINT;
		StartingUp 	: DINT;
		GlobalDataPtr 	: ^GlobalDataStr;
		PauseSignal 	: DINT;
		PauzeOverride 	: DINT;
		CalcLineSpeed 	: DINT;
		WaitForNextPausePuls 	: DINT;
		TmrPause 	: UDINT;
		PauseOverride 	: DINT;
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL Init;
	
	FUNCTION VIRTUAL GLOBAL CyWork
		VAR_INPUT
			EAX 	: UDINT;
		END_VAR
		VAR_OUTPUT
			state (EAX) 	: UDINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL RtWork
		VAR_INPUT
			EAX 	: UDINT;
		END_VAR
		VAR_OUTPUT
			state (EAX) 	: UDINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL Background
		VAR_INPUT
			EAX 	: UDINT;
		END_VAR
		VAR_OUTPUT
			state (EAX) 	: UDINT;
		END_VAR;
	
	FUNCTION GLOBAL GlobalData;
	
	FUNCTION GLOBAL ResetComm;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

#pragma using MerkerEx
#pragma using Standard
#pragma usingLtd Banner_EZlight
#pragma usingLtd Camera_Master
#pragma usingLtd Claxon
#pragma usingLtd InfeedBelt
#pragma usingLtd SpeedInput
#pragma usingLtd X_Axle_Correction
#pragma usingLtd Y_Axle_Correction


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB Vi54_Control::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_VI54_CONTROL
0$UINT, 0$UINT, (SIZEOF(::Vi54_Control))$UINT, 
21$UINT, 19$UINT, 0$UINT, 
TO_UDINT(996485646), "Vi54_Control", //Class
TO_UDINT(4145520360), "RecipeBase", 0$UINT, 0$UINT, //Baseclass
//Servers:
(::Vi54_Control.Gestart.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3982126964), "Gestart", 
(::Vi54_Control.Gestopt.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3589415164), "Gestopt", 
(::Vi54_Control.InternalPause.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(1081307608), "InternalPause", 
(::Vi54_Control.ExternalPause.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(971800639), "ExternalPause", 
(::Vi54_Control.CPU_Load.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(892527675), "CPU_Load", 
(::Vi54_Control.Reset.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(2815000061), "Reset", 
(::Vi54_Control.MasterOverrule.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(480354513), "MasterOverrule", 
(::Vi54_Control.CleaningMode.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3810429396), "CleaningMode", 
(::Vi54_Control.CleaningJogOption.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000011000$UINT, TO_UDINT(1481470846), "CleaningJogOption", 
(::Vi54_Control.CleaningJog.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(4004442580), "CleaningJog", 
(::Vi54_Control.JogButtonVisual.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(2843643750), "JogButtonVisual", 
(::Vi54_Control.CleaningSpeed.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000011000$UINT, TO_UDINT(4102448733), "CleaningSpeed", 
(::Vi54_Control.CleaningJogDistance.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000011000$UINT, TO_UDINT(772621926), "CleaningJogDistance", 
(::Vi54_Control.PauseSignalOptions.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000011000$UINT, TO_UDINT(1650899331), "PauseSignalOptions", 
(::Vi54_Control.PauseActive.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000011000$UINT, TO_UDINT(2637836467), "PauseActive", 
(::Vi54_Control.PauseDelay.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000011000$UINT, TO_UDINT(1089853723), "PauseDelay", 
(::Vi54_Control.ResetKnopVisual.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3919579439), "ResetKnopVisual", 
(::Vi54_Control.UseInpAnalogeSpeed.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000011000$UINT, TO_UDINT(330721768), "UseInpAnalogeSpeed", 
(::Vi54_Control.__________.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(705157791), "__________", 
(::Vi54_Control.RunState.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(2759549320), "RunState", 
(::Vi54_Control.RunStateInfeedConv.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(2127783334), "RunStateInfeedConv", 
//Clients:
(::Vi54_Control.Comm_Xaxles.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(2388601753), "Comm_Xaxles", TO_UDINT(1781566825), "X_Axle_Correction", 0$UINT, 0$UINT, 
(::Vi54_Control.Comm_Yaxles.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(1157888060), "Comm_Yaxles", TO_UDINT(3986048554), "Y_Axle_Correction", 0$UINT, 0$UINT, 
(::Vi54_Control.Comm_CameraMaster.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(3218936928), "Comm_CameraMaster", TO_UDINT(3246862170), "Camera_Master", 2$UINT, 0$UINT, 
(::Vi54_Control.Comm_Conveyors.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(1945090169), "Comm_Conveyors", TO_UDINT(3956548114), "InfeedBelt", 1$UINT, 0$UINT, 
(::Vi54_Control.iLineSpeed.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(4204802921), "iLineSpeed", TO_UDINT(3374501148), "SpeedInput", 0$UINT, 0$UINT, 
(::Vi54_Control.iStart.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(932878885), "iStart", 
(::Vi54_Control.iStop.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(1028057403), "iStop", 
(::Vi54_Control.LampComm.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(3445920052), "LampComm", TO_UDINT(90179801), "Banner_EZlight", 0$UINT, 0$UINT, 
(::Vi54_Control.ClaxonComm.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(4256968383), "ClaxonComm", TO_UDINT(42930980), "Claxon", 0$UINT, 0$UINT, 
(::Vi54_Control.iSafetyOK.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(1427264330), "iSafetyOK", 
(::Vi54_Control.iExternRelease.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(1219003944), "iExternRelease", 
(::Vi54_Control.oMachineOK.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(514810962), "oMachineOK", 
(::Vi54_Control.oPause.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(2837495386), "oPause", 
(::Vi54_Control.iDrivesOk.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(1182664576), "iDrivesOk", 
(::Vi54_Control.iDrivesEnabled.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(928233264), "iDrivesEnabled", 
(::Vi54_Control.oResetSignal.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(2842544545), "oResetSignal", 
(::Vi54_Control.vError.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(129942421), "vError", 
(::Vi54_Control.MglobalData.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(4069986453), "MglobalData", TO_UDINT(2225119864), "MerkerEx", 1$UINT, 21$UINT, 
(::Vi54_Control.Standard3.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(1639076328), "Standard3", TO_UDINT(3603188683), "Standard", 6$UINT, 1$UINT, 
END_FUNCTION


#define USER_CNT_Vi54_Control 1

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_Vi54_Control] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION Vi54_Control::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
		nCmdSize	: UINT;
	END_VAR

	ret_code	:= RecipeBase::@STD();
	IF ret_code <> C_OK THEN
		RETURN;
	END_IF;
	nCmdSize		:= RecipeBase::Comm.pMeth^.nCmds$UINT*SIZEOF(pVoid) + CMDMETH.Init;

	_memcpy((#vmt.CmdTable)$^USINT, RecipeBase::Comm.pMeth, nCmdSize);
	vmt.CmdTable.nCmds		:= nSTDCMD + USER_CNT_Vi54_Control;
	vmt.CmdTable.Init		:= #Init();
	vmt.CmdTable.CyWork		:= #CyWork();
	vmt.CmdTable.RtWork		:= #RtWork();
#pragma warning (disable : 74)
	vmt.UserFcts[0]		:= #Background();

#pragma warning (default : 74)
	RecipeBase::Comm.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF RecipeBase::Comm.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	Reset.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF Reset.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	MasterOverrule.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF MasterOverrule.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	CleaningMode.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF CleaningMode.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	CleaningJogOption.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF CleaningJogOption.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	CleaningJog.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF CleaningJog.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	CleaningSpeed.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF CleaningSpeed.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	CleaningJogDistance.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF CleaningJogDistance.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	PauseSignalOptions.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF PauseSignalOptions.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	PauseActive.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF PauseActive.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	PauseDelay.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF PauseDelay.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	UseInpAnalogeSpeed.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF UseInpAnalogeSpeed.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION

FUNCTION VIRTUAL GLOBAL Vi54_Control::Init

  if mGlobalData.GetSize() <> sizeof(GlobalDataStr) then
    mGlobalData.SetSize(udSize:= sizeof(GlobalDataStr));
  end_if; 
  
  // open init methode of baseclass
  RecipeBase::Init();

  // Only at first scan
  if _FirstScan = 1 then
    GlobalDataPtr$^Usint := mGlobalData.GetDataPtr();
   
    // Set pointers
    Comm_Conveyors.InitTask(SetGlobalPtr:= GlobalDataPtr, SetRecipePtr:= ReceptPtr);
    Comm_Conveyors.SetStationNbr(Nbr:= 1);
    
    Comm_CameraMaster.InitTask(SetGlobalPtr:= GlobalDataPtr, SetRecipePtr:= ReceptPtr);
    
    Comm_Xaxles.InitTask(SetGlobalPtr:= GlobalDataPtr, SetRecipePtr:= ReceptPtr);
    Comm_Xaxles.SetStationNbr(Nbr:= 1);
    
    Comm_Yaxles.InitTask(SetGlobalPtr:= GlobalDataPtr, SetRecipePtr:= ReceptPtr);
    Comm_Yaxles.SetStationNbr(Nbr:= 1);
  end_if;

END_FUNCTION

FUNCTION VIRTUAL GLOBAL Vi54_Control::RtWork
	VAR_INPUT
		EAX 	: UDINT;
	END_VAR
	VAR_OUTPUT
		state (EAX) 	: UDINT;
	END_VAR

  // Open realtime tasks 
  Comm_CameraMaster.RtTask();

	state := READY;

END_FUNCTION

FUNCTION VIRTUAL GLOBAL Vi54_Control::CyWork
	VAR_INPUT
		EAX 	: UDINT;
	END_VAR
	VAR_OUTPUT
		state (EAX) 	: UDINT;
	END_VAR
  
  // Read inputs
  iSafetyOK       := iSafetyOK.Read();
  iDrivesOk       := iDrivesOk.Read();
  iDrivesEnabled  := iDrivesEnabled.Read();
  iStart          := iStart.Read();
  iStop           := iStop.Read();
  CPU_Load        := _CPULOAD;

  // Open methodes
  Comm_CameraMaster.CyTask();
  Comm_Xaxles.CyTask();
  Comm_Yaxles.CyTask();
  Comm_Conveyors.CyTask();
  GlobalData();
  ResetComm();
  
  
  // Calculate the actual line speed
  if UseInpAnalogeSpeed = Actief then
    iLineSpeed.MyRtTask(InputSetting:= SpeedInput::eInput::eAnalog);
    CalcLineSpeed := to_dint(to_real iLineSpeed.ActInfeedSpeed ToMMperSec); 
  else
    CalcLineSpeed := to_dint(to_real ReceptPtr^.Machine.LineSpeed ToMMperSec);
  end_if;
    
  // Cleaning jog function
  JogButtonVisual$dint := (CleaningMode = 1 & CleaningJogOption = Actief);
  if CleaningJog = 1 then
    CleaningJog := 0;
  end_if;
  
   // check errors..
  if IsClientConnected(#vError) then
    vError := vError.Read();
  else
    vError := 0;
  end_if;
  NoError := (vError = 0);
  
  // ResetKnop visable
  if iSafetyOK = 0  | NoError = 0 then
    ResetKnopVisual := 1;
  else
    ResetKnopVisual := 0;
  end_if;

  // Runstatussen
  if iSafetyOK = 0 then  // NOODSTOP
    Gestart := 0;
    CleaningMode := 0;
    StartingUp := 0;
    RunState := eNoodstopStatus;
  elsif NoError = 0 then // storing
    Gestart := 0;
    CleaningMode := 0;
    StartingUp := 0;
    RunState := eErrorStatus;
  elsif iStop = 0 & (Gestart = 1 | CleaningMode = 1) then // stop knop
    Gestart := 0;
    CleaningMode := 0;
    if NoError = 0 then  // met stop knop ook reset mogelijk !!
      oResetSignal := 1;
    end_if;  
    RunState := eStopStatus;
  elsif CleaningMode = 1 & Gestart = 0 then  // machine in schoonmaak stand
    Gestart := 0;
    RunState := eCleaningStatus;
  elsif iStart = 1 & Gestart = 0 then
    CleaningMode := 0;
    Gestart := 1;
  else  
    if StartingUp = 1 then
      Gestart := 0;
      if GlobalDataPtr^.gMachineData.Reference_Amount = GlobalDataPtr^.gMachineData.Act_Reference_Amount then
        StartingUp := 0;
      end_if;  
    elsif Gestart = 1 then
      if GlobalDataPtr^.gMachineData.Reference_Amount <> GlobalDataPtr^.gMachineData.Act_Reference_Amount then
        Gestart := 0;  // na opstarten opnieuw start geven..
        StartingUp := 1;
        RunState := eStartUpStatus;
      end_if;
      if StartingUp = 0 & PauseSignal = 1 then
        CleaningMode := 0;
        RunState := eRunStatus;
      elsif StartingUp = 0 & PauseSignal = 0 then
        CleaningMode := 0;
        Runstate := ePauseStatus;
      end_if;  
    else
      RunState := eStopStatus;
    end_if;
  end_if;  
  Gestopt := (Gestart = 0);


  // Pauze signaal, verschillende keuzes betreft inlezen
  if PauseActive = actief then
    iExternRelease  := iExternRelease.Read();
    if PauseSignalOptions = NormalyClosed then // normaly closed
      if iExternRelease = 0 then
        PauseSignal := 0;
      else
        PauseSignal := 1;
      end_if;
    elsif PauseSignalOptions = NormalyOpen then // normaly open
      if iExternRelease = 1 then
        PauseSignal := 0;
      else
        PauseSignal := 1;
      end_if;
    elsif PauseSignalOptions = Puls then // Met een puls pause signaal in- en uitschakelen
      if Standard3.R_TRIG(CLK:= iExternRelease) then
        WaitForNextPausePuls := 1;
        PauseSignal := 0;
      elsif WaitForNextPausePuls = 1 & Standard3.R_TRIG(CLK:= iExternRelease) then
        WaitForNextPausePuls := 0;
        PauseSignal := 1;
      end_if;
    end_if;
    
    if PauseSignal = 0 & CleaningMode = 0 then // hef op bij schoonmaken
      if (ops.tAbsolute - TmrPause) >= to_udint(PauseDelay * _100MS) then // vertraagd stop signaal (Vi-08)
        PauseOverride := 0;
      end_if;
    else
      PauseOverride := 1000;
      TmrPause := Ops.tAbsolute;
    end_if;
  else
    PauseSignal := 1;
    PauseOverride := 1000;
    TmrPause := Ops.tAbsolute;
  end_if;
   
  if IsClientConnected(#oPause) then
    oPause := (PauseSignal = 1 & RunState = eRunStatus);
    oPause.Write (oPause);
  end_if;



  // Leds from the pi�zo buttons
  if NoError = 0 then
    iStart := -1;
  elsif StartingUp = 1 then
    iStart := -2;
  elsif Gestart = 0 then
    iStart := 0;
  elsif (PauseSignal = 0 & PauseActive = actief) then
    iStart := -3;
  else 
    iStart := 1;
  end_if;
  iStart.Write(input:=iStart);


  // Set light collors
  if Runstate = eRunStatus then
    LampComm.LightCollors(iCollor:= Banner_EZlight::eGreenOn);
  elsif Runstate = ePauseStatus then
    LampComm.LightCollors(iCollor:= Banner_EZlight::eGreenFlashing);
  elsif Runstate = eStopStatus then
    LampComm.LightCollors(iCollor:= Banner_EZlight::eWhiteOn);
  elsif Runstate = eNoodstopStatus then
    LampComm.LightCollors(iCollor:= Banner_EZlight::eRedOn);
  elsif Runstate = eErrorStatus then
    LampComm.LightCollors(iCollor:= Banner_EZlight::eYellowOn);
  end_if;
  
  // Set claxon sound
  if ClaxonComm.ClaxonActief = Actief then
    if Runstate = eNoodstopStatus | Runstate = eErrorStatus then
      ClaxonComm.ClaxonState(State:= 1);
    else
      ClaxonComm.ClaxonState(State:= 0);
    end_if;
  end_if;


	state := READY;

END_FUNCTION

FUNCTION VIRTUAL GLOBAL Vi54_Control::Background
	VAR_INPUT
		EAX 	: UDINT;
	END_VAR
	VAR_OUTPUT
		state (EAX) 	: UDINT;
	END_VAR
  
  // Open Background methodes


	state := READY;

END_FUNCTION

FUNCTION GLOBAL Vi54_Control::ResetComm

  if Reset = 1 then
    Comm_CameraMaster.ResetErrors();
    Comm_Xaxles.ResetErrors();
    Comm_Yaxles.ResetErrors();
    Comm_Conveyors.ResetErrors();
    oResetSignal := 1;
  else
    oResetSignal := 0;
    Reset        := 0;
  end_if;
  
  oResetSignal.Write(input:= oResetSignal);

END_FUNCTION

FUNCTION GLOBAL Vi54_Control::GlobalData

  // global data pointers vullen
  GlobalDataPtr^.gRunStatus.gRunStatusGlob               := RunState;
  GlobalDataPtr^.gGeneralData.LineSpeed                  := CalcLineSpeed;
  GlobalDataPtr^.gGeneralData.iDrivesOK                  := iDrivesOk;
  GlobalDataPtr^.gGeneralData.iDrivesEnabled             := iDrivesEnabled;
  GlobalDataPtr^.gGeneralData.iNoodstopOk                := iSafetyOK;
  GlobalDataPtr^.gGeneralData.iExternrelease             := PauseSignal;
  GlobalDataPtr^.gGeneralData.PauzeOverride              := PauzeOverride;
  GlobalDataPtr^.gGeneralData.NoError                    := NoError;
  
  // Cleaning Settings
  GlobalDataPtr^.gGeneralData.CleaningMode               := CleaningMode;
  GlobalDataPtr^.gGeneralData.CleaningJogOption          := CleaningJogOption;
  GlobalDataPtr^.gGeneralData.CleaningJog                := CleaningJog;
  GlobalDataPtr^.gGeneralData.CleaningJogDistance        := CleaningJogDistance;
  GlobalDataPtr^.gGeneralData.CleaningSpeed              := to_dint(to_real CleaningSpeed ToMMperSec);
  GlobalDataPtr^.gGeneralData.CleaningAccDec             := to_dint(to_real 30 ToMMperSec2);
   
  GlobalDataPtr^.gGeneralData.oResetSignal               := oResetSignal;
  GlobalDataPtr^.gGeneralData.oMachineOK                 := oMachineOK;  
  
  // Set runstates
  RunStateInfeedConv  := GlobalDataPtr^.gRunStatus.gRunStatusInfeedConv;

END_FUNCTION

//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "DiagnosticStation_PLC"
	Revision           = "1.1"
	GUID               = "{990B0862-68AD-4060-8FBF-6DF22FEFB6EB}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(960,360)"
	Comment            = "Use this class as station for the diagnostic export.">
	<Channels>
		<Server Name="ClassSvr" GUID="{FC653B24-9CEF-43DD-BB90-C9FB95B5B31A}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="ID_Destination" GUID="{C429E4C6-DF37-4BD5-BA9C-A96A7924FBC4}" Visualized="false" Initialize="true" WriteProtected="true" Retentive="false"/>
		<Server Name="ID_Source" GUID="{41CAFE4B-D146-4BAF-9389-02DE1F7BAFA1}" Visualized="false" Initialize="true" WriteProtected="true" Retentive="false"/>
		<Client Name="cPrio" Required="true" Internal="false" Comment="Communication priority number."/>
		<Client Name="cUserFunction" Required="true" Internal="false" Comment="Object channel to DiagnosticUserFunction_PLC."/>
		<Client Name="DiagnosticWork_PLC" Required="true" Internal="true"/>
		<Client Name="ReceiveDataCMD_PLC" Required="true" Internal="true"/>
		<Client Name="SendDataCMD_PLC" Required="true" Internal="true"/>
		<Client Name="toDataManager" Required="true" Internal="false" Comment="Connection to communication data manager."/>
	</Channels>
	<RevDoku>
		<Owner Company="Sigmatek"/>
		<Dokumentation Revision="1.1" Date="2016-06-15" Author="HasHan" Company="Sigmatek" Description="changes at the inside"/>
		<Dokumentation Revision="1.0" Date="2016-06-02" Author="H�tAnt" Company="Sigmatek" Description="Creation"/>
	</RevDoku>
	<Network Name="DiagnosticStation_PLC">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name           = "DiagnosticWork_PLC"
				GUID           = "{45D5BA62-870C-4341-8B70-23D56B40F7FD}"
				Class          = "DiagnosticWork_PLC"
				Position       = "(420,690)"
				Visualized     = "false"
				BackgroundTime = "2 ms">
				<Channels>
					<Server Name="sStatus"/>
					<Client Name="cToCom"/>
					<Client Name="cUserFunction"/>
				</Channels>
			</Object>
			<Object
				Name       = "ReceiveDataCMD_PLC"
				GUID       = "{FD751422-E71E-4784-94E9-A8E18ABC1542}"
				Class      = "ReceiveDataCMD_PLC"
				Position   = "(1080,510)"
				Visualized = "false">
				<Channels>
					<Server Name="ClassSvr"/>
					<Server Name="ID_Source"/>
					<Server Name="sRecvCnt"/>
					<Client Name="cDiagnosticWork_PLC"/>
					<Client Name="toDataManager"/>
				</Channels>
			</Object>
			<Object
				Name       = "SendDataCMD_PLC"
				GUID       = "{26CF3FC7-2E0D-468E-AF62-B47BB6B4CFA7}"
				Class      = "SendDataCMD_PLC"
				Position   = "(450,120)"
				Visualized = "false">
				<Channels>
					<Server Name="ClassSvr"/>
					<Server Name="ID_Destination"/>
					<Server Name="ID_Source"/>
					<Server Name="sSendCnt"/>
					<Server Name="sSendErr"/>
					<Client Name="cPrio"/>
					<Client Name="cStation"/>
					<Client Name="toDataManager"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="this.DiagnosticWork_PLC" Destination="DiagnosticWork_PLC.sStatus"/>
			<Connection Source="this.ID_Source" Destination="SendDataCMD_PLC.ID_Source" Vertices="(1944,270),(952,330),"/>
			<Connection Source="this.ID_Destination" Destination="SendDataCMD_PLC.ID_Destination" Vertices="(1944,330),(952,270),"/>
			<Connection Source="DiagnosticWork_PLC.cToCom" Destination="SendDataCMD_PLC.ClassSvr" Vertices="(420,840),(952,210),"/>
			<Connection Source="DiagnosticWork_PLC.cUserFunction" Destination="this.cUserFunction" Vertices="(420,780),(38,270),"/>
			<Connection Source="this.SendDataCMD_PLC" Destination="SendDataCMD_PLC.ClassSvr"/>
			<Connection Source="SendDataCMD_PLC.cStation" Destination="DiagnosticWork_PLC.sStatus" Vertices="(450,330),(914,780),"/>
			<Connection Source="SendDataCMD_PLC.cPrio" Destination="this.cPrio" Vertices="(450,270),(360,270),(360,330),(38,330),"/>
			<Connection Source="this.ReceiveDataCMD_PLC" Destination="ReceiveDataCMD_PLC.ClassSvr"/>
			<Connection Source="ReceiveDataCMD_PLC.cDiagnosticWork_PLC" Destination="DiagnosticWork_PLC.sStatus" Vertices="(1080,660),(914,780),"/>
			<Connection Source="ReceiveDataCMD_PLC.toDataManager" Destination="this.toDataManager" Vertices="(1080,600),(270,600),(270,210),(38,210),"/>
			<Connection Source="SendDataCMD_PLC.toDataManager" Destination="this.toDataManager" Vertices="(450,210),(38,210),"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
DiagnosticStation_PLC : CLASS
  //Servers:
	ClassSvr 	: SvrChCmd_DINT;
	ID_Source 	: SvrCh_DINT;
	ID_Destination 	: SvrCh_DINT;
  //Clients:
	DiagnosticWork_PLC 	: CltChCmd_DiagnosticWork_PLC;
	toDataManager 	: CltChCmd_DataManager;
	cUserFunction 	: CltChCmd_DiagnosticUserFunction_PLC;
	cPrio 	: CltCh_DINT;
	SendDataCMD_PLC 	: CltChCmd_SendDataCMD_PLC;
	ReceiveDataCMD_PLC 	: CltChCmd_ReceiveDataCMD_PLC;
  //Variables:
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL Init;
	
	FUNCTION VIRTUAL GLOBAL ID_Source::Read
		VAR_OUTPUT
			output (EAX) 	: DINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL ID_Destination::Read
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

#pragma using DiagnosticWork_PLC
#pragma using ReceiveDataCMD_PLC
#pragma using SendDataCMD_PLC
#pragma usingLtd DataManager
#pragma usingLtd DiagnosticUserFunction_PLC


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB DiagnosticStation_PLC::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_DIAGNOSTICSTATION_PLC
1$UINT, 1$UINT, (SIZEOF(::DiagnosticStation_PLC))$UINT, 
3$UINT, 6$UINT, 0$UINT, 
TO_UDINT(116578120), "DiagnosticStation_PLC", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::DiagnosticStation_PLC.ClassSvr.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(619352855), "ClassSvr", 
(::DiagnosticStation_PLC.ID_Source.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(4072861165), "ID_Source", 
(::DiagnosticStation_PLC.ID_Destination.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3587003032), "ID_Destination", 
//Clients:
(::DiagnosticStation_PLC.DiagnosticWork_PLC.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(3804321695), "DiagnosticWork_PLC", TO_UDINT(3804321695), "DiagnosticWork_PLC", 1$UINT, 0$UINT, 
(::DiagnosticStation_PLC.toDataManager.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000110$UINT, TO_UDINT(31318979), "toDataManager", TO_UDINT(4008337867), "DataManager", 1$UINT, 0$UINT, 
(::DiagnosticStation_PLC.cUserFunction.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000110$UINT, TO_UDINT(121626066), "cUserFunction", TO_UDINT(4200646535), "DiagnosticUserFunction_PLC", 1$UINT, 0$UINT, 
(::DiagnosticStation_PLC.cPrio.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000110$UINT, TO_UDINT(3130820789), "cPrio", 
(::DiagnosticStation_PLC.SendDataCMD_PLC.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(64911590), "SendDataCMD_PLC", TO_UDINT(64911590), "SendDataCMD_PLC", 1$UINT, 0$UINT, 
(::DiagnosticStation_PLC.ReceiveDataCMD_PLC.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(3044989839), "ReceiveDataCMD_PLC", TO_UDINT(3044989839), "ReceiveDataCMD_PLC", 1$UINT, 0$UINT, 
END_FUNCTION


#define USER_CNT_DiagnosticStation_PLC 0

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_DiagnosticStation_PLC] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION DiagnosticStation_PLC::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_DiagnosticStation_PLC, pCmd := #vmt.CmdTable);
	vmt.CmdTable.Init		:= #Init();
	ClassSvr.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF ClassSvr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	ID_Source.pMeth			:= StoreMethod( #ID_Source::Read(), #M_NO_F() );
	IF ID_Source.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	ID_Destination.pMeth			:= StoreMethod( #ID_Destination::Read(), #M_NO_F() );
	IF ID_Destination.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION

FUNCTION VIRTUAL GLOBAL DiagnosticStation_PLC::Init

  if _FirstScan then
    ReceiveDataCMD_PLC.ID_Source := ID_Source; //set the same ID to the receive-object
  end_if;

END_FUNCTION


FUNCTION VIRTUAL GLOBAL DiagnosticStation_PLC::ID_Source::Read
	VAR_OUTPUT
		output (EAX) 	: DINT;
	END_VAR

	ID_Source := SendDataCMD_PLC.ID_Source.Read();
	output := ID_Source;

END_FUNCTION


FUNCTION VIRTUAL GLOBAL DiagnosticStation_PLC::ID_Destination::Read
	VAR_OUTPUT
		output (EAX) 	: DINT;
	END_VAR

	ID_Destination := SendDataCMD_PLC.ID_Destination.Read();
	output := ID_Destination;

END_FUNCTION

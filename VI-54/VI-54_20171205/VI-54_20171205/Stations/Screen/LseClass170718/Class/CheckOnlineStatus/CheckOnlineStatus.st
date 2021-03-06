//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "CheckOnlineStatus"
	Revision           = "1.0"
	GUID               = "{BFC3B5B6-B0D3-4E04-B131-B32FE53707BC}"
	RealtimeTask       = "false"
	CyclicTask         = "true"
	DefCyclictime      = "50 ms"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(600,180)"
	Comment            = "class for checking/alarming the online status">
	<Channels>
		<Server Name="AlarmState" GUID="{5182088B-07E2-415D-A525-B6DAF4D2AC2A}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false" Comment="actual status of the communication alarm"/>
		<Server Name="Locked" GUID="{B63077B4-0B51-4AFC-B86A-334A091E495A}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false" Comment="0 ... communication never was online&#13;&#10;1 ... communication was online -&gt; alarming enabled"/>
		<Client Name="AlarmCommunication" Required="true" Internal="true"/>
		<Client Name="AlarmNo" Required="true" Internal="false" Comment="alarm number for PLC offline alarm (input)"/>
		<Client Name="toTCPComm" Required="true" Internal="false" Comment="Object channel to TCPCommunication."/>
	</Channels>
	<RevDoku>
		<Owner Company="Sigmatek"/>
		<Dokumentation Revision="1.0" Date="2015-06-24" Company="Sigmatek" Description="Creation."/>
	</RevDoku>
	<Network Name="CheckOnlineStatus">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name       = "AlarmCommunication"
				GUID       = "{6BFE5B5A-D77B-4942-9436-F47B15FDC694}"
				Class      = "_AlarmX0Para"
				Position   = "(210,240)"
				Visualized = "true">
				<Channels>
					<Server Name="ClassSvr"/>
					<Client Name="Acknow"/>
					<Client Name="Config" Value="0"/>
					<Client Name="Group"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="AlarmCommunication.Config" Destination="this.AlarmNo" Vertices="(210,330),(38,270),"/>
			<Connection Source="this.AlarmState" Destination="AlarmCommunication.ClassSvr" Vertices="(938,270),(766,330),"/>
			<Connection Source="this.AlarmCommunication" Destination="AlarmCommunication.ClassSvr"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
CheckOnlineStatus : CLASS
  //Servers:
	Locked 	: SvrChCmd_DINT;
	AlarmState 	: SvrCh_DINT;
  //Clients:
	toTCPComm 	: CltChCmd_TCPCommunication;
	AlarmNo 	: CltCh_DINT;
	AlarmCommunication 	: CltChCmd__AlarmX0Para;
  //Variables:
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL CyWork
		VAR_INPUT
			EAX 	: UDINT;
		END_VAR
		VAR_OUTPUT
			state (EAX) 	: UDINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL AlarmState::Read
		VAR_OUTPUT
			output (EAX) 	: DINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL AlarmState::Write
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

#pragma using _AlarmX0Para
#pragma usingLtd TCPCommunication


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB CheckOnlineStatus::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_CHECKONLINESTATUS
1$UINT, 0$UINT, (SIZEOF(::CheckOnlineStatus))$UINT, 
2$UINT, 3$UINT, 0$UINT, 
TO_UDINT(618552974), "CheckOnlineStatus", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::CheckOnlineStatus.Locked.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(438963991), "Locked", 
(::CheckOnlineStatus.AlarmState.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3658100978), "AlarmState", 
//Clients:
(::CheckOnlineStatus.toTCPComm.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(3767705459), "toTCPComm", TO_UDINT(3704218787), "TCPCommunication", 1$UINT, 7$UINT, 
(::CheckOnlineStatus.AlarmNo.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000110$UINT, TO_UDINT(4089904493), "AlarmNo", 
(::CheckOnlineStatus.AlarmCommunication.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(2051489927), "AlarmCommunication", TO_UDINT(800276940), "_AlarmX0Para", 0$UINT, 9$UINT, 
END_FUNCTION


#define USER_CNT_CheckOnlineStatus 0

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_CheckOnlineStatus] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION CheckOnlineStatus::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_CheckOnlineStatus, pCmd := #vmt.CmdTable);
	vmt.CmdTable.CyWork		:= #CyWork();
	Locked.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF Locked.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	AlarmState.pMeth			:= StoreMethod( #AlarmState::Read(), #AlarmState::Write() );
	IF AlarmState.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION


FUNCTION VIRTUAL GLOBAL CheckOnlineStatus::CyWork
	VAR_INPUT
		EAX 	: UDINT;
	END_VAR
	VAR_OUTPUT
		state (EAX) 	: UDINT;
	END_VAR
  
  // Warten bis Kommunikation Online ist
  //---------------------------------------------------
  if Locked = 0 then
    
    if toTCPComm.Online then
      Locked := 1;
    end_if;

  // Kommunikation ist Online
  //---------------------------------------------------
  else
    
    if toTCPComm.Online then
      
      if toTCPComm.TransferRateReceive <> 0 then
        // online
        if AlarmCommunication.ClassSvr.Read() <> 0 then
          AlarmCommunication.ClassSvr.Write(input:=0);
        end_if;
 
      else
        // offline
        if AlarmCommunication.ClassSvr.Read() <> 1 then
          AlarmCommunication.ClassSvr.Write(input:=1);
        end_if;
      end_if;

    else
    
      // offline
      if AlarmCommunication.ClassSvr.Read() <> 1 then
        AlarmCommunication.ClassSvr.Write(input:=1);
      end_if;
      
    end_if;

  end_if;

	state := READY;

END_FUNCTION


FUNCTION VIRTUAL GLOBAL CheckOnlineStatus::AlarmState::Read
	VAR_OUTPUT
		output (EAX) 	: DINT;
	END_VAR

	AlarmState := AlarmCommunication.ClassSvr.Read();
	output := AlarmState;

END_FUNCTION


FUNCTION VIRTUAL GLOBAL CheckOnlineStatus::AlarmState::Write
	VAR_INPUT
		input (EAX) 	: DINT;
	END_VAR
	VAR_OUTPUT
		result (EAX) 	: DINT;
	END_VAR

	AlarmState := input;
	result := (AlarmCommunication.ClassSvr.Write(AlarmState))$DINT;

END_FUNCTION

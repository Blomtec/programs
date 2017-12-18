//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "ReadValue"
	Revision           = "1.1"
	GUID               = "{732A648E-67EC-4BE2-A595-E320237761A8}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(588,120)"
	Comment            = "Diese Klasse dient in Verbindung mit der Klasse SynchRdWr zum Versenden bzw. Empfangen von 4 Byte Werten einer verbundenen Steuerung.">
	<Channels>
		<Server Name="ClassSvr" GUID="{BF636FF0-9449-4186-AB63-66C6D2AC4DDB}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false" Comment="READY.. Registration at manager class (TCPComReceiveData) was successful&#13;&#10;ERROR.. Registration failed"/>
		<Server Name="RxServer" GUID="{023F55D8-9D00-4069-835A-9F30D114E448}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false" Comment="This server shows the last received value"/>
		<Client Name="coSystemLogging" Required="false" Internal="false" Comment="object channel to SystemLogging (optional)"/>
		<Client Name="coTCPComReceive" Required="true" Internal="false" Comment="Object channel to TCPComReceiveData"/>
		<Client Name="ID" Required="true" Internal="false" Comment="ID number which must be unique for each object. It also must be the same number like the ID of the sending object, so that this class receives its data."/>
		<Client Name="RxClient" Required="false" Internal="false" Comment="When receiving data, the received value will be set on this client, and written to the connected server."/>
	</Channels>
	<RevDoku>
		<Owner Company="Sigmatek"/>
		<Dokumentation Revision="1.1" Date="2015-09-29" Author="BraLis" Company="Sigmatek" Description="insert the method SystemLogging::LogEventText instead of TRACE-Messages"/>
		<Dokumentation Revision="1.0" Date="2015-03-31" Company="Sigmatek"/>
	</RevDoku>
</Class>
*)
ReadValue : CLASS
	TYPE
#pragma pack(push, 1)
	  RdData : STRUCT
	    udID : UDINT;
	    dValue : DINT;
	  END_STRUCT;
#pragma pack(pop)
	END_TYPE
  //Servers:
	ClassSvr 	: SvrChCmd_iprStates;
	RxServer 	: SvrCh_DINT;
  //Clients:
	coTCPComReceive 	: CltChCmd_TCPComReceiveData;
	ID 	: CltCh_UDINT;
	RxClient 	: CltCh_DINT;
	coSystemLogging 	: CltChCmd_SystemLogging;
  //Variables:
		usInitRun 	: USINT;
		aRdData 	: RdData;
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL Init;
				//! <Function Comment="When receiving data, this method will be called by the class TCPComReceiveData. It sets the client RxClient and the server RxServer to the received value." Name="SetData"/>
	FUNCTION VIRTUAL GLOBAL SetData
		VAR_INPUT
			pValue 	: ^void;			//! <Variable Comment="Pointer to the received data" Name="SetData.pValue"/>
			udSize 	: UDINT;			//! <Variable Comment="Size of the received data" Name="SetData.udSize"/>
		END_VAR
		VAR_OUTPUT
			bSuccessful 	: BOOL;			//! <Variable Comment="TRUE..  Successfully received the data&#13;&#10;FALSE.. Wrong size of the received data" Name="SetData.bSuccessful"/>
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

#pragma usingLtd SystemLogging
#pragma usingLtd TCPComReceiveData


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB ReadValue::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_READVALUE
1$UINT, 1$UINT, (SIZEOF(::ReadValue))$UINT, 
2$UINT, 4$UINT, 0$UINT, 
TO_UDINT(2170874617), "ReadValue", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::ReadValue.ClassSvr.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(619352855), "ClassSvr", 
(::ReadValue.RxServer.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(2035040209), "RxServer", 
//Clients:
(::ReadValue.coTCPComReceive.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(3865838395), "coTCPComReceive", TO_UDINT(2405448339), "TCPComReceiveData", 1$UINT, 4$UINT, 
(::ReadValue.ID.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(299066170), "ID", 
(::ReadValue.RxClient.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(3831885426), "RxClient", 
(::ReadValue.coSystemLogging.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000000$UINT, TO_UDINT(292037947), "coSystemLogging", TO_UDINT(90452573), "SystemLogging", 1$UINT, 4$UINT, 
END_FUNCTION


#define USER_CNT_ReadValue 1

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_ReadValue] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION ReadValue::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_ReadValue, pCmd := #vmt.CmdTable);
	vmt.CmdTable.Init		:= #Init();
#pragma warning (disable : 74)
	vmt.UserFcts[0]		:= #SetData();

#pragma warning (default : 74)
	ClassSvr.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF ClassSvr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION


FUNCTION VIRTUAL GLOBAL ReadValue::Init

  // erster Init-Durchlauf
  //------------------------------------------------------
  if usInitRun = 0 then
  
    // ID-Nummer lesen
    ID := ID.Read();
    
    // Anmelden an Manager Klasse
    if coTCPComReceive.LoginObject(udID  := ID, 
                                pThis := this) = true then
      ClassSvr := READY;
    else
      if (IsClientConnected(input:=#coSystemLogging)) then
        coSystemLogging.LogEventText("WriteValue::Init(): Anmelden an Manager Klasse fehlgeschlagen");
      end_if;
      ClassSvr := ERROR;
    end_if;

  end_if;

  // Init-Durchlauf z�hlen
  usInitRun += 1;
  
END_FUNCTION


FUNCTION VIRTUAL GLOBAL ReadValue::SetData
	VAR_INPUT
		pValue 	: ^void;
		udSize 	: UDINT;
	END_VAR
	VAR_OUTPUT
		bSuccessful 	: BOOL;
	END_VAR
  
  if udSize = sizeof(RdData) then
    
    aRdData := pValue^$RdData;

    // Wert auf Client setzen und schreiben
    RxClient := aRdData.dValue;
    RxClient.Write(RxClient);
    
    // Wert auf Server setzen
    RxServer := aRdData.dValue;
    
    // R�ckgabewert setzen, alles erfolgreich
    bSuccessful := true;
  
  else
  
    bSuccessful := false;
    
  end_if;
  
END_FUNCTION
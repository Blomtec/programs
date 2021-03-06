//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "TCPComSendData"
	Revision           = "1.6"
	GUID               = "{BDF80B03-5F48-488D-80A4-6FAC593E39ED}"
	RealtimeTask       = "false"
	CyclicTask         = "true"
	BackgroundTask     = "true"
	DefBackground      = "100 ms"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(484,120)"
	Comment            = "Diese Klasse dient zum Senden bzw. Empfangen von Daten einer verbundenen Steuerung.">
	<Channels>
		<Server Name="Timeout" GUID="{214E5FB0-5DA4-450C-82C5-614FBCC38BD6}" Visualized="false" Initialize="true" WriteProtected="true" Retentive="false" Comment="Timeout for the sending process"/>
		<Client Name="coSystemLogging" Required="false" Internal="false" Comment="object channel to SystemLogging (optional)"/>
		<Client Name="CriticalSection" Required="true" Internal="true"/>
		<Client Name="StdLib" Required="false" Internal="false" Comment="object channel to StdLib (don&apos;t connect!)"/>
	</Channels>
	<Dependencies>
		<Files>
			<File Path=".\Class\TCPComReceiveData\SynchRdWr.h" Include="true"/>
		</Files>
	</Dependencies>
	<RevDoku>
		<Owner Company="Sigmatek"/>
		<Dokumentation Revision="1.6" Date="2016-07-18" Author="KaiAnd" Company="Sigmatek" Description="1: Client coSystemLogging is an optional connection&#13;&#10;2: implemeted Method GetOnlineState() which gets the online status of the connection&#13;&#10;3: server &quot;IsOnline&quot; and Client &quot;TCPCom&quot; deleted&#13;&#10;4: optical changes in hole class"/>
		<Dokumentation Revision="1.5" Date="2016-07-14" Company="Sigmatek" Description="&quot;LastIn-FirstOut&quot; sending changed to &quot;FirstIn-FirstOut&quot; sending (read and write counter)"/>
		<Dokumentation Revision="1.4" Date="2016-01-28" Author="Roskri" Company="Sigmatek" Description="Changed class clients and/or servers to follow programming guideline"/>
		<Dokumentation Revision="1.3" Date="2015-09-29" Author="BraLis" Company="Sigmatek" Description="insert the method SystemLogging::LogEventText instead of TRACE-Messages"/>
		<Dokumentation Revision="1.2" Date="2015-03-31" Company="Sigmatek"/>
	</RevDoku>
	<Network Name="TCPComSendData">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name       = "_base"
				GUID       = "{4769F497-D1DA-4B7F-BC78-72C9BEF8E0A6}"
				Class      = "TCPComSend"
				Position   = "(211,120)"
				Visualized = "false">
				<Channels>
					<Server Name="ClassSvr"/>
					<Server Name="ID_Destination"/>
					<Server Name="ID_Source"/>
					<Server Name="sSendCnt"/>
					<Server Name="sSendErr"/>
					<Client Name="cPrio"/>
					<Client Name="cSendErr"/>
					<Client Name="cSendOk"/>
					<Client Name="toDataManager"/>
				</Channels>
			</Object>
			<Object
				Name       = "CriticalSection"
				GUID       = "{C49EE6FA-D3E1-412D-A52C-B4707AAE22B7}"
				Class      = "CriticalSection"
				Position   = "(210,540)"
				Visualized = "false">
				<Channels>
					<Server Name="ClassSvr"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="this.CriticalSection" Destination="CriticalSection.ClassSvr"/>
			<Connection Source="this.ClassSvr" Destination="_base.ClassSvr" Vertices="(999,210),(827,210),"/>
			<Connection Source="this.ID_Destination" Destination="_base.ID_Destination" Vertices="(999,270),(827,270),"/>
			<Connection Source="this.ID_Source" Destination="_base.ID_Source" Vertices="(999,330),(827,330),"/>
			<Connection Source="this.sSendCnt" Destination="_base.sSendCnt" Vertices="(999,390),(827,390),"/>
			<Connection Source="this.sSendErr" Destination="_base.sSendErr" Vertices="(999,450),(827,450),"/>
			<Connection Source="_base.toDataManager" Destination="this.toDataManager" Vertices="(211,210),(38,210),"/>
			<Connection Source="_base.cPrio" Destination="this.cPrio" Vertices="(211,270),(38,270),"/>
			<Connection Source="_base.cSendOk" Destination="this.cSendOk" Vertices="(211,330),(38,330),"/>
			<Connection Source="_base.cSendErr" Destination="this.cSendErr" Vertices="(211,390),(38,390),"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
#pragma using TCPComSend

TCPComSendData : CLASS
: TCPComSend
	TYPE
	  t_e_SendSteps :
	  (
	    TCPComSend_Idle,
	    TCPComSend_SendData,
	    TCPComSend_WaitAck
	  )$UDINT;
	  t_e_Startup :
	  (
	    Startup_WaitOnline,
	    Startup_GetData,
	    Startup_Send
	  )$UDINT;
#pragma pack(push, 1)
	  t_s_CBCount : STRUCT
	    udSending : DINT;
	    udSended : DINT;
	    udReceived : DINT;
	    udNoReceiverConnected : DINT;
	    udJobDeleted : DINT;
	    udTimeout : DINT;
	    udGlobalReceiveError : DINT;
	  END_STRUCT;
#pragma pack(pop)
#pragma pack(push, 1)
	  t_s_Data : STRUCT
	    OptCmd : UDINT;
	    pValue : ^void;
	    udLength : UDINT;
	  END_STRUCT;
#pragma pack(pop)
#pragma pack(push, 1)
	  t_s_ObjList : STRUCT
	    pthis : ^WriteValue;
	    cyclic : UDINT;
	  END_STRUCT;
#pragma pack(pop)
#pragma pack(push, 1)
	  t_s_SendData : STRUCT
	    bActive : BOOL;
	    udReadElement : UDINT;
	    udWriteElement : UDINT;
	    aData : ARRAY [0..SynchRdWr_MaxObjects-1] OF t_s_Data;
	  END_STRUCT;
#pragma pack(pop)
	END_TYPE
  //Servers:
	Timeout 	: SvrCh_UDINT;
  //Clients:
	StdLib 	: CltChCmd__StdLib;
	CriticalSection 	: CltChCmd_CriticalSection;
	coSystemLogging 	: CltChCmd_SystemLogging;
  //Variables:
		aObjects : ARRAY [0..SynchRdWr_MaxObjects-1] OF t_s_ObjList;

		eJobState 	: DataManagerPriority::t_e_CallbackState;
		eSendSteps 	: t_e_SendSteps;
		eStartup 	: t_e_Startup;
		pSendBuffer 	: ^t_s_SendData;
		sCBCounter 	: t_s_CBCount;
		sSendData1 	: t_s_SendData;
		sSendData2 	: t_s_SendData;
		udNumberObjects 	: UDINT;
		udRxCounter 	: UDINT;
		udSendElements 	: UDINT;
		udTimeout 	: UDINT;
		udTxCounter 	: UDINT;
		usRetries 	: USINT;
		IsCon_coSystemLogging 	: DINT;
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL Init;
	
	FUNCTION VIRTUAL GLOBAL CyWork
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
	
	FUNCTION VIRTUAL GLOBAL CallBackJobState
		VAR_INPUT
			JobID 	: DINT;
			JobState 	: DataManagerPriority::t_e_CallbackState;
		END_VAR;
				//! <Function Comment="Is used to register an object which sends data." Name="LoginObject"/>
	FUNCTION GLOBAL LoginObject
		VAR_INPUT
			OptCmd 	: UDINT;			//! <Variable Comment="optinial command" Name="LoginObject.OptCmd"/>
			pThis 	: ^WriteValue;			//! <Variable Comment="Thispointer" Name="LoginObject.pThis"/>
			udCyclic 	: UDINT;			//! <Variable Comment="1 = Object should be updated cyclic" Name="LoginObject.udCyclic"/>
		END_VAR
		VAR_OUTPUT
			bSuccessful 	: BOOL;			//! <Variable Comment="TRUE.. Method was successful&#13;&#10;FALSE.. Error" Name="LoginObject.bSuccessful"/>
		END_VAR;
				//! <Function Comment="Method to insert data into the send buffer." Name="InsertSendData"/>
	FUNCTION GLOBAL InsertSendData
		VAR_INPUT
			OptCmd 	: UDINT;			//! <Variable Comment="optional command" Name="InsertSendData.OptCmd"/>
			pValue 	: ^void;			//! <Variable Comment="Pointer to the send data" Name="InsertSendData.pValue"/>
			udLength 	: UDINT;			//! <Variable Comment="Length of the send data" Name="InsertSendData.udLength"/>
		END_VAR
		VAR_OUTPUT
			bSuccessful 	: BOOL;			//! <Variable Comment="TRUE.. Ok&#13;&#10;FALSE.. Error" Name="InsertSendData.bSuccessful"/>
		END_VAR;
				//! <Function Comment="SSW for the first collecting of the data." Name="SendHandling"/>
	FUNCTION GLOBAL SendHandling;
				//! <Function Comment="SSW for sending the data." Name="SendSteps"/>
	FUNCTION SendSteps;
				//! <Function Comment="Hier kann der Status der Verbindung ausgelesen werden.&#13;&#10;Can be used to determine the status of the connection." Name="GetOnlineState"/>
	FUNCTION GLOBAL GetOnlineState
		VAR_OUTPUT
			bOnline 	: BOOL;			//! <Variable Comment="FALSE ... offline&#13;&#10;TRUE ... online" Name="GetOnlineState.bOnline"/>
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

#pragma using CriticalSection
#pragma usingLtd _StdLib
#pragma usingLtd SystemLogging


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB TCPComSendData::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_TCPCOMSENDDATA
1$UINT, 6$UINT, (SIZEOF(::TCPComSendData))$UINT, 
1$UINT, 3$UINT, 0$UINT, 
TO_UDINT(864003870), "TCPComSendData", //Class
TO_UDINT(2053161344), "TCPComSend", 1$UINT, 2$UINT, //Baseclass
//Servers:
(::TCPComSendData.Timeout.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3187968904), "Timeout", 
//Clients:
(::TCPComSendData.StdLib.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000000$UINT, TO_UDINT(584375759), "StdLib", TO_UDINT(3689364044), "_StdLib", 0$UINT, 0$UINT, 
(::TCPComSendData.CriticalSection.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(794617671), "CriticalSection", TO_UDINT(794617671), "CriticalSection", 0$UINT, 4$UINT, 
(::TCPComSendData.coSystemLogging.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000000$UINT, TO_UDINT(292037947), "coSystemLogging", TO_UDINT(90452573), "SystemLogging", 1$UINT, 4$UINT, 
END_FUNCTION


#define USER_CNT_TCPComSendData 3

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_TCPComSendData] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION TCPComSendData::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
		nCmdSize	: UINT;
	END_VAR

	ret_code	:= TCPComSend::@STD();
	IF ret_code <> C_OK THEN
		RETURN;
	END_IF;
	nCmdSize		:= TCPComSend::ClassSvr.pMeth^.nCmds$UINT*SIZEOF(pVoid) + CMDMETH.Init;

	_memcpy((#vmt.CmdTable)$^USINT, TCPComSend::ClassSvr.pMeth, nCmdSize);
	vmt.CmdTable.nCmds		:= nSTDCMD + USER_CNT_TCPComSendData;
	vmt.CmdTable.Init		:= #Init();
	vmt.CmdTable.CyWork		:= #CyWork();
#pragma warning (disable : 74)
	vmt.UserFcts[0]		:= #Background();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[1]		:= #CallBackJobState();

#pragma warning (default : 74)
	TCPComSend::ClassSvr.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF TCPComSend::ClassSvr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

#pragma usingLtd WriteValue

//{{LSL_IMPLEMENTATION


FUNCTION VIRTUAL GLOBAL TCPComSendData::Init

  if (_FirstScan) then
    // als erstes ist Buffer 1 zum Senden aktiv
    sSendData1.bActive := true;
    sSendData2.bActive := false;
    
    //-----------------------------------------------------------------------------------------
    //  check client-connnections and set flags                                       
    //-----------------------------------------------------------------------------------------
    if (IsClientConnected(#coSystemLogging)) then
      IsCon_coSystemLogging := TRUE;
    else
      IsCon_coSystemLogging := FALSE;
    end_if;    
    
  end_if;

END_FUNCTION


FUNCTION GLOBAL TCPComSendData::LoginObject
	VAR_INPUT
		OptCmd 	: UDINT;
		pThis 	: ^WriteValue;
		udCyclic 	: UDINT;
	END_VAR
	VAR_OUTPUT
		bSuccessful 	: BOOL;
	END_VAR
    
  // �bergabeparameter auf Grenzen pr�fen
  if (OptCmd >= sizeof(aObjects) / sizeof(aObjects[0])) then
    if (IsCon_coSystemLogging = TRUE) then
      coSystemLogging.LogEventText("TCPComSendData::LoginObject(): �bergabeparameter usID verletzt die Grenzen");
    end_if;
    bSuccessful := false;
    return;
  end_if;
  
  // Pr�fen ob die ID bereits belegt ist
  if (aObjects[OptCmd].pthis <> NIL) then
    if (IsCon_coSystemLogging = TRUE) then
      coSystemLogging.LogEventText("TCPComSendData::LoginObject(): Index f�r Profilpunkt bereits belegt");
    end_if;
    bSuccessful := false;
    return;
  end_if;

  // This-Pointer von RdWr-Object speichern,
  // somit ist dieser Index belegt
  aObjects[OptCmd].pthis := pThis;
  aObjects[OptCmd].cyclic := udCyclic;
  
  // angemeldete Punkte z�hlen
  udNumberObjects += 1;

  // Methode war erfolgreich
  bSuccessful := true;
  
END_FUNCTION


FUNCTION GLOBAL TCPComSendData::InsertSendData
	VAR_INPUT
		OptCmd 	: UDINT;
		pValue 	: ^void;
		udLength 	: UDINT;
	END_VAR
	VAR_OUTPUT
		bSuccessful 	: BOOL;
	END_VAR
  VAR
    tmpIndex  : UDINT;
//  	pSendBuffer   : ^t_s_SendData;
  END_VAR

  // Pr�fen, ob Buffer 1 aktiv ist
  if (sSendData1.bActive = true) then
    pSendBuffer := #sSendData1;
    
  // Pr�fen ob Buffer 2 aktiv ist
  elsif (sSendData2.bActive = true) then
    pSendBuffer := #sSendData2;
    
  // kein Buffer aktiv => Fehler
  else
    if (IsCon_coSystemLogging = TRUE) then
      coSystemLogging.LogEventText("TCPComSendData::SendData(): kein Buffer zum Senden aktiv");
    end_if;
    bSuccessful := false;
    return;
  end_if;
  
  // aktuelle Position holen
  tmpIndex := pSendBuffer^.udWriteElement;
  
  // Pr�fen ob noch ein Element im Buffer Platz findet
  if (tmpIndex >= (sizeof(pSendBuffer^.aData) / sizeof(pSendBuffer^.aData[0]))) then
    //TODO: KOGTOB, Tracemeldung �berpr�fen
    if (IsCon_coSystemLogging = TRUE) then
      //coSystemLogging.LogEventText("TCPComSendData::SendData(): maximale Gr��e vom SendeBuffer erreicht");
    end_if;
    bSuccessful := false;
    return;
  end_if;

  // �nderung in Buffer eintragen
  pSendBuffer^.aData[tmpIndex].OptCmd   := OptCmd;
  pSendBuffer^.aData[tmpIndex].pValue   := pValue;
  pSendBuffer^.aData[tmpIndex].udLength := udLength;
  
  // Auf �berlauf �berwachen
  if (pSendBuffer^.udWriteElement < (sizeof(pSendBuffer^.aData) / sizeof(pSendBuffer^.aData[0]) -1)) then
    // Anzahl der Elemente in Buffer erh�hen
    pSendBuffer^.udWriteElement += 1;
  else
    pSendBuffer^.udWriteElement := 0;
  end_if;
  
  // Alles erfolgreich
  bSuccessful := true;
  
END_FUNCTION


FUNCTION VIRTUAL GLOBAL TCPComSendData::CallBackJobState
	VAR_INPUT
		JobID 	  : DINT;
		JobState 	: DataManagerPriority::t_e_CallbackState;
	END_VAR
  
  TCPComSend::CallBackJobState(JobID, JobState);
  
  // aktuellen Status der Nachricht speichern
  eJobState := JobState;
  
  // jeden Callback z�hlen
  case (eJobState) of
  
    // Nachricht wird aktuell gesendet
    //---------------------------------------------------------
    _MNG_Sending:
      sCBCounter.udSending += 1;
      
    // Nachricht wurde erfolgreich gesendet
    //---------------------------------------------------------
    _MNG_Sended:
      sCBCounter.udSended += 1;
      
      // Hier sollte nicht gepr�ft werden, ob das Schrittschaltwert
      // im richtigen Status steht. Die Kommunikation wird in einem
      // h�her prioren Task abgearbeitet, und dadurch k�nnen wir
      // direkt nach dem Aufrufen der Sende-Methode unterbrochen werden.
      // Dies kann passieren, bevor das SSW auf Wait4Ack gesetzt wird.

      // Auf �berlauf �berwachen
      if (pSendBuffer^.udReadElement < (sizeof(pSendBuffer^.aData) / sizeof(pSendBuffer^.aData[0]) -1)) then
        // Anzahl der Elemente in Buffer erh�hen
        pSendBuffer^.udReadElement += 1;
      else
        pSendBuffer^.udReadElement := 0;
      end_if;      
      
      // wieder bereit zum Daten senden
      if (pSendBuffer^.udReadElement <> pSendBuffer^.udWriteElement) then
        eSendSteps := TCPComSend_SendData;
      else
        eSendSteps := TCPComSend_Idle;
      end_if;

    // Nachricht vom Empf�nger erhalten
    //---------------------------------------------------------
    _MNG_Received:
      sCBCounter.udReceived += 1;
      
    // Kein Empf�nger f�r Nachricht vorhanden
    //---------------------------------------------------------
    _MNG_NoReceiverConnected: 
    
      sCBCounter.udNoReceiverConnected += 1;
      if (IsCon_coSystemLogging = TRUE) then
        coSystemLogging.LogEventText("TCPComSendData::CallBackJobState(): keine Empfangsklasse verf�gbar");
      end_if;
      ClassSvr := ERROR;
      
    // Nachricht wurde nicht gesendet und gel�scht
    //---------------------------------------------------------
    _MNG_JobDeletet:
    
      sCBCounter.udJobDeleted += 1;
      if (IsCon_coSystemLogging = TRUE) then
        coSystemLogging.LogEventText("TCPComSendData::CallBackJobState(): Job wurde gel�scht");
      end_if;
      ClassSvr := ERROR;
    
    // Timeout f�r Nachricht ist aufgetreten
    //---------------------------------------------------------
    _MNG_TimeOut:
      sCBCounter.udTimeout += 1;
      
      // aktuelle Anzahl Retries z�hlen
      usRetries += 1;
      
      // maximale Anzahl pr�fen
      if (usRetries > SynchRdWr_MaxRetries) then
        if (IsCon_coSystemLogging = TRUE) then
          coSystemLogging.LogEventText("TCPComSendData::CallBackJobState(): maximale Anzahl an Retries erreicht");
        end_if;
        ClassSvr := ERROR;
      else
        if (IsCon_coSystemLogging = TRUE) then
          coSystemLogging.LogEventText("TCPComSendData::CallBackJobState(): Retry zum Senden ausgel�st");
        end_if;
        // neuen Versuch zum Senden starten
        eSendSteps := TCPComSend_SendData;
      end_if;

    // globaler Fehler ist aufgetreten
    //---------------------------------------------------------
    _MNG_GlobalReceiveError:
    
      sCBCounter.udGlobalReceiveError += 1;
      if (IsCon_coSystemLogging = TRUE) then
        coSystemLogging.LogEventText("TCPComSendData::CallBackJobState(): Fehler beim Empfangen der Daten");
      end_if;
      ClassSvr := ERROR;
    
  end_case;

END_FUNCTION


FUNCTION VIRTUAL GLOBAL TCPComSendData::Background
	VAR_INPUT
		EAX 	: UDINT;
	END_VAR
	VAR_OUTPUT
		state (EAX) 	: UDINT;
	END_VAR
  VAR
  	tmpCounter  : UDINT;
    tmpValue    : DINT;
    tmpObject   : ^WriteValue;
    tmpSize     : UDINT;
    tmpID       : UDINT;
  END_VAR
  
   // Schleife zum Durchsuchen aller Objekte
  for tmpCounter:=0 to (sizeof(aObjects) / sizeof(aObjects[0]) -1) do
      
    tmpObject := aObjects[tmpCounter].pthis;
  
    // Pr�fen ob Objekte mit Index angemeldet ist
    if (tmpObject <> NIL) then
    
      // checken ob das Objekt zyklisch upgedatet werden soll oder nicht
      if (aObjects[tmpCounter].cyclic = 1) then
        // Wert vom Objekt holen und pr�fen ob verf�gbar
        if (tmpObject^.GetData(pValue:= #tmpValue, udSize:=#tmpSize, udID:=#tmpID) = true) then
          
          // Daten in Sendebuffer eintragen
          if (InsertSendData(optCmd:=tmpID, pValue:=tmpValue$^void, udLength:=tmpSize) = false) then
            //coSystemLogging.LogEventText("TCPComSendData::Background(): Eintragen der Daten in Sendebuffer fehlgeschlagen");
          end_if;

        end_if;
      end_if;

    end_if;
    
    SendHandling();

  end_for;

	state := READY;

END_FUNCTION


FUNCTION VIRTUAL GLOBAL TCPComSendData::CyWork
	VAR_INPUT
		EAX 	: UDINT;
	END_VAR
	VAR_OUTPUT
		state (EAX) 	: UDINT;
	END_VAR
  VAR
  	tmpCounter  : UDINT;
    tmpValue    : DINT;
    tmpObject   : ^WriteValue;
    tmpSize     : UDINT;
    tmpID       : UDINT;
  END_VAR

  //Hier werden die Daten zyklisch geschickt....
  
  // Schleife zum Durchsuchen aller Objekte
  for tmpCounter:=0 to (sizeof(aObjects) / sizeof(aObjects[0]) -1) do
      
    tmpObject := aObjects[tmpCounter].pthis;
  
    // Pr�fen ob Objekte mit Index angemeldet ist
    if (tmpObject <> NIL) then
    
      // checken ob das Objekt zyklisch upgedatet werden soll oder nicht
      if (aObjects[tmpCounter].cyclic = 1) then
        // Wert vom Objekt holen und pr�fen ob verf�gbar
        if (tmpObject^.GetData(pValue:=#tmpValue, udSize:=#tmpSize, udID:=#tmpID) = true) then
          
          // Daten in Sendebuffer eintragen
          if (InsertSendData(optCmd:=tmpID, pValue:=tmpValue$^void, udLength:=tmpSize) = false) then
            //coSystemLogging.LogEventText("TCPComSendData::CyWork(): Eintragen der Daten in Sendebuffer fehlgeschlagen");
          end_if;

        end_if;
      end_if;

    end_if;
    
    SendHandling();

  end_for;

	state := READY;

END_FUNCTION


FUNCTION TCPComSendData::SendSteps
  
  //*****************************************************************************
  //** SCHRITTSCHALTWERK ZUM SENDEN DER DATEN                                  **
  //*****************************************************************************
  
  case eSendSteps of
    
    // Nichts zum Senden
    //*****************************************************************************
    TCPComSend_Idle:
    
      // Methode SendData ThreadSafe machen:
      // es gibt 2 Buffer zum Eintragen der Daten zum Senden.
      // Im folgenden Abschnitt werden die Buffer ThreadSafe
      // umgeschaltet und danach im CyWork gesendet
      
      // Section Start => Sollte der CyWork durch RtWork unterbrochen 
      // werden, wird der folgende Abschnitt noch im RtWork abgearbeitet
      CriticalSection.SectionStart();
      
      // Pr�fen, ob in Buffer 1 Elemente zum Senden sind
      if ((sSendData1.bActive = true) & (sSendData1.udWriteElement <> sSendData1.udReadElement)) then
        
        // Buffer umschalten
        sSendData1.bActive := false;
        sSendData2.bActive := true;

        // Pointer auf Buffer zum Senden setzen
        pSendBuffer := #sSendData1;
        
        // Schrittschaltwerk ansto�en
        eSendSteps := TCPComSend_SendData;
        
      // Pr�fen, ob in Buffer 2 Elemente zum Senden sind
      elsif ((sSendData2.bActive = true) & (sSendData2.udWriteElement <> sSendData2.udReadElement)) then
        
        // Buffer umschalten
        sSendData1.bActive := true;
        sSendData2.bActive := false;
        
        // Pointer auf Buffer zum Senden setzen
        pSendBuffer := #sSendData2;
     
        // Schrittschaltwerk ansto�en
        eSendSteps := TCPComSend_SendData;
     
      end_if;
      
      // Section Stop
      CriticalSection.SectionStop();
    
    
    // Daten senden
    //*****************************************************************************
    TCPComSend_SendData:
      
      // Das Schrittschaltwerk muss vor dem Senden gesetzt werden.
      // Die Kommunikation l�uft in einem h�her prioren Task ab und dadurch
      // kann es passieren, dass sofort nach dem Aufruf, der Callback aufgerufen wird
      // Wird hier das SSW nicht schon gesetzt, k�nnten wir dadurch das Setzen
      // vom Callback �berschreiben und h�ngen bleiben.
      if (pSendBuffer^.udWriteElement <> pSendBuffer^.udReadElement) then
        eSendSteps  := TCPComSend_WaitAck;
        udTxCounter += 1;
        udTimeout   := ops.tAbsolute;
      
        if ( SendData(pSendBuffer^.aData[pSendBuffer^.udReadElement].pValue, 
                      pSendBuffer^.aData[pSendBuffer^.udReadElement].udLength,
                      Timeout,
                      to_usint(pSendBuffer^.aData[pSendBuffer^.udReadElement].OptCmd)) < 0 ) then
          if (IsCon_coSystemLogging = TRUE) then
            coSystemLogging.LogEventText("TCPComSendData::SendSteps(): Senden der Daten fehlgeschlagen");
          end_if;
        end_if;
      end_if;
      
    
    // Warten auf Acknowledge
    //*****************************************************************************
    TCPComSend_WaitAck:

  end_case;

END_FUNCTION


FUNCTION GLOBAL TCPComSendData::SendHandling
  VAR
  	tmpCounter  : UDINT;
    tmpValue    : DINT;
    tmpObject   : ^WriteValue;
    tmpSize     : UDINT;
    tmpID       : UDINT;
  END_VAR
  
  //*****************************************************************************
  //** SCHRITTSCHALTWERK ZUM ERSTMALIGEN SAMMELN DER DATEN                     **
  //*****************************************************************************
  
  case eStartup of
  
    // Warten bis Communication Online ist
    //*****************************************************************************
    Startup_WaitOnline:
      
      // Pr�fen ob Kommunikation Online ist
      if (toDataManager.GetOnlineState()) then
        
        // Sammeln der Daten starten
        eStartup := Startup_GetData;
        
      end_if;

    // Daten von Sendeobjekten sammeln
    //*****************************************************************************
    Startup_GetData:
    
      // Schleife zum Durchsuchen aller Objekte
      for tmpCounter:=0 to (sizeof(aObjects) / sizeof(aObjects[0]) -1) do
          
        tmpObject := aObjects[tmpCounter].pthis;
      
        // Pr�fen ob Objekte mit Index angemeldet ist
        if (tmpObject <> NIL) then
        
          // Wert vom Objekt holen und pr�fen ob verf�gbar
          if (tmpObject^.GetData(pValue:=#tmpValue, udSize:=#tmpSize, udID:=#tmpID) = true) then
            
            // Daten in Sendebuffer eintragen
            if (InsertSendData(OptCmd:=tmpID, pValue:=tmpValue$^void, udLength := tmpSize) = false) then
              //coSystemLogging.LogEventText("TCPComSendData::SendHandling(): Eintragen der Daten in Sendebuffer fehlgeschlagen");
            end_if;

          end_if;

        end_if;

      end_for;

      // Daten senden
      eStartup := Startup_Send;
      
      
    // Daten sollen gesendet werden
    //*****************************************************************************
    Startup_Send:
    
      // Pr�fen ob Kommunikation noch Online ist
      if (toDataManager.GetOnlineState() = true) then
      
        // Schrittschaltwerk zum Senden aufrufen
        SendSteps();
        
      else
        
        // Buffer r�cksetzen
        sSendData1.udReadElement  := 0;
        sSendData1.udWriteElement := 0;
        
        sSendData2.udReadElement  := 0;
        sSendData2.udWriteElement := 0;
        
        // Wieder in Schritt springen, um Kommunikation zu pr�fen
        eStartup  := Startup_WaitOnline;
        eSendSteps := TCPComSend_Idle;
        
      end_if;

  end_case;

END_FUNCTION


FUNCTION GLOBAL TCPComSendData::GetOnlineState
	VAR_OUTPUT
		bOnline 	: BOOL;
	END_VAR
  
  bOnline := to_bool(toDataManager.GetOnlineState());

END_FUNCTION


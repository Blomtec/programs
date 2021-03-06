//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "FileTransfer"
	Revision           = "1.2"
	GUID               = "{F695B97B-75A4-409E-B168-63E5F001DB82}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(1050,420)"
	Comment            = "Die Klasse dient dem Austausch von&#13;&#10;Files zwischen zwei CPUs bzw.Terminals.&#13;&#10;Kann verwendet werden um Files&#13;&#10;von einer 2ten CPU zu holen.&#13;&#10;Die Klasse alleine ist nicht funktionsf�hig. Sie ben�tigt&#13;&#10;die Klasse DataMng um korrekt zu funktionieren.">
	<Channels>
		<Server Name="ClassSvr" GUID="{D278FAED-FE47-4102-B5F2-EF8AD1E80A32}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false" Comment="Objekt-Server der Klasse. Der Client cFileTransfer der Klasse&#13;&#10;FolderTransfer muss hierher verbunden werden wenn man diese nutzt.&#13;&#10;Ansonsten kann man den Status der letzten Operation mit der Methode&#13;&#10;GetStateOfProcess abgefragt werden."/>
		<Server Name="sDestinationID" GUID="{08FF1875-98F7-4EC3-8973-99620ED241A4}" Visualized="false" Initialize="true" WriteProtected="true" Retentive="false" Comment="Destination communication id number."/>
		<Server Name="sErrorNr" GUID="{9B5B9FBB-E12C-44B2-BE64-A9854F0CE59E}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false" Comment="Interne Fehlernummer."/>
		<Server Name="sMyID" GUID="{E6517E42-390B-4221-B750-643318503436}" Visualized="false" Initialize="true" WriteProtected="true" Retentive="false" Comment="Source communication id number."/>
		<Server Name="sState" GUID="{68262DE1-61A5-4871-B1DB-FAE96458E6C6}" Class="FileTransferHandle" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false" Comment="Status des letzten Kommandos ."/>
		<Server Name="sSubState" GUID="{669D95F8-A1B0-4D86-852A-13DE53E1D818}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false" Comment="Genauere Aufschl�sselung des aktuell durchlaufenen Schritts"/>
		<Client Name="cDataManager" Required="true" Internal="false" Comment="Connection to communication data manager."/>
		<Client Name="cPrio" Required="true" Internal="false" Comment="Communication priority number."/>
		<Client Name="FileTransferHandle" Required="true" Internal="true"/>
		<Client Name="RecvData" Required="true" Internal="true"/>
		<Client Name="SendData" Required="true" Internal="true"/>
	</Channels>
	<Dependencies>
		<Files>
			<File Path=".\Class\FileTransfer\FileTransfer.pdf"/>
			<File Path=".\Class\FileTransfer\Diagnostic_Def.h" Include="true"/>
		</Files>
	</Dependencies>
	<RevDoku>
		<Owner Company="Sigmatek" Author="h�tant"/>
		<Dokumentation Revision="1.2" Date="2015-10-27" Author="h�tant" Company="Sigmatek" Description="added documentation file"/>
		<Dokumentation Revision="1.1" Date="2015-10-21" Author="h�tant" Company="Sigmatek" Description="added error handling and some improvements"/>
		<Dokumentation Revision="1.0" Date="2015-10-15" Author="h�tant" Company="Sigmatek" Description="creation of class"/>
	</RevDoku>
	<Network Name="FileTransfer">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name           = "FileTransferHandle"
				GUID           = "{9ED5EBE1-B53B-47A0-89F4-EDB95C6EE025}"
				Class          = "FileTransferHandle"
				Position       = "(1080,360)"
				Visualized     = "false"
				BackgroundTime = "100 ms">
				<Channels>
					<Server Name="sCallbackError"/>
					<Server Name="sCallbackOK"/>
					<Server Name="sErrorNr"/>
					<Server Name="sState"/>
					<Server Name="sSubState"/>
					<Client Name="cFileSys"/>
					<Client Name="cGrafix"/>
					<Client Name="cSigCLib"/>
					<Client Name="cToCom"/>
				</Channels>
			</Object>
			<Object
				Name       = "RecvData"
				GUID       = "{18E74258-2910-4777-9B94-754C0323B939}"
				Class      = "FileTransfer_RecvData"
				Position   = "(2010,120)"
				Visualized = "false">
				<Channels>
					<Server Name="ClassSvr"/>
					<Server Name="sMyID"/>
					<Server Name="sRecvCnt"/>
					<Client Name="cDataMng"/>
					<Client Name="cFileTransfer"/>
				</Channels>
			</Object>
			<Object
				Name       = "SendData"
				GUID       = "{3232863A-09C2-4327-9871-4A1C04FFB3B3}"
				Class      = "Comm_SendData"
				Position   = "(360,360)"
				Visualized = "false">
				<Channels>
					<Server Name="ClassSvr"/>
					<Server Name="sDestinationId"/>
					<Server Name="sMyId"/>
					<Server Name="sSendCnt"/>
					<Server Name="sSendErr"/>
					<Client Name="cDataMng"/>
					<Client Name="cPrio"/>
					<Client Name="cSendErr"/>
					<Client Name="cSendOk"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="this.RecvData" Destination="RecvData.ClassSvr"/>
			<Connection Source="this.FileTransferHandle" Destination="FileTransferHandle.sState"/>
			<Connection Source="this.SendData" Destination="SendData.ClassSvr"/>
			<Connection Source="RecvData.cFileTransfer" Destination="FileTransferHandle.sState" Vertices="(2010,270),(1920,270),(1920,450),(1726,450),"/>
			<Connection Source="FileTransferHandle.cToCom" Destination="SendData.ClassSvr" Vertices="(1080,450),(976,450),"/>
			<Connection Source="SendData.cDataMng" Destination="this.cDataManager" Vertices="(360,450),(270,450),(270,210),(38,210),"/>
			<Connection Source="RecvData.cDataMng" Destination="this.cDataManager" Vertices="(2010,210),(38,210),"/>
			<Connection Source="SendData.cPrio" Destination="this.cPrio" Vertices="(360,510),(180,510),(180,270),(38,270),"/>
			<Connection Source="SendData.cSendOk" Destination="FileTransferHandle.sCallbackOK" Vertices="(360,570),(180,570),(180,870),(1920,870),(1920,630),(1726,630),"/>
			<Connection Source="SendData.cSendErr" Destination="FileTransferHandle.sCallbackError" Vertices="(360,630),(270,630),(270,840),(1830,840),(1830,690),(1726,690),"/>
			<Connection Source="this.sState" Destination="FileTransferHandle.sState" Vertices="(2646,390),(2460,390),(2460,450),(1726,450),"/>
			<Connection Source="this.sSubState" Destination="FileTransferHandle.sSubState" Vertices="(2646,450),(2520,450),(2520,510),(1726,510),"/>
			<Connection Source="this.sErrorNr" Destination="FileTransferHandle.sErrorNr" Vertices="(2646,510),(2580,510),(2580,570),(1726,570),"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
FileTransfer : CLASS
  //Servers:
	ClassSvr 	: SvrChCmd_DINT;
	sMyID 	: SvrCh_DINT;
	sDestinationID 	: SvrCh_DINT;
	sState 	: SvrChCmd__FT_State_PTofCls_FileTransferHandle;
	sSubState 	: SvrCh__FT_SubState_PTofCls_FileTransferHandle;
	sErrorNr 	: SvrCh_DINT;
  //Clients:
	FileTransferHandle 	: CltChCmd_FileTransferHandle;
	cDataManager 	: CltChCmd_DataManager;
	cPrio 	: CltCh_DINT;
	SendData 	: CltChCmd_Comm_SendData;
	RecvData 	: CltChCmd_FileTransfer_RecvData;
  //Variables:
  //Functions:
				//! <Function Comment="Nicht f�r den Benutzer.( Initialisierung )" Name="Init"/>
	FUNCTION VIRTUAL GLOBAL Init;
				//! <Function Comment="Wird verwendet, um ein File von der Gegenstelle zu holen." Name="GetFile"/>
	FUNCTION GLOBAL GetFile
		VAR_INPUT
			pSourceDP 	: ^CHAR;			//! <Variable Comment="Laufwerk und Ordner des zu holenden Files ( z.B.: &quot;C:\Test\Hallo\&quot; )" Name="GetFile.pSourceDP"/>
			pSourceNE 	: ^CHAR;			//! <Variable Comment="Name und Endung des Files ( z.B.: &quot;logfile.dat&quot; )" Name="GetFile.pSourceNE"/>
			pDestinationDP 	: ^CHAR;			//! <Variable Comment="Laufwerk und Ordnername , wohin das File kopiert werden soll.&#13;&#10;( z.B.: &quot;E:\Export\&quot; ) Der Ordner muss bereits existieren." Name="GetFile.pDestinationDP"/>
		END_VAR
		VAR_OUTPUT
			retcode 	: DINT;			//! <Variable Comment="0 .. Es l�uft bereits eine andere Aktion&#13;&#10;1 .. Transfer wurde erfolgreich gestartet.&#13;&#10;-1 .. Einer der �bergebenen Pointer ist NULL&#13;&#10;-2 .. Befehl konnte der Kommunikation nicht weitergegeben werden." Name="GetFile.retcode"/>
		END_VAR;
				//! <Function Comment="Wird verwendet, um den Status der letzten Aktion zu �berpr�fen." Name="GetStateOfProcess"/>
	FUNCTION GLOBAL GetStateOfProcess
		VAR_OUTPUT
			retcode 	: FileTransferHandle::_FT_State;			//! <Variable Comment="FT_NoAction .. aktuelle keine Aktive Aktion&#13;&#10;FT_OperationReady .. Aktion wurde ohne Fehler durchgef�hrt.&#13;&#10;FT_Error .. Es ist ein Fehler aufgetreten.&#13;&#10;&#13;&#10;Der Server sSubState gibt genauere Ausk�nfte �ber Fehler oder&#13;&#10;aktuelle Statusinformationen." Name="GetStateOfProcess.retcode"/>
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

#pragma using Comm_SendData
#pragma using FileTransfer_RecvData
#pragma using FileTransferHandle
#pragma usingLtd DataManager


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB FileTransfer::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_FILETRANSFER
1$UINT, 2$UINT, (SIZEOF(::FileTransfer))$UINT, 
6$UINT, 5$UINT, 0$UINT, 
TO_UDINT(4196971158), "FileTransfer", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::FileTransfer.ClassSvr.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(619352855), "ClassSvr", 
(::FileTransfer.sMyID.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3817383452), "sMyID", 
(::FileTransfer.sDestinationID.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(2304361400), "sDestinationID", 
(::FileTransfer.sState.pMeth)$UINT, _CH_SVR_OBJ$UINT, 2#0000000000000000$UINT, TO_UDINT(2839362732), "sState", 
(::FileTransfer.sSubState.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3622246169), "sSubState", 
(::FileTransfer.sErrorNr.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3976045603), "sErrorNr", 
//Clients:
(::FileTransfer.FileTransferHandle.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(496318626), "FileTransferHandle", TO_UDINT(496318626), "FileTransferHandle", 1$UINT, 2$UINT, 
(::FileTransfer.cDataManager.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000110$UINT, TO_UDINT(3108336456), "cDataManager", TO_UDINT(4008337867), "DataManager", 1$UINT, 0$UINT, 
(::FileTransfer.cPrio.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000110$UINT, TO_UDINT(3130820789), "cPrio", 
(::FileTransfer.SendData.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(2327520716), "SendData", TO_UDINT(2033074076), "Comm_SendData", 0$UINT, 5$UINT, 
(::FileTransfer.RecvData.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(3769627246), "RecvData", TO_UDINT(2875724004), "FileTransfer_RecvData", 1$UINT, 0$UINT, 
END_FUNCTION


#define USER_CNT_FileTransfer 0

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_FileTransfer] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION FileTransfer::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_FileTransfer, pCmd := #vmt.CmdTable);
	vmt.CmdTable.Init		:= #Init();
	ClassSvr.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF ClassSvr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	_memcpy((#vmt.CmdTable)$^USINT, sState.pMeth, SIZEOF(CMDMETH));
	vmt.CmdTable.nCmds		:= nSTDCMD;
	sState.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF sState.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION

FUNCTION VIRTUAL GLOBAL FileTransfer::Init

  // Initwerte �bernehmen
  SendData.sMyId := sMyID;
  SendData.sDestinationId := sDestinationID;
  RecvData.sMyID := sMyID;
  
END_FUNCTION


FUNCTION GLOBAL FileTransfer::GetFile
	VAR_INPUT
		pSourceDP 	: ^CHAR;
		pSourceNE 	: ^CHAR;
    pDestinationDP 	: ^CHAR;
	END_VAR
	VAR_OUTPUT
		retcode 	: DINT;
	END_VAR
  
  // Funktion weiterleiten.
  retcode := FileTransferHandle.GetFile(pSourceDP, pSourceNE,pDestinationDP);
  
END_FUNCTION


FUNCTION GLOBAL FileTransfer::GetStateOfProcess
	VAR_OUTPUT
		retcode 	: FileTransferHandle::_FT_State;
	END_VAR
  
  // aktuellen status zur�ckgeben.
  retcode := FileTransferHandle.sState;

END_FUNCTION

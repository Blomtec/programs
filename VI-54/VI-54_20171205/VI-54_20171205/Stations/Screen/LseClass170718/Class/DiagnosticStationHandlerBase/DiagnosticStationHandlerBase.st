//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)

//{{LSL_DEFINES
#define DiagnosticStationHandlerBase_MaxStationNr  10
#define DiagnosticStationHandlerBase_MaxNameLength  100


//}}LSL_DEFINES

//{{LSL_DECLARATION

(*!
<Class
	Name               = "DiagnosticStationHandlerBase"
	Revision           = "1.0"
	GUID               = "{81215D6B-122A-46B8-8508-9326C74FDED5}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "true"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(930,240)"
	Comment            = "This class login at the DiagnosticBase class. It calls every station, which is logged in at this class.">
	<Channels>
		<Server Name="sFuctionname" GUID="{7402A02B-220C-431F-9EE2-F99A281C9FB8}" Class="StringInternal" Visualized="false" Initialize="true" WriteProtected="false" Retentive="false" Comment="Name of the function."/>
		<Server Name="sStatus" GUID="{F912700A-459F-4D3C-99E9-2040422240F9}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false" Comment="Shows the actual state of the function."/>
		<Client Name="cDiagnostic" Required="true" Internal="false" Comment="Object channel to DiagnosticBase."/>
		<Client Name="cFileSys" Required="false" Internal="false" Comment="Object channel to _FileSys. Does not have to be connected."/>
		<Client Name="cSigCLib" Required="false" Internal="false" Comment="Object channel to SigCLib. Does not have to be connected."/>
		<Client Name="FunctionName" Required="true" Internal="true"/>
	</Channels>
	<RevDoku>
		<Owner Company="Sigmatek"/>
		<Dokumentation Revision="1.0" Date="2016-06-02" Author="H�tAnt" Company="Sigmatek" Description="Creation"/>
	</RevDoku>
	<Network Name="DiagnosticStationHandlerBase">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name       = "FunctionName"
				GUID       = "{455F930D-3CC7-4654-A904-7F98F4BA6070}"
				Class      = "String"
				Position   = "(180,300)"
				Visualized = "true"
				Remotely   = "true">
				<Channels>
					<Server Name="Data"/>
					<Client Name="SingleRealloc" Value="1"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="this.FunctionName" Destination="FunctionName.Data"/>
			<Connection Source="this.sFuctionname" Destination="FunctionName.Data" Vertices="(908,270),(736,390),"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
DiagnosticStationHandlerBase : CLASS
	TYPE
	  _ssw_DSHB :
	  (
	    DSHB_WaitForTrigger,
	    DSHB_CheckInstalledStation,
	    DSHB_CheckNextStation,
	    DSHB_CreateStationFolder,
	    DSHB_CallNextStation,
	    DSHB_WaitForResponse
	  )$UDINT;
	  _StationName : ARRAY [0..DiagnosticStationHandlerBase_MaxNameLength-1] OF CHAR;
#pragma pack(push, 1)
	  _StationListEntry : STRUCT
	    name : _StationName;
	    pThis : pVoid;
	    pFct_StartAction : pVoid;
	    pFct_GetState : pVoid;
	  END_STRUCT;
#pragma pack(pop)
#pragma pack(push, 1)
	  _StationList : STRUCT
	    nr : UDINT;
	    Entry : ARRAY [0..DiagnosticStationHandlerBase_MaxStationNr-1] OF _StationListEntry;
	  END_STRUCT;
#pragma pack(pop)
	END_TYPE
  //Servers:
	sStatus 	: SvrChCmd_iprStates;
	sFuctionname 	: SvrChCmd_UDINT;
  //Clients:
	cDiagnostic 	: CltChCmd_DiagnosticBase;
	cSigCLib 	: CltChCmd_SigCLib;
	FunctionName 	: CltChCmd_String;
	cFileSys 	: CltChCmd__FileSys;
  //Variables:
		InstalledStations 	: _StationList;			//! <Variable Comment="List with all stations which are logged in." Name="InstalledStations"/>
		ssw 	: _ssw_DSHB;
		ActualStationIndex 	: UDINT;
		NameOfFunction 	: _DiagString;
		DrivePathFunction 	: _DiagString;
		TmpDP 	: _DiagString;
		Fault 	: _DiagErrorCode;
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL Init;
	
	FUNCTION VIRTUAL GLOBAL Background
		VAR_INPUT
			EAX 	: UDINT;
		END_VAR
		VAR_OUTPUT
			state (EAX) 	: UDINT;
		END_VAR;
				//! <Function Comment="This method is called when the diagnostic export starts." Name="StartAction"/>
	FUNCTION VIRTUAL GLOBAL StartAction
		VAR_INPUT
			pDP 	: ^CHAR;			//! <Variable Comment="Path of the function. (for example: C:\Diagnostic\MyFunction)" Name="StartAction.pDP"/>
		END_VAR
		VAR_OUTPUT
			retcode 	: DINT;			//! <Variable Comment="0..Error&#13;&#10;1..Ok" Name="StartAction.retcode"/>
		END_VAR;
				//! <Function Comment="This method returns the actual state of the function." Name="GetWorkState"/>
	FUNCTION VIRTUAL GLOBAL GetWorkState
		VAR_OUTPUT
			retcode 	: iprStates;			//! <Variable Comment="Actual state." Name="GetWorkState.retcode"/>
		END_VAR;
				//! <Function Comment="Use this method to login stations at this class." Name="InstallStation"/>
	FUNCTION VIRTUAL GLOBAL InstallStation
		VAR_INPUT
			pName 	: ^CHAR;			//! <Variable Comment="Pointer to the name of the station." Name="InstallStation.pName"/>
			pThis 	: pVoid;			//! <Variable Comment="This pointer of the station object." Name="InstallStation.pThis"/>
			pFct_StartAction 	: pVoid;			//! <Variable Comment="The method of the station which will be called when the diagnostic export starts." Name="InstallStation.pFct_StartAction"/>
			pFct_GetState 	: pVoid;			//! <Variable Comment="Mehod which returns the actual state of the station." Name="InstallStation.pFct_GetState"/>
		END_VAR
		VAR_OUTPUT
			dRetcode 	: DINT;			//! <Variable Comment="-1..max. number of added stations reached.&#13;&#10;1..Ok, station added." Name="InstallStation.dRetcode"/>
		END_VAR;
				//! <Function Comment="Get the name of the function." Name="GetFunktionName"/>
	FUNCTION VIRTUAL GetFunktionName
		VAR_OUTPUT
			pName 	: ^CHAR;			//! <Variable Comment="Pointer to the function name." Name="GetFunktionName.pName"/>
		END_VAR;
				//! <Function Comment="Calls the method SetError from the class DiagnosticBase, with your station name, your error number and your error code." Name="SetError"/>
	FUNCTION GLOBAL SetError
		VAR_INPUT
			pStationName 	: ^CHAR;			//! <Variable Comment="Pointer to the name of the station." Name="SetError.pStationName"/>
			ErrorNr 	: DINT;			//! <Variable Comment="Error number." Name="SetError.ErrorNr"/>
			ErrorCode 	: DINT;			//! <Variable Comment="Error code." Name="SetError.ErrorCode"/>
		END_VAR;
				//! <Function Comment="Use this mehod to make an entry at the diagnostic log file." Name="LogFunction"/>
	FUNCTION GLOBAL LogFunction
		VAR_INPUT
			pStationName 	: ^CHAR;			//! <Variable Comment="Name of the station." Name="LogFunction.pStationName"/>
			bState 	: BOOL;			//! <Variable Comment="TRUE..Function finished&#13;&#10;FALSE..Error" Name="LogFunction.bState"/>
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

#pragma using String
#pragma usingLtd _FileSys
#pragma usingLtd DiagnosticBase
#pragma usingLtd SigCLib


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB DiagnosticStationHandlerBase::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_DIAGNOSTICSTATIONHANDLERBASE
1$UINT, 0$UINT, (SIZEOF(::DiagnosticStationHandlerBase))$UINT, 
2$UINT, 4$UINT, 0$UINT, 
TO_UDINT(3493223079), "DiagnosticStationHandlerBase", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::DiagnosticStationHandlerBase.sStatus.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(3043700589), "sStatus", 
(::DiagnosticStationHandlerBase.sFuctionname.pMeth)$UINT, _CH_SVR_OBJ$UINT, 2#0000000001000000$UINT, TO_UDINT(3861852248), "sFuctionname", 
//Clients:
(::DiagnosticStationHandlerBase.cDiagnostic.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(910439362), "cDiagnostic", TO_UDINT(2315852333), "DiagnosticBase", 1$UINT, 5$UINT, 
(::DiagnosticStationHandlerBase.cSigCLib.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000000$UINT, TO_UDINT(1539399991), "cSigCLib", TO_UDINT(77440046), "SigCLib", 0$UINT, 14$UINT, 
(::DiagnosticStationHandlerBase.FunctionName.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(2597220961), "FunctionName", TO_UDINT(1850111279), "String", 1$UINT, 10$UINT, 
(::DiagnosticStationHandlerBase.cFileSys.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000000$UINT, TO_UDINT(194275965), "cFileSys", TO_UDINT(545279513), "_FileSys", 1$UINT, 18$UINT, 
END_FUNCTION


#define USER_CNT_DiagnosticStationHandlerBase 5

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_DiagnosticStationHandlerBase] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION DiagnosticStationHandlerBase::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_DiagnosticStationHandlerBase, pCmd := #vmt.CmdTable);
	vmt.CmdTable.Init		:= #Init();
#pragma warning (disable : 74)
	vmt.UserFcts[0]		:= #Background();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[1]		:= #StartAction();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[2]		:= #GetWorkState();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[3]		:= #InstallStation();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[4]		:= #GetFunktionName();

#pragma warning (default : 74)
	sStatus.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF sStatus.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	_memcpy((#vmt.CmdTable)$^USINT, sFuctionname.pMeth, SIZEOF(CMDMETH));
	vmt.CmdTable.nCmds		:= nSTDCMD;
	vmt.CmdTable.Write		:= #sFuctionname::M_WR_DIRECT();
	sFuctionname.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF sFuctionname.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION
// ********************************************************************
// Prototype of StartAction Methode
// ********************************************************************
// ********************************************************************
FUNCTION GLOBAL PT_STARTACTION_FNC_DiagnosticStationHandlerBase
	VAR_INPUT
		pthis 	: ^void;
    pDP     : ^char;
	END_VAR
  var_output
    retcode : dint;
  end_var
  
  retcode := pthis$^DiagnosticStationHandlerBase^.StartAction(pDP);
  
END_FUNCTION

FUNCTION VIRTUAL GLOBAL DiagnosticStationHandlerBase::StartAction
	VAR_INPUT
		pDP 	: ^CHAR;
	END_VAR
	VAR_OUTPUT
		retcode 	: DINT;
	END_VAR
  
  retcode := 0;
  if InstalledStations.nr > 0 & ssw = DSHB_WaitForTrigger then
    retcode := 1;
    cSigCLib.StrCpy(dst0:=#DrivePathFunction[0], src0:=pDP);
    sStatus := BUSY;
    ssw := DSHB_CheckInstalledStation;
  end_if;
  

END_FUNCTION

// ********************************************************************
// Prototype of GetWorkState Methode
// ********************************************************************
// ********************************************************************
FUNCTION GLOBAL PT_GETSTATE_FNC_DiagnosticStationHandlerBase
	VAR_INPUT
		pthis 	: ^void;
	END_VAR
  var_output
    retcode : iprStates;
  end_var

  retcode := pthis$^DiagnosticStationHandlerBase^.GetWorkState();
  
END_FUNCTION

FUNCTION VIRTUAL GLOBAL DiagnosticStationHandlerBase::GetWorkState
	VAR_OUTPUT
		retcode 	: iprStates;
	END_VAR
  
  retcode := sStatus;

END_FUNCTION


FUNCTION VIRTUAL GLOBAL DiagnosticStationHandlerBase::Init

  if _FirstScan then
    // Installiert die Funktion bei der Diagnose , damit diese im Falle eines Exports aufgerufen wird.
    cDiagnostic.InstallFunction(pName:=GetFunktionName(), 
                                pThis:=this, 
                                pFct_StartAction:=#PT_STARTACTION_FNC_DiagnosticStationHandlerBase(), 
                                pFct_GetState:=#PT_GETSTATE_FNC_DiagnosticStationHandlerBase());
                                
  end_if;
  
END_FUNCTION


FUNCTION VIRTUAL GLOBAL DiagnosticStationHandlerBase::Background
	VAR_INPUT
		EAX 	: UDINT;
	END_VAR
	VAR_OUTPUT
		state (EAX) 	: UDINT;
	END_VAR
  VAR
  	retStart : dint;
    retStatus: iprStates ;
    tmpRetcode : dint;
  END_VAR

  
  case ssw of
    
    DSHB_WaitForTrigger: // Wait for Trigger to start Export
        
    
    DSHB_CheckInstalledStation : // Pr�fen ob sich jemand angemeldet hat.
        if InstalledStations.nr > 0 then
          ActualStationIndex := 0;
          ssw := DSHB_CheckNextStation;
        else
          // Fertig.
          ssw := DSHB_WaitForTrigger;
          sStatus := Ready;
        end_if;
        
    DSHB_CheckNextStation : // Pr�fen ob wir fertig sind , sonst weiter mit der n�chsten Funktion
        if ActualStationIndex <= (InstalledStations.nr-1) then
          ssw := DSHB_CreateStationFolder;
        else
          // Fertig , alle Funktionen durch.
          ssw := DSHB_WaitForTrigger;
          sStatus := Ready;
        end_if;
        
     DSHB_CreateStationFolder:
        cSigCLib.StrCpy(dst0:=#TmpDP[0], src0:=#DrivePathFunction[0]);
        cSigCLib.StrCat(ps1:=#TmpDP[0], ps2:=#InstalledStations.Entry[ActualStationIndex].name[0]);

        tmpRetcode := cFileSys.CreateDirectory(dirname:=#TmpDP[0]);

        cSigCLib.StrCat(ps1:=#TmpDP[0], ps2:="\");

        case tmpRetcode of
          RTF_NO_ERROR,
          RTF_FILE_EXISTS : ssw := DSHB_CallNextStation;
        else
          // fehler ausgeben.
          ActualStationIndex +=1;
          ssw := DSHB_CheckNextStation;
        end_case;
     
    DSHB_CallNextStation : // Aufruf der einzelnen Station , diese f�hrt die Aktion aus.
        retStart := InstalledStations.Entry[ActualStationIndex].pFct_StartAction$PT_STARTACTION_FNC_DiagnosticStationHandlerBase(InstalledStations.Entry[ActualStationIndex].pThis,#TmpDP[0]);
        if retStart > 0 then 
          // Funktion wurde gestartet
          ssw := DSHB_WaitForResponse;
        else
          // Fehlermeldung ausgeben + weiter zur n�chsten Station
          ActualStationIndex +=1;
          ssw := DSHB_CheckNextStation;
        end_if;
    
    DSHB_WaitForResponse : // Pr�fen wann Funktion fertig ist.
        retStatus :=  InstalledStations.Entry[ActualStationIndex].pFct_GetState$PT_GETSTATE_FNC_DiagnosticStationHandlerBase(InstalledStations.Entry[ActualStationIndex].pThis);
        case retStatus of
          iprStates::READY : // Funktion wurde erfolgreich beendet. weiter mit n�chster Funktion.
                             ActualStationIndex +=1;
                             ssw := DSHB_CheckNextStation;
          
          iprStates::ERROR : // Es ist ein Fehler aufgetreten , ErrorCode holen und weiter mit n�chster Funktion.
                             ActualStationIndex +=1;
                             ssw := DSHB_CheckNextStation;
          
          iprStates::BUSY  : // noch besch�figt , nichts machen.
        else
          // Es ist ein Fehler aufgetreten , ErrorCode holen und weiter mit n�chster Funktion.
          ActualStationIndex +=1;
          ssw := DSHB_CheckNextStation;
        end_case;

  
  
  end_case;


	state := READY;

END_FUNCTION

FUNCTION VIRTUAL GLOBAL DiagnosticStationHandlerBase::InstallStation
	VAR_INPUT
		pName 	: ^CHAR;
		pThis 	: pVoid;
		pFct_StartAction 	: pVoid;
		pFct_GetState 	: pVoid;
	END_VAR
	VAR_OUTPUT
		dRetcode 	: DINT;
	END_VAR
  
  // Maximale Anzahl an Funktionen erreicht.
  dRetcode := -1; 
    
  // Kontrolle der Maximalen Anzahl an Funktionen
  if InstalledStations.nr < DiagnosticStationHandlerBase_MaxStationNr then
    
    // Daten der Funktion eintragen.
    cSigCLib.StrNCpy(dst0:=#InstalledStations.Entry[InstalledStations.nr].name[0], src0:=pName, count:=DiagnosticStationHandlerBase_MaxNameLength);
    InstalledStations.Entry[InstalledStations.nr].pThis := pThis ;
    InstalledStations.Entry[InstalledStations.nr].pFct_StartAction  := pFct_StartAction ;
    InstalledStations.Entry[InstalledStations.nr].pFct_GetState     := pFct_GetState ;
    
    // Anzahl der Installierten Empf�nger erh�hen.
    InstalledStations.nr +=1;
    // Funktion erfolgreich installiert.
    dRetcode := 1;
    
  end_if;
  
END_FUNCTION


FUNCTION VIRTUAL DiagnosticStationHandlerBase::GetFunktionName
	VAR_OUTPUT
		pName 	: ^CHAR;
	END_VAR
  

  FunctionName.ReadDataOff(udOff:=0, pData:=#NameOfFunction[0], udMax:=sizeof(NameOfFunction));
  pName := #NameOfFunction[0];

END_FUNCTION


FUNCTION GLOBAL DiagnosticStationHandlerBase::SetError
	VAR_INPUT
		pStationName 	: ^CHAR;
		ErrorNr 	: DINT;
		ErrorCode 	: DINT;
	END_VAR
  
  cDiagnostic.SetError(pFunctionName:=GetFunktionName(), pStationName, ErrorNr, ErrorCode);
  
END_FUNCTION


FUNCTION GLOBAL DiagnosticStationHandlerBase::LogFunction
	VAR_INPUT
		pStationName 	: ^CHAR;
		bState 	: BOOL;
	END_VAR

  if pStationName = NIL then
    return;
  end_if;

  cDiagnostic.LogFunction(GetFunktionName(), pStationName, bState);

END_FUNCTION

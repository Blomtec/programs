//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "ProjectInfo_User"
	Revision           = "1.1"
	GUID               = "{A1441CF2-8102-432D-8F6D-18511CBBAFAC}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(420,120)"
	Comment            = "This class writes the received project information into a file.">
	<Channels>
		<Client Name="cFileSys" Required="false" Internal="false" Comment="Object channel to _FileSys. Does not have to be connected."/>
	</Channels>
	<RevDoku>
		<Owner Company="Sigmatek"/>
		<Dokumentation Revision="1.1" Date="2016-06-15" Author="HasHan" Company="Sigmatek" Description="removed some warnings"/>
		<Dokumentation Revision="1.0" Date="2016-04-25" Author="GreJoh" Company="Sigmatek" Description="Creation"/>
	</RevDoku>
	<Network Name="ProjectInfo_User">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name       = "_base"
				GUID       = "{8252D454-0127-40F3-ADAD-C5346A5346C2}"
				Class      = "DiagnosticUserFunction"
				Position   = "(218,120)"
				Visualized = "false">
				<Channels>
					<Server Name="sStatus"/>
					<Client Name="cSigCLib"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="this.sStatus" Destination="_base.sStatus" Vertices="(690,210),(518,210),"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
#pragma using DiagnosticUserFunction

ProjectInfo_User : CLASS
: DiagnosticUserFunction
	TYPE
	  t_e_ProjectInfoSteps :
	  (
	    _IDLE,
	    _CREATE_FILE,
	    _OPEN_FILE,
	    _BUILD_STRING,
	    _WRITE_STRING,
	    _WRITE_DATA,
	    _CHECK_STATE_FIRST,
	    _CLOSE_FILE,
	    _CHECK_STATE_SEC,
	    _FINISHED,
	    _ERROR
	  )$UDINT;
	END_TYPE
  //Servers:
  //Clients:
	cFileSys 	: CltChCmd__FileSys;
  //Variables:
		ssw_prjInfo 	: t_e_ProjectInfoSteps;
		DrivePath 	: _DiagString;			//! <Variable Comment="Path where the file with the project information will be created." Name="DrivePath"/>
		ProjectInfo 	: _Diag_ProjectInfo;			//! <Variable Comment="Struct with the project information." Name="ProjectInfo"/>
		dIdentification 	: DINT;
		dRetID 	: DINT;
		ssw_NextStep 	: t_e_ProjectInfoSteps;
		dHandle 	: DINT;
		dWriteHandle 	: DINT;
		dWrittenBytes 	: DINT;			//! <Variable Comment="Number of the written bytes." Name="dWrittenBytes"/>
		udDataSize 	: UDINT;			//! <Variable Comment="Size of the received data." Name="udDataSize"/>
		pHandleAddress 	: ^DINT;
		udLength 	: UDINT;
		arrDataString : ARRAY [0..Diagnostic_MAX_FileFolderString] OF CHAR;
			//! <Variable Comment="String with the data which will be written to the file." Name="arrDataString"/>
		arrHelpString : ARRAY [0..Diagnostic_MAX_FileFolderString] OF CHAR;

		dActArrayNumber 	: DINT;
  //Functions:
				//! <Function Comment="Use this method to set the drive path." Name="SetDrivePath"/>
	FUNCTION VIRTUAL GLOBAL SetDrivePath
		VAR_INPUT
			pDP 	: ^CHAR;			//! <Variable Comment="Pointer to the data with the drive path." Name="SetDrivePath.pDP"/>
		END_VAR;
				//! <Function Comment="Receive data." Name="ReceivedData"/>
	FUNCTION VIRTUAL GLOBAL ReceivedData
		VAR_INPUT
			size 	: UDINT;			//! <Variable Comment="Size of the received data." Name="ReceivedData.size"/>
			pdata 	: ^USINT;			//! <Variable Comment="Pointer to the received data." Name="ReceivedData.pdata"/>
			OptCMD 	: USINT;			//! <Variable Comment="Optional command." Name="ReceivedData.OptCMD"/>
		END_VAR
		VAR_OUTPUT
			retcode 	: BOOL;			//! <Variable Comment="FALSE..Error&#13;&#10;TRUE..Data received" Name="ReceivedData.retcode"/>
		END_VAR;
				//! <Function Comment="This method creates the file for the project infos and writes the data to the file." Name="WorkMethode"/>
	FUNCTION VIRTUAL GLOBAL WorkMethode;
				//! <Function Comment="Get the actual state." Name="GetWorkState"/>
	FUNCTION VIRTUAL GLOBAL GetWorkState
		VAR_OUTPUT
			retcode 	: iprStates;			//! <Variable Comment="Actual state." Name="GetWorkState.retcode"/>
		END_VAR;
				//! <Function Comment="Get error code." Name="GetErrorCode"/>
	FUNCTION VIRTUAL GLOBAL GetErrorCode
		VAR_OUTPUT
			retcode 	: _DiagErrorCode;			//! <Variable Comment="Error code." Name="GetErrorCode.retcode"/>
		END_VAR;
				//! <Function Comment="Method to set the parameters for the GetAsyncState method." Name="SetAsyncParam"/>
	FUNCTION SetAsyncParam
		VAR_INPUT
			pHandleAddr 	: ^DINT;			//! <Variable Comment="Pointer which is used for the input variable Erg of the method GetAsyncState." Name="SetAsyncParam.pHandleAddr"/>
			dID 	: DINT;			//! <Variable Comment="Variable which is used for the input variable ID of the method GetAsyncState." Name="SetAsyncParam.dID"/>
		END_VAR;
				//! <Function Comment="Add carriage return to the input string." Name="AddCarriageReturnLineFeed"/>
	FUNCTION AddCarriageReturnLineFeed
		VAR_INPUT
			Destination 	: ^CHAR;			//! <Variable Comment="Pointer to the string where the carriage return and the line feed should be added." Name="AddCarriageReturnLineFeed.Destination"/>
		END_VAR
		VAR_OUTPUT
			Retcode 	: DINT;			//! <Variable Comment="0..OK&#13;&#10;-1..Input pointer was NIL" Name="AddCarriageReturnLineFeed.Retcode"/>
		END_VAR;
				//! <Function Comment="Build string with the project name, project checksum and the amount of the classes." Name="BuildString"/>
	FUNCTION BuildString
		VAR_OUTPUT
			Retcode 	: DINT;
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

#pragma usingLtd _FileSys


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB ProjectInfo_User::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_PROJECTINFO_USER
1$UINT, 1$UINT, (SIZEOF(::ProjectInfo_User))$UINT, 
0$UINT, 1$UINT, 0$UINT, 
TO_UDINT(1919277734), "ProjectInfo_User", //Class
TO_UDINT(487743715), "DiagnosticUserFunction", 1$UINT, 0$UINT, //Baseclass
//Servers:
//Clients:
(::ProjectInfo_User.cFileSys.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000000$UINT, TO_UDINT(194275965), "cFileSys", TO_UDINT(545279513), "_FileSys", 1$UINT, 18$UINT, 
END_FUNCTION


#define USER_CNT_ProjectInfo_User 6

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_ProjectInfo_User] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION ProjectInfo_User::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
		nCmdSize	: UINT;
	END_VAR

	ret_code	:= DiagnosticUserFunction::@STD();
	IF ret_code <> C_OK THEN
		RETURN;
	END_IF;
	nCmdSize		:= DiagnosticUserFunction::sStatus.pMeth^.nCmds$UINT*SIZEOF(pVoid) + CMDMETH.Init;

	_memcpy((#vmt.CmdTable)$^USINT, DiagnosticUserFunction::sStatus.pMeth, nCmdSize);
	vmt.CmdTable.nCmds		:= nSTDCMD + USER_CNT_ProjectInfo_User;
#pragma warning (disable : 74)
	vmt.UserFcts[0]		:= #SetDrivePath();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[1]		:= #ReceivedData();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[2]		:= #WorkMethode();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[3]		:= #GetWorkState();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[4]		:= #GetErrorCode();

#pragma warning (default : 74)
	DiagnosticUserFunction::sStatus.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF DiagnosticUserFunction::sStatus.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION


FUNCTION VIRTUAL GLOBAL ProjectInfo_User::SetDrivePath
	VAR_INPUT
		pDP 	: ^CHAR;
	END_VAR

  cSigCLib.StrCpy(dst0:=#DrivePath[0], src0:=pDP);

END_FUNCTION


FUNCTION VIRTUAL GLOBAL ProjectInfo_User::ReceivedData
	VAR_INPUT
		size 	: UDINT;
		pdata 	: ^USINT;
		OptCMD 	: USINT;
	END_VAR
	VAR_OUTPUT
		retcode 	: BOOL;
	END_VAR
  
  retcode := FALSE;
  
  if ssw_prjInfo = _IDLE then
  
    if pdata <> 0  & size = sizeof(ProjectInfo) then
      
      // copy the received project info to a local variable
      _memcpy(ptr1:=#ProjectInfo, ptr2:=pdata, cntr:=size);
      retcode := TRUE;
      // set next step
      ssw_prjInfo := _CREATE_FILE;
      udDataSize := size;
      sStatus := Busy;
      
    end_if;
    
  end_if;

END_FUNCTION


FUNCTION VIRTUAL GLOBAL ProjectInfo_User::WorkMethode


  case ssw_prjInfo of

    // Idle
    //**********************************************************************    
    _IDLE : // Wait for Start Aktion (  RecivedData )


    // Create File
    //**********************************************************************    
    _CREATE_FILE :  

        cSigCLib.StrCat(ps1:=#DrivePath[0], ps2:=Diagnostic_ProjectInfoName);             
        dRetID := cFileSys.FileCreate_A(Async:=1, dpne:=#DrivePath[0], size:=100, fill:=0, att:=ATT_CREATE_ALWAYS); 
        ssw_NextStep := _OPEN_FILE;
        SetAsyncParam(pHandleAddr:=#dHandle, dId:=dRetID);
        ssw_prjInfo := _CHECK_STATE_SEC;

    // Open File
    //**********************************************************************    
    _OPEN_FILE :
    
        dRetID := cFileSys.FileOpen_A(Async:=1, filename:=#DrivePath[0], attributes:=ATT_READ_WRITE);
        dWriteHandle := dRetID;
        ssw_NextStep := _BUILD_STRING;
        SetAsyncParam(pHandleAddr:=#dHandle, dId:=dRetID);
        ssw_prjInfo := _CHECK_STATE_SEC;
        
    // Build string
    //**********************************************************************    
    _BUILD_STRING :
    
        dRetID := BuildString();
        
        if dRetID <> 0 then
          ssw_prjInfo := _ERROR;
          return;
        end_if;
        
        ssw_prjInfo := _WRITE_STRING;

    // Write string to the file
    //********************************************************************** 
    _WRITE_STRING :
    
        udLength := cSigCLib.StrLen(str:=#arrDataString[0]);
        dRetID := cFileSys.FileWrite_AV1(Async:=1, handle:=dWriteHandle, buffer:=#arrDataString[0], length:=udLength);
        ssw_NextStep := _WRITE_DATA;
        SetAsyncParam(pHandleAddr:=#dWrittenBytes, dId:=dRetID);
        ssw_prjInfo := _CHECK_STATE_SEC;
        dActArrayNumber := 0;

    // Write class name, class revision and class crc to the file
    //********************************************************************** 
    _WRITE_DATA :
    
      // Write infos to the file for each class in the project (for example: "_AlarmX0Para;0.7;AD1546AD")
      if dActArrayNumber < ProjectInfo.ClassAmount then
      
        arrDataString[0] := 0;
        // Write the class name to the file
        cSigCLib.StrCpy(dst0:=#arrDataString[0], src0:=#ProjectInfo.ClsVersCRC[dActArrayNumber].ClsName[0]);
        // Add ";"
        cSigCLib.StrCat(ps1:=#arrDataString[0], ps2:=";");
        // Write the class revision to the file
        cSigCLib.StrCat(ps1:=#arrDataString[0], ps2:=#ProjectInfo.ClsVersCRC[dActArrayNumber].ClsRevision[0]);
        // Add ";"
        cSigCLib.StrCat(ps1:=#arrDataString[0], ps2:=";");
        // Write the class CRC to the file
        cSigCLib.IToA(val:=ProjectInfo.ClsVersCRC[dActArrayNumber].ClsCRC$DINT, dst:=#arrHelpString[0], base:=16); 
        cSigCLib.StrCat(ps1:=#arrDataString[0], ps2:=#arrHelpString[0]);        
        // Add carriage return, to write the next class infos into a new line
        AddCarriageReturnLineFeed(Destination:=#arrDataString[0]);
        udLength := cSigCLib.StrLen(str:=#arrDataString[0]);
        dIdentification := cFileSys.FileWrite_AV1(Async:=1, handle:=dWriteHandle, buffer:=#arrDataString[0], length:=udLength);        
        dActArrayNumber += 1;
        ssw_prjInfo := _CHECK_STATE_FIRST;
        
      else
        
        ssw_prjInfo := _CLOSE_FILE;
        
      end_if;

    // Check asynchronous state
    //**********************************************************************    
    _CHECK_STATE_FIRST :
      
        dRetID := cFileSys.GetAsyncState(ID:=to_udint(dIdentification), Erg:=#dWrittenBytes);
        
        case dRetID of
          
          RT_INVALID_ID,
          RT_ERG_DELETED:
          
            Fault.ErrorNr := 5;
            Fault.ErrorCode := -1;
            ssw_prjInfo := _ERROR;
          
          0:      

            if dWrittenBytes <> to_dint(udLength) then
              Fault.ErrorNr := 5;
              Fault.ErrorCode := -2;
              ssw_prjInfo := _ERROR;
            else
              ssw_prjInfo := _WRITE_DATA;              
            end_if;

        end_case;

        dWriteHandle := dHandle;
        
    // Close File
    //**********************************************************************    
    _CLOSE_FILE : 

        dRetID := cFileSys.FileClose_A(Async:=1, handle:=dHandle);
        ssw_NextStep := _FINISHED;
        SetAsyncParam(pHandleAddr:=#dHandle, dId:=dRetID);
        ssw_prjInfo := _CHECK_STATE_SEC;

    // Check asynchronous state
    //**********************************************************************    
    _CHECK_STATE_SEC :

        dRetID := cFileSys.GetAsyncState(ID:=to_udint(dIdentification), Erg:=pHandleAddress);
        case dRetID of
          
          RT_INVALID_ID,
          RT_ERG_DELETED:
            
            Fault.ErrorNr := ssw_prjInfo$DINT;
            Fault.ErrorCode := -1;
            
            ssw_prjInfo := _ERROR;
          
          0:      

            ssw_prjInfo := ssw_NextStep;
            
            if ssw_NextStep = _WRITE_DATA then
              
              if dWrittenBytes <> to_dint(udLength) then
                
                Fault.ErrorNr := ssw_prjInfo$DINT;
                Fault.ErrorCode := -2;
                ssw_prjInfo := _ERROR;

              end_if;
              
            end_if;


        end_case;

        dWriteHandle := dHandle;

    // Finished
    //**********************************************************************           
    _FINISHED : 
    
        sStatus := READY;
        ssw_prjInfo := _IDLE;
        
        
    // Error
    //**********************************************************************    
    _ERROR :
    
      sStatus := ERROR;
      ssw_prjInfo := _IDLE;
      
  
  end_case;

END_FUNCTION


FUNCTION ProjectInfo_User::SetAsyncParam
	VAR_INPUT
		pHandleAddr 	: ^DINT;
		dID 	: DINT;
	END_VAR

    pHandleAddress := pHandleAddr;
    dIdentification := dId;
    ssw_prjInfo := _CHECK_STATE_SEC;

END_FUNCTION


FUNCTION ProjectInfo_User::BuildString
	VAR_OUTPUT
		Retcode : DINT;
	END_VAR
  
  arrDataString[0] := 0;
  
  // Add the project name
  cSigCLib.StrCpy(dst0:=#arrDataString[0], src0:="Project name: ");
  cSigCLib.StrCat(ps1:=#arrDataString[0], ps2:=#ProjectInfo.ProjectName[0]);
  Retcode := AddCarriageReturnLineFeed(Destination:=#arrDataString[0]);
  
  if Retcode <> 0 then
    return;
  end_if;

  
  // Add the checksum
  cSigCLib.StrCat(ps1:=#arrDataString[0], ps2:="Project checksum: ");
  cSigCLib.IToA(val:=ProjectInfo.ProjectCRC$DINT, dst:=#arrHelpString[0], base:=16);
  cSigCLib.StrCat(ps1:=#arrDataString[0], ps2:=#arrHelpString[0]);
  Retcode := AddCarriageReturnLineFeed(Destination:=#arrDataString[0]);
  
  if Retcode <> 0 then
    return;
  end_if;
  
  // Add the amount of the classes
  cSigCLib.StrCat(ps1:=#arrDataString[0], ps2:="Classes in project: ");
  cSigCLib.IToA(val:=ProjectInfo.ClassAmount, dst:=#arrHelpString[0], base:=10);
  cSigCLib.StrCat(ps1:=#arrDataString[0], ps2:=#arrHelpString[0]);
  Retcode := AddCarriageReturnLineFeed(Destination:=#arrDataString[0]);
  if Retcode <> 0 then
    return;
  end_if;
  Retcode := AddCarriageReturnLineFeed(Destination:=#arrDataString[0]);
  if Retcode <> 0 then
    return;
  end_if;
  
  cSigCLib.StrCat(ps1:=#arrDataString[0], ps2:="Class name;class revision;checksum");
  Retcode := AddCarriageReturnLineFeed(Destination:=#arrDataString[0]);
  if Retcode <> 0 then
    return;
  end_if;

END_FUNCTION


FUNCTION ProjectInfo_User::AddCarriageReturnLineFeed
	VAR_INPUT
		Destination 	: ^CHAR;
	END_VAR
	VAR_OUTPUT
		Retcode 	: DINT;
	END_VAR
  
  Retcode := 0;
  
  if Destination = NIL then
    Retcode := -1;
    return;
  end_if;

  cSigCLib.StrCat(ps1:=Destination, ps2:="$R");
  cSigCLib.StrCat(ps1:=Destination, ps2:="$L");


END_FUNCTION

FUNCTION VIRTUAL GLOBAL ProjectInfo_User::GetWorkState
	VAR_OUTPUT
		retcode 	: iprStates;
	END_VAR

  retcode := sStatus;

END_FUNCTION


FUNCTION VIRTUAL GLOBAL ProjectInfo_User::GetErrorCode
	VAR_OUTPUT
		retcode 	: _DiagErrorCode;
	END_VAR

  retcode := Fault;

END_FUNCTION

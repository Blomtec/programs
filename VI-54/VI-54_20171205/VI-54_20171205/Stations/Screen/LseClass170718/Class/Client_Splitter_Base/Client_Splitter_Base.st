//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "Client_Splitter_Base"
	Revision           = "1.1"
	GUID               = "{913E6D81-DF21-11D5-B925-0010609208D7}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "true"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	IconPath           = ".\Class\Client_Splitter_Base\Tools.ICO"
	SharedCommandTable = "true"
	Objectsize         = "(284,120)"
	Comment            = "V1.1 Splitter Class with variable Clients (Baseclass)">
	<Channels>
		<Server Name="To_Splitt" GUID="{913E6D82-DF21-11D5-B925-0010609208D7}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false" Comment="splitting value"/>
	</Channels>
	<Dependencies>
		<Files>
			<File Path=".\Source\code\Global_Functions\H_Get_ptr_on_Obj.h" Include="false"/>
			<File Path=".\Source\code\Global_Functions\Get_ptr_on_Obj.st"/>
		</Files>
	</Dependencies>
</Class>
*)
Client_Splitter_Base : CLASS
  //Servers:
	To_Splitt 	: SvrChCmd_DINT;
  //Clients:
  //Variables:
		pCls 	: ^ClsHdr;
  //Functions:
				//! <Function Comment="[#DEUTSCH]&#13;&#10; ******************************************************************&#13;&#10;           Client - Splitter Funktion f�r variable Clients&#13;&#10;     Verteilt die Writefunktion auf die verbundenen Clients auf.&#13;&#10;&#13;&#10;  ACHTUNG : Basisklasse darf keine Clients haben !!&#13;&#10;            Das Konplexe Objegt hingegen darf soviele Clients wie&#13;&#10;            sie es ben�tigen haben.&#13;&#10; ******************************************************************&#13;&#10;      erstellt   :   BS  :  KW 35/01&#13;&#10; ******************************************************************&#13;&#10;                         CONSTRUCTION&#13;&#10; ******************************************************************&#13;&#10;" Name="Client_Splitter_Base"/>
	FUNCTION Client_Splitter_Base
		VAR_OUTPUT
			ret_code 	: ConfStates;
		END_VAR;
				//! <Function Comment=" ******************************************************************&#13;&#10;           Client - Splitter Funktion f�r variable Clients&#13;&#10;     Verteilt die Writefunktion auf die verbundenen Clients auf.&#13;&#10;  ACHTUNG : Basisklasse darf keine Clients haben !!&#13;&#10;            Das Komplexe Objekt hingegen darf soviele Clients haben, wie&#13;&#10;            sie ben�tigen.&#13;&#10; ******************************************************************&#13;&#10;      erstellt   :   BS  :  KW 35/01&#13;&#10; ******************************************************************&#13;&#10;                         WRITE Funktion&#13;&#10; ******************************************************************&#13;&#10; ******************************************************************&#13;&#10;           client splitter function for variable clients&#13;&#10;          splitts the channels and calls the write function&#13;&#10; you have to add somemany Clients as you want.&#13;&#10;  automatically each client will get the same value from the&#13;&#10;  Server.&#13;&#10;  Attention : Baseclass is not allowed to have clients !!&#13;&#10; ******************************************************************&#13;&#10;      created   :   BS  :  KW 35/01&#13;&#10; ******************************************************************&#13;&#10;                   operation of WRITE function&#13;&#10; ******************************************************************&#13;&#10;" Name="To_Splitt.Write"/>
	FUNCTION VIRTUAL GLOBAL To_Splitt::Write
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

//}}LSL_DECLARATION


FUNCTION GLOBAL TAB Client_Splitter_Base::@CT_
0$UINT,
2#0100000000000000$UINT, //TY_CLIENT_SPLITTER_BASE
1$UINT, 1$UINT, (SIZEOF(::Client_Splitter_Base))$UINT, 
1$UINT, 0$UINT, 0$UINT, 
TO_UDINT(1524808134), "Client_Splitter_Base", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::Client_Splitter_Base.To_Splitt.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(1120314414), "To_Splitt", 
//Clients:
END_FUNCTION


#define USER_CNT_Client_Splitter_Base 0

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_Client_Splitter_Base] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION Client_Splitter_Base::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_Client_Splitter_Base, pCmd := #vmt.CmdTable);
	vmt.CmdTable.Write		:= #Write();
	To_Splitt.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF To_Splitt.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	ret_code	:= Client_Splitter_Base();

END_FUNCTION

//{{LSL_IMPLEMENTATION


//*********************Inserted from .\code\C_Client_Splitter.st*********************



 



//[#DEUTSCH]
// ******************************************************************
//           Client - Splitter Funktion f�r variable Clients
//     Verteilt die Writefunktion auf die verbundenen Clients auf.
//
//  ACHTUNG : Basisklasse darf keine Clients haben !!
//            Das Komplexe Objekt hingegen darf soviele Clients haben, wie
//            sie ben�tigen.
// ******************************************************************
//    		erstellt 		: 		BS		:		KW 35/01
// ******************************************************************
//                         WRITE Funktion
// ******************************************************************
//[#ENGLISH]
// ******************************************************************
//           client splitter function for variable clients
//          splitts the channels and calls the write function
//	you have to add somemany Clients as you want.
//  automatically each client will get the same value from the
//  Server.
//
//  Attention : Baseclass is not allowed to have clients !!
// ******************************************************************
//    		created 		: 		BS		:		KW 35/01
// ******************************************************************
//                   operation of WRITE function
// ******************************************************************
FUNCTION VIRTUAL GLOBAL Client_Splitter_Base::To_Splitt::Write
VAR_INPUT
	input		: DINT;
END_VAR
VAR_OUTPUT
	result		: DINT;
END_VAR
VAR
	Ptr			: ^CltCh;
	i			: UINT;
END_VAR;

	To_Splitt := input;

// Pointer auf 1.Client
	Ptr := THIS$^CltCh;

//HaaPet
//before
///	Ptr := (ptr$UDINT + SIZEOF(Client_Splitter_Base) + SIZEOF(SvrCh)*TO_UDINT(pCls^.nSvrChs))$^CltCh;
//after
  Ptr := (ptr$UDINT + SIZEOF(Client_Splitter_Base) + SIZEOF(SvrCh)*TO_UDINT(pCls^.pDsc^.nSvrChs))$^CltCh;
//---------------------------------  

// Daten rausschreiben
//HaaPet
//before
///		IF pCls^.nCltChs THEN
//      FOR i := 1 TO pCls^.pDsc^.nCltChs DO
//after
	IF pCls^.pDsc^.nCltChs THEN
		FOR i := 1 TO pCls^.pDsc^.nCltChs DO
//--------------------------------- 

			WR_VIACHNL(THIS$^SVRCH,TO_UINT(Ptr$UDINT-THIS$UDINT),input);
			ptr^.dData := input;
			Ptr += SIZEOF(CltCh);
		END_FOR;
	END_IF;

// Daten schreiben
	result := Input;
END_FUNCTION //VIRTUAL GLOBAL Client_Splitter::Write
//[#DEUTSCH]
// ******************************************************************
//           Client - Splitter Funktion f�r variable Clients
//     Verteilt die Writefunktion auf die verbundenen Clients auf.
//
//  ACHTUNG : Basisklasse darf keine Clients haben !!
//            Das Konplexe Objegt hingegen darf soviele Clients wie
//            sie es ben�tigen haben.
// ******************************************************************
//    		erstellt 		: 		BS		:		KW 35/01
// ******************************************************************
//                         CONSTRUCTION
// ******************************************************************
FUNCTION  Client_Splitter_Base::Client_Splitter_Base
VAR_OUTPUT
	ret_code		: CONFSTATES;
END_VAR
	
	pCls 	:= Get_ptr_on_Obj(THIS);
	
	ret_code:= C_OK;

END_FUNCTION //  Client_Splitter_Base::Client_Splitter_Base


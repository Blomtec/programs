//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "SCL_GetClassVersion"
	Revision           = "1.1"
	GUID               = "{8CDE2180-E335-4E68-9000-1380E43A306C}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "true"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(424,120)">
	<Channels>
		<Server Name="ClassSvr" GUID="{C93B727B-A387-4F3C-A797-279033D39BC7}" Visualized="false" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Client Name="cConvert" Required="true" Internal="false"/>
	</Channels>
	<Dependencies>
		<Files>
			<File Path=".\Class\SCL_GetClassVersion\SCL GetClassVersion.pdf"/>
		</Files>
	</Dependencies>
	<RevDoku>
		<Owner Company="Sigmatek" Author="h�tant"/>
		<Dokumentation Revision="1.1" Date="2013-06-05" Author="spimar" Company="Sigmatek" Description="Added documentation and comments for library compatibility"/>
		<Dokumentation Revision="1.0" Date="2011-05-19" Author="h�tant" Company="Sigmatek" Description="Creation"/>
	</RevDoku>
</Class>
*)
SCL_GetClassVersion : CLASS
	TYPE
	  _CR_ClassNameTxt : ARRAY [0..299] OF CHAR;
#pragma pack(push, 1)
	  _CR_OneEntry : STRUCT  //! <Type Public="true" Name="_CR_OneEntry"/>
	    ClassName : _CR_ClassNameTxt;
	    RevisionHigh : DINT;
	    RevisionLow : DINT;
	    RevisionTxt : ARRAY [0..9] OF CHAR;
	  END_STRUCT;
#pragma pack(pop)
	END_TYPE
  //Servers:
	ClassSvr 	: SvrChCmd_DINT;
  //Clients:
	cConvert 	: CltChCmd_ASCII_BIN;
  //Variables:
  //Functions:
	
	FUNCTION GLOBAL GetRevisionOfClass
		VAR_INPUT
			ThisPointer 	: ^void;
			pChar 	: ^CHAR;
		END_VAR;
	
	FUNCTION GLOBAL GetAllClassesAndRevisions
		VAR_INPUT
			pData 	: ^_CR_OneEntry;
		END_VAR
		VAR_OUTPUT
			retcode 	: DINT;
		END_VAR;
	
	FUNCTION GLOBAL GetNrOfEntries
		VAR_OUTPUT
			Entries 	: DINT;
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

#pragma usingLtd ASCII_BIN


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB SCL_GetClassVersion::@CT_
0$UINT,
2#0100000000000000$UINT, //TY_SCL_GETCLASSVERSION
1$UINT, 1$UINT, (SIZEOF(::SCL_GetClassVersion))$UINT, 
1$UINT, 1$UINT, 0$UINT, 
TO_UDINT(3283476102), "SCL_GetClassVersion", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::SCL_GetClassVersion.ClassSvr.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(619352855), "ClassSvr", 
//Clients:
(::SCL_GetClassVersion.cConvert.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(3533872764), "cConvert", TO_UDINT(2897291062), "ASCII_BIN", 1$UINT, 20$UINT, 
END_FUNCTION


#define USER_CNT_SCL_GetClassVersion 0

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_SCL_GetClassVersion] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION SCL_GetClassVersion::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_SCL_GetClassVersion, pCmd := #vmt.CmdTable);
	vmt.CmdTable.Write		:= #M_WR_DIRECT();
	ClassSvr.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF ClassSvr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION

VAR_External
	pFirstCls           : ^ClsHdr;		// pointer to the first ClassHdr
END_VAR

#pragma warning(disable:137 )


FUNCTION GLOBAL SCL_GetClassVersion::GetRevisionOfClass
	VAR_INPUT
		ThisPointer 	: ^void;
		pChar 	: ^CHAR;
	END_VAR
  VAR
	  p_Obj       : ^Obj;
    p_ClsHdr    : ^ClsHdr;
    txtRevHi    : Array [0..99] of char;
    txtRevLo    : Array [0..99] of char;
  END_VAR

  // initialize the local Arrays
	_memset(dest:=#txtRevHi[0], usByte:=0, cntr:=sizeof(txtRevHi));
  _memset(dest:=#txtRevLo[0], usByte:=0, cntr:=sizeof(txtRevLo));
  
  // Get Objekt info from Loader
  p_Obj		:= LSL_GetHdr(ThisPointer);
  // Set the Class Header
  p_ClsHdr := p_Obj^.pClsHdr;
  
  // Convert Revision High to ASCII
  cConvert.Bin2Ascii(pt:=#txtRevHi[0], value:=p_ClsHdr^.pDsc^.udRev.Hi, format:=16#800);
  // Convert Revision Low to ASCII
  cConvert.Bin2Ascii(pt:=#txtRevlo[0], value:=p_ClsHdr^.pDsc^.udRev.Lo, format:=16#800);
  // copy Revision High to the target string
  _strcpy(dest:=pchar, src:=#txtRevHi[0]);
  // copy a dot to the target string
  _strcat(dest:=pchar, src:=".");
  // copy Revision Low to the target string
  _strcat(dest:=pchar, src:=#txtRevlo[0]);

END_FUNCTION


FUNCTION GLOBAL SCL_GetClassVersion::GetAllClassesAndRevisions
	VAR_INPUT
		pData 	: ^_CR_OneEntry;
	END_VAR
	VAR_OUTPUT
		retcode 	: DINT;
	END_VAR
  VAR
    tmpClsHdr : ^ClsHdr;
    txtRevHi    : Array [0..99] of char;
    txtRevLo    : Array [0..99] of char;
    tmpPtr : ^_CR_OneEntry;
  END_VAR

  retcode := 0;

	tmpPtr := pData;
  
  tmpClsHdr := pFirstCls;
  
  while tmpClsHdr <> NIL do
    // ClassenNamen eintragen
    _strcpy(dest:=#tmpPtr^.className[0]  , src:=#tmpClsHdr^.pDsc^.Name$CLexem.Text[ 0 ]);
    // Revision Bin�r eintragen
    tmpPtr^.RevisionLow := tmpClsHdr^.pDsc^.udRev.Lo;
    tmpPtr^.RevisionHigh := tmpClsHdr^.pDsc^.udRev.Hi;
    // Revision Ascii eintragen
    // Convert Revision High to ASCII
    cConvert.Bin2Ascii(pt:=#txtRevHi[0],  value:=tmpClsHdr^.pDsc^.udRev.Hi, format:=16#800);
    // Convert Revision Low to ASCII
    cConvert.Bin2Ascii(pt:=#txtRevlo[0],  value:=tmpClsHdr^.pDsc^.udRev.Lo, format:=16#800);
    // copy Revision High to the target string
    _strcpy(dest:=#tmpPtr^.RevisionTxt[0], src:=#txtRevHi[0]);
    // copy a dot to the target string
    _strcat(dest:=#tmpPtr^.RevisionTxt[0], src:=".");
    // copy Revision Low to the target string
    _strcat(dest:=#tmpPtr^.RevisionTxt[0], src:=#txtRevLo[0]);
    // n�chste Classe durchsuchen.    
    tmpClsHdr := tmpClsHdr^.pNxtCls;
    // increment for every found Class
    retcode +=1;
    // Zielpointer erh�hen
    tmpPtr += sizeof(_CR_OneEntry);
  end_while;


END_FUNCTION


FUNCTION GLOBAL SCL_GetClassVersion::GetNrOfEntries
	VAR_OUTPUT
		Entries 	: DINT;
	END_VAR
  VAR
    tmpClsHdr : ^ClsHdr;
  END_VAR
  
  // initialize the retcode
  Entries := 0;
  
  // Start with the first Class
  tmpClsHdr := pFirstCls;
  
  // Search as long as we found a next Class
  while tmpClsHdr <> NIL do
    // increase the counter of Classes
    Entries +=1;
    // change the pointer to next Class
    tmpClsHdr := tmpClsHdr^.pNxtCls;
  end_while;

END_FUNCTION

#pragma warning(default:137 )


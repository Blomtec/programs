//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "StringBaseGB"
	Revision           = "0.0"
	GUID               = "{3C34CFD7-7F7C-43EE-AE24-D2C343566DCB}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "true"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(540,120)">
	<Channels>
	</Channels>
	<Network Name="StringBaseGB">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name       = "_base"
				GUID       = "{1558A297-28A1-46A0-B130-4A18B02EF2A7}"
				Class      = "StringBase"
				Position   = "(218,120)"
				Visualized = "true">
				<Channels>
					<Server Name="Command"/>
					<Client Name="ToOsKernal"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="this.Command" Destination="_base.Command" Vertices="(946,210),(774,210),"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
#pragma using StringBase

StringBaseGB : CLASS
: StringBase
  //Servers:
  //Clients:
  //Variables:
  //Functions:
	
	FUNCTION GLOBAL CalculateDigits
		VAR_INPUT
			Value 	: DINT;
		END_VAR
		VAR_OUTPUT
			Size 	: DINT;
		END_VAR;
	
	FUNCTION GLOBAL BuildValue2AsciiGB
		VAR_INPUT
			Value 	: DINT;
			pBaDest 	: ^CHAR;
			Offset 	: DINT;
		END_VAR
		VAR_OUTPUT
			Size 	: DINT;
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

//}}LSL_DECLARATION


FUNCTION GLOBAL TAB StringBaseGB::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_STRINGBASEGB
0$UINT, 0$UINT, (SIZEOF(::StringBaseGB))$UINT, 
0$UINT, 0$UINT, 0$UINT, 
TO_UDINT(624710835), "StringBaseGB", //Class
TO_UDINT(1348707034), "StringBase", 3$UINT, 2$UINT, //Baseclass
//Servers:
//Clients:
END_FUNCTION


#define USER_CNT_StringBaseGB 37

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_StringBaseGB] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION StringBaseGB::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
		nCmdSize	: UINT;
	END_VAR

	ret_code	:= StringBase::@STD();
	IF ret_code <> C_OK THEN
		RETURN;
	END_IF;
	nCmdSize		:= StringBase::Command.pMeth^.nCmds$UINT*SIZEOF(pVoid) + CMDMETH.Init;

	_memcpy((#vmt.CmdTable)$^USINT, StringBase::Command.pMeth, nCmdSize);
	vmt.CmdTable.nCmds		:= nSTDCMD + USER_CNT_StringBaseGB;
	StringBase::Command.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF StringBase::Command.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION
FUNCTION GLOBAL StringBaseGB::CalculateDigits
	VAR_INPUT
		Value 	: DINT;
	END_VAR
	VAR_OUTPUT
		Size 	: DINT;
	END_VAR
  VAR
    ValueAbs : DINT;
  END_VAR

  Size := 1;
  
  if Value < 0 then
    Size += 1;
  end_if;
  
  ValueAbs := abs(Value);
  
  while ValueAbs > 9 do
    Size += 1;
    
    ValueAbs := ValueAbs / 10;
  end_while;

END_FUNCTION


FUNCTION GLOBAL StringBaseGB::BuildValue2AsciiGB
	VAR_INPUT
		Value 	: DINT;
		pBaDest 	: ^CHAR;
		Offset 	: DINT;
	END_VAR
	VAR_OUTPUT
		Size 	: DINT;
	END_VAR
    
  Size := BuildValue2Ascii(Value, CalculateDigits(Value), pBaDest, Offset);

END_FUNCTION
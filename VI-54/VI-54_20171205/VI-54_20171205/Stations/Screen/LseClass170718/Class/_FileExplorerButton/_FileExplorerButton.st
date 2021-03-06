//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "_FileExplorerButton"
	Revision           = "0.4"
	GUID               = "{D204C0E2-C585-482A-A716-F880C39330D5}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "true"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	IconPath           = ".\Class\_FileExplorerButton\FileExplorer.ico"
	SharedCommandTable = "true"
	Objectsize         = "(390,540)"
	Comment            = "Contains basic functionality of fileexplorer and represents buttons to operate.">
	<Channels>
	</Channels>
	<RevDoku>
		<Owner Company="sigmatek" Author="kolott"/>
		<Dokumentation Revision="0.4" Date="2013-04-02" Author="kolott" Company="sigmatek" Description="icon added"/>
		<Dokumentation Revision="0.3" Date="2012-12-20" Author="kolott" Company="sigmatek" Description="dr1811: XSave Button (Overwrite existing file) added"/>
		<Dokumentation Revision="0.2" Date="2012-10-22" Author="kolott" Company="sigmatek" Description="default of buttonframe has cahnged to be same than frame of listview"/>
		<Dokumentation Revision="0.1" Date="2012-06-25" Author="kolott" Company="sigmatek" Description="release"/>
	</RevDoku>
	<Network Name="_FileExplorerButton">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name       = "_base"
				GUID       = "{E4FFFC27-E333-4042-A463-C9A1685874B9}"
				Class      = "_FileExplorer"
				Position   = "(218,120)"
				Visualized = "true">
				<Channels>
					<Server Name="ActPos"/>
					<Server Name="ConfirmYes"/>
					<Server Name="Execute"/>
					<Server Name="IsActivated"/>
					<Server Name="IsBusySignal"/>
					<Server Name="IsMarked"/>
					<Server Name="Refresh"/>
					<Server Name="Server0"/>
					<Server Name="SortCriteria"/>
					<Client Name="ConfirmWindow" Value="-1"/>
					<Client Name="ErrorWindow"/>
					<Client Name="ExtendedScrollBar" Value="0"/>
					<Client Name="LineHighness"/>
					<Client Name="LineWidth"/>
					<Client Name="Lse"/>
					<Client Name="PixelWidthDate"/>
					<Client Name="PixelWidthFileSize"/>
					<Client Name="PixelWidthName"/>
					<Client Name="PixelWidthTime"/>
					<Client Name="VerticalLevel"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="this.Server0" Destination="_base.Server0" Vertices="(796,210),(624,210),"/>
			<Connection Source="this.Refresh" Destination="_base.Refresh" Vertices="(796,270),(624,270),"/>
			<Connection Source="this.ActPos" Destination="_base.ActPos" Vertices="(796,330),(624,330),"/>
			<Connection Source="this.Execute" Destination="_base.Execute" Vertices="(796,390),(624,390),"/>
			<Connection Source="this.IsActivated" Destination="_base.IsActivated" Vertices="(796,510),(624,510),"/>
			<Connection Source="this.IsMarked" Destination="_base.IsMarked" Vertices="(796,570),(624,570),"/>
			<Connection Source="this.ConfirmYes" Destination="_base.ConfirmYes" Vertices="(796,630),(624,630),"/>
			<Connection Source="_base.Lse" Destination="this.Lse" Vertices="(218,210),(38,210),"/>
			<Connection Source="_base.VerticalLevel" Destination="this.VerticalLevel" Vertices="(218,270),(38,270),"/>
			<Connection Source="_base.LineWidth" Destination="this.LineWidth" Vertices="(218,330),(38,330),"/>
			<Connection Source="_base.ConfirmWindow" Destination="this.ConfirmWindow" Vertices="(218,510),(38,450),"/>
			<Connection Source="_base.ErrorWindow" Destination="this.ErrorWindow" Vertices="(218,570),(38,510),"/>
			<Connection Source="this.IsBusySignal" Destination="_base.IsBusySignal" Vertices="(796,450),(624,450),"/>
			<Connection Source="_base.LineHighness" Destination="this.LineHighness" Vertices="(218,390),(38,390),"/>
			<Connection Source="_base.PixelWidthName" Destination="this.PixelWidthName" Vertices="(218,630),(38,570),"/>
			<Connection Source="_base.PixelWidthDate" Destination="this.PixelWidthDate" Vertices="(218,690),(38,630),"/>
			<Connection Source="_base.PixelWidthTime" Destination="this.PixelWidthTime" Vertices="(218,750),(38,690),"/>
			<Connection Source="_base.PixelWidthFileSize" Destination="this.PixelWidthFileSize" Vertices="(218,810),(38,750),"/>
			<Connection Source="this.SortCriteria" Destination="_base.SortCriteria" Vertices="(796,690),(624,690),"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
#pragma using _FileExplorer

_FileExplorerButton : CLASS
: _FileExplorer
	TYPE
#pragma pack(push, 1)
	  FexButton : STRUCT
	    room : _ROOM;
	    attrib : UDINT;
	    execmd : Exec;
	    onscreen : BOOL;
	    txt : ^void;
	    chrsize : UINT;
	    valid : BOOL;
	    colback : _COLOR;
	    coltext : _COLOR;
	  END_STRUCT;
#pragma pack(pop)
	END_TYPE
  //Servers:
  //Clients:
  //Variables:
		ButtonRoom 	: _ROOM;
		ButtonFrameType 	: _FRAMETYPE;
		ButtonColorText 	: _COLOR;
		ButtonColorBack 	: _COLOR;
		ButtonColorFrame 	: _COLOR;
		BusyButtonColor 	: _COLOR;
		ButtonFont 	: _FONT;
		Button : ARRAY [0..9] OF FexButton;

		OldIsActivated 	: UDINT;
		OldIsMarked 	: UDINT;
		OldSelectionIs 	: _SELIS;
		UseButtonLoad 	: BOOL;
		UseButtonSave 	: BOOL;
		UseButtonOverwrite 	: BOOL;
		UseButtonMark 	: BOOL;
		UseButtonUnMark 	: BOOL;
		UseButtonPaste 	: BOOL;
		UseButtonDelete 	: BOOL;
		UseButtonMkDir 	: BOOL;
		UseButtonRename 	: BOOL;
		UseButtonPanic 	: BOOL;
		OldBusySignal 	: UDINT;
		BusyButton 	: FexButton;
		Timex 	: UDINT;
		ButtonWidth 	: INT;
  //Functions:
	
	FUNCTION _FileExplorerButton
		VAR_OUTPUT
			ret_code 	: ConfStates;
		END_VAR;
				//! <Function Comment="[#ENGLISH]&#13;&#10;this method is called everytime when the input is active and a event occured&#13;&#10;&#13;&#10;ped ....... pointer to _EDITOR information&#13;&#10;pe ........ pointer to _EVENT information&#13;&#10;&#13;&#10;for the returnstatement there are 3 different possibilities&#13;&#10;_IDLE ..... the system should goon like it is (system goes on)&#13;&#10;_IDIDIT ... i did it (system is ready)&#13;&#10;_IFAILED .. i tried to do my best, but i failed (system is ready)&#13;&#10;" Name="GetEvent"/>
	FUNCTION __CDECL VIRTUAL GLOBAL GetEvent
		VAR_INPUT
			ped 	: ^_EDITOR;			//! <Variable Comment="pointer to _EDITOR information" Name="GetEvent.ped"/>
			pe 	: ^_EVENT;			//! <Variable Comment="pointer to _EVENT information" Name="GetEvent.pe"/>
		END_VAR
		VAR_OUTPUT
			retcode (EAX) 	: _DOIT;			//! <Variable Comment="for the returnstatement there are 3 different possibilities&#13;&#10;  _IDLE ..... the system should goon like it is (system goes on)&#13;&#10;  _IDIDIT ... i did it (system is ready)&#13;&#10;  _IFAILED .. i tried to do my best, but i failed (system is ready)&#13;&#10;" Name="GetEvent.retcode"/>
		END_VAR;
				//! <Function Comment="[#ENGLISH]&#13;&#10;this method is called everytime when system wants to redraw the io&#13;&#10;&#13;&#10;pio ....... pointer to io information&#13;&#10;pr ........ pointer to result information&#13;&#10;pv ........ pointer to io variableinformation&#13;&#10;input ..... TRUE it&apos;s an input / FALSE it&apos;s an output&#13;&#10;&#13;&#10;for the returnstatement there are 3 different possibilities&#13;&#10;_IDLE ..... the system should goon like it is (system goes on)&#13;&#10;_IDIDIT ... i did it (system is ready)&#13;&#10;_IFAILED .. i tried to do my best, but i failed (system is ready)&#13;&#10;&#13;&#10;if you want to draw the io let&apos;s return _IDIDIT&#13;&#10;" Name="Draw"/>
	FUNCTION __CDECL VIRTUAL GLOBAL Draw
		VAR_INPUT
			pio 	: ^_IO;			//! <Variable Comment="pointer to _IO information" Name="Draw.pio"/>
			pr 	: ^_RESULT;			//! <Variable Comment="pointer to _RESULT information" Name="Draw.pr"/>
			pv 	: ^_VARIABLE;			//! <Variable Comment="pointer to io _VARIABLE information" Name="Draw.pv"/>
			input 	: BOOL;			//! <Variable Comment="TRUE it&apos;s an input&#13;&#10;FALSE it&apos;s an output" Name="Draw.input"/>
		END_VAR
		VAR_OUTPUT
			retcode (EAX) 	: _DOIT;			//! <Variable Comment="for the returnstatement there are 3 different possibilities&#13;&#10;  _IDLE ..... the system should goon like it is (system goes on)&#13;&#10;  _IDIDIT ... i did it (system is ready)&#13;&#10;  _IFAILED .. i tried to do my best, but i failed (system is re" Name="Draw.retcode"/>
		END_VAR;
				//! <Function Comment="[#ENGLISH]&#13;&#10;this method is called once right in front of drawing the object.&#13;&#10;for example open screen&#13;&#10;" Name="IF_Start"/>
	FUNCTION __CDECL VIRTUAL GLOBAL IF_Start
		VAR_INPUT
			pio 	: ^_IO;			//! <Variable Comment="pointer to _IO information" Name="IF_Start.pio"/>
			firsttime 	: BOOL;			//! <Variable Comment="true: when system wants to view drawing after open screen&#13;&#10;false: when system wants to redraw background" Name="IF_Start.firsttime"/>
		END_VAR;
				//! <Function Comment="[#ENGLISH]&#13;&#10;method is called cyclic during object is on screen&#13;&#10;&#13;&#10;pio ....... pointer to io information&#13;&#10;input .... TRUE it&apos;s an input / FALSE it&apos;s an output&#13;&#10;" Name="IF_Run"/>
	FUNCTION __CDECL VIRTUAL GLOBAL IF_Run
		VAR_INPUT
			pio 	: ^_IO;			//! <Variable Comment="pointer to _IO information given by LSE" Name="IF_Run.pio"/>
			input 	: BOOL;			//! <Variable Comment="TRUE it&apos;s an input&#13;&#10;FALSE it&apos;s an output" Name="IF_Run.input"/>
		END_VAR;
				//! <Function Comment="method is used to get descriptiontext" Name="GetDescriptionText"/>
	FUNCTION VIRTUAL GLOBAL GetDescriptionText
		VAR_INPUT
			ptxt 	: ^pVoid;			//! <Variable Comment="pointer where text should be given" Name="GetDescriptionText.ptxt"/>
			pchrsize 	: ^UINT;			//! <Variable Comment="1 for ascii-code, 2 to get text in unicode-format" Name="GetDescriptionText.pchrsize"/>
			txtid 	: UDINT;			//! <Variable Comment="id of text to be given" Name="GetDescriptionText.txtid"/>
		END_VAR;
	
	FUNCTION VIRTUAL SetButtonStyleSingle
		VAR_INPUT
			pb 	: ^_FileExplorerButton::FexButton;
			pr 	: ^_ROOM;
			txtid 	: UDINT;
			exe 	: Exec;
			valid 	: BOOL;
			colback 	: _COLOR;
			coltext 	: _COLOR;
		END_VAR
		VAR_OUTPUT
			retcode 	: BOOL;
		END_VAR;
	
	FUNCTION VIRTUAL SetButtonStyle
		VAR_INPUT
			pio 	: ^_IO;
		END_VAR;
	
	FUNCTION VIRTUAL DrawButtonSingle
		VAR_INPUT
			pio 	: ^_IO;
			pb 	: ^FexButton;
		END_VAR;
	
	FUNCTION DrawButtonAll
		VAR_INPUT
			pio 	: ^_IO;
		END_VAR;
	
	FUNCTION RunButtonAll
		VAR_INPUT
			pio 	: ^_IO;
		END_VAR;
	
	FUNCTION VIRTUAL IsButtonHID
		VAR_INPUT
			pio 	: ^_IO;
			pe 	: ^_EVENT;
		END_VAR
		VAR_OUTPUT
			retcode 	: BOOL;
		END_VAR;
	
	FUNCTION RunButtonSingle
		VAR_INPUT
			pio 	: ^_IO;
			pb 	: ^FexButton;
			onscreen 	: BOOL;
		END_VAR;
				//! <Function Comment="method is used to configurate view of buttons" Name="ActivateButtons"/>
	FUNCTION VIRTUAL GLOBAL ActivateButtons;
	
	FUNCTION VIRTUAL SetButtonPosition
		VAR_INPUT
			pio 	: ^_IO;
		END_VAR;
	
	FUNCTION BusyPushText
		VAR_INPUT
			busytxt 	: ^CHAR;
		END_VAR;
	
	FUNCTION BusyPopText;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

//}}LSL_DECLARATION


FUNCTION GLOBAL TAB _FileExplorerButton::@CT_
0$UINT,
2#0100000000000000$UINT, //TY__FILEEXPLORERBUTTON
0$UINT, 4$UINT, (SIZEOF(::_FileExplorerButton))$UINT, 
0$UINT, 0$UINT, 0$UINT, 
TO_UDINT(3562545917), "_FileExplorerButton", //Class
TO_UDINT(129556241), "_FileExplorer", 0$UINT, 8$UINT, //Baseclass
//Servers:
//Clients:
END_FUNCTION


#define USER_CNT__FileExplorerButton 46

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT__FileExplorerButton] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION _FileExplorerButton::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
		nCmdSize	: UINT;
	END_VAR

	ret_code	:= _FileExplorer::@STD();
	IF ret_code <> C_OK THEN
		RETURN;
	END_IF;
	nCmdSize		:= _MyIO::Server0.pMeth^.nCmds$UINT*SIZEOF(pVoid) + CMDMETH.Init;

	_memcpy((#vmt.CmdTable)$^USINT, _MyIO::Server0.pMeth, nCmdSize);
	vmt.CmdTable.nCmds		:= nSTDCMD + USER_CNT__FileExplorerButton;
#pragma warning (disable : 74)
	vmt.UserFcts[2]		:= #GetEvent();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[3]		:= #Draw();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[5]		:= #IF_Start();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[7]		:= #IF_Run();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[34]		:= #GetDescriptionText();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[40]		:= #SetButtonStyleSingle();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[41]		:= #SetButtonStyle();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[42]		:= #DrawButtonSingle();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[43]		:= #IsButtonHID();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[44]		:= #ActivateButtons();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[45]		:= #SetButtonPosition();

#pragma warning (default : 74)
	_MyIO::Server0.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF _MyIO::Server0.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	ret_code	:= _FileExplorerButton();

END_FUNCTION

//{{LSL_IMPLEMENTATION

#define BUTTON_LOAD      300
#define BUTTON_SAVE      301
#define BUTTON_MARK      302
#define BUTTON_PASTE     303
#define BUTTON_OVERWRITE 304
#define BUTTON_DELETE    305
#define BUTTON_MKDIR     306
#define BUTTON_UNMARK    307
#define BUTTON_PANIC     308
#define BUTTON_BUSY      309
#define BUTTON_RENAME    310

var_private
  virtmno_load, virtmno_save : udint;
end_var

FUNCTION _FileExplorerButton::_FileExplorerButton
	VAR_OUTPUT
		ret_code 	: ConfStates;
	END_VAR

  virtmno_load := GetVirtualMethodNumber(this, #ExecuteLoad());
  virtmno_save := GetVirtualMethodNumber(this, #ExecuteSave());
  ButtonWidth  := 85;
 
	ret_code := C_OK;

END_FUNCTION

FUNCTION __CDECL VIRTUAL GLOBAL _FileExplorerButton::IF_Start
	VAR_INPUT
		pio 	: ^_IO;
		firsttime 	: BOOL;
	END_VAR
 
  if(firsttime = true) then
    ActivateButtons();        // activate - deactivate buttons
    SetButtonStyle(pio);      // set stylo of buttons
    SetButtonPosition(pio);   // set position of buttons
    OldSelectionIs := SELIS_NONE;
    OldIsActivated := false;
    OldIsMarked    := false;
  end_if;
  
  pio^.space.xy1.x += ButtonWidth;
  _FileExplorer::IF_Start(pio, firsttime);
  pio^.space.xy1.x -= ButtonWidth;
  
END_FUNCTION

FUNCTION VIRTUAL GLOBAL _FileExplorerButton::ActivateButtons

  UseButtonLoad      := (GetVirtualMethodPointer(this, virtmno_load) <> #ExecuteLoad()); // true: when methode is overwritten
  UseButtonSave      := (GetVirtualMethodPointer(this, virtmno_save) <> #ExecuteSave()); // true: when methode is overwritten
  UseButtonOverwrite := (GetVirtualMethodPointer(this, virtmno_save) <> #ExecuteSave()); // true: when methode is overwritten
  UseButtonMark      := true;
  UseButtonUnMark    := false;
  UseButtonPaste     := true;
  UseButtonDelete    := true;
  UseButtonMkDir     := true;
  UseButtonRename    := true;
  UseButtonPanic     := true;

END_FUNCTION

FUNCTION __CDECL VIRTUAL GLOBAL _FileExplorerButton::Draw
	VAR_INPUT
		pio 	: ^_IO;
		pr 	: ^_RESULT;
		pv 	: ^_VARIABLE;
		input 	: BOOL;
	END_VAR
	VAR_OUTPUT
		retcode (EAX) 	: _DOIT;
	END_VAR

  retcode := _ScrollArea2::Draw(pio, pr, pv, input);
  DrawButtonAll(pio);

END_FUNCTION

FUNCTION __CDECL VIRTUAL GLOBAL _FileExplorerButton::IF_Run
	VAR_INPUT
		pio 	: ^_IO;
		input 	: BOOL;
	END_VAR

  _FileExplorer::IF_Run(pio, input);

  RunButtonAll(pio);

END_FUNCTION

FUNCTION __CDECL VIRTUAL GLOBAL _FileExplorerButton::GetEvent
	VAR_INPUT
		ped 	: ^_EDITOR;
		pe 	: ^_EVENT;
	END_VAR
	VAR_OUTPUT
		retcode (EAX) 	: _DOIT;
	END_VAR

  Timex := ops.tAbsolute;

  if(pe^.ftype = _EVENT_HIDPRESS) | (pe^.ftype = _EVENT_HIDRELEASE) then
    if(IsButtonHID(#ped^.input.io, pe) = true) then
      retcode := _IDIDIT;
      return;
    end_if;
  end_if;

  retcode := _FileExplorer::GetEvent(ped, pe);

END_FUNCTION

FUNCTION VIRTUAL _FileExplorerButton::SetButtonStyleSingle
	VAR_INPUT
		pb 	: ^_FileExplorerButton::FexButton;
		pr 	: ^_ROOM;
		txtid 	: UDINT;
		exe 	: Exec;
		valid 	: BOOL;
		colback 	: _COLOR;
		coltext 	: _COLOR;
	END_VAR
	VAR_OUTPUT
		retcode 	: bool;
	END_VAR

  pb^.room     := pr^;
  pb^.attrib   := T_COPY or T_SOLID or T_MIDBOUND or T_CENTERBOUND;
  pb^.onscreen := false;
  pb^.execmd   := exe;
  pb^.valid    := valid;
  pb^.colback  := colback; //ButtonColorBack;
  pb^.coltext  := coltext; //ButtonColorText;
  GetDescriptionText(#pb^.txt, #pb^.chrsize, txtid);
 // pb^.colfree  := Graphic.ReadPixel((pr^.xy1.x + pr^.xy2.x) / 2, (pr^.xy1.y + pr^.xy2.y) / 2);

  retcode := valid;

END_FUNCTION

FUNCTION VIRTUAL _FileExplorerButton::SetButtonStyle
	VAR_INPUT
		pio 	: ^_IO;
	END_VAR

  ButtonFrameType  := GetFrameType(37, 28, 25, pio^.frametype);
  ButtonColorBack  := pio^.colback;
  if(GetBackColor(ButtonColorBack) = INVISIBLE) then
    ButtonColorBack := Graphic.MakeColor(GetPenColor(ButtonColorBack), GetPenColor(ButtonColorBack));
  end_if;
  ButtonColorText  := pio^.coltxt;
  ButtonColorFrame := pio^.colframe;
  BusyButtonColor  := 2#0000011111100000; // pure green
  ButtonFont       := pio^.font;

END_FUNCTION

FUNCTION VIRTUAL _FileExplorerButton::SetButtonPosition
	VAR_INPUT
		pio 	: ^_IO;
	END_VAR
  VAR
    height : int;
    room : _ROOM;
  END_VAR

  ButtonRoom       := pio^.space;
  ButtonRoom.xy2.x := ButtonRoom.xy1.x + ButtonWidth - 2;

  height := 0;
  if(UseButtonSave      = true) then height += 1; end_if;
  if(UseButtonOverwrite = true) then height += 1; end_if;
  if(UseButtonLoad      = true) then height += 1; end_if;
  if(UseButtonRename    = true) then height += 1; end_if;
  if(UseButtonUnMark    = true) then height += 1; end_if;
  if(UseButtonPaste     = true) then height += 1; end_if;
  if(UseButtonMark      = true) then height += 1; end_if;
  if(UseButtonDelete    = true) then height += 1; end_if;
  if(UseButtonMkDir     = true) then height += 1; end_if;
  if(UseButtonPanic     = true) then height += 1; end_if;

  if(height < 4) then
    height := 4;
  end_if;

  height := (ButtonRoom.xy2.y - ButtonRoom.xy1.y + 1) / height;
  room   := ButtonRoom;
  room.xy2.y := room.xy1.y + height - 2;
  
  if(SetButtonStyleSingle(#Button[1], #room, BUTTON_SAVE, ExecSave, UseButtonSave, ButtonColorBack, ButtonColorText) = true) then
    room.xy1.y += height;
    room.xy2.y += height;
  end_if;
  if(SetButtonStyleSingle(#Button[9], #room, BUTTON_OVERWRITE, ExecOverwrite, UseButtonOverwrite, ButtonColorBack, ButtonColorText) = true) then
    room.xy1.y += height;
    room.xy2.y += height;
  end_if;
  if(SetButtonStyleSingle(#Button[0], #room, BUTTON_LOAD, ExecLoad, UseButtonLoad, ButtonColorBack, ButtonColorText) = true) then
    room.xy1.y += height;
    room.xy2.y += height;
  end_if;
  if(SetButtonStyleSingle(#Button[3], #room, BUTTON_UNMARK, ExecUnMark, UseButtonUnMark, ButtonColorBack, ButtonColorText) = true) then
    room.xy1.y += height;
    room.xy2.y += height;
  end_if;
  if(SetButtonStyleSingle(#Button[4], #room, BUTTON_PASTE, ExecPaste, UseButtonPaste, ButtonColorBack, ButtonColorText) = true) then
    room.xy1.y += height;
    room.xy2.y += height;
  end_if;
  if(SetButtonStyleSingle(#Button[8], #room, BUTTON_RENAME, ExecRename, UseButtonRename, ButtonColorBack, ButtonColorText) = true) then
    room.xy1.y += height;
    room.xy2.y += height;
  end_if;
  if(SetButtonStyleSingle(#Button[2], #room, BUTTON_MARK, ExecMark, UseButtonMark, ButtonColorBack, ButtonColorText) = true) then
    room.xy1.y += height;
    room.xy2.y += height;
  end_if;
  if(SetButtonStyleSingle(#Button[5], #room, BUTTON_DELETE, ExecDelete, UseButtonDelete, ButtonColorBack, ButtonColorText) = true) then
    room.xy1.y += height;
    room.xy2.y += height;
  end_if;
  if(SetButtonStyleSingle(#Button[6], #room, BUTTON_MKDIR, ExecMkDir, UseButtonMkDir, ButtonColorBack, ButtonColorText) = true) then
    room.xy1.y += height;
    room.xy2.y += height;
  end_if;
  
  if(SetButtonStyleSingle(#Button[7], #room, BUTTON_PANIC, ExecPanic, UseButtonPanic, ButtonColorBack, ButtonColorText) = false) then
    room.xy1.y -= height;
    room.xy2.y -= height;
  end_if;
  
  SetButtonStyleSingle(#BusyButton, #room, BUTTON_BUSY, ExecIdle, true, ButtonColorBack, ButtonColorText);
  
END_FUNCTION

FUNCTION VIRTUAL _FileExplorerButton::DrawButtonSingle
	VAR_INPUT
    pio : ^_IO;
		pb 	: ^FexButton;
	END_VAR
  VAR
    actreg, ioreg, newreg : _REGION;
  END_VAR

  if(pb^.valid = true) then
    if(pb^.onscreen = true) then
      OutMultiTextAlign(pb^.txt, 0, #pb^.room, ButtonFont, pb^.attrib, ButtonFrameType, pb^.coltext, pb^.colback, ButtonColorFrame, pb^.chrsize);
    else
      ioreg  := NIL;
      newreg := NIL;
      actreg := ActivateAndRegion(#ioreg, #newreg, #pb^.room);
      Graphic.PutImage(#pio^.image, DEFKOORD, DEFKOORD);
      DeactivateAndRegion(actreg, #ioreg, #newreg);
      //Graphic.Beam(pb^.room.xy1.x, pb^.room.xy1.y, pb^.room.xy2.x, pb^.room.xy2.y, T_COPY or T_SOLID, WHITE);
    end_if;
    
   #ifdef UC_ROTATE
    REFRESHRECTANGLE(#pb^.room);
   #endif
  end_if;

END_FUNCTION

FUNCTION _FileExplorerButton::DrawButtonAll
	VAR_INPUT
    pio : ^_IO;
  END_VAR
  
  DrawButtonSingle(pio, #BusyButton); // muss vor panic-button ausgegeben werden, weil selber room
 
  DrawButtonSingle(pio, #Button[0]);
  DrawButtonSingle(pio, #Button[1]);
  DrawButtonSingle(pio, #Button[2]);
  DrawButtonSingle(pio, #Button[3]);
  DrawButtonSingle(pio, #Button[4]);
  DrawButtonSingle(pio, #Button[5]);
  DrawButtonSingle(pio, #Button[6]);
  DrawButtonSingle(pio, #Button[7]);
  DrawButtonSingle(pio, #Button[8]);
  DrawButtonSingle(pio, #Button[9]); // overwrite
  
END_FUNCTION

FUNCTION _FileExplorerButton::RunButtonSingle
	VAR_INPUT
		pio : ^_IO;
		pb 	: ^FexButton;
		onscreen 	: BOOL;
	END_VAR
  
  if(pb^.valid = true) then
    if(onscreen <> pb^.onscreen) then
      pb^.onscreen := onscreen;
      DrawButtonSingle(pio, pb);
    end_if;
  end_if;
  
END_FUNCTION

FUNCTION _FileExplorerButton::RunButtonAll
	VAR_INPUT
		pio 	: ^_IO;
	END_VAR
  VAR
    ia, im, tmp : bool;
    color : _COLOR;
  END_VAR
    
  if((ops.tAbsolute - Timex) > 150) then
    Timex := ops.tAbsolute;
  
    if(IsActivated <> OldIsActivated) | (IsMarked <> OldIsMarked) | (SelectionIs <> OldSelectionIs) | ( OldBusySignal <> IsBusySignal) then
      OldBusySignal := IsBusySignal;
  
      if(IsBusySignal <> 0) then
        RunButtonSingle(pio, #Button[0], false); // load
        RunButtonSingle(pio, #Button[1], false); // save
        RunButtonSingle(pio, #Button[2], false); // mark
        RunButtonSingle(pio, #Button[5], false); // delete
        RunButtonSingle(pio, #Button[3], false); // unmark
        RunButtonSingle(pio, #Button[4], false); // paste
        RunButtonSingle(pio, #Button[6], false); // mkdir
        RunButtonSingle(pio, #Button[7], false); // panic
        RunButtonSingle(pio, #Button[8], false); // rename
        RunButtonSingle(pio, #Button[9], false); // overwrite
    
        color := BusyButtonColor;
        if(IsBusySignal and 2) then
          color := ButtonColorBack;
        end_if;

        if(color <> BusyButton.colback) then
          BusyButton.onscreen := false;
          BusyButton.colback := color;
        end_if;
    
        RunButtonSingle(pio, #BusyButton, true); // panic
      else
      
        OldIsMarked    := IsMarked;
        OldIsActivated := IsActivated;
        OldSelectionIs := SelectionIs;
      
        RunButtonSingle(pio, #BusyButton, false); // ggf.panic l�schen
        
        ia := false;
        im := false;

        if(IsActivated <> 0) then
          ia := true;
          if(IsMarked <> 0) then
            im := true;
          end_if;
        end_if;
   
        tmp := false;
        if(ia = true) & (SelectionIs = SELIS_FILE) then
          tmp := true;
        end_if;
        RunButtonSingle(pio, #Button[0], tmp); // load
        RunButtonSingle(pio, #Button[8], tmp); // rename
        RunButtonSingle(pio, #Button[9], tmp); // overwrite
    
        RunButtonSingle(pio, #Button[1], ia); // save
    
        tmp := false;
        if(ia = true) & ((SelectionIs = SELIS_DIRECTORY) | (SelectionIs = SELIS_FILE)) then
          tmp := true;
        end_if;
        RunButtonSingle(pio, #Button[2], tmp); // mark
        RunButtonSingle(pio, #Button[5], tmp); // delete
    
        RunButtonSingle(pio, #Button[3], im); // unmark
        RunButtonSingle(pio, #Button[4], im); // paste
        RunButtonSingle(pio, #Button[6], ia); // mkdir
        RunButtonSingle(pio, #Button[7], true); // panic
        
      end_if;
    end_if;
  end_if;
  
END_FUNCTION

FUNCTION VIRTUAL _FileExplorerButton::IsButtonHID
	VAR_INPUT
		pio 	: ^_IO;
		pe 	: ^_EVENT;
	END_VAR
	VAR_OUTPUT
		retcode 	: BOOL;
	END_VAR
  VAR
  	no : udint;
    pb : ^FexButton;
  END_VAR
  
  retcode := false;
  
  if(Focus = true) then
    //if((pe^.dot.x >= pio^.space.xy1.x) & (pe^.dot.y >= pio^.space.xy1.y) & (pe^.dot.y <= pio^.space.xy2.y) & (pe^.dot.x <= (pio^.space.xy1.x + ButtonWidth))) then
    if((pe^.dot.x >= ButtonRoom.xy1.x) & (pe^.dot.y >= ButtonRoom.xy1.y) & (pe^.dot.y <= ButtonRoom.xy2.y) & (pe^.dot.x <= ButtonRoom.xy2.x)) then
      retcode := true;
      if(IsBusy = 0) then // nur wenn nicht busy
        no := sizeof(Button) / sizeof(FexButton);
        pb := #Button[0];
        while(no) do
          no -= 1;
  
          if(pe^.dot.x >= pb^.room.xy1.x) & (pe^.dot.x <= pb^.room.xy2.x) & (pe^.dot.y >= pb^.room.xy1.y) & (pe^.dot.y <= pb^.room.xy2.y) then
            if(pb^.onscreen = true) then
              pb^.attrib := pb^.attrib or T_INVRS;
              if(pe^.ftype = _EVENT_HIDRELEASE) then
                pb^.attrib := pb^.attrib xor T_INVRS;
              end_if;
              DrawButtonSingle(pio, pb);
        
              if(pe^.ftype = _EVENT_HIDRELEASE) then
                Execute.Write(pb^.execmd);
              end_if;
              return;
            end_if;
          end_if;
    
          pb += sizeof(FexButton);
        end_while;
      end_if;
    end_if;
  end_if;
  
END_FUNCTION

FUNCTION VIRTUAL GLOBAL _FileExplorerButton::GetDescriptionText
	VAR_INPUT
		ptxt 	: ^pVoid;
		pchrsize 	: ^UINT;
		txtid 	: UDINT;
	END_VAR

  ptxt^     := NIL;
  pchrsize^ := 1;
  
  case txtid of
    BUTTON_LOAD :
      ptxt^ := "LOAD";
    BUTTON_SAVE :
      ptxt^ := "SaveAS";
    BUTTON_OVERWRITE :
      ptxt^ := "SAVE";
    BUTTON_MARK :
      ptxt^ := "MARK";
    BUTTON_PASTE :
      ptxt^ := "PASTE";
    BUTTON_DELETE :
      ptxt^ := "DEL";
    BUTTON_MKDIR :
      ptxt^ := "MkDIR";
    BUTTON_UNMARK :
      ptxt^ := "UnMARK";
    BUTTON_PANIC :
      ptxt^ := "PANIC";
    BUTTON_RENAME :
      ptxt^ := "ReNAM";
    BUTTON_BUSY :
      ptxt^ := "BUSY";
    else
      _FileExplorer::GetDescriptionText(ptxt, pchrsize, txtid);
   end_case; 

END_FUNCTION


FUNCTION _FileExplorerButton::BusyPushText
  VAR_INPUT
    busytxt : ^char;
  END_VAR

  BusyButton.txt     := busytxt;
  BusyButton.chrsize := 1;
  _FileExplorer::BusyPush();

END_FUNCTION


FUNCTION _FileExplorerButton::BusyPopText

  _FileExplorer::BusyPop();
  GetDescriptionText(#BusyButton.txt, #BusyButton.chrsize, BUTTON_BUSY);

END_FUNCTION

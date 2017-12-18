//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)

//{{LSL_DEFINES


// Default-Settings for the Touch-Calibration
//-------------------------------------------------------------------------------------------------

#define   TouchCalib_UDCVersion                                         1
#define   TouchCalib_NoAnything                                         2

#define   TouchCalib_TextTouchScreen                                    "Please touch the screen to start!"
#define   TouchCalib_TextTouchCrosshair                                 "Please touch the crosshair!"
#define   TouchCalib_TextCalibSuccessful                                "Calibration successful! Please touch the screen to continue."
#define   TouchCalib_TextCalibFailed                                    "Calibration failed! Please touch the screen to calibrate again."

#define   TouchCalib_TextIdxTouchScreen                                 0
#define   TouchCalib_TextIdxTouchCrosshair                              1
#define   TouchCalib_TextIdxCalibSuccessful                             2
#define   TouchCalib_TextIdxCalibFailed                                 3

#define   TouchCalib_StdTextAttrib                                      T_SOLID OR T_COPY OR T_PROP

#define   TouchCalib_CrosshairSize                                      40                                            // The length and width of the crosshair (if no image is choosen) [pixel]



//}}LSL_DEFINES

//{{LSL_DECLARATION

(*!
<Class
	Name               = "TouchCalib"
	Revision           = "1.0"
	GUID               = "{7EC29653-88B4-4828-8414-BBEB9EB15527}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "true"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(540,240)"
	Comment            = "Class for touch-calibration">
	<Channels>
		<Server Name="State" GUID="{C7AAF6ED-4FEB-4830-8B03-90902288CDB9}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Client Name="coGrafix" Required="false" Internal="false"/>
		<Client Name="Tolerance" Required="true" Internal="false" Comment="tolerance of the touch events"/>
	</Channels>
	<Dependencies>
		<Files>
			<File Path=".\Class\TouchCalib\Dokumentation_TouchCalib_v1.0.pdf"/>
		</Files>
	</Dependencies>
	<RevDoku>
		<Owner Company="Sigmatek" Author="KruAle"/>
		<Dokumentation Revision="1.0" Date="2016-05-10" Author="KruAle" Company="Sigmatek" Description="Use the background-color and the frame of the UDC."/>
		<Dokumentation Revision="1.0 Beta" Date="2016-04-28" Author="KruAle" Company="Sigmatek" Description="Class for touch calibration."/>
	</RevDoku>
	<Network Name="TouchCalib">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name       = "_base"
				GUID       = "{53D20DB3-C83C-4995-BC98-D400A80110BF}"
				Class      = "_MyIO"
				Position   = "(218,120)"
				Visualized = "true"
				Remotely   = "true">
				<Channels>
					<Server Name="Refresh"/>
					<Server Name="Server0"/>
					<Client Name="Graphic"/>
					<Client Name="Lse"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="this.Server0" Destination="_base.Server0" Vertices="(690,210),(518,210),"/>
			<Connection Source="this.Refresh" Destination="_base.Refresh" Vertices="(690,270),(518,270),"/>
			<Connection Source="_base.Lse" Destination="this.Lse" Vertices="(218,210),(30,210),(38,210),"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
#pragma using _MyIO

TouchCalib : CLASS
: _MyIO
	TYPE
#pragma pack(push, 1)
	  t_e_CalibStruct : STRUCT
	    Setpoint : ARRAY [0..2] OF XYKOORDS;
	    Actpoint : ARRAY [0..2] OF XYKOORDS;
	  END_STRUCT;
#pragma pack(pop)
#pragma pack(push, 1)
	  t_s_UDCInformation : STRUCT
	    Image : _ANYTHING;
	    Textscheme : _ANYTHING;
	    BgCol : _COLOR;
	    TxtCol : _COLOR;
	    FrameCol : _COLOR;
	    Attribute : _ATTRIB;
	  END_STRUCT;
#pragma pack(pop)
	END_TYPE
  //Servers:
	State 	: SvrCh_DINT;
  //Clients:
	Tolerance 	: CltCh_DINT;
	coGrafix 	: CltChCmd__Grafix;
  //Variables:
		bTouchEvent 	: BOOL;
		sCalibData 	: t_e_CalibStruct;
		sTouchData 	: t_s_UDCInformation;
		Checkpoint 	: _DOT;
		TouchKoord 	: _DOT;
  //Functions:
				//! <Function Comment="this method is called everytime when the input is active and a event occured" Name="GetEvent"/>
	FUNCTION __CDECL VIRTUAL GLOBAL GetEvent
		VAR_INPUT
			ped 	: ^_EDITOR;			//! <Variable Comment="pointer to _EDITOR information" Name="GetEvent.ped"/>
			pe 	: ^_EVENT;			//! <Variable Comment="pointer to _EVENT information" Name="GetEvent.pe"/>
		END_VAR
		VAR_OUTPUT
			retcode (EAX) 	: _DOIT;			//! <Variable Comment="for the returnstatement there are 3 different possibilities&#13;&#10;  _IDLE ..... the system should goon like it is (system goes on)&#13;&#10;  _IDIDIT ... i did it (system is ready)&#13;&#10;  _IFAILED .. i tried to do my best, but i failed (system is ready)&#13;&#10;" Name="GetEvent.retcode"/>
		END_VAR;
				//! <Function Comment="this method is called everytime when system wants to redraw the io" Name="Draw"/>
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
				//! <Function Comment="this method is called once right in front of drawing the object.&#13;&#10;for example open screen&#13;&#10;" Name="IF_Start"/>
	FUNCTION __CDECL VIRTUAL GLOBAL IF_Start
		VAR_INPUT
			pio 	: ^_IO;			//! <Variable Comment="pointer to _IO information" Name="IF_Start.pio"/>
			firsttime 	: BOOL;			//! <Variable Comment="true: when system wants to view drawing after open screen&#13;&#10;false: when system wants to redraw background" Name="IF_Start.firsttime"/>
		END_VAR;
	
	FUNCTION DrawDefaultCrosshair
		VAR_INPUT
			Room 	: _ROOM;
		END_VAR;
	
	FUNCTION OutUserText
		VAR_INPUT
			pio 	: ^_IO;
			dIndex 	: DINT;
			pDefText 	: ^CHAR;
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

#pragma usingLtd _Grafix


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB TouchCalib::@CT_
0$UINT,
2#0100000000000000$UINT, //TY_TOUCHCALIB
1$UINT, 0$UINT, (SIZEOF(::TouchCalib))$UINT, 
1$UINT, 2$UINT, 0$UINT, 
TO_UDINT(627189056), "TouchCalib", //Class
TO_UDINT(2980745877), "_MyIO", 0$UINT, 3$UINT, //Baseclass
//Servers:
(::TouchCalib.State.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(1422331979), "State", 
//Clients:
(::TouchCalib.Tolerance.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(598342311), "Tolerance", 
(::TouchCalib.coGrafix.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000000$UINT, TO_UDINT(860445224), "coGrafix", TO_UDINT(197854207), "_Grafix", 1$UINT, 2$UINT, 
END_FUNCTION


#define USER_CNT_TouchCalib 17

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_TouchCalib] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION TouchCalib::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
		nCmdSize	: UINT;
	END_VAR

	ret_code	:= _MyIO::@STD();
	IF ret_code <> C_OK THEN
		RETURN;
	END_IF;
	nCmdSize		:= _MyIO::Server0.pMeth^.nCmds$UINT*SIZEOF(pVoid) + CMDMETH.Init;

	_memcpy((#vmt.CmdTable)$^USINT, _MyIO::Server0.pMeth, nCmdSize);
	vmt.CmdTable.nCmds		:= nSTDCMD + USER_CNT_TouchCalib;
#pragma warning (disable : 74)
	vmt.UserFcts[2]		:= #GetEvent();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[3]		:= #Draw();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[5]		:= #IF_Start();

#pragma warning (default : 74)
	_MyIO::Server0.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF _MyIO::Server0.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION


FUNCTION __CDECL VIRTUAL GLOBAL TouchCalib::IF_Start
	VAR_INPUT
		pio 	: ^_IO;
		firsttime 	: BOOL;
	END_VAR
  VAR
    pHelpAnyThing   : ^_ANYTHING;
  END_VAR

  // only once necessary
  //-----------------------------------------------------------------------------------------
  if firsttime then
    
    // initialize the data
    sTouchData.Textscheme.list := DEFLST;
    sTouchData.Textscheme.no   := DEFSCOPE;
    sTouchData.Image.list      := DEFLST;
    sTouchData.Image.no        := DEFSCOPE;
    
    // check pointer to io-information
    if (pio = NIL) | (pio^.theurge = NIL) then
      TRACE("TouchCalib::IF_Start(): Pointer pio is invalid");
      return;
    end_if;
    
    // check version of the udc
    //-----------------------------------------------------------------------------------------
    if (pio^.theurge^.info = TouchCalib_UDCVersion) then      
      

      // get the textscheme and the image
      //-----------------------------------------------------------------------------------------
      // check the number of all parameters
      if (pio^.theurge^.memanything.no = TouchCalib_NoAnything) then
        
        pHelpAnyThing := pio^.theurge^.memanything.ptr;
        
        // check if schema is a image
        if pHelpAnyThing^.list = ICONLST then
          sTouchData.Image := pHelpAnyThing^;
        end_if;
        
        pHelpAnyThing += sizeof(_ANYTHING);
        
        // check if scheme is a textscheme
        if pHelpAnyThing^.list = TEXTSCHEME then
          sTouchData.Textscheme := pHelpAnyThing^;
        end_if;

      else
        TRACE("TouchCalib::IF_Start(): Wrong number of schemes in the UDC");
      end_if;
      

    else
      TRACE("TouchCalib::IF_Start(): Wrong version of the UDC");
    end_if;
      
  end_if;
  
  
  // save the background color
  sTouchData.BgCol      := pio^.colback;
  sTouchData.TxtCol     := pio^.coltxt;
  sTouchData.FrameCol   := pio^.colframe;
  sTouchData.Attribute  := pio^.attrib;
  
  // get the valid tolerance
  Tolerance := Tolerance.read();
  
  // set first screen
  //-----------------------------------------------------------------------------------------
  bTouchEvent := true;
  OutTextAlign(p0 := "", 
               x1 := 0, 
               p1 := #pio^.space, 
               x2 := pio^.font, 
               x3 := sTouchData.Attribute, 
               x9 := pio^.frametype, 
               x4 := sTouchData.TxtCol, 
               x5 := sTouchData.BgCol, 
               x6 := sTouchData.FrameCol, 
               x7 := 1);
  
END_FUNCTION


FUNCTION __CDECL VIRTUAL GLOBAL TouchCalib::GetEvent
	VAR_INPUT
		ped 	: ^_EDITOR;
		pe 	: ^_EVENT;
	END_VAR
	VAR_OUTPUT
		retcode (EAX) 	: _DOIT;
	END_VAR
  
  // touch event occured
  //--------------------------------------------------
  if pe^.ftype = _EVENT_HIDPRESS then
    bTouchEvent := true;
    TouchKoord  := pe^.dot;
    Refresh     := 1;         // refresh, because new default koord could be out of udc-room
  end_if;
  
  // method of the base-class
  retcode := _MyIO::GetEvent(ped, pe);
  
END_FUNCTION


FUNCTION __CDECL VIRTUAL GLOBAL TouchCalib::Draw
	VAR_INPUT
		pio 	: ^_IO;
		pr 	: ^_RESULT;
		pv 	: ^_VARIABLE;
		input 	: BOOL;
	END_VAR
	VAR_OUTPUT
		retcode (EAX) 	: _DOIT;
	END_VAR
  VAR
    myroom    : _ROOM;
    pPicture  : ^void;
  END_VAR

  // draw because of touch-event
  //-----------------------------------------------------------------------------------------
  if bTouchEvent then
    bTouchEvent := false;
      
    
    //********************************************************************************
    //********************************************************************************
    //****                        SSM for the touch-events                        ****
    //********************************************************************************
    //********************************************************************************
    case State of
      
      
      // ********************************************************************************
      // **   Draw user information                                                    **
      // ********************************************************************************
      0:
          // get text in textscheme
          OutUserText(pio       := pio,
                      dIndex    := TouchCalib_TextIdxTouchScreen, 
                      pDefText  := TouchCalib_TextTouchScreen);
          State := 1;
      
      
      // ********************************************************************************
      // **   Draw the first crosshair                                                 **
      // ********************************************************************************
      1:  
          // get text in textscheme
          OutUserText(pio       := pio,
                      dIndex    := TouchCalib_TextIdxTouchCrosshair, 
                      pDefText  := TouchCalib_TextTouchCrosshair);
          
          // reset touch-koord
          coGrafix.SetTouchKoords(1);
          
          // 1 crosshair
          //-----------------------------------------------------------------------------------------
          myroom.xy1.x              := TouchCalib_CrosshairSize;
          myroom.xy1.y              := TouchCalib_CrosshairSize;
          myroom.xy2.x              := myroom.xy1.x + TouchCalib_CrosshairSize;
          myroom.xy2.y              := myroom.xy1.y + TouchCalib_CrosshairSize;
          sCalibData.Setpoint[0].X  := myroom.xy1.x + (TouchCalib_CrosshairSize / 2);
          sCalibData.Setpoint[0].y  := myroom.xy1.y + (TouchCalib_CrosshairSize / 2);
          
          // get picture
          pPicture := get_anything(#sTouchData.Image, NIL); 
          if pPicture = NIL then
            DrawDefaultCrosshair(Room:=myroom);
          else
            out_part_BMP(#myroom, pPicture$^_BMP, pio^.attrib);
          end_if;
          
          // next step
          State := 2;


      // ********************************************************************************
      // **   Save the first touch-point                                               **
      // ********************************************************************************
      2:  
          // save touch-koord
          sCalibData.Actpoint[0].x := TouchKoord.x;
          sCalibData.Actpoint[0].y := TouchKoord.y;
          
          // get text in textscheme
          OutUserText(pio       := pio,
                      dIndex    := TouchCalib_TextIdxTouchCrosshair, 
                      pDefText  := TouchCalib_TextTouchCrosshair);
          
          // 2 crosshair
          //-----------------------------------------------------------------------------------------    
          myroom.xy1.x              := (pio^.space.xy2.x - TouchCalib_CrosshairSize) - TouchCalib_CrosshairSize;
          myroom.xy1.y              := TouchCalib_CrosshairSize;
          myroom.xy2.x              := myroom.xy1.x + TouchCalib_CrosshairSize;
          myroom.xy2.y              := myroom.xy1.y + TouchCalib_CrosshairSize;
          sCalibData.Setpoint[1].X  := myroom.xy1.x + (TouchCalib_CrosshairSize / 2);
          sCalibData.Setpoint[1].Y  := myroom.xy1.y + (TouchCalib_CrosshairSize / 2);

          // get picture
          pPicture := get_anything(#sTouchData.Image, NIL); 
          if pPicture = NIL then
            DrawDefaultCrosshair(Room:=myroom);
          else
            out_part_BMP(#myroom, pPicture$^_BMP, pio^.attrib);
          end_if;
          
          // next step
          State := 3;


      // ********************************************************************************
      // **   Save the second touch-point                                              **
      // ********************************************************************************
      3:
          // save touch-koord
          sCalibData.Actpoint[1].x := TouchKoord.x;
          sCalibData.Actpoint[1].y := TouchKoord.y;
          
          // get text in textscheme
          OutUserText(pio       := pio,
                      dIndex    := TouchCalib_TextIdxTouchCrosshair, 
                      pDefText  := TouchCalib_TextTouchCrosshair);
          
          // 3 crosshair
          //-----------------------------------------------------------------------------------------
          myroom.xy1.x              := TouchCalib_CrosshairSize;
          myroom.xy1.y              := (pio^.space.xy2.y - TouchCalib_CrosshairSize) - TouchCalib_CrosshairSize;
          myroom.xy2.x              := myroom.xy1.x + TouchCalib_CrosshairSize;
          myroom.xy2.y              := myroom.xy1.y + TouchCalib_CrosshairSize;
          sCalibData.Setpoint[2].X  := myroom.xy1.x + (TouchCalib_CrosshairSize / 2);
          sCalibData.Setpoint[2].Y  := myroom.xy1.y + (TouchCalib_CrosshairSize / 2);
          
          // get picture
          pPicture := get_anything(#sTouchData.Image, NIL); 
          if pPicture = NIL then
            DrawDefaultCrosshair(Room:=myroom);
          else
            out_part_BMP(#myroom, pPicture$^_BMP, pio^.attrib);
          end_if;
          
          // next step
          State := 4;


      // ********************************************************************************
      // **   Save the third touch-point                                               **
      // ********************************************************************************
      4:
          // save touch-koord    
          sCalibData.Actpoint[2].x := TouchKoord.x;
          sCalibData.Actpoint[2].y := TouchKoord.y;
          
          // set the new calibration
          coGrafix.SetNewTouchCalibration(#sCalibData);
          coGrafix.SetTouchKoords(0);
          
          // get text in textscheme
          OutUserText(pio       := pio,
                      dIndex    := TouchCalib_TextIdxTouchCrosshair, 
                      pDefText  := TouchCalib_TextTouchCrosshair);
          
          // 4 crosshair
          //-----------------------------------------------------------------------------------------
          myroom.xy1.x  := (pio^.space.xy2.x - TouchCalib_CrosshairSize) - TouchCalib_CrosshairSize;
          myroom.xy1.y  := (pio^.space.xy2.y - TouchCalib_CrosshairSize) - TouchCalib_CrosshairSize;
          myroom.xy2.x  := myroom.xy1.x + TouchCalib_CrosshairSize;
          myroom.xy2.y  := myroom.xy1.y + TouchCalib_CrosshairSize;
          Checkpoint.x  := myroom.xy1.x + (TouchCalib_CrosshairSize / 2);
          Checkpoint.y  := myroom.xy1.y + (TouchCalib_CrosshairSize / 2);
          
          // get picture
          pPicture := get_anything(#sTouchData.Image, NIL); 
          if pPicture = NIL then
            DrawDefaultCrosshair(Room:=myroom);
          else
            out_part_BMP(#myroom, pPicture$^_BMP, pio^.attrib);
          end_if;
          
          // next step
          State := 6;


      // ********************************************************************************
      // **   Touch successfully calibrated! -> wait for next touch-event              **
      // ********************************************************************************
      5:
          // done, reset everything
          State := 0;
          // return to the previous screen
          InsertCMD(CMD_RETURN, 0, 0);           


      // ********************************************************************************
      // **   Check if the calibration is valid -> do it again, if neccessary          **
      // ********************************************************************************
      6:
          // touch calibration valid?
          //-----------------------------------------------------------------------------------------
          if TouchKoord.x > (Checkpoint.x - Tolerance) & TouchKoord.x < (Checkpoint.x + Tolerance) &
             TouchKoord.y > (Checkpoint.y - Tolerance) & TouchKoord.y < (Checkpoint.y + Tolerance) then
            
            // get text in textscheme
            OutUserText(pio       := pio,
                        dIndex    := TouchCalib_TextIdxCalibSuccessful, 
                        pDefText  := TouchCalib_TextCalibSuccessful);
            
            State := 5;
            
          else
            
            // get text in textscheme
            OutUserText(pio       := pio,
                        dIndex    := TouchCalib_TextIdxCalibFailed, 
                        pDefText  := TouchCalib_TextCalibFailed);
                        
            // calibration not successfull! -> start again
            //--------------------------------------------------
            State := 0;
            
          end_if;
           
           
    end_case;
  
  end_if;
  
  retcode := _IDIDIT;
  
END_FUNCTION


FUNCTION TouchCalib::DrawDefaultCrosshair
	VAR_INPUT
		Room 	: _ROOM;
	END_VAR
  
  // draw a crosshair according to the room
  //----------------------------------------------------------------
  // horizontal line
  coGrafix.Line(x0      := Room.xy1.x, 
                y0      := Room.xy1.y + (TouchCalib_CrosshairSize / 2), 
                x1      := Room.xy2.x, 
                y1      := Room.xy1.y + (TouchCalib_CrosshairSize / 2), 
                attrib  := TouchCalib_StdTextAttrib, 
                color   := BLACK);
  // vertical line
  coGrafix.Line(x0      := Room.xy1.x + (TouchCalib_CrosshairSize / 2), 
                y0      := Room.xy1.y, 
                x1      := Room.xy1.x + (TouchCalib_CrosshairSize / 2), 
                y1      := Room.xy2.y, 
                attrib  := TouchCalib_StdTextAttrib, 
                color   := BLACK);
  
END_FUNCTION


FUNCTION TouchCalib::OutUserText
	VAR_INPUT
		pio 	: ^_IO;
		dIndex 	: DINT;
		pDefText 	: ^CHAR;
	END_VAR
  VAR
  	pString   : ^_CHAR;
    tmpString : ARRAY[0..255] of _CHAR;
  END_VAR

  // check strings
  if pDefText = NIL | pio = NIL then
    TRACE("TouchCalib::OutUserText(): Invalid data");
    return;
  end_if;

  // get text in textscheme
  //--------------------------------------------------
  pString$^void := NewDoScheme( x0 := sTouchData.Textscheme.list, 
                                x1 := dIndex, 
                                x2 := sTouchData.Textscheme.no);
  
  // check if text is valid
  //--------------------------------------------------
  if pString = NIL then
  
    // default-text
    StrNCpy(p0 := #tmpString[0], 
            x1 := sizeof(tmpString[0]), 
            p2 := pDefText, 
            x3 := sizeof(pDefText^), 
            ml := sizeof(tmpString) / sizeof(tmpString[0]));
            
  else
  
    // text from scheme
    StrNCpy(p0 := #tmpString[0], 
            x1 := sizeof(tmpString[0]), 
            p2 := pString, 
            x3 := sizeof(pString^), 
            ml := sizeof(tmpString) / sizeof(tmpString[0]));
            
  end_if;
    
  // show text
  //--------------------------------------------------
  OutTextAlign(p0 := #tmpString[0], 
               x1 := 0, 
               p1 := #pio^.space, 
               x2 := pio^.font, 
               x3 := sTouchData.Attribute, 
               x9 := pio^.frametype, 
               x4 := sTouchData.TxtCol, 
               x5 := sTouchData.BgCol, 
               x6 := sTouchData.FrameCol, 
               x7 := sizeof(tmpString[0]));
  
END_FUNCTION

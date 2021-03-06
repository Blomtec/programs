//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "RecipeHandle"
	Revision           = "2.0"
	GUID               = "{A26A2286-A0FC-4F81-B7F1-FDBDBC4111A0}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "true"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(510,180)">
	<Channels>
		<Server Name="ClassSvr" GUID="{B71237A1-7CDA-4B4D-88CD-3636E91BB484}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="DeleteProgNbr" GUID="{1E4DFB6A-095F-4A34-B9B4-86E03AEB29E7}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="Filter" GUID="{8744C52F-3E64-42ED-B1E4-CD8A63055127}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="File" Comment="Which bit number do we wanna save&#13;&#10;"/>
		<Server Name="ListNbr" GUID="{8A9D9B9C-512D-428D-9BA4-98D4D606D8CD}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="LoadProgNbr" GUID="{7BF1DA11-141F-4212-A01B-AD6DB4186EDC}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="PageDown" GUID="{F501F811-688D-4F02-94C5-76B0EFA73EE2}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="PageUp" GUID="{84405422-E30D-46DA-8217-A093879583CF}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="SaveProgNbr" GUID="{762A530D-922B-48A6-B3EF-9AAC0100F77A}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="Slider" GUID="{D3EB8DD5-E45C-40CC-900B-E4E66756194D}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Client Name="ActRecipeName" Required="true" Internal="false"/>
		<Client Name="ActRecipeNbr" Required="true" Internal="false"/>
		<Client Name="FileOs" Required="false" Internal="false"/>
		<Client Name="RecipeChain" Required="true" Internal="false"/>
		<Client Name="Standard1" Required="true" Internal="true"/>
		<Client Name="StringHelper" Required="true" Internal="true"/>
		<Client Name="SystemLogIn" Required="true" Internal="false"/>
	</Channels>
	<Network Name="RecipeHandle">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name           = "Standard1"
				GUID           = "{A44BCAB9-6A1B-4C08-AB69-0D701898FDD5}"
				Class          = "Standard"
				Position       = "(240,150)"
				Visualized     = "false"
				BackgroundTime = "1000 ms">
				<Channels>
					<Server Name="ClassSvr"/>
				</Channels>
			</Object>
			<Object
				Name       = "StringHelper"
				GUID       = "{D4F6132B-EEDD-4EB0-B985-79FFCC45B2C6}"
				Class      = "StringBaseGB"
				Position   = "(240,330)"
				Visualized = "true">
				<Channels>
					<Server Name="Command"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="this.StringHelper" Destination="StringHelper.Command"/>
			<Connection Source="this.Standard1" Destination="Standard1.ClassSvr"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
RecipeHandle : CLASS
  //Servers:
	ClassSvr 	: SvrChCmd_DINT;
	Filter 	: SvrCh_UDINT;
	ListNbr 	: SvrCh_DINT;
	PageUp 	: SvrCh_DINT;
	PageDown 	: SvrCh_DINT;
	LoadProgNbr 	: SvrCh_DINT;
	SaveProgNbr 	: SvrCh_DINT;
	DeleteProgNbr 	: SvrCh_DINT;
	Slider 	: SvrCh_DINT;
  //Clients:
	ActRecipeNbr 	: CltCh_DINT;
	ActRecipeName 	: CltChCmd_RecipeName;
	RecipeChain 	: CltChCmd_RecipeName;
	SystemLogIn 	: CltChCmd_AccessControlMain;
	StringHelper 	: CltChCmd_StringBaseGB;
	FileOs 	: CltChCmd__FileSys;
	Standard1 	: CltChCmd_Standard;
  //Variables:
		MaxRecipeList 	: DINT;
		Destination : ARRAY [0..cMaxAsciiLine] OF CHAR;

		RecipeNumber : ARRAY [0..100] OF CHAR;

		RecipeName : ARRAY [0..cMaxAsciiLine] OF CHAR;

		InfoStr 	: _DDE_INFO;
		RecipeDateTime 	: DateTime;
		SearchFor : ARRAY [0..100] OF CHAR;

		SearchNbr : ARRAY [0..10] OF CHAR;

		RecipeDate : ARRAY [0..40] OF CHAR;

		RecipeTime : ARRAY [0..40] OF CHAR;

		TextLine : ARRAY [0..40] OF CHAR;

		DateLine : ARRAY [0..40] OF CHAR;

		TimeLine : ARRAY [0..40] OF CHAR;

		NameArray : ARRAY [0..99] OF CHAR;

		XFilter 	: UDINT;
		SaveProgNbrOld 	: DINT;
		RecipeNameArray : ARRAY [0..40] OF CHAR;

		ActNameArray : ARRAY [0..40] OF CHAR;

		OldActNameArray : ARRAY [0..40] OF CHAR;

		Slide 	: DINT;
		cntrrrr 	: DINT;
		FileIsloaded 	: BOOL;
		ProgramIsLoaded 	: DINT;
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL Init;
	
	FUNCTION VIRTUAL GLOBAL Background
		VAR_INPUT
			EAX 	: UDINT;
		END_VAR
		VAR_OUTPUT
			state (EAX) 	: UDINT;
		END_VAR;
	
	FUNCTION GLOBAL ReadActRecipe
		VAR_OUTPUT
			Nbr 	: DINT;
		END_VAR;
	
	FUNCTION ConvToDate
		VAR_INPUT
			dde_dt 	: _DDE_DATIM;
		END_VAR
		VAR_OUTPUT
			DT_struct 	: DateTime;
		END_VAR;
	
	FUNCTION GLOBAL UpdateRecipes;
	
	FUNCTION GLOBAL MakeFileName
		VAR_INPUT
			FileNbr 	: DINT;
			ReadActRecipe 	: BOOL;
		END_VAR;
	
	FUNCTION GLOBAL CheckExistProg
		VAR_INPUT
			Number 	: DINT;
		END_VAR
		VAR_OUTPUT
			State 	: BOOL;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL PageUp::Write
		VAR_INPUT
			input (EAX) 	: DINT;
		END_VAR
		VAR_OUTPUT
			result (EAX) 	: DINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL PageDown::Write
		VAR_INPUT
			input (EAX) 	: DINT;
		END_VAR
		VAR_OUTPUT
			result (EAX) 	: DINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL LoadProgNbr::Write
		VAR_INPUT
			input (EAX) 	: DINT;
		END_VAR
		VAR_OUTPUT
			result (EAX) 	: DINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL SaveProgNbr::Write
		VAR_INPUT
			input (EAX) 	: DINT;
		END_VAR
		VAR_OUTPUT
			result (EAX) 	: DINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL DeleteProgNbr::Write
		VAR_INPUT
			input (EAX) 	: DINT;
		END_VAR
		VAR_OUTPUT
			result (EAX) 	: DINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL Slider::Write
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

#pragma using Standard
#pragma using StringBaseGB
#pragma usingLtd _FileSys
#pragma usingLtd AccessControlMain
#pragma usingLtd RecipeName


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB RecipeHandle::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_RECIPEHANDLE
2$UINT, 0$UINT, (SIZEOF(::RecipeHandle))$UINT, 
9$UINT, 7$UINT, 0$UINT, 
TO_UDINT(2560184650), "RecipeHandle", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::RecipeHandle.ClassSvr.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(619352855), "ClassSvr", 
(::RecipeHandle.Filter.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000011000$UINT, TO_UDINT(2403113115), "Filter", 
(::RecipeHandle.ListNbr.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(811731884), "ListNbr", 
(::RecipeHandle.PageUp.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(82448359), "PageUp", 
(::RecipeHandle.PageDown.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(1528306972), "PageDown", 
(::RecipeHandle.LoadProgNbr.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(1065873272), "LoadProgNbr", 
(::RecipeHandle.SaveProgNbr.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(407617760), "SaveProgNbr", 
(::RecipeHandle.DeleteProgNbr.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3009393826), "DeleteProgNbr", 
(::RecipeHandle.Slider.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(1061148545), "Slider", 
//Clients:
(::RecipeHandle.ActRecipeNbr.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(3873189700), "ActRecipeNbr", 
(::RecipeHandle.ActRecipeName.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(1795142643), "ActRecipeName", TO_UDINT(1770004111), "RecipeName", 0$UINT, 0$UINT, 
(::RecipeHandle.RecipeChain.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(507486438), "RecipeChain", TO_UDINT(1770004111), "RecipeName", 0$UINT, 0$UINT, 
(::RecipeHandle.SystemLogIn.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(1810012693), "SystemLogIn", TO_UDINT(1830373904), "AccessControlMain", 2$UINT, 17$UINT, 
(::RecipeHandle.StringHelper.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(1278313889), "StringHelper", TO_UDINT(624710835), "StringBaseGB", 0$UINT, 0$UINT, 
(::RecipeHandle.FileOs.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000000$UINT, TO_UDINT(523274688), "FileOs", TO_UDINT(545279513), "_FileSys", 1$UINT, 18$UINT, 
(::RecipeHandle.Standard1.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(2411475140), "Standard1", TO_UDINT(3603188683), "Standard", 6$UINT, 1$UINT, 
END_FUNCTION


#define USER_CNT_RecipeHandle 1

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_RecipeHandle] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION RecipeHandle::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_RecipeHandle, pCmd := #vmt.CmdTable);
	vmt.CmdTable.Init		:= #Init();
#pragma warning (disable : 74)
	vmt.UserFcts[0]		:= #Background();

#pragma warning (default : 74)
	ClassSvr.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF ClassSvr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	Filter.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF Filter.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	ListNbr.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF ListNbr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	PageUp.pMeth			:= StoreMethod( #M_RD_DIRECT(), #PageUp::Write() );
	IF PageUp.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	PageDown.pMeth			:= StoreMethod( #M_RD_DIRECT(), #PageDown::Write() );
	IF PageDown.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	LoadProgNbr.pMeth			:= StoreMethod( #M_RD_DIRECT(), #LoadProgNbr::Write() );
	IF LoadProgNbr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	SaveProgNbr.pMeth			:= StoreMethod( #M_RD_DIRECT(), #SaveProgNbr::Write() );
	IF SaveProgNbr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	DeleteProgNbr.pMeth			:= StoreMethod( #M_RD_DIRECT(), #DeleteProgNbr::Write() );
	IF DeleteProgNbr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	Slider.pMeth			:= StoreMethod( #M_RD_DIRECT(), #Slider::Write() );
	IF Slider.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION

FUNCTION VIRTUAL GLOBAL RecipeHandle::Init

  // make libary toolcat if there is none
  if FileExist(dpne:= "Toolcat") = false then
    FileOs.CreateDirectory(dirname:= "Toolcat");
  end_if;

  if _FirstScan = 1 then
    LoadProgNbr := -1;
    SaveProgNbr := -1;
    SaveProgNbrOld := -1;
    // read amout of recipe chain
    MaxRecipeList := RecipeChain.MyInit(Number:= ListNbr);

    if ActRecipeNbr.Read() >= (MaxNbrRecipeList - MaxRecipeList) then
      ListNbr := (MaxNbrRecipeList - MaxRecipeList);
    else
      ListNbr := ActRecipeNbr.Read();
    end_if;
    Slider := ListNbr;
    RecipeChain.MyInit(Number:= ListNbr);
    UpdateRecipes(); // loading new recipes
  end_if;
          
END_FUNCTION

FUNCTION VIRTUAL GLOBAL RecipeHandle::Background
	VAR_INPUT
		EAX 	: UDINT;
	END_VAR
	VAR_OUTPUT
		state (EAX) 	: UDINT;
	END_VAR
    
  // Rename file
  ActRecipeNbr := ActRecipeNbr.Read();
   
  // When the machine is started or when PLC becomes later online, load ones the recipes
  if SystemLogIn.ReloadRecipe(ReadValue:= 0) <> 0 then
    if LoadProgNbr.Write(input:= ActRecipeNbr) = True then // Load last program
      SystemLogIn.ReloadRecipe(ReadValue:= 1);
      ProgramIsLoaded := 1; 
    end_if;
  end_if;


  // Save Recipe when nbr is changed
  if SaveProgNbr <> SaveProgNbrOld then
    // Check if this number is already used, delete programnummer
    if CheckExistProg(Number:= SaveProgNbr) = True then
      MakeFileName(FileNbr:= SaveProgNbr, ReadActRecipe:= FALSE);
      FileOs.FileDelete(filename:= #NameArray[0]);
    end_if;
    // Save toolcat
    MakeFileName(FileNbr:= SaveProgNbr, ReadActRecipe:= true);
    XFilter := Filter;
    save_toolcat(p0:= #NameArray[0], p1:= #XFilter);
    UpdateRecipes(); // loading new recipes
    
    LoadProgNbr.Write(input:=SaveProgNbr);

    SaveProgNbr := -1;
    SaveProgNbrOld := SaveProgNbr;
  end_if; 
  
  // When actual name is changed -> reset arrays
  ActRecipeName.ReadName(Nbr:= ActRecipeNbr, Dest:= #ActNameArray[0], MaxSize:= 40);
  if StrCmp(p0:= #ActNameArray, x1:= sizeof(_ASCII), p2:= #OldActNameArray, x3:= sizeof(_ASCII)) = TRUE then 
    StrFill(p0:= #ActNameArray, x1:= 0, x2:= 1, x3:= StrSize(p0:= #ActNameArray, x1:= 1));  // Set ActNameArray to '0' 
    ActRecipeName.ReadName(Nbr:= ActRecipeNbr, Dest:= #ActNameArray[0], MaxSize:= 40);
  
    StrFill(p0:= #RecipeNameArray, x1:= 0, x2:= 1, x3:= StrSize(p0:= #RecipeNameArray, x1:= 1));  // Set RecipeNameArray to '0'    
    RecipeChain.ReadName(Nbr:= ActRecipeNbr, Dest:= #RecipeNameArray[0], MaxSize:= 40);  
    
    // When the actual recipe name is different then recipe name 
    if StrCmp(p0:= #ActNameArray, x1:= sizeof(_ASCII), p2:= #RecipeNameArray, x3:= sizeof(_ASCII)) = True then 
      // First read recipe name and copy to another string array
      MakeFileName(FileNbr:= ActRecipeNbr, ReadActRecipe:= false);
      StrCpy(p0:= #RecipeNameArray, x1:= sizeof(_ASCII), p2:= #NameArray, x3:= sizeof(_ASCII));
      MakeFileName(FileNbr:= ActRecipeNbr, ReadActRecipe:= true);
      FileOs.RenameFile_Dir(actname:= #RecipeNameArray[0], newname:= #NameArray[0]);
      UpdateRecipes(); // loading new recipes
    end_if;
    StrCpy(p0:= #OldActNameArray, x1:= sizeof(_ASCII), p2:= #ActNameArray, x3:= sizeof(_ASCII));
  end_if;
  
  
	state := READY;

END_FUNCTION

FUNCTION VIRTUAL GLOBAL RecipeHandle::PageUp::Write
	VAR_INPUT
		input (EAX) 	: DINT;
	END_VAR
	VAR_OUTPUT
		result (EAX) 	: DINT;
	END_VAR

  // Recipe page up
	PageUp := input;
  
  if (ListNbr + (MaxRecipeList * 2)) <= MaxNbrRecipeList then
    ListNbr += MaxRecipeList;
  else
    ListNbr := (MaxNbrRecipeList - MaxRecipeList);
  end_if;
  RecipeChain.MyInit(Number:= ListNbr);
  
  UpdateRecipes(); // loading new recipes
  PageUp := 0;
  
  Slider := ListNbr;
	result := PageUp;

END_FUNCTION

FUNCTION VIRTUAL GLOBAL RecipeHandle::PageDown::Write
	VAR_INPUT
		input (EAX) 	: DINT;
	END_VAR
	VAR_OUTPUT
		result (EAX) 	: DINT;
	END_VAR

  // Recipe page down
	PageDown := input;
  
  if (ListNbr - MaxRecipeList) >= 0 then
    ListNbr -= MaxRecipeList;
  else
    ListNbr := 0;
  end_if;
  RecipeChain.MyInit(Number:= ListNbr);
  UpdateRecipes(); // loading new recipes
  PageDown := 0;
  
  Slider := ListNbr;
	result := PageDown;

END_FUNCTION

FUNCTION VIRTUAL GLOBAL RecipeHandle::Slider::Write
	VAR_INPUT
		input (EAX) 	: DINT;
	END_VAR
	VAR_OUTPUT
		result (EAX) 	: DINT;
	END_VAR

	Slider := input;
  
  ListNbr := Slider;
  RecipeChain.MyInit(Number:= ListNbr);
  UpdateRecipes(); // loading new recipes
  
	result := Slider;

END_FUNCTION

FUNCTION VIRTUAL GLOBAL RecipeHandle::LoadProgNbr::Write
	VAR_INPUT
		input (EAX) 	: DINT;
	END_VAR
	VAR_OUTPUT
		result (EAX) 	: DINT;
	END_VAR
  VAR
  	SetZeroArray      : ARRAY[0..40] OF CHAR; 
  END_VAR

  FileIsloaded := False;

  // Loading a new program
	LoadProgNbr := input;

  // Set string array to '0' 
  StrFill(p0:=#SetZeroArray, x1:= 0, x2:= 1, x3:= StrSize(p0:= #SetZeroArray, x1:= 1));    
  StrFill(p0:=#TextLine, x1:= 0, x2:= 1, x3:= StrSize(p0:= #TextLine, x1:= 1));  // Set textline to '0' 
  StrFill(p0:=#DateLine, x1:= 0, x2:= 1, x3:= StrSize(p0:= #DateLine, x1:= 1));  // Set textline to '0' 
  StrFill(p0:=#TimeLine, x1:= 0, x2:= 1, x3:= StrSize(p0:= #TimeLine, x1:= 1));  // Set textline to '0' 
  
  // Set data to actual recipe
  ActRecipeName.WriteNbr(Nbr:= LoadProgNbr);
  ActRecipeNbr.Write(input:= LoadProgNbr);
  
  // Set name to actual recipe name
  RecipeChain.ReadName(Nbr:= LoadProgNbr, Dest:= #TextLine[0], MaxSize:= 40);
  // is there a name, else set "No Name" 
  if StrCmp(p0:= #TextLine, x1:= 1, p2:= #SetZeroArray, x3:= 1) = false then 
    StrCpy(p0:= #TextLine, x1:= sizeof(_ASCII), p2:= "[No name]", x3:= sizeof(_ASCII));
  end_if;
  ActRecipeName.WriteName(Nbr:= LoadProgNbr, 
                          Name:= #TextLine[0], 
                          Lenght:= 40);
  // Set date to actual recipe name
  RecipeChain.ReadDate(Nbr:= LoadProgNbr, Dest:= #DateLine[0], MaxSize:= 40);
  ActRecipeName.WriteDate(Nbr:= LoadProgNbr, 
                          Dates:= #DateLine[0], 
                          Lenght:= 40);
  // Set date to actual recipe name
  RecipeChain.ReadTime(Nbr:= LoadProgNbr, Dest:= #TimeLine[0], MaxSize:= 40);
  ActRecipeName.WriteTime(Nbr:= LoadProgNbr, 
                          Times:= #TimeLine[0], 
                          Lenght:= 40);


  // Load toolcat file
  MakeFileName(FileNbr:= LoadProgNbr, ReadActRecipe:= true);
  XFilter := Filter;
  FileIsloaded := load_toolcat(p0:= #NameArray[0], p1:= #XFilter);
  
  // Set loadProgNbr to -1
  LoadProgNbr := -1;
	result      := FileIsloaded;

END_FUNCTION

FUNCTION GLOBAL RecipeHandle::ReadActRecipe
	VAR_OUTPUT
		Nbr 	: DINT;
	END_VAR
  
  Nbr := ActRecipeNbr.Read();

END_FUNCTION

FUNCTION VIRTUAL GLOBAL RecipeHandle::SaveProgNbr::Write
	VAR_INPUT
		input (EAX) 	: DINT;
	END_VAR
	VAR_OUTPUT
		result (EAX) 	: DINT;
	END_VAR

	SaveProgNbr := input; 
	result := SaveProgNbr;

END_FUNCTION

FUNCTION VIRTUAL GLOBAL RecipeHandle::DeleteProgNbr::Write
	VAR_INPUT
		input (EAX) 	: DINT;
	END_VAR
	VAR_OUTPUT
		result (EAX) 	: DINT;
	END_VAR

	DeleteProgNbr := input;
  MakeFileName(FileNbr:= DeleteProgNbr, ReadActRecipe:= true);
  FileOs.FileDelete(filename:= #NameArray[0]);
  
  // reload recipe nbr
  UpdateRecipes(); // loading new recipes
  LoadProgNbr.Write(input:= DeleteProgNbr); 
	result := DeleteProgNbr;

END_FUNCTION

FUNCTION GLOBAL RecipeHandle::UpdateRecipes
  VAR
  	i                 : Dint;
    SizeOfTextArray   : Dint;
    SizeOfNumberArray : Dint;
    Handle            : Dint;
    SetZeroArray      : ARRAY[0..40] OF CHAR; 
  END_VAR
  
  // Set string array to '0' 
  StrFill(p0:=#SearchFor, x1:= 0, x2:= 1, x3:= StrSize(p0:= #SearchFor, x1:= 1));
  StrFill(p0:=#SetZeroArray, x1:= 0, x2:= 1, x3:= StrSize(p0:= #SetZeroArray, x1:= 1));
  StrFill(p0:=#RecipeName, x1:= 0, x2:= 1, x3:= StrSize(p0:= #RecipeName, x1:= 1));

  // Check listnbr.. 
  if ListNbr >= (MaxNbrRecipeList - MaxRecipeList) then
    ListNbr := (MaxNbrRecipeList - MaxRecipeList);
  end_if;
  
  for i := ListNbr to (ListNbr + MaxRecipeList) do 
    StrCpy(p0:= #SearchFor, x1:= sizeof(_ASCII), p2:= "c:\Toolcat\", x3:= sizeof(_ASCII));
    SizeOfTextArray := StrSize(p0:=#SearchFor, x1:= 1);
    
    DToA(p0:= #SearchNbr[0], x1:= i, x2:= 16#800, x3:= 1);
    SizeOfNumberArray := StrSize(p0:=#SearchNbr, x1:= 1);
    StrCpy(p0:= #SearchFor[SizeOfTextArray], x1:= sizeof(_ASCII), p2:= #SearchNbr[0], x3:= sizeof(_ASCII));
    SearchFor[SizeOfTextArray + SizeOfNumberArray] := '.';
    SearchFor[SizeOfTextArray + SizeOfNumberArray + 1] := '*';
    
    // Get information of recipes
    Handle := FileOs.FindFirstEx(namepattern:= #SearchFor[0], attr0:= 0, attrmask:= 0, fileinfo:= #InfoStr, filename:= #RecipeName[0], maxlength:= 255);
    
    if Handle >= 0 then // Do we found something??? Look if the founded recipe is equal to listnbr
      // Write name to recipe (do not write the numbers + .)
      RecipeChain.WriteName(Nbr:= i, Name:= #RecipeName[SizeOfNumberArray + 1], Lenght:= 40);

      // Write date and time to recipe
      RecipeDateTime := ConvToDate(dde_dt:= InfoStr.DateTime); // convert time and date
      StrNCpy(p0:= #RecipeDate[0], x1:= sizeof(_ASCII), p2:= #RecipeDateTime.Str[0], x3:= sizeof(_ASCII), ml:= 11);
      // Write date to recipe
      RecipeChain.WriteDate(Nbr:= i, Dates:= #RecipeDate[0], Lenght:= 40);
      
      StrCpy(p0:= #RecipeTime[0], x1:= sizeof(_ASCII), p2:= #RecipeDateTime.Str[11], x3:= sizeof(_ASCII));
      // Write time to recipe
      RecipeChain.WriteTime(Nbr:= i, Times:= #RecipeTime[0], Lenght:= 40);
    else
      // Write '0' name to recipe
      RecipeChain.WriteName(Nbr:= i, Name:= #SetZeroArray[0], Lenght:= 40);
      // Write '0' date to recipe
      RecipeChain.WriteDate(Nbr:= i, Dates:= #SetZeroArray[0], Lenght:= 40);
      // Write '0' time to recipe
      RecipeChain.WriteTime(Nbr:= i, Times:= #SetZeroArray[0], Lenght:= 40);
    end_if;
    FileOs.FindClose(handle:= Handle);
  end_for;

END_FUNCTION

FUNCTION GLOBAL RecipeHandle::MakeFileName
	VAR_INPUT
		FileNbr 	: DINT;
		ReadActRecipe 	: BOOL;
	END_VAR
  VAR
    SizeOfTextArray   : Dint;
    SizeOfNumberArray : Dint;
    DeleteNbrArray    : ARRAY[0..40] OF CHAR;
  END_VAR

  // Set string array to '0' 
  _memset(#NameArray, 0, sizeof(NameArray)); // Set array to '0'

  // Build string name
  // Set "Toolcat" in array
  StrCpy(p0:= #NameArray, x1:= sizeof(_ASCII), p2:= "C:\Toolcat\", x3:= sizeof(_ASCII));
  SizeOfTextArray := StrSize(p0:=#NameArray, x1:= 1);
  // set number in array
  DToA(p0:= #DeleteNbrArray[0], x1:= FileNbr, x2:= 16#800, x3:= 1);
  SizeOfNumberArray := StrSize(p0:=#DeleteNbrArray, x1:= 1);
  StrCpy(p0:= #NameArray[SizeOfTextArray], x1:= sizeof(_ASCII), p2:= #DeleteNbrArray[0], x3:= sizeof(_ASCII));
  // Set point in array
  NameArray[SizeOfTextArray + SizeOfNumberArray] := '.';
  // Set name in array
  if ReadActRecipe = true then
    ActRecipeName.ReadName(Nbr:= ActRecipeNbr.Read(), Dest:= #NameArray[SizeOfTextArray + SizeOfNumberArray + 1], MaxSize:= 40); 
  else
    ListNbr := FileNbr;
    // Check listnbr..
    if ListNbr >= (MaxNbrRecipeList - MaxRecipeList) then
      ListNbr := (MaxNbrRecipeList - MaxRecipeList);
    end_if;
    RecipeChain.MyInit(Number:= ListNbr);
    UpdateRecipes(); // loading new recipes
    RecipeChain.ReadName(Nbr:= FileNbr, Dest:= #NameArray[SizeOfTextArray + SizeOfNumberArray + 1], MaxSize:= 40);
  end_if;
  
END_FUNCTION

FUNCTION RecipeHandle::ConvToDate
	VAR_INPUT
		dde_dt 	: _DDE_DATIM;
	END_VAR
	VAR_OUTPUT
		DT_struct 	: DateTime;
	END_VAR
  VAR
    dde_udint:udint;
  END_VAR;
  
  // Convert to date
    dde_udint:=dde_dt$udint;
  
  // read date time data
  DT_struct.Year    := (dde_udint AND 2#11111110000000000000000000000000) shr 25;
  DT_struct.Year    += 1980;
  DT_struct.Month   := (dde_udint AND 2#00000001111000000000000000000000) shr 21;
  DT_struct.Day     :=   (dde_udint AND 2#00000000000111110000000000000000) shr 16;
  DT_struct.Hour    := (dde_udint AND 2#00000000000000001111100000000000) shr 11;
  DT_struct.Minute  := (dde_udint AND 2#00000000000000000000011111100000) shr 5;

  //write date time data in a string
  if DT_struct.Day < 10 then                
    DtoA(#dt_struct.str[1],to_DINT(DT_struct.Day), 0x0800,sizeof(_ASCII));
    dt_struct.str[0] := '0';
  else       
    DtoA(#dt_struct.str[0],to_DINT(DT_struct.Day), 0x0800,sizeof(_ASCII));
  end_if;
  dt_struct.str[2] := '.';
  if DT_struct.Month < 10 then         
    DtoA(#dt_struct.str[4],to_DINT(DT_struct.Month), 0x0800,sizeof(_ASCII));
    dt_struct.str[3] := '0';
  else       
    DtoA(#dt_struct.str[3],to_DINT(DT_struct.Month), 0x0800,sizeof(_ASCII));
  end_if;
  dt_struct.str[5] := '.';
  DtoA(#dt_struct.str[6],to_DINT(DT_struct.Year), 0x0800,sizeof(_ASCII));
  dt_struct.str[10] := 32;
  dt_struct.str[11] := 32;

  if DT_struct.Hour < 10 then             
    DtoA(#dt_struct.str[13],to_DINT(DT_struct.Hour), 0x0800,sizeof(_ASCII));
    dt_struct.str[12] := '0';
  else       
    DtoA(#dt_struct.str[12],to_DINT(DT_struct.Hour), 0x0800,sizeof(_ASCII));
  end_if;
  dt_struct.str[14] := ':';
  if DT_struct.Minute < 10 then      
     DtoA(#dt_struct.str[16],to_DINT(DT_struct.Minute), 0x0800,sizeof(_ASCII));
     dt_struct.str[15] := '0';
  else       
     DtoA(#dt_struct.str[15],to_DINT(DT_struct.Minute), 0x0002,sizeof(_ASCII));
  end_if;
  dt_struct.str[17] := 0;

END_FUNCTION

FUNCTION GLOBAL RecipeHandle::CheckExistProg
	VAR_INPUT
		Number 	: DINT;
	END_VAR
	VAR_OUTPUT
		State 	: BOOL;
	END_VAR
  VAR
    CheckArray        : ARRAY[0..40] OF CHAR;
    CheckNbrArray     : ARRAY[0..40] OF CHAR;
    FoundName         : ARRAY[0..40] OF CHAR;
    InfoProgArray     : _DDE_INFO;
    SizeOfTextArray   : Dint;
    SizeOfNumberArray : Dint;
    Handle            : Dint;
  END_VAR
  
  // Set string array to '0' 
  StrFill(p0:=#CheckArray, x1:= 0, x2:= 1, x3:= StrSize(p0:= #CheckArray, x1:= 1));

  StrCpy(p0:= #CheckArray, x1:= sizeof(_ASCII), p2:= "c:\Toolcat\", x3:= sizeof(_ASCII));
  SizeOfTextArray := StrSize(p0:=#CheckArray, x1:= 1);
  
  DToA(p0:= #CheckNbrArray[0], x1:= Number, x2:= 16#800, x3:= 1);
  SizeOfNumberArray := StrSize(p0:=#CheckNbrArray, x1:= 1);
  StrCpy(p0:= #CheckArray[SizeOfTextArray], x1:= sizeof(_ASCII), p2:= #CheckNbrArray[0], x3:= sizeof(_ASCII));
  
  CheckArray[SizeOfTextArray + SizeOfNumberArray] := '*';
  
  // Get information of recipes
  Handle := FileOs.FindFirstEx(namepattern:= #CheckArray[0], attr0:= 0, attrmask:= 0, fileinfo:= #InfoProgArray, filename:= #FoundName[0], maxlength:= 255);
  
  if Handle >= 0 then // Do we found something???
    State := TRUE;
  else
    State := FALSE;
  end_if;

END_FUNCTION

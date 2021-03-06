//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "Management"
	Revision           = "0.0"
	GUID               = "{DB16A0FA-CF66-4FE3-A581-A0EAFAFEC0BA}"
	RealtimeTask       = "true"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(1080,120)">
	<Channels>
		<Server Name="__________" GUID="{EF9D65DF-7208-49DF-AE10-1FFB5140C95A}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="___________" GUID="{EFC37348-486A-49A3-93ED-31A4DAF2CF91}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="AlarmActive" GUID="{2CDFED48-C1FD-4B02-8206-1302D43CD0BD}" Visualized="true" Remotely="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="ClassSvr" GUID="{5E8182F8-D09B-4F77-A4C3-9946EE153CFF}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="CleaningMode" GUID="{272A3758-732B-435E-B0F3-55AF325352CC}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="Line_Runstatus" GUID="{44BE6A10-9B48-4E2E-AD12-3858F797BB37}" Visualized="true" Remotely="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="Line_Speed" GUID="{4190424A-D1CD-48DE-ABB9-3E0216435DFC}" Visualized="true" Remotely="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="Line_Started" GUID="{588381BE-B378-4650-AED9-7B63624D26FF}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="Line_StartingUp" GUID="{28F81FF7-978A-4F63-9AE9-3C95EE1329C2}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="Line_Stopped" GUID="{35B57180-FC4A-4951-8A21-EEA71DE5A63D}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="OverruleSafetyVI51" GUID="{A61B22B7-9445-48D1-89CD-876F57191DEB}" Visualized="true" Remotely="true" Initialize="true" WriteProtected="false" Retentive="File"/>
		<Server Name="ResetSignal" GUID="{CF6BBB62-AD4D-45B2-8940-7663349811FA}" Visualized="true" Remotely="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Client Name="Comm_Terminal" Required="true" Internal="false"/>
		<Client Name="iActRunStatus_VI49" Required="true" Internal="false"/>
		<Client Name="iActRunStatus_VI51" Required="true" Internal="false"/>
		<Client Name="iSafetyOK" Required="true" Internal="false"/>
		<Client Name="iStart" Required="true" Internal="false"/>
		<Client Name="iStop" Required="true" Internal="false"/>
		<Client Name="oResetAlarm" Required="true" Internal="false"/>
		<Client Name="Standard3" Required="true" Internal="true"/>
	</Channels>
	<Network Name="Management">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name           = "Standard3"
				GUID           = "{9D819DE2-3FF4-4DE0-A9C6-B738A816DB0E}"
				Class          = "Standard"
				Position       = "(300,390)"
				Visualized     = "false"
				BackgroundTime = "1000 ms">
				<Channels>
					<Server Name="ClassSvr"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="this.Standard3" Destination="Standard3.ClassSvr"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
Management : CLASS
  //Servers:
	ClassSvr 	: SvrChCmd_DINT;
	Line_Started 	: SvrCh_DINT;
	Line_Stopped 	: SvrCh_DINT;
	Line_StartingUp 	: SvrCh_DINT;
	CleaningMode 	: SvrCh_DINT;
	__________ 	: SvrCh_DINT;
	Line_Runstatus 	: SvrCh_RunningStateEnum;
	Line_Speed 	: SvrCh_DINT;
	ResetSignal 	: SvrCh_DINT;
	AlarmActive 	: SvrCh_DINT;
	___________ 	: SvrCh_DINT;
	OverruleSafetyVI51 	: SvrCh_DINT;
  //Clients:
	iSafetyOK 	: CltCh_DINT;
	iStart 	: CltCh_DINT;
	iStop 	: CltCh_DINT;
	Comm_Terminal 	: CltChCmd_TerminalControl;
	oResetAlarm 	: CltChCmd_AlarmDisplayList2;
	iActRunStatus_VI51 	: CltCh_RunningStateEnum;
	iActRunStatus_VI49 	: CltCh_RunningStateEnum;
	Standard3 	: CltChCmd_Standard;
  //Variables:
		LineRunstatusArray : ARRAY [0..cNbrOfMachinesInLine] OF RunningStateEnum;

		j 	: DINT;
		HoldReset 	: DINT;
		TmrHold 	: UDINT;
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL RtWork
		VAR_INPUT
			EAX 	: UDINT;
		END_VAR
		VAR_OUTPUT
			state (EAX) 	: UDINT;
		END_VAR;
	
	FUNCTION GLOBAL CheckRunStatus
		VAR_INPUT
			InpStatus 	: RunningStateEnum;
		END_VAR
		VAR_OUTPUT
			OutputState 	: DINT;
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

#pragma using Standard
#pragma usingLtd AlarmDisplayList2
#pragma usingLtd TerminalControl


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB Management::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_MANAGEMENT
0$UINT, 0$UINT, (SIZEOF(::Management))$UINT, 
12$UINT, 8$UINT, 0$UINT, 
TO_UDINT(13731952), "Management", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::Management.ClassSvr.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(619352855), "ClassSvr", 
(::Management.Line_Started.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(1836465403), "Line_Started", 
(::Management.Line_Stopped.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(2135352013), "Line_Stopped", 
(::Management.Line_StartingUp.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(4286219901), "Line_StartingUp", 
(::Management.CleaningMode.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3810429396), "CleaningMode", 
(::Management.__________.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(705157791), "__________", 
(::Management.Line_Runstatus.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3654357393), "Line_Runstatus", 
(::Management.Line_Speed.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(4237410684), "Line_Speed", 
(::Management.ResetSignal.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(4224226979), "ResetSignal", 
(::Management.AlarmActive.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(165019020), "AlarmActive", 
(::Management.___________.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(1229728487), "___________", 
(::Management.OverruleSafetyVI51.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000011000$UINT, TO_UDINT(1452380760), "OverruleSafetyVI51", 
//Clients:
(::Management.iSafetyOK.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(1427264330), "iSafetyOK", 
(::Management.iStart.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(932878885), "iStart", 
(::Management.iStop.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(1028057403), "iStop", 
(::Management.Comm_Terminal.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(3135083357), "Comm_Terminal", TO_UDINT(74052286), "TerminalControl", 3$UINT, 2$UINT, 
(::Management.oResetAlarm.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(415226770), "oResetAlarm", TO_UDINT(3752654854), "AlarmDisplayList2", 0$UINT, 0$UINT, 
(::Management.iActRunStatus_VI51.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(2649002515), "iActRunStatus_VI51", 
(::Management.iActRunStatus_VI49.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(2317626208), "iActRunStatus_VI49", 
(::Management.Standard3.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(1639076328), "Standard3", TO_UDINT(3603188683), "Standard", 6$UINT, 1$UINT, 
END_FUNCTION


#define USER_CNT_Management 0

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_Management] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION Management::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_Management, pCmd := #vmt.CmdTable);
	vmt.CmdTable.RtWork		:= #RtWork();
	ClassSvr.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF ClassSvr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	CleaningMode.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF CleaningMode.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	Line_Speed.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF Line_Speed.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	ResetSignal.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF ResetSignal.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	OverruleSafetyVI51.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF OverruleSafetyVI51.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION
//

FUNCTION VIRTUAL GLOBAL Management::RtWork
	VAR_INPUT
		EAX 	: UDINT;
	END_VAR
	VAR_OUTPUT
		state (EAX) 	: UDINT;
	END_VAR
  
  // Read inputs & Runstatussen
  iSafetyOK          := iSafetyOK.Read();
  iStart             := iStart.Read();
  iStop              := iStop.Read();
  iActRunStatus_VI51 := iActRunStatus_VI51.Read();
  iActRunStatus_VI49 := iActRunStatus_VI49.Read();
  
  // Set all of the runstatussen in array
  LineRunstatusArray[1] := iActRunStatus_VI51;
  LineRunstatusArray[2] := iActRunStatus_VI49;

  
  // Check Safety Error
  AlarmActive := (Line_Runstatus = eNoodstopStatus | Line_Runstatus = eErrorStatus);
  
  // Set window start up
  if Standard3.R_TRIG(CLK:= Line_StartingUp) then
    Comm_Terminal.SelectWindowNbr(Nbr:= 105);
  elsif Standard3.F_TRIG(CLK:= Line_StartingUp) then
    Comm_Terminal.SelectWindow.Write(input:= -1);
  end_if;
  
  // Hold reset signal for at least 1000ms high
  if Standard3.TON(IN:= ResetSignal, PT:= 1000) then
    ResetSignal := 0;
  end_if;
  if ResetSignal = 1 then
    oResetAlarm.ResetData();
  end_if;
  if AlarmActive = 1 then // get alarm text
    oResetAlarm.HelpTxt.Write(input:= 0);
  end_if;
      
  // Runstatussen
  if CheckRunStatus(InpStatus:= eNoodstopStatus) = 1 then  // NOODSTOP
    Line_Started := 0;
    CleaningMode := 0;
    Line_StartingUp := 0;
    Line_Runstatus := eNoodstopStatus;
  elsif CheckRunStatus(InpStatus:= eErrorStatus) = 1 then // storing
    Line_Started := 0;
    CleaningMode := 0;
    Line_StartingUp := 0;
    Line_Runstatus := eErrorStatus;
  elsif iStop = 1 & (Line_Started = 1 | CleaningMode = 1) then // stop knop
    Line_Started := 0;
    CleaningMode := 0;
    Line_Runstatus := eStopStatus;
  elsif CleaningMode = 1 & Line_Started = 0 then  // machine in schoonmaak stand
    Line_Started := 0;
    Line_Runstatus := eCleaningStatus;
  elsif iStart = 1 & Line_Started = 0 then
    CleaningMode := 0;
    Line_Started := 1;
  else  
    if Line_StartingUp = 1 then
      Line_Started := 0;
      if CheckRunStatus(InpStatus:= eStopStatus) = 1 then
        Line_StartingUp := 0;
      else
        Line_Runstatus := eStartUpStatus;
      end_if;  
    elsif Line_Started = 1 then
      if CheckRunStatus(InpStatus:= eDriveOffStatus) = 1 then
        Line_Started := 0;  // na opstarten opnieuw start geven..
        Line_StartingUp := 1;
        Line_Runstatus := eStartUpStatus;
      else
        if Line_StartingUp = 0 then
          CleaningMode := 0;
          Line_Runstatus := eRunStatus;
        end_if;  
      end_if;
    else
      Line_Runstatus := eStopStatus;
    end_if;
  end_if;  
  Line_Stopped := (Line_Started = 0);


	state := READY;

END_FUNCTION


FUNCTION GLOBAL Management::CheckRunStatus
	VAR_INPUT
		InpStatus 	: RunningStateEnum;
	END_VAR
	VAR_OUTPUT
		OutputState 	: DINT;
	END_VAR
  VAR
  	i           : Dint;
  END_VAR

  OutputState := 0;
  j           := 0;
  
  Case InpStatus of 
    eNoodstopStatus:
      for i := 1 to cNbrOfMachinesInLine do
        if LineRunstatusArray[i] = eNoodstopStatus then
          OutputState := 1;
        end_if;   
      end_for;
     
    eErrorStatus: 
      for i := 1 to cNbrOfMachinesInLine do
        if LineRunstatusArray[i] = eErrorStatus then
          OutputState := 1;
        end_if;   
      end_for;
      
    eDriveOffStatus:
      for i := 1 to cNbrOfMachinesInLine do
        if LineRunstatusArray[i] = eDriveOffStatus then
          OutputState := 1;
        end_if;   
      end_for;
      
    eStopStatus: // All of the belts are equeal to stopstatus
      for i := 1 to cNbrOfMachinesInLine do
        if LineRunstatusArray[i] = eStopStatus then
          j += 1;
          if j >= cNbrOfMachinesInLine then
            OutputState := 1;
          end_if;
        end_if;   
      end_for;
    
  end_case; 

END_FUNCTION

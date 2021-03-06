//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "CalcDeltaSC"
	Revision           = "0.0"
	GUID               = "{6DE74B66-65AA-4F3B-95D7-3E40DE3AAB21}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(450,1320)">
	<Channels>
		<Server Name="OffsetZ" GUID="{E728A1BC-47FD-4C43-9E5C-CF7E184283B1}" Visualized="false" Initialize="false" WriteProtected="false" Retentive="false"/>
	</Channels>
	<Network Name="CalcDeltaSC">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name       = "_base"
				GUID       = "{4B623124-05C7-475D-8D26-88F19E29BCA4}"
				Class      = "CalcDelta"
				Position   = "(218,120)"
				Visualized = "true"
				Remotely   = "true">
				<Channels>
					<Server Name="ActPos1"/>
					<Server Name="ActPos2"/>
					<Server Name="ActPos3"/>
					<Server Name="ActPos4"/>
					<Server Name="ClassSvr"/>
					<Server Name="DragCalcDelay" Value="0"/>
					<Server Name="HeadRadius" Value="500000"/>
					<Server Name="MotorArm" Value="3200000"/>
					<Server Name="MotorRadius" Value="2000000"/>
					<Server Name="RobotArm" Value="8500000"/>
					<Server Name="RobotRotAxisZ"/>
					<Server Name="SetPos1_Control"/>
					<Server Name="SetPos2_Control"/>
					<Server Name="SetPos3_Control"/>
					<Server Name="SetPos4_Control"/>
					<Server Name="XW1"/>
					<Server Name="XW2"/>
					<Server Name="XW3"/>
					<Server Name="XW4"/>
					<Client Name="Ax101"/>
					<Client Name="Ax102"/>
					<Client Name="Ax103"/>
					<Client Name="Ax104"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="this.ClassSvr" Destination="_base.ClassSvr" Vertices="(946,210),(774,210),"/>
			<Connection Source="this.ActPos1" Destination="_base.ActPos1" Vertices="(946,270),(774,270),"/>
			<Connection Source="this.SetPos1_Control" Destination="_base.SetPos1_Control" Vertices="(946,330),(774,330),"/>
			<Connection Source="this.XW1" Destination="_base.XW1" Vertices="(946,390),(774,390),"/>
			<Connection Source="this.ActPos2" Destination="_base.ActPos2" Vertices="(946,450),(774,450),"/>
			<Connection Source="this.SetPos2_Control" Destination="_base.SetPos2_Control" Vertices="(946,510),(774,510),"/>
			<Connection Source="this.XW2" Destination="_base.XW2" Vertices="(946,570),(774,570),"/>
			<Connection Source="this.ActPos3" Destination="_base.ActPos3" Vertices="(946,630),(774,630),"/>
			<Connection Source="this.SetPos3_Control" Destination="_base.SetPos3_Control" Vertices="(946,690),(774,690),"/>
			<Connection Source="this.XW3" Destination="_base.XW3" Vertices="(946,750),(774,750),"/>
			<Connection Source="this.ActPos4" Destination="_base.ActPos4" Vertices="(946,810),(774,810),"/>
			<Connection Source="this.SetPos4_Control" Destination="_base.SetPos4_Control" Vertices="(946,870),(774,870),"/>
			<Connection Source="this.XW4" Destination="_base.XW4" Vertices="(946,930),(774,930),"/>
			<Connection Source="this.DragCalcDelay" Destination="_base.DragCalcDelay" Vertices="(946,990),(774,990),"/>
			<Connection Source="this.HeadRadius" Destination="_base.HeadRadius" Vertices="(946,1050),(774,1050),"/>
			<Connection Source="this.MotorRadius" Destination="_base.MotorRadius" Vertices="(946,1110),(774,1110),"/>
			<Connection Source="this.RobotArm" Destination="_base.RobotArm" Vertices="(946,1170),(774,1170),"/>
			<Connection Source="this.MotorArm" Destination="_base.MotorArm" Vertices="(946,1230),(774,1230),"/>
			<Connection Source="this.RobotRotAxisZ" Destination="_base.RobotRotAxisZ" Vertices="(946,1290),(774,1290),"/>
			<Connection Source="_base.Ax101" Destination="this.Ax101" Vertices="(218,210),(38,210),"/>
			<Connection Source="_base.Ax102" Destination="this.Ax102" Vertices="(218,270),(38,270),"/>
			<Connection Source="_base.Ax103" Destination="this.Ax103" Vertices="(218,330),(38,330),"/>
			<Connection Source="_base.Ax104" Destination="this.Ax104" Vertices="(218,390),(38,390),"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
#pragma using CalcDelta

CalcDeltaSC : CLASS
: CalcDelta
  //Servers:
	OffsetZ 	: SvrCh_DINT;
  //Clients:
  //Variables:
  //Functions:
				//! <Function Comment="Solves the direct kinematic problem:&#13;&#10;computes the effector-position and -orientation [world-coordinates] from the motor positions [ApplicationUnits]" Name="User_CalcDirectKinematic"/>
	FUNCTION VIRTUAL GLOBAL User_CalcDirectKinematic
		VAR_INPUT
			pMotorPos 	: ^_LMCPROF_POS;			//! <Variable Comment="pointer to the motor positions [ApplicationUnits] (input)" Name="User_CalcDirectKinematic.pMotorPos"/>
			pEffectorPos 	: ^_LMCPROF_POS;			//! <Variable Comment="pointer to the effector positions and -angles [world-coordinates] (output)" Name="User_CalcDirectKinematic.pEffectorPos"/>
		END_VAR
		VAR_OUTPUT
			ErrorNo 	: DINT;			//! <Variable Comment=" 0 ... no error&#13;&#10;&gt;0 ... errorcode" Name="User_CalcDirectKinematic.ErrorNo"/>
		END_VAR;
				//! <Function Comment="Solves the inverse kinematic problem:&#13;&#10;computes the motor positions [ApplicationUnits] from the effector-position and -orientation [world-coordinates]" Name="User_CalcInverseKinematic"/>
	FUNCTION VIRTUAL GLOBAL User_CalcInverseKinematic
		VAR_INPUT
			pEffectorPos 	: ^_LMCPROF_POS;			//! <Variable Comment="pointer to the effector positions and -angles [world-coordinates] (inp�t)" Name="User_CalcInverseKinematic.pEffectorPos"/>
			pMotorPos 	: ^_LMCPROF_POS;			//! <Variable Comment="pointer to the motor positions [ApplicationUnits] (output)" Name="User_CalcInverseKinematic.pMotorPos"/>
		END_VAR
		VAR_OUTPUT
			ErrorNo 	: DINT;			//! <Variable Comment=" 0 ... no error&#13;&#10;&gt;0 ... errorcode" Name="User_CalcInverseKinematic.ErrorNo"/>
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

//}}LSL_DECLARATION


FUNCTION GLOBAL TAB CalcDeltaSC::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_CALCDELTASC
0$UINT, 0$UINT, (SIZEOF(::CalcDeltaSC))$UINT, 
1$UINT, 0$UINT, 0$UINT, 
TO_UDINT(4081551811), "CalcDeltaSC", //Class
TO_UDINT(1232291236), "CalcDelta", 1$UINT, 1$UINT, //Baseclass
//Servers:
(::CalcDeltaSC.OffsetZ.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3676131755), "OffsetZ", 
//Clients:
END_FUNCTION


#define USER_CNT_CalcDeltaSC 2

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_CalcDeltaSC] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION CalcDeltaSC::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
		nCmdSize	: UINT;
	END_VAR

	ret_code	:= CalcDelta::@STD();
	IF ret_code <> C_OK THEN
		RETURN;
	END_IF;
	nCmdSize		:= _LMCCalcModelBase::ClassSvr.pMeth^.nCmds$UINT*SIZEOF(pVoid) + CMDMETH.Init;

	_memcpy((#vmt.CmdTable)$^USINT, _LMCCalcModelBase::ClassSvr.pMeth, nCmdSize);
	vmt.CmdTable.nCmds		:= nSTDCMD + USER_CNT_CalcDeltaSC;
#pragma warning (disable : 74)
	vmt.UserFcts[0]		:= #User_CalcDirectKinematic();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[1]		:= #User_CalcInverseKinematic();

#pragma warning (default : 74)
	_LMCCalcModelBase::ClassSvr.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF _LMCCalcModelBase::ClassSvr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	OffsetZ.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF OffsetZ.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION


FUNCTION VIRTUAL GLOBAL CalcDeltaSC::User_CalcDirectKinematic
	VAR_INPUT
		pMotorPos 	: ^_LMCPROF_POS;
		pEffectorPos 	: ^_LMCPROF_POS;
	END_VAR
	VAR_OUTPUT
		ErrorNo 	: DINT;
	END_VAR

  ErrorNo := CalcDelta::User_CalcDirectKinematic(pMotorPos, pEffectorPos);
  pEffectorPos^.Pos3 += OffsetZ;

END_FUNCTION


FUNCTION VIRTUAL GLOBAL CalcDeltaSC::User_CalcInverseKinematic
	VAR_INPUT
		pEffectorPos 	: ^_LMCPROF_POS;
		pMotorPos 	: ^_LMCPROF_POS;
	END_VAR
	VAR_OUTPUT
		ErrorNo 	: DINT;
	END_VAR

  pEffectorPos^.Pos3 -= OffsetZ;
  ErrorNo := CalcDelta::User_CalcInverseKinematic(pEffectorPos, pMotorPos);

END_FUNCTION

//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "Logic_And"
	Revision           = "0.0"
	GUID               = "{0EE4C48F-BE34-4ABF-925C-321497044A19}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(390,360)">
	<Channels>
		<Server Name="ClassSvr" GUID="{6455FAFC-818B-4C02-A098-BBDD45DFB2B0}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="result" GUID="{460343EC-B02D-4075-AE04-D0EFABB3EADA}" Visualized="true" Remotely="true" Initialize="false" WriteProtected="true" Retentive="false" Comment="result of the calculation of operand1 - operand10"/>
		<Client Name="Logic_And_101" Required="true" Internal="true"/>
		<Client Name="Op1" Required="false" Internal="false" Comment="Operand 1"/>
		<Client Name="Op2" Required="false" Internal="false" Comment="Operand 2"/>
		<Client Name="Op3" Required="false" Internal="false" Comment="Operand 3"/>
		<Client Name="Op4" Required="false" Internal="false" Comment="Operand 4"/>
		<Client Name="Op5" Required="false" Internal="false" Comment="Operand 5"/>
	</Channels>
	<Network Name="Logic_And">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name       = "Logic_And_101"
				GUID       = "{37AC5A47-B689-4807-AC44-7FCE6F7AA749}"
				Class      = "Logic_And_10"
				Position   = "(210,120)"
				Visualized = "true"
				Remotely   = "true">
				<Channels>
					<Server Name="result"/>
					<Client Name="Op1"/>
					<Client Name="Op10" Value="1"/>
					<Client Name="Op2"/>
					<Client Name="Op3"/>
					<Client Name="Op4"/>
					<Client Name="Op5"/>
					<Client Name="Op6" Value="1"/>
					<Client Name="Op7" Value="1"/>
					<Client Name="Op8" Value="1"/>
					<Client Name="Op9" Value="1"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="this.Logic_And_101" Destination="Logic_And_101.result"/>
			<Connection Source="this.result" Destination="Logic_And_101.result" Vertices="(682,270),(510,210),"/>
			<Connection Source="Logic_And_101.Op1" Destination="this.Op1" Vertices="(210,210),(38,210),"/>
			<Connection Source="Logic_And_101.Op2" Destination="this.Op2" Vertices="(210,270),(38,270),"/>
			<Connection Source="Logic_And_101.Op3" Destination="this.Op3" Vertices="(210,330),(38,330),"/>
			<Connection Source="Logic_And_101.Op4" Destination="this.Op4" Vertices="(210,390),(38,390),"/>
			<Connection Source="Logic_And_101.Op5" Destination="this.Op5" Vertices="(210,450),(38,450),"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
Logic_And : CLASS
  //Servers:
	ClassSvr 	: SvrChCmd_DINT;
	result 	: SvrCh_DINT;
  //Clients:
	Logic_And_101 	: CltChCmd_Logic_And_10;
	Op1 	: CltCh_DINT;
	Op2 	: CltCh_DINT;
	Op3 	: CltCh_DINT;
	Op4 	: CltCh_DINT;
	Op5 	: CltCh_DINT;
  //Variables:
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL result::Read
		VAR_OUTPUT
			output (EAX) 	: DINT;
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

#pragma using Logic_And_10


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB Logic_And::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_LOGIC_AND
0$UINT, 0$UINT, (SIZEOF(::Logic_And))$UINT, 
2$UINT, 6$UINT, 0$UINT, 
TO_UDINT(1707546935), "Logic_And", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::Logic_And.ClassSvr.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(619352855), "ClassSvr", 
(::Logic_And.result.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3817997973), "result", 
//Clients:
(::Logic_And.Logic_And_101.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(3732141375), "Logic_And_101", TO_UDINT(3338767098), "Logic_And_10", 1$UINT, 3$UINT, 
(::Logic_And.Op1.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000100$UINT, TO_UDINT(1877102209), "Op1", 
(::Logic_And.Op2.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000100$UINT, TO_UDINT(4142604091), "Op2", 
(::Logic_And.Op3.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000100$UINT, TO_UDINT(2179739565), "Op3", 
(::Logic_And.Op4.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000100$UINT, TO_UDINT(529054222), "Op4", 
(::Logic_And.Op5.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000100$UINT, TO_UDINT(1754237592), "Op5", 
END_FUNCTION


#define USER_CNT_Logic_And 0

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_Logic_And] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION Logic_And::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_Logic_And, pCmd := #vmt.CmdTable);
	ClassSvr.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF ClassSvr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	result.pMeth			:= StoreMethod( #result::Read(), #M_NO_F() );
	IF result.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION


FUNCTION VIRTUAL GLOBAL Logic_And::result::Read
	VAR_OUTPUT
		output (EAX) 	: DINT;
	END_VAR

	result := Logic_And_101.result.Read();
	output := result;

END_FUNCTION
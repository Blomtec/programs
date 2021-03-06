//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "RamRingBuffer"
	Revision           = "1.1"
	GUID               = "{4CABB075-3B1E-403B-8503-A959A20EBE6A}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "true"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(326,120)"
	Comment            = "Class is used to enable arbitrary ringbuffer.&#13;&#10;Connect RAMex to get retentive ringbuffer or MerkerEx to keep records just during runtime.">
	<Channels>
		<Server Name="ClassSvr" GUID="{21CB1DF4-4E8A-42A6-8FCD-299E458AD75D}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Client Name="Data" Required="true" Internal="false" Comment="Connect RAMex (retentive data) or MerkerEx (runtime data)"/>
	</Channels>
	<RevDoku>
		<Owner Company="sigmatek" Author="schwer"/>
		<Dokumentation Revision="1.1" Date="16.03.10" Author="Hlawol" Company="Sigmatek" Description="new method GetHeader()"/>
		<Dokumentation Revision="1.0" Date="25.02.10" Author="Hlawol" Company="Sigmatek" Description="new method Resize()&#13;&#10;-&gt; version set to official version"/>
		<Dokumentation Revision="0.1" Date="01.02.2010&#13;&#10;" Author="schwer" Company="sigmatek" Description="-use setsize instead of alloc to reserve sram/ram-memory&#13;&#10;-a temp. variable was used to copy data -&gt; now sram/ram pointer is directly used&#13;&#10;&#13;&#10;"/>
	</RevDoku>
</Class>
*)
RamRingBuffer : CLASS
	TYPE
#pragma pack(push, 1)
	  SRR_HEAD : STRUCT  //! <Type Public="true" Name="SRR_HEAD"/>
	    No : UDINT;
	    Begin : UDINT;
	    Pos : UDINT;
	    Used : UDINT;
	    RecSize : UDINT;
	  END_STRUCT;
#pragma pack(pop)
	END_TYPE
  //Servers:
	ClassSvr 	: SvrChCmd_UDINT;
  //Clients:
	Data 	: CltChCmd_MerkerEx;
  //Variables:
		Head 	: SRR_HEAD;
		IsOk 	: BOOL;
  //Functions:
	
	FUNCTION RamRingBuffer
		VAR_OUTPUT
			ret_code 	: ConfStates;
		END_VAR;
				//! <Function Comment="Method is used to prepaire ringbuffer.&#13;&#10;Number of max. records and size of one record has to be defined by using parameter &apos;account&apos; and &apos;size&apos;.&#13;&#10;The return-parameter will give information about success.&#13;&#10;Note: This method has to be called once before using ringbuffer.&#13;&#10;eg: Call method in last run of your Init-method." Name="Prepaire"/>
	FUNCTION GLOBAL Prepaire
		VAR_INPUT
			account 	: UDINT;			//! <Variable Comment="number of entries" Name="Prepaire.account"/>
			size 	: UDINT;			//! <Variable Comment="size of one entry" Name="Prepaire.size"/>
		END_VAR
		VAR_OUTPUT
			retcode 	: BOOL;			//! <Variable Comment="success of operation" Name="Prepaire.retcode"/>
		END_VAR;
	
	FUNCTION WriteHead;
				//! <Function Comment="Use this method to put new record into ringbuffer.&#13;&#10;Parameter &apos;psrc&apos; is used to define data which should be stored into ringbuffer.&#13;&#10;The return-parameter gives information about success." Name="AddRecord"/>
	FUNCTION GLOBAL AddRecord
		VAR_INPUT
			psrc 	: ^void;
		END_VAR
		VAR_OUTPUT
			retcode 	: BOOL;
		END_VAR;
				//! <Function Comment="Method is used to get record out of ringbuffer.&#13;&#10;Parameter &apos;pdst&apos; dill define address where record with given number &apos;pos&apos; will be stored.&#13;&#10;Return-parameter will give information about success." Name="GetRecord"/>
	FUNCTION GLOBAL GetRecord
		VAR_INPUT
			pdst 	: ^void;
			pos 	: UDINT;
		END_VAR
		VAR_OUTPUT
			retcode 	: BOOL;
		END_VAR;
				//! <Function Comment="Use method to delete single record in ringbuffer.&#13;&#10;Parameter &apos;pos&apos; specifies record which should be deleted.&#13;&#10;Return-parameter gives information about success." Name="DelRecord"/>
	FUNCTION GLOBAL DelRecord
		VAR_INPUT
			pos 	: UDINT;
		END_VAR
		VAR_OUTPUT
			retcode 	: BOOL;
		END_VAR;
				//! <Function Comment="Use method to overwrite already existing record.&#13;&#10;New recorddata (&apos;psrc&apos;) and position of record (&apos;pos&apos;) are necessary.&#13;&#10;Return-parameter will give information about sucess." Name="ChxRecord"/>
	FUNCTION GLOBAL ChxRecord
		VAR_INPUT
			psrc 	: ^void;
			pos 	: UDINT;
		END_VAR
		VAR_OUTPUT
			retcode 	: BOOL;
		END_VAR;
				//! <Function Comment="Use this method to delete all records in ringbuffer.&#13;&#10;Return-parameter will give information about success." Name="DelAllRecords"/>
	FUNCTION GLOBAL DelAllRecords
		VAR_OUTPUT
			retcode 	: BOOL;
		END_VAR;
				//! <Function Comment="Method is used to return number of already stored records." Name="GetNoOfRecords"/>
	FUNCTION GLOBAL GetNoOfRecords
		VAR_OUTPUT
			retcode 	: UDINT;
		END_VAR;
	
	FUNCTION ReadRecPos
		VAR_INPUT
			pdst 	: ^void;
			i 	: UDINT;
		END_VAR
		VAR_OUTPUT
			retcode 	: BOOL;
		END_VAR;
	
	FUNCTION WriteRecPos
		VAR_INPUT
			psrc 	: ^void;
			i 	: UDINT;
		END_VAR
		VAR_OUTPUT
			retcode 	: BOOL;
		END_VAR;
				//! <Function Comment="Method is used to resize the ringbuffer.&#13;&#10;Old data will be copied into new memory.&#13;&#10;Number of max. records and size of one record has to be defined by using parameter &apos;account&apos; and &apos;size&apos;.&#13;&#10;The return-parameter will give information about success.&#13;&#10;Note: if new size is smaller, only the new size of one entry will be copied, so be sure, that all data are packed in the new size before calling this method, otherwise this may cause loss of data!" Name="Resize"/>
	FUNCTION VIRTUAL GLOBAL Resize
		VAR_INPUT
			account 	: UDINT;			//! <Variable Comment="number of entries in ringbuffer" Name="Resize.account"/>
			size 	: UDINT;			//! <Variable Comment="size of one entry" Name="Resize.size"/>
		END_VAR
		VAR_OUTPUT
			retcode 	: BOOL;			//! <Variable Comment="success of operation" Name="Resize.retcode"/>
		END_VAR;
				//! <Function Comment="get header of ringbuffer" Name="GetHeader"/>
	FUNCTION VIRTUAL GLOBAL GetHeader
		VAR_OUTPUT
			pHead 	: ^SRR_HEAD;			//! <Variable Comment="pointer to buffer header" Name="GetHeader.pHead"/>
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

#pragma usingLtd MerkerEx


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB RamRingBuffer::@CT_
0$UINT,
2#0100000000000000$UINT, //TY_RAMRINGBUFFER
1$UINT, 1$UINT, (SIZEOF(::RamRingBuffer))$UINT, 
1$UINT, 1$UINT, 0$UINT, 
TO_UDINT(3534980377), "RamRingBuffer", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::RamRingBuffer.ClassSvr.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(619352855), "ClassSvr", 
//Clients:
(::RamRingBuffer.Data.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(2607161047), "Data", TO_UDINT(2225119864), "MerkerEx", 1$UINT, 21$UINT, 
END_FUNCTION


#define USER_CNT_RamRingBuffer 2

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_RamRingBuffer] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION RamRingBuffer::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_RamRingBuffer, pCmd := #vmt.CmdTable);
#pragma warning (disable : 74)
	vmt.UserFcts[0]		:= #Resize();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[1]		:= #GetHeader();

#pragma warning (default : 74)
	ClassSvr.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF ClassSvr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	ret_code	:= RamRingBuffer();

END_FUNCTION

//{{LSL_IMPLEMENTATION
FUNCTION RamRingBuffer::RamRingBuffer
	VAR_OUTPUT
		ret_code 	: ConfStates;
	END_VAR

	ret_code   := C_OK;
  IsOk       := false;
  Head.No    := 0;
  Head.Begin := 0;
  Head.Pos   := 0;
  Head.Used  := 0;

END_FUNCTION


FUNCTION GLOBAL RamRingBuffer::Prepaire
	VAR_INPUT
		account 	: UDINT;
		size 	: UDINT;
	END_VAR
	VAR_OUTPUT
		retcode 	: BOOL;
	END_VAR
  var
    tmp : udint;
  end_var

  retcode := false;
  tmp     := size * account + sizeof(Head);

  if(Data.GetSize() <> tmp) then
    if(Data.SetSize(tmp) = C_OK) then //schwer 01.02.2010: use setsize instead of alloc
      retcode      := true;
      Head.No      := account;
      Head.RecSize := size;
      WriteHead();
    end_if;
  else
    if(Data.GetDataAt(#Head$usint, sizeof(Head), 0) = C_OK) then
      retcode := true;
      if((Head.RecSize <> size)|(account <> Head.No)) then
        Head.No      := account;
        Head.RecSize := size;
        WriteHead();
      end_if;
    end_if;
  end_if;

  GetNoOfRecords();
  IsOk := retcode;

END_FUNCTION


FUNCTION GLOBAL RamRingBuffer::AddRecord
	VAR_INPUT
		psrc 	: ^void;
	END_VAR
	VAR_OUTPUT
		retcode 	: BOOL;
	END_VAR
  var
    pos : udint;
    tmp : SRR_HEAD;
  end_var

  retcode := false;

  if(IsOk = true) then

    if(Head.No > 0) then
      tmp := Head;

      pos := tmp.Pos;
      if(tmp.Used = 1) then
        if(tmp.Pos = tmp.Begin) then
          tmp.Begin := (tmp.Pos + 1) mod tmp.No;
        end_if;
      end_if;

      tmp.Used := 1;
      tmp.Pos  += 1;
      if(tmp.Pos >= tmp.No) then
        tmp.Pos := 0;
      end_if;

      if(WriteRecPos(psrc, pos) = true) then
        Head := tmp;
        WriteHead(); // write new headerdata
        GetNoOfRecords(); // set ClassSvr with act.data
        retcode := true;
      end_if;

    end_if;
  end_if;

END_FUNCTION


FUNCTION GLOBAL RamRingBuffer::GetRecord
	VAR_INPUT
		pdst 	: ^void;
		pos 	: UDINT;
	END_VAR
	VAR_OUTPUT
		retcode 	: BOOL;
	END_VAR

  retcode := false;

  if(IsOk = true) then
    if(pos < GetNoOfRecords()) then
      pos     := (Head.Begin + pos) mod Head.No;
      retcode := ReadRecPos(pdst, pos);
    end_if;
  end_if;

END_FUNCTION


FUNCTION GLOBAL RamRingBuffer::GetNoOfRecords
	VAR_OUTPUT
		retcode 	: UDINT;
	END_VAR

  retcode := 0;

  if(IsOk = true) then
    if((Head.No > 0) & (Head.Used = true)) then
      if(Head.Begin = Head.Pos) then
        retcode := Head.No;
      else
        retcode := ((Head.Pos + Head.No - Head.Begin) mod Head.No);
      end_if;
    end_if;
  end_if;

  ClassSvr := retcode;

END_FUNCTION


FUNCTION GLOBAL RamRingBuffer::ChxRecord
	VAR_INPUT
		psrc 	: ^void;
		pos 	: UDINT;
	END_VAR
	VAR_OUTPUT
		retcode 	: BOOL;
	END_VAR

  retcode := false;

  if(IsOk = true) then
    if(pos < GetNoOfRecords()) then
      pos     := (Head.Begin + pos) mod Head.No;
      retcode := WriteRecPos(psrc, pos);
    end_if;
  end_if;

END_FUNCTION


FUNCTION GLOBAL RamRingBuffer::DelRecord
	VAR_INPUT
		pos 	: UDINT;
	END_VAR
	VAR_OUTPUT
		retcode 	: BOOL;
	END_VAR
  var
    aa, ab, anz : udint;
    isrc, idst : udint;
    //tmp : array[0..2047] of usint; //schwer 01.02.2010: a temp. variable was used to copy data -> now sram/ram pointer is directly used
    ptmp : ^usint;
  end_var

  retcode := false;

  if(IsOk = true) then //&(Head.RecSize <= sizeof(tmp))) then

    anz := GetNoOfRecords();
    if(pos < anz) then
      retcode := true;

      //ptmp    := #tmp[0]; 
      aa      := anz - pos - 1;
      ab      := pos + 1;
      idst    := (Head.Begin + pos) mod Head.No;

      while(aa) do
        aa   -= 1;
        isrc := (Head.Begin + ab) mod Head.No;
        ptmp := Data.GetDataPtr();
        if(ptmp <> NIL) then
          WriteRecPos(ptmp + sizeof(Head) + isrc * Head.RecSize, idst);
        end_if;
        idst := isrc;
        ab   += 1;
      end_while;

      if(anz = 1) then
        Head.Begin := 0;
        Head.Pos   := 0;
        Head.Used  := 0;
      else
        if(Head.Pos > 0) then
          Head.Pos -= 1;
        else
          Head.Pos := Head.No - 1;
        end_if;
      end_if;
      WriteHead();
      GetNoOfRecords(); // set ClassSvr with act.data
    end_if;
  end_if;

END_FUNCTION


FUNCTION GLOBAL RamRingBuffer::DelAllRecords
	VAR_OUTPUT
		retcode 	: BOOL;
	END_VAR

  retcode := false;
  if(IsOk = true) then
    Head.Begin := 0;
    Head.Pos   := 0;
    Head.Used  := 0;
    retcode    := true;
    WriteHead();
    GetNoOfRecords(); // set ClassSvr with act.data
  end_if;

END_FUNCTION


FUNCTION RamRingBuffer::ReadRecPos
	VAR_INPUT
		pdst 	: ^void;
		i 	: UDINT;
	END_VAR
	VAR_OUTPUT
		retcode 	: BOOL;
	END_VAR

  retcode := false;
  i       := sizeof(Head) + i * Head.RecSize;
  if(Data.GetDataAt(pdst$^usint, Head.RecSize, i) = C_OK) then
    retcode := true;
  end_if;

END_FUNCTION


FUNCTION RamRingBuffer::WriteRecPos
	VAR_INPUT
		psrc 	: ^void;
		i 	: UDINT;
	END_VAR
	VAR_OUTPUT
		retcode 	: BOOL;
	END_VAR

  retcode := false;
  i       := sizeof(Head) + i * Head.RecSize;
  if(Data.SetDataAt(psrc$^usint, Head.RecSize, i) = C_OK) then
    retcode  := true;
  end_if;

END_FUNCTION


FUNCTION RamRingBuffer::WriteHead

  Data.SetDataAt(#Head$usint, sizeof(Head), 0);
  
END_FUNCTION



FUNCTION VIRTUAL GLOBAL RamRingBuffer::Resize
	VAR_INPUT
		account 	: UDINT;
		size 	    : UDINT;
	END_VAR
	VAR_OUTPUT
		retcode 	: BOOL;
	END_VAR
  var
    new       : UDINT;
    old       : UDINT; 
    pdest     : ^USINT;
    psrc      : ^USINT;
    pdat      : ^USINT;
  end_var

  retcode := false;
  
  pdat := Data.GetDataPtr();
  
  if ((account = 0) | (size = 0) | (pdat = nil)) then
  // error: will cause zero memory
  
    return;
  
  end_if;
  
  //set pdat to data position
  pdat += sizeof(Head);
  
  // ********   check if new size is smaller than old one **************
  new     := size; 
  old     := Head.RecSize;

  if(new < old) then
  // new size is smaller than old one -> pack data first, then copy

    pdest := psrc := pdat;

    old   := Head.No - 1;
    
    while (old > 0) do     
    // let�s move old - 1 entries
    
      psrc  += Head.RecSize;  // pointer to old start of entry
      pdest += size;          // pointer to new start of entry
    
      _memcpy(ptr1:=pdest, ptr2:=psrc, cntr:=size);
     
      old -= 1;
    
    end_while;
    
    Head.RecSize := size;
  end_if;  


  // ********   check if new number of entries is smaller than old one **************
    
  if account < Head.No then
  // new number of entries is smaller than old one -> move the needed entries into correct position before cut
  
    old := (Head.Pos - account + Head.No) mod Head.No;
    new := Head.Pos - 1;
  
    if (old < new) then
    // entries are in line without overrun
    
      if (old <> 0) then
      // we have to move some data
      
        old   *= Head.RecSize;
        psrc  := pdat + old;
        pdest := pdat;
        
        _memmove(dest:=pdest, src:=psrc, anz:=account * Head.RecSize);
        
      end_if;
    
      Head.Begin := 0;
      Head.Pos   := 0;
    
    elsif (old > new) then
    // entries are not in line (overrun) -> move entries from oldest needed to actpos of the ringbuffer
    
      psrc  := pdat + old * Head.RecSize;
      pdest := pdat + Head.Pos * Head.RecSize;
      
      _memmove(dest:=pdest, src:=psrc, anz:=(account - Head.Pos) * Head.RecSize);
          
    end_if;
  
  end_if;


  // *******************  R E A L L O C ************************
  
  new := (account * size) + sizeof(Head);
  if(Data.SetSize(new) = C_OK) then 
  // Realloc is OK

    pdat := Data.GetDataPtr();
    
    if pdat = NIL then
      retcode := false;
      return;
    end_if;
    
    //set pdat to data position
    pdat += sizeof(Head);

    retcode      := true;
        
    // ********* check if new size of entries is bigger than old one ************************
  
    new := size; 
    old := Head.RecSize;

    if(new > old) then
    // new size of entries is bigger than old one
    
      new := Head.No;
      if account < Head.No then
      // we have to use new definition, otherwise we will get an access exception error
      
        new := account;
      
      end_if;
    
      pdest := pdat + (new * size);
      psrc  := pdat + (new * Head.RecSize);
      //new   -= 1;
      
      while (new > 0) do     
      // let�s move old entries
      
        psrc  -= Head.RecSize;  // pointer to old start of entry
        pdest -= size;          // pointer to new start of entry
        _memset(dest:=pdest+Head.RecSize, usByte:=0, cntr:=size-Head.RecSize);
        _memmove(dest:=pdest, src:=psrc, anz:=Head.RecSize);
        new -= 1;
      
      end_while;
      
      Head.RecSize := size;
      
    end_if;  
  
  
  // ********* check if we have more entries than before  ************************
          
    if ((account > Head.No) & (Head.Pos = Head.Begin) & (Head.Used = 1)) then
    // now we have more entries than before and an overrun buffer -> move older data to end of ringbuffer
    
      pdest := pdat;
      psrc  := pdest;
      pdest += (Head.Pos + account - Head.No) * size;
      psrc  += Head.Pos * size;
      
      _memmove(dest:=pdest, src:=psrc, anz:=((Head.No - Head.Pos) * size));
      
      Head.Begin += account - Head.No;
    
    end_if;
    
    Head.No      := account;
               
  end_if;
  
  
  WriteHead();
  GetNoOfRecords();
  IsOk := retcode;


END_FUNCTION


FUNCTION VIRTUAL GLOBAL RamRingBuffer::GetHeader
	VAR_OUTPUT
		pHead 	: ^SRR_HEAD;
	END_VAR

  pHead := #Head;

END_FUNCTION

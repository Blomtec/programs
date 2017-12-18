
FUNCTION GLOBAL Get_ptr_on_Obj
VAR_INPUT
	ptr				: ^void;
END_VAR
VAR_OUTPUT
	pCls			: ^ClsHdr;
END_VAR
VAR
	pObj			: ^Obj;
END_VAR

	pObj		:= LSL_GetHdr(ptr);
	pCls		:= pObj^.pClsHdr;

END_FUNCTION // NewClass0::NewClass0


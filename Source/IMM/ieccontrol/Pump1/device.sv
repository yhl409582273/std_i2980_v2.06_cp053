%IMPORT_OVER_LISTFILE_OBJECT
 tsDeviceId
, cCompPump

END_IMPORT

%SYSTEMVAR_DECL
  sv_DeviceId : tsDeviceId := (CompId:=cCompPump,IndexId:=1) (* unique Device Identifier *)
     %INPUT_LEVEL 16

 // Device Id Device Id

%ELEMENT sv_DeviceId.CompId
    
 // Component Id Component Id

%ELEMENT sv_DeviceId.IndexId
    
 // Device index Device index
;
 sv_bDeviceReady : BOOL := TRUE (* Device is ready *)
     %INPUT_LEVEL 16

 // Device ready Device ready
;
%END



#END_OF_IEC_PART

@Puma @IecEditor 6 22 @Sve 25 
@@@BEG_Comment@@@

@@@END_Comment@@@

@BEG_Contents 

@BEG_Export 
@RT(16)SveTreeContainer 
2 
@SysVar @RT(11)sv_DeviceId @RT(0) @T @T @DERIVED 0 @T @T @DT @RT(10)tsDeviceId @RT(0) @T @T @UNKNOWN 0 @F 
@F @F 
@T 
@BEG_Attrib 
4 @RT(30)(CompId:=cCompPump,IndexId:=1) @RT(24)unique Device Identifier 
@RT(0) @RT(2)16 @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(9)Device Id @RT(9)Device Id @RT(0) @RT(0) @RT(0) 
@END_Attrib 
3 
@AttrSym @RT(11)sv_DeviceId @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(39)(CompId:=cCompHeatingNozzle,IndexId:=1) @RT(24)unique Device Identifier 
@RT(0) @RT(2)16 @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(9)Device Id @RT(9)Device Id @RT(0) @RT(0) @RT(0) 
@END_Attrib 
@AttrSym @RT(18)sv_DeviceId.CompId @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(18)cCompHeatingNozzle @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(12)Component Id @RT(12)Component Id @RT(0) @RT(0) @RT(0) 
@END_Attrib 
@AttrSym @RT(19)sv_DeviceId.IndexId @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(1)1 @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(12)Device index @RT(12)Device index @RT(0) @RT(0) @RT(0) 
@END_Attrib 


@SysVar @RT(15)sv_bDeviceReady @RT(0) @T @F @DT @RT(4)BOOL @RT(0) @T @T @BASIC 0 @F 
@F @F 
@T 
@BEG_Attrib 
4 @RT(4)TRUE @RT(15)Device is ready 
@RT(0) @RT(2)16 @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(12)Device ready @RT(12)Device ready @RT(0) @RT(0) @RT(0) 
@END_Attrib 
1 
@AttrSym @RT(15)sv_bDeviceReady @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(15)Device is ready 
@RT(0) @RT(2)16 @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(12)Device ready @RT(12)Device ready @RT(0) @RT(0) @RT(0) 
@END_Attrib 


@RT(15)SETreeContainer 
0 
@RT(15)SOTreeContainer 
0 

@RT(15)SATreeContainer 
0 

@RT(21)SExtAttrTreeContainer 
0 
@END_Export 

@END_Contents 

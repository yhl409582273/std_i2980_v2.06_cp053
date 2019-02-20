%IMPORT_OVER_LISTFILE_SOURCE
 TimeAccurate
, fmt23
, fmtCalibState
, OnOff
, YesNo
, Stroke
, fmt31

END_IMPORT
%IMPORT_OVER_LISTFILE_OBJECT
 tsIdentMovement
, tsIdentSpeedMovement
, tnCalibState_None
, tnCalibGroup_Other
, cCompNozzle
, cMoveNone
, cLevelProcessOperator
, cLevelStartupTechnican
, cLevelServiceEngineer

END_IMPORT

%SYSTEMVAR_DECL
  sv_dSetDelayTimeOffFwd : TIME
 %PLAUSIBILITY T#0s..T#1s    RETAIN  %DISPLAY_LEVEL 1  %INPUT_LEVEL cLevelProcessOperator
 %FORMAT fmt23  %UNIT TimeAccurate 
// Delay time off fwd Delay time off fwd
;
 sv_dSetDelayTimeOffBwd : TIME
 %PLAUSIBILITY T#0s..T#1s    RETAIN  %DISPLAY_LEVEL 1  %INPUT_LEVEL cLevelProcessOperator
 %FORMAT fmt23  %UNIT TimeAccurate 
// Delay time off bwd Delay time off bwd
;
 sv_IdentState : tsIdentMovement := (prMaxRampFwd:=@%FU.sv_NozzleFwdProfVis.rMaxRampVel,prMaxRampBwd:=@%FU.sv_NozzleBwdProfVis.rMaxRampVel,pdDeadTimeFwd:=@%FU.sv_dSetDelayTimeOffFwd,pdDeadTimeBwd:=@%FU.sv_dSetDelayTimeOffBwd,Status:=tnCalibState_None,Group:=tnCalibGroup_Other)
    
%ELEMENT sv_IdentState.Status
   RETAIN  %DISPLAY_LEVEL 1  %INPUT_LEVEL cLevelStartupTechnican
 %FORMAT fmtCalibState 
%ELEMENT sv_IdentState.bNameDummy
    
// Nozzle Nozzle

%ELEMENT sv_IdentState.bRedo
     %DISPLAY_LEVEL 1  %INPUT_LEVEL cLevelServiceEngineer
 %FORMAT OnOff ;
 sv_bMoveIdent : BOOL
     %DISPLAY_LEVEL 1  %INPUT_LEVEL cLevelStartupTechnican
 %FORMAT YesNo 
// Move identification Move identification
;
 sv_rIdentPosition : REAL
 %PLAUSIBILITY 0.0..Mold1.sv_rMoldStroke    RETAIN  %DISPLAY_LEVEL 1  %INPUT_LEVEL cLevelStartupTechnican
 %FORMAT fmt31  %UNIT Stroke 
// Identification position Identification position
;
 sv_IdentMaxSpeedState : tsIdentSpeedMovement := (prPosition:=@%FU.sv_rNozzlePosition,prVelocityFwd:=@%FU.sv_rMaxSpeedFwdCalib,prVelocityBwd:=@%FU.sv_rMaxSpeedBwdCalib,prVelocityLimitFwd:=@%FU.sv_rMaxSpeedFwdCalc,prVelocityLimitBwd:=@%FU.sv_rMaxSpeedBwdCalc,prActVelocity:=@%FU.sv_rNozzleVelocity,prStroke:=@%FU.sv_rNozzleStrokePlaus,rMaxPositionLimitFactor:=0.8,rMinPositionLimitFactor:=0.2,prIdentPosition:=@%FU.sv_rIdentPosition,pbMoveIdent:=@%FU.sv_bMoveIdent,Group:=tnCalibGroup_Other,DeviceId:=(CompId:=cCompNozzle,IndexId:=1),MoveId:=cMoveNone,pConstFwdVis:=@%FU.sv_ConstFwdSetup,pConstBwdVis:=@%FU.sv_ConstBwdSetup,bPositionIncreasingFwd:=FALSE,prStopRamp:=@%FU.sv_rIdentStopRamp,sName:='Nozzle1',prMaxPressureFwd:=@%FU.sv_rMaxPressureFwd,prMaxPressureBwd:=@%FU.sv_rMaxPressureBwd,prMaxPressureFwdHydr:=@%FU.sv_HydrMaxValuesFwd.rMaxPressure,prMaxPressureBwdHydr:=@%FU.sv_HydrMaxValuesBwd.rMaxPressure,pdDelayTimeOffFwd:=@%FU.sv_dSetDelayTimeOffFwd,pdDelayTimeOffBwd:=@%FU.sv_dSetDelayTimeOffBwd)
    
%ELEMENT sv_IdentMaxSpeedState.Status
   RETAIN  %DISPLAY_LEVEL 1  %INPUT_LEVEL cLevelStartupTechnican
 %FORMAT fmtCalibState 
%ELEMENT sv_IdentMaxSpeedState.bNameDummy
    
// Nozzle Nozzle

%ELEMENT sv_IdentMaxSpeedState.bRedo
     %DISPLAY_LEVEL 1  %INPUT_LEVEL cLevelServiceEngineer
 %FORMAT OnOff ;
 sv_IdentMinSpeedState : tsIdentSpeedMovement := (prPosition:=@%FU.sv_rNozzlePosition,prVelocityFwd:=@%FU.sv_MinOutputFwd.rVelocity,prVelocityBwd:=@%FU.sv_MinOutputBwd.rVelocity,prVelocityLimitFwd:=@%FU.sv_rMaxSpeedFwdCalc,prVelocityLimitBwd:=@%FU.sv_rMaxSpeedBwdCalc,prActVelocity:=@%FU.sv_rNozzleVelocity,prStroke:=@%FU.sv_rNozzleStrokePlaus,rMaxPositionLimitFactor:=0.8,rMinPositionLimitFactor:=0.2,prIdentPosition:=@%FU.sv_rIdentPosition,pbMoveIdent:=@%FU.sv_bMoveIdent,Group:=tnCalibGroup_Other,DeviceId:=(CompId:=cCompNozzle,IndexId:=1),MoveId:=cMoveNone,pConstFwdVis:=@%FU.sv_ConstFwdSetup,pConstBwdVis:=@%FU.sv_ConstBwdSetup,bPositionIncreasingFwd:=FALSE,prStopRamp:=@%FU.sv_rIdentStopRamp,pdMaxMoveTimeFwd:=@%FU.sv_NozzleFwdTimesSet.dMaxMoveTime,pdMaxMoveTimeBwd:=@%FU.sv_NozzleBwdTimesSet.dMaxMoveTime,sName:='Nozzle1',prMaxPressureFwd:=@%FU.sv_rMaxPressureFwd,prMaxPressureBwd:=@%FU.sv_rMaxPressureBwd,prMaxPressureFwdHydr:=@%FU.sv_HydrMaxValuesFwd.rMaxPressure,prMaxPressureBwdHydr:=@%FU.sv_HydrMaxValuesBwd.rMaxPressure,prIdentPressureFwd:=@%FU.sv_MinOutputFwd.rPressure,prIdentPressureBwd:=@%FU.sv_MinOutputBwd.rPressure)
    
%ELEMENT sv_IdentMinSpeedState.Status
   RETAIN  %DISPLAY_LEVEL 1  %INPUT_LEVEL cLevelStartupTechnican
 %FORMAT fmtCalibState 
%ELEMENT sv_IdentMinSpeedState.bNameDummy
    
// Nozzle Nozzle

%ELEMENT sv_IdentMinSpeedState.bRedo
     %DISPLAY_LEVEL 1  %INPUT_LEVEL cLevelServiceEngineer
 %FORMAT OnOff 
%ELEMENT sv_IdentMinSpeedState.rMaxPositionLimitFactor
 %PLAUSIBILITY %FU.sv_IdentMinSpeedState.rMinPositionLimitFactor..0.99     
%ELEMENT sv_IdentMinSpeedState.rMinPositionLimitFactor
 %PLAUSIBILITY 0.01..%FU.sv_IdentMinSpeedState.rMaxPositionLimitFactor     ;
 sv_rIdentStopRamp : REAL
    ;
%END



#END_OF_IEC_PART

@Puma @IecEditor 6 152 @Sve 25 
@@@BEG_Comment@@@

@@@END_Comment@@@

@BEG_Contents 

@BEG_Export 
@RT(16)SveTreeContainer 
8 
@SysVar @RT(22)sv_dSetDelayTimeOffFwd @RT(0) @T @F @DT @RT(4)TIME @RT(0) @T @T @BASIC 0 @F 
@F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(1)1 @RT(21)cLevelProcessOperator @RT(0) @RT(5)fmt23 @RT(12)TimeAccurate @RT(0) @RT(0) 
@RT(10)T#0s..T#1s @RT(0) @RT(0) @RT(1)y @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(18)Delay time off fwd @RT(18)Delay time off fwd @RT(0) @RT(0) @RT(0) 
@END_Attrib 
1 
@AttrSym @RT(22)sv_dSetDelayTimeOffFwd @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(1)1 @RT(21)cLevelProcessOperator @RT(0) @RT(5)fmt23 @RT(12)TimeAccurate @RT(0) @RT(0) 
@RT(10)T#0s..T#1s @RT(0) @RT(0) @RT(1)y @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(18)Delay time off fwd @RT(18)Delay time off fwd @RT(0) @RT(0) @RT(0) 
@END_Attrib 


@SysVar @RT(22)sv_dSetDelayTimeOffBwd @RT(0) @T @F @DT @RT(4)TIME @RT(0) @T @T @BASIC 0 @F 
@F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(1)1 @RT(21)cLevelProcessOperator @RT(0) @RT(5)fmt23 @RT(12)TimeAccurate @RT(0) @RT(0) 
@RT(10)T#0s..T#1s @RT(0) @RT(0) @RT(1)y @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(18)Delay time off bwd @RT(18)Delay time off bwd @RT(0) @RT(0) @RT(0) 
@END_Attrib 
1 
@AttrSym @RT(22)sv_dSetDelayTimeOffBwd @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(1)1 @RT(21)cLevelProcessOperator @RT(0) @RT(5)fmt23 @RT(12)TimeAccurate @RT(0) @RT(0) 
@RT(10)T#0s..T#1s @RT(0) @RT(0) @RT(1)y @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(18)Delay time off bwd @RT(18)Delay time off bwd @RT(0) @RT(0) @RT(0) 
@END_Attrib 


@SysVar @RT(13)sv_IdentState @RT(0) @T @T @DERIVED 0 @T @T @DT @RT(15)tsIdentMovement @RT(0) @T @T @UNKNOWN 0 @F 
@F @F 
@T 
@BEG_Attrib 
4 @RT(241)(prMaxRampFwd:=@%FU.sv_NozzleFwdProfVis.rMaxRampVel,prMaxRampBwd:=@%FU.sv_NozzleBwdProfVis.rMaxRampVel,pdDeadTimeFwd:=@%FU.sv_dSetDelayTimeOffFwd,pdDeadTimeBwd:=@%FU.sv_dSetDelayTimeOffBwd,Status:=tnCalibState_None,Group:=tnCalibGroup_Other) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@END_Attrib 
3 
@AttrSym @RT(20)sv_IdentState.Status @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(1)1 @RT(22)cLevelStartupTechnican @RT(0) @RT(13)fmtCalibState @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(1)y @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@END_Attrib 
@AttrSym @RT(24)sv_IdentState.bNameDummy @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(6)Nozzle @RT(6)Nozzle @RT(0) @RT(0) @RT(0) 
@END_Attrib 
@AttrSym @RT(19)sv_IdentState.bRedo @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(1)1 @RT(21)cLevelServiceEngineer @RT(0) @RT(5)OnOff @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@END_Attrib 


@SysVar @RT(13)sv_bMoveIdent @RT(0) @T @F @DT @RT(4)BOOL @RT(0) @T @T @BASIC 0 @F 
@F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(1)1 @RT(22)cLevelStartupTechnican @RT(0) @RT(5)YesNo @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(19)Move identification @RT(19)Move identification @RT(0) @RT(0) @RT(0) 
@END_Attrib 
1 
@AttrSym @RT(13)sv_bMoveIdent @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(1)1 @RT(22)cLevelStartupTechnican @RT(0) @RT(5)YesNo @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(19)Move identification @RT(19)Move identification @RT(0) @RT(0) @RT(0) 
@END_Attrib 


@SysVar @RT(17)sv_rIdentPosition @RT(0) @T @F @DT @RT(4)REAL @RT(0) @T @T @BASIC 0 @F 
@F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(1)1 @RT(22)cLevelStartupTechnican @RT(0) @RT(5)fmt31 @RT(6)Stroke @RT(0) @RT(0) 
@RT(25)0.0..Mold1.sv_rMoldStroke @RT(0) @RT(0) @RT(1)y @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(23)Identification position @RT(23)Identification position @RT(0) @RT(0) @RT(0) 
@END_Attrib 
1 
@AttrSym @RT(17)sv_rIdentPosition @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(1)1 @RT(22)cLevelStartupTechnican @RT(0) @RT(5)fmt31 @RT(6)Stroke @RT(0) @RT(0) 
@RT(25)0.0..Mold1.sv_rMoldStroke @RT(0) @RT(0) @RT(1)y @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(23)Identification position @RT(23)Identification position @RT(0) @RT(0) @RT(0) 
@END_Attrib 


@SysVar @RT(21)sv_IdentMaxSpeedState @RT(0) @T @T @DERIVED 0 @F @RT(20)tsIdentSpeedMovement @F 
@T 
@BEG_Attrib 
4 @RT(954)(prPosition:=@%FU.sv_rNozzlePosition,prVelocityFwd:=@%FU.sv_rMaxSpeedFwdCalib,prVelocityBwd:=@%FU.sv_rMaxSpeedBwdCalib,prVelocityLimitFwd:=@%FU.sv_rMaxSpeedFwdCalc,prVelocityLimitBwd:=@%FU.sv_rMaxSpeedBwdCalc,prActVelocity:=@%FU.sv_rNozzleVelocity,prStroke:=@%FU.sv_rNozzleStrokePlaus,rMaxPositionLimitFactor:=0.8,rMinPositionLimitFactor:=0.2,prIdentPosition:=@%FU.sv_rIdentPosition,pbMoveIdent:=@%FU.sv_bMoveIdent,Group:=tnCalibGroup_Other,DeviceId:=(CompId:=cCompNozzle,IndexId:=1),MoveId:=cMoveNone,pConstFwdVis:=@%FU.sv_ConstFwdSetup,pConstBwdVis:=@%FU.sv_ConstBwdSetup,bPositionIncreasingFwd:=FALSE,prStopRamp:=@%FU.sv_rIdentStopRamp,sName:='Nozzle1',prMaxPressureFwd:=@%FU.sv_rMaxPressureFwd,prMaxPressureBwd:=@%FU.sv_rMaxPressureBwd,prMaxPressureFwdHydr:=@%FU.sv_HydrMaxValuesFwd.rMaxPressure,prMaxPressureBwdHydr:=@%FU.sv_HydrMaxValuesBwd.rMaxPressure,pdDelayTimeOffFwd:=@%FU.sv_dSetDelayTimeOffFwd,pdDelayTimeOffBwd:=@%FU.sv_dSetDelayTimeOffBwd) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@END_Attrib 
3 
@AttrSym @RT(28)sv_IdentMaxSpeedState.Status @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(1)1 @RT(22)cLevelStartupTechnican @RT(0) @RT(13)fmtCalibState @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(1)y @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@END_Attrib 
@AttrSym @RT(32)sv_IdentMaxSpeedState.bNameDummy @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(6)Nozzle @RT(6)Nozzle @RT(0) @RT(0) @RT(0) 
@END_Attrib 
@AttrSym @RT(27)sv_IdentMaxSpeedState.bRedo @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(1)1 @RT(21)cLevelServiceEngineer @RT(0) @RT(5)OnOff @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@END_Attrib 


@SysVar @RT(21)sv_IdentMinSpeedState @RT(0) @T @T @DERIVED 0 @F @RT(20)tsIdentSpeedMovement @F 
@T 
@BEG_Attrib 
4 @RT(1086)(prPosition:=@%FU.sv_rNozzlePosition,prVelocityFwd:=@%FU.sv_MinOutputFwd.rVelocity,prVelocityBwd:=@%FU.sv_MinOutputBwd.rVelocity,prVelocityLimitFwd:=@%FU.sv_rMaxSpeedFwdCalc,prVelocityLimitBwd:=@%FU.sv_rMaxSpeedBwdCalc,prActVelocity:=@%FU.sv_rNozzleVelocity,prStroke:=@%FU.sv_rNozzleStrokePlaus,rMaxPositionLimitFactor:=0.8,rMinPositionLimitFactor:=0.2,prIdentPosition:=@%FU.sv_rIdentPosition,pbMoveIdent:=@%FU.sv_bMoveIdent,Group:=tnCalibGroup_Other,DeviceId:=(CompId:=cCompNozzle,IndexId:=1),MoveId:=cMoveNone,pConstFwdVis:=@%FU.sv_ConstFwdSetup,pConstBwdVis:=@%FU.sv_ConstBwdSetup,bPositionIncreasingFwd:=FALSE,prStopRamp:=@%FU.sv_rIdentStopRamp,pdMaxMoveTimeFwd:=@%FU.sv_NozzleFwdTimesSet.dMaxMoveTime,pdMaxMoveTimeBwd:=@%FU.sv_NozzleBwdTimesSet.dMaxMoveTime,sName:='Nozzle1',prMaxPressureFwd:=@%FU.sv_rMaxPressureFwd,prMaxPressureBwd:=@%FU.sv_rMaxPressureBwd,prMaxPressureFwdHydr:=@%FU.sv_HydrMaxValuesFwd.rMaxPressure,prMaxPressureBwdHydr:=@%FU.sv_HydrMaxValuesBwd.rMaxPressure,prIdentPressureFwd:=@%FU.sv_MinOutputFwd.rPressure,prIdentPressureBwd:=@%FU.sv_MinOutputBwd.rPressure) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@END_Attrib 
5 
@AttrSym @RT(28)sv_IdentMinSpeedState.Status @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(1)1 @RT(22)cLevelStartupTechnican @RT(0) @RT(13)fmtCalibState @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(1)y @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@END_Attrib 
@AttrSym @RT(32)sv_IdentMinSpeedState.bNameDummy @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(6)Nozzle @RT(6)Nozzle @RT(0) @RT(0) @RT(0) 
@END_Attrib 
@AttrSym @RT(27)sv_IdentMinSpeedState.bRedo @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(1)1 @RT(21)cLevelServiceEngineer @RT(0) @RT(5)OnOff @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@END_Attrib 
@AttrSym @RT(45)sv_IdentMinSpeedState.rMaxPositionLimitFactor @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(55)%FU.sv_IdentMinSpeedState.rMinPositionLimitFactor..0.99 @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@END_Attrib 
@AttrSym @RT(45)sv_IdentMinSpeedState.rMinPositionLimitFactor @RT(0) @F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(55)0.01..%FU.sv_IdentMinSpeedState.rMaxPositionLimitFactor @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@END_Attrib 


@SysVar @RT(17)sv_rIdentStopRamp @RT(0) @T @F @DT @RT(4)REAL @RT(0) @T @T @BASIC 0 @F 
@F @F 
@T 
@BEG_Attrib 
4 @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@RT(0) @RT(0) 
@RT(0) @RT(0) @RT(0) @RT(0) @RT(0) 
@END_Attrib 
0 


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
   PROGRAM


StringTheory:TemplateVersion equate('2.49')
ResizeAndSplit:TemplateVersion equate('4.13')
WINEVENT:Version              equate ('3.96')   !Deprecated
WinEvent:TemplateVersion      equate('3.96')
event:WinEventTaskbarLoadIcon equate(0500h+5510)

   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('EFOCUS.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE
  INCLUDE('UltimateDebug.INC'),ONCE
  include('StringTheory.Inc'),ONCE
  include('ResizeAndSplit.Inc'),ONCE
   INCLUDE('sdkODSMessagePump.inc'),ONCE  
   Include('EventEqu.Clw'),Once

   MAP
     MODULE('UDOVERVIEW_BC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('UDOVERVIEW002.CLW')
Main                   PROCEDURE   !
     END
     include('eventmap.clw')

DebugABCGlobalInformation_UDOverView PROCEDURE()                                         ! DEBUG Prototype
DebugABCGlobalVariables_UDOverView PROCEDURE()                                           ! DEBUG Prototype

       MyOKToEndSessionHandler(long pLogoff),long,pascal
       MyEndSessionHandler(long pLogoff),pascal
   END


Version              STRING(30)
SilentRunning        BYTE(0)                               ! Set true when application is running in 'silent mode'

!region File Declaration
!endregion

CLSkel_TplVersion    CSTRING('v16.06.27.1, Released 2016-06-27')
udb_Settings                GROUP,PRE(udb_Settings)
DebugOff                            BOOL(FALSE)
DebugPrefix                         STRING(20)
SaveToFile                          BOOL(FALSE)
ASCIIFileName                       STRING(100)
DebugNoCR                           BYTE(FALSE)
LineWrap                            BYTE(TRUE)
ModuleName                          STRING(100)
AppName                             STRING(100)
Modified                            STRING(26)
                            END
               
csResizeApp  CLASS(csResizeClass),TYPE
Fetch            PROCEDURE(STRING Sect,STRING Ent,*? Val),VIRTUAL
Update           PROCEDURE(STRING Sect,STRING Ent,STRING Val),VIRTUAL
               END
osdkODSMessagePump         CLASS(sdkODSMessagePump) 
                         END
WE::ProgramName     string(512)
WE::MustClose       long
WE::CantCloseNow    long

FuzzyMatcher         FuzzyClass                            ! Global fuzzy matcher
GlobalErrorStatus    ErrorStatusClass,THREAD
GlobalErrors         ErrorClass                            ! Global error manager
INIMgr               INIClass                              ! Global non-volatile storage manager
GlobalRequest        BYTE(0),THREAD                        ! Set when a browse calls a form, to let it know action to perform
GlobalResponse       BYTE(0),THREAD                        ! Set to the response from the form
VCRRequest           LONG(0),THREAD                        ! Set to the request from the VCR buttons

Dictionary           CLASS,THREAD
Construct              PROCEDURE
Destruct               PROCEDURE
                     END


  CODE
  GlobalErrors.Init(GlobalErrorStatus)
  FuzzyMatcher.Init                                        ! Initilaize the browse 'fuzzy matcher'
  FuzzyMatcher.SetOption(MatchOption:NoCase, 1)            ! Configure case matching
  FuzzyMatcher.SetOption(MatchOption:WordOnly, 0)          ! Configure 'word only' matching
  INIMgr.Init('.\UDOverView.INI', NVD_INI)                 ! Configure INIManager to use INI file
  DctInit
    udb_Settings.DebugOff      =  0
    udb_Settings.DebugPrefix   =  '[ID]'
    udb_Settings.SaveToFile    =  0
    udb_Settings.ASCIIFileName =  'DebugLog.txt'
    udb_Settings.DebugNoCR     =  1
    udb_Settings.LineWrap      =  0
  SYSTEM{PROP:Icon} = 'UDOverView.ico'
    ds_SetOKToEndSessionHandler(address(MyOKToEndSessionHandler))
    ds_SetEndSessionHandler(address(MyEndSessionHandler))
    WE::ProgramName = command('0')
    Version = ds_GetFileVersionInfo(,WE::ProgramName)
  Main
  INIMgr.Update
  INIMgr.Kill                                              ! Destroy INI manager
  FuzzyMatcher.Kill                                        ! Destroy fuzzy matcher
    
!--------------------------------------------------------------------
csResizeApp.Fetch   PROCEDURE(STRING Sect,STRING Ent,*? Val)
  CODE
  INIMgr.Fetch(Sect,Ent,Val)
!--------------------------------------------------------------------
csResizeApp.Update  PROCEDURE(STRING Sect,STRING Ent,STRING Val)
  CODE
  INIMgr.Update(Sect,Ent,Val)
! ------ winevent -------------------------------------------------------------------
MyOKToEndSessionHandler procedure(long pLogoff)
OKToEndSession    long(TRUE)
! Setting the return value OKToEndSession = FALSE
! will tell windows not to shutdown / logoff now.
! If parameter pLogoff = TRUE if the user is logging off.

  code
  return(OKToEndSession)

! ------ winevent -------------------------------------------------------------------
MyEndSessionHandler procedure(long pLogoff)
! If parameter pLogoff = TRUE if the user is logging off.

  code
 
!BOE: DEBUG Global
DebugABCGlobalInformation_UDOverView PROCEDURE()

UD                   UltimateDebug
                     
  CODE
  
  UD.Init('DebugABCGlobalInformation_UDOverView',udb_Settings)
    
  
  RETURN

DebugABCGlobalVariables_UDOverView PROCEDURE()

UD                   UltimateDebug

  CODE
  
  UD.Init('DebugABCGlobalVariables_UDOverView',udb_Settings)
  
  RETURN
!EOE: DEBUG Global



Dictionary.Construct PROCEDURE

  CODE
  IF THREAD()<>1
     DctInit()
  END


Dictionary.Destruct PROCEDURE

  CODE
  DctKill()




   MEMBER('UDOverView.clw')                                ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('UDOVERVIEW002.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('UDOVERVIEW001.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('UDOVERVIEW003.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
Main PROCEDURE 

UD                   UltimateDebug
                                MAP
LoadReportControl                   PROCEDURE()
FindPreviousValue                   PROCEDURE(STRING pFindValue)
TimeDifference                      PROCEDURE(STRING pFirstNumber,STRING pSecondNumber),STRING
ExpandTree                          PROCEDURE()
CollapseTree                        PROCEDURE()
ShowProperties                      PROCEDURE(STRING pMessage)
ApplyQuickFilters                   PROCEDURE()
ProcessKeycode                      PROCEDURE()
ManageRecentFiles                   PROCEDURE()
LoadRecentFiles                     PROCEDURE()
ApplyListFilter                     PROCEDURE()
LoadRecents                         PROCEDURE()
InitializeDebugOutputMonitoring     PROCEDURE()
UpdateAllQueues                     PROCEDURE()
ParseDebugMessages                  PROCEDURE()
ClearLog                            PROCEDURE()
RetrieveDebugMessages               PROCEDURE()
UpdateElapsedTimes                  PROCEDURE()
InitializeLists                     PROCEDURE()
SetMinimalView                      PROCEDURE()
SelectCurrentLine                   PROCEDURE()
ConvertHexToLong                    PROCEDURE(STRING hexstring),LONG
FillInValues                        PROCEDURE()
GetSelectedText                     PROCEDURE(SIGNED FEQ),STRING
UpdateFieldNameList                 PROCEDURE()
MarkAllFinds                        PROCEDURE()
SaveDBLog                           PROCEDURE
LoadDBLog                           PROCEDURE()
LoadListBoxStyles                   PROCEDURE()
AddQ                                PROCEDURE()
UpdateDisplayQueue                  PROCEDURE()

                                END

stFilterText            StringTheory

RecentsHandler      CLASS,TYPE 
!
!Properties
!----------
Q                       &QUEUE
ListFEQ                 SIGNED
ContentFEQ              SIGNED
FindSelectedButtonFEQ   SIGNED
FindNextButtonFEQ       SIGNED
SaveFilename            CSTRING(MAX_PATH)
!
!Methods
!-------
Init                    PROCEDURE(QUEUE Q,SIGNED ListFEQ,SIGNED ContentFEQ,SIGNED FindSelectedButtonFEQ,SIGNED FindNextButtonFEQ,STRING SaveFilename)
Load                    PROCEDURE(STRING pFileName)
TakeQueueAccepted       PROCEDURE
TakeNewValueButtonAccepted      PROCEDURE
TakeNextButtonAccepted  PROCEDURE,VIRTUAL  !ABSTRACT
TakeNewValue            PROCEDURE(STRING NewValue),BOOL
                    END


RecentFinds         CLASS(RecentsHandler)
FindNextValue           PROCEDURE(STRING pFindValue)
TakeNextButtonAccepted  PROCEDURE,DERIVED
                    END

RecentFilters       CLASS(RecentsHandler)
CurrentFilter           STRING(200)                           !
TakeNextButtonAccepted  PROCEDURE,DERIVED
ApplyFilter             PROCEDURE(STRING pFilter,<LONG pType>)
ClearFilter             PROCEDURE()
                    END


stParseMessage  StringTheory
stParseProperties   StringTheory
stParseDebugInfo    StringTheory
stParseLine         StringTheory


myMessageQ          queue(sdkODSMessageQ),pre(myMessageQ)
Line                    long 
                    end 
myPause     long 

myLineNumber        long 
myMessagesIn        queue(sdkODSMessageQ),pre(myMessagesIn)
                    end 
myPtr       long 
myRecordCount       long 

qFind       Queue,PRE(qFind)
Row             LONG
Message         STRING(10000)
            END

LeftSide            EQUATE(1)
RightSide           EQUATE(2)

FilterType          ITEMIZE,PRE(ft)
Thread                  EQUATE
FilterProcedure         EQUATE
FilterPrefix            EQUATE

                    END

ColumnWidths        LONG,DIM(8)

Content              STRING(64000)                         !
myAutoScroll         LONG(1)                               !
ShowAllMessages      BYTE                                  !
AutoScroll           BYTE(1)                               !
Filters              STRING(5000)                          !
LastFind             STRING(100)                           !
qEvent               QUEUE,PRE(qEvent)                     !
Description          STRING(60)                            !
Value                STRING(60)                            !
Line                 LONG                                  !
                     END                                   !
qLast                QUEUE,PRE(qLast)                      !
LastApp              STRING(60)                            !
LastModule           STRING(100)                           !
LastModified         STRING(20)                            !
Thread               LONG                                  !
ProcedureLine        LONG                                  !
                     END                                   !
TraceValue           STRING(5000)                          !
WatchForProfileDetails LONG                                !
qColumns             QUEUE,PRE(qColumns)                   !
Label                STRING(100)                           !
ExternalName         STRING(100)                           !
                     END                                   !
qProfileDetailDisplay QUEUE,PRE(qProfileDetailDisplay)     !
Column               STRING(100)                           !
Value                STRING(5000)                          !
Line                 LONG                                  !
                     END                                   !
qProfileDetail       QUEUE,PRE(qProfileDetail)             !
Column               STRING(100)                           !
Value                STRING(5000)                          !
Line                 LONG                                  !
                     END                                   !
WordWrap             BYTE(1)                               !
CurrentLine          LONG                                  !
ViewRawMessage       BYTE                                  !
StayOnTop            BYTE                                  !
Minimal              BYTE                                  !
LastLineSelected     LONG                                  !
WhichSide            BYTE                                  !
qPrefix              QUEUE,PRE(qPrefix)                    !
Prefix               STRING(20)                            !
                     END                                   !
qL                   QUEUE,PRE(qL)                         !
Thread               LONG                                  !
POINTER              LONG                                  !
CurrentLevel         LONG                                  !
                     END                                   !
qStats               QUEUE,PRE(qStats)                     !
PID                  STRING(14)                            !
ProcedureName        STRING(100)                           !
Count                LONG                                  !
Line                 LONG                                  !
Message              STRING(5000)                          !
                     END                                   !
qRecentFiles         QUEUE,PRE(qRecentFiles)               !
RecentFile           STRING(220)                           !
                     END                                   !
qRecentFinds         QUEUE,PRE(qRecentFinds)               !
Find                 STRING(100)                           !
                     END                                   !
CurrentFindPointer   LONG(1)                               !
qRecentFilters       QUEUE,PRE(qRecentFilters)             !
Filter               STRING(100)                           !
                     END                                   !
qProcess             QUEUE,PRE(qProcess)                   !
Process              STRING(160)                           !
                     END                                   !
qPID                 QUEUE,PRE(qPID)                       !
PID                  STRING(60)                            !
                     END                                   !
qProcedures          QUEUE,PRE(qProcedures)                !
ProcedureName        STRING(100)                           !
                     END                                   !
qTimes               QUEUE,PRE()                           !
LastProcedure        STRING(100)                           !
Thread               LONG                                  !
LastTime             STRING(12)                            !
                     END                                   !
qThreads             QUEUE,PRE()                           !
ThreadNo             STRING(3)                             !
SortNumber           LONG                                  !
                     END                                   !
qFlat                QUEUE,PRE(qFlat)                      !
Date                 STRING(26)                            !
Thread               LONG                                  !
ProcedureName        STRING(100)                           !
Level                LONG                                  !
Message              STRING(5000)                          !
Line                 LONG                                  !
                     END                                   !
qElapsed             QUEUE,PRE(qElapsed)                   !
ProcedureName        STRING(100)                           !
Elapsed              STRING(12)                            !
Message              STRING(5000)                          !
Line                 LONG                                  !
                     END                                   !
qMaster              QUEUE,PRE(qMaster)                    !
Line                 LONG                                  !
PID                  STRING(14)                            !
Process              STRING(160)                           !
Date                 STRING(26)                            !
Elapsed              STRING(12)                            !
Thread               LONG                                  !
Prefix               STRING(20)                            !
App                  STRING(60)                            !
Module               STRING(100)                           !
ProcedureName        STRING(100)                           !
Message              STRING(5000)                          !
Style                LONG                                  !
Level                LONG                                  !
Modified             STRING(20)                            !
RawMessage           STRING(5000)                          !
ProcedureLine        LONG                                  !
                     END                                   !
qProperties          QUEUE,PRE(qProperties)                !
PropName             STRING(60)                            !
PropValue            STRING(60)                            !
Line                 LONG                                  !
                     END                                   !
qProcs               QUEUE,PRE(qProcs)                     !
Date                 STRING(26)                            !
Thread               LONG                                  !
ProcedureName        STRING(100)                           !
Level                LONG                                  !
Message              STRING(5000)                          !
Line                 LONG                                  !
                     END                                   !
q                    QUEUE,PRE(q)                          !
Line                 LONG                                  !
PID                  STRING(14)                            !
Process              STRING(160)                           !
Date                 STRING(26)                            !
Elapsed              STRING(12)                            !
Thread               LONG                                  !
Prefix               STRING(20)                            !
App                  STRING(60)                            !
Module               STRING(100)                           !
ProcedureName        STRING(100)                           !
Message              STRING(5000)                          !
Style                LONG                                  !
Level                LONG                                  !
Modified             STRING(20)                            !
RawMessage           STRING(5000)                          !
ProcedureLine        LONG                                  !
                     END                                   !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('UltimateDebug OverView'),AT(,,944,506),FONT('Segoe UI',8),RESIZE,CENTER,ICON('UDOverView.ico'), |
  GRAY,IMM,SYSTEM,TIMER(20)
                       MENUBAR,USE(?MENUBAR1)
                         MENU('File'),USE(?MENUFile)
                           ITEM('Open'),USE(?ITEMLoad)
                           ITEM('Save'),USE(?ITEMSave)
                           ITEM,USE(?SEPARATOR1),SEPARATOR
                           ITEM('Settings'),USE(?ITEMSettings)
                         END
                         MENU('Help'),USE(?MENUHelp)
                           ITEM('About'),USE(?ITEMAbout)
                         END
                       END
                       STRING('File:'),AT(380,471),USE(?STRING5),HIDE
                       COMBO(@s220),AT(398,471,245,14),USE(qRecentFiles:RecentFile),FONT(,10),DROP(10),FROM(qRecentFiles), |
  HIDE
                       PROMPT('Find:'),AT(3,6),USE(?Find:Prompt)
                       COMBO(@s100),AT(24,4,245,14),USE(qRecentFinds:Find),FONT(,10),VSCROLL,DROP(10),FORMAT('400L(2)|M@s100@'), |
  FROM(qRecentFinds)
                       PROMPT('Filter:'),AT(364,6),USE(?Filter:Prompt)
                       COMBO(@s100),AT(388,4,245,14),USE(qRecentFilters:Filter),FONT(,10),VSCROLL,DROP(10),FROM(qRecentFilters)
                       BUTTON('...'),AT(649,471,32,15),USE(?LookupFile),HIDE,SKIP
                       BUTTON('Next'),AT(275,3,32,15),USE(?BUTTONNext),KEY(F3Key),SKIP
                       BUTTON('Load'),AT(685,471,42,15),USE(?BUTTONLoad),HIDE,SKIP
                       BUTTON('Previous'),AT(311,3,,15),USE(?BUTTONPrevious),SKIP
                       BUTTON('Apply'),AT(639,3,32,15),USE(?BUTTONApply),SKIP
                       BUTTON('Reset'),AT(675,3,42,15),USE(?BUTTONReset),SKIP
                       SHEET,AT(2,290,329,212),USE(?SHEET)
                         TAB('Tree'),USE(?TABTree)
                           LIST,AT(3,328,324,173),USE(?LISTProcs),FONT(,10),HVSCROLL,COLOR(COLOR:White),GRID(00D3D3D3h), |
  FLAT,FORMAT('69L(2)|M~Time~@s26@30L(2)|M~Thread~@n_5@400L(2)T~Procedure Name~@s100@'),FROM(qProcs)
                           BUTTON,AT(3,309,17,14),USE(?BUTTONContract),ICON('arrow_up.ico')
                           BUTTON,AT(21,309,17,14),USE(?BUTTONExpand),ICON('arrow_down.ico')
                           BUTTON('SeeQueue'),AT(163,309),USE(?BUTTONSeeQueue),HIDE
                         END
                         TAB('Flat'),USE(?TABFlat)
                           LIST,AT(3,327,323,173),USE(?LISTFlat),FONT(,10),HVSCROLL,FORMAT('66L(2)|M~Date~@s26@30L' & |
  '(2)|M~Thread~@n_5@120L(2)|M~Procedure Name~@s100@'),FROM(qFlat)
                         END
                         TAB('Elapsed'),USE(?TABTime)
                           LIST,AT(3,327,323,173),USE(?LISTElapsed),FONT(,10),HVSCROLL,FORMAT('96L(2)|M~Procedure ' & |
  'Name~@s100@48L(2)~Elapsed~@s12@'),FROM(qElapsed)
                         END
                         TAB('Stats'),USE(?TAB1)
                           LIST,AT(5,327,321,173),USE(?LISTStats),FONT(,10),HVSCROLL,FORMAT('34R(2)|M~PID~L(2)@s14' & |
  '@108L(2)|M~Procedure Name~@s100@60L(2)|M~Count~C(0)@n_9@'),FROM(qStats)
                         END
                         TAB('Filter'),USE(?TAB2)
                           TEXT,AT(5,327,321,162),USE(Filters)
                           STRING('Filters:'),AT(5,312),USE(?STRING8)
                         END
                       END
                       REGION,AT(331,290,4,210),USE(?EasyHSplit),BEVEL(1),IMM
                       REGION,AT(2,285,940,4),USE(?EasyVSplit),BEVEL(1),IMM
                       BUTTON('Apply'),AT(279,308,48,14),USE(?BUTTONListFilter),SKIP
                       BUTTON('Reset'),AT(231,308,44,14),USE(?BUTTONListClear),SKIP
                       BUTTON('Pause'),AT(805,3,66,15),USE(?BUTTONPause),SKIP
                       BUTTON('Clear Log'),AT(875,3,66,15),USE(?BUTTONClearLog),SKIP
                       CHECK(' Minimal View'),AT(3,36),USE(Minimal)
                       CHECK(' Stay On Top'),AT(3,25),USE(StayOnTop)
                       GROUP('Quick Filters'),AT(88,22,854,28),USE(?GROUPQuickFilter),BOXED
                         LIST,AT(488,32,78,13),USE(?LISTPrefix),VSCROLL,DROP(5),FROM(qPrefix)
                         STRING('Prefix:'),AT(461,34),USE(?STRING7)
                       END
                       LIST,AT(129,32,78,13),USE(?LISTPID),FONT(,10),VSCROLL,DROP(7),FROM(qPID)
                       STRING('PID:'),AT(110,34),USE(?STRING3)
                       LIST,AT(249,32,113,13),USE(?LISTProcess),FONT(,10),VSCROLL,DROP(7),FROM(qProcess)
                       STRING('Process:<0DH,0AH>'),AT(215,34,29),USE(?STRING4)
                       LIST,AT(402,32,51,13),USE(?LISTThreads),FONT(,10),VSCROLL,DROP(7),FORMAT('12L(2)@s3@'),FROM(qThreads)
                       STRING('Thread:'),AT(371,34),USE(?STRING1)
                       LIST,AT(615,32,167,13),USE(?LISTProcedures),FONT(,10),VSCROLL,DROP(7),FORMAT('400L(2)@s100@'), |
  FROM(qProcedures)
                       STRING('Procedure:'),AT(575,34),USE(?STRING2)
                       LIST,AT(840,32,90,13),USE(?LISTFilterHighlighted),DROP(6),FROM('None|All|Prefix|PID|Pro' & |
  'cess|Thread|Procedure')
                       STRING('Highlighted:'),AT(791,34),USE(?STRING6)
                       SHEET,AT(731,290,211,212),USE(?SHEETContent)
                         TAB('Properties'),USE(?TABContent)
                           LIST,AT(733,311,207,190),USE(?LISTProperties),HVSCROLL,FORMAT('48L(2)|M@s60@240L(2)|M@s60@'), |
  FROM(qProperties)
                         END
                         TAB('Trace Detail'),USE(?TAB3)
                           TEXT,AT(731,454,207,47),USE(TraceValue),VSCROLL
                           LIST,AT(732,311,207,138),USE(?LISTProfileDetails),HVSCROLL,FORMAT('94L(2)|M~Column~@s60' & |
  '@1020L(2)~Value~@s255@'),FROM(qProfileDetailDisplay)
                           BUTTON('See Queue'),AT(447,311),USE(?BUTTON2),HIDE
                           REGION,AT(730,451,208,2),USE(?EasyVSplit:2),BEVEL(1),IMM
                         END
                         TAB('Event Detail'),USE(?TABEvent)
                           LIST,AT(736,311,204,185),USE(?LISTEvent),FORMAT('91L(2)|M@s60@240L(2)@s60@'),FROM(qEvent)
                         END
                       END
                       TEXT,AT(336,311,391,190),USE(Content),FONT(,10),VSCROLL
                       BUTTON('Fill-In Values'),AT(662,470),USE(?BUTTONFillInValues),HIDE,SKIP
                       CHECK(' View Raw Message'),AT(553,297),USE(ViewRawMessage),SKIP
                       CHECK(' Word Wrap'),AT(493,297),USE(WordWrap),SKIP
                       BUTTON('Filter Highlighted'),AT(416,293,73,14),USE(?BUTTONFilterHighlighted),SKIP
                       BUTTON('Find Highlighted'),AT(339,293,73,14),USE(?BUTTONFindHighlighted),SKIP
                       LIST,AT(2,50,940,236),USE(?Messages),FONT(,10),HVSCROLL,COLOR(COLOR:White),GRID(00D3D3D3h), |
  FLAT,FORMAT('32R(2)|M~Line~L(2)@n_9@40R(2)|M~PID~L(2)@n_14@82L(2)|M~Process~@s160@62L' & |
  '(2)|M~Time~@s12@61L(2)|M~Elapsed~@s12@35L(2)|M~Thread~@n_4@57L(2)|M~Prefix~@s20@73L(' & |
  '2)|M~App~@s60@76L(2)|M~Module~@s100@82L(2)|M~Procedure~@s100@1020L(2)|MY~Message~@s255@'), |
  FROM(q)
                       REGION,AT(729,310,2,191),USE(?EasyHSplit:2),BEVEL(1),IMM
                       CHECK(' Auto-Scroll'),AT(721,4),USE(myAutoScroll),SKIP,TRN
                       CHECK(' Show All Messages'),AT(721,15),USE(ShowAllMessages),SKIP,TRN
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
! ----- csResize --------------------------------------------------------------------------
csResize             Class(csResizeClass)
Init                   PROCEDURE (),VIRTUAL
                     End  ! csResize
! ----- end csResize -----------------------------------------------------------------------
! ----- csVSplit1 --------------------------------------------------------------------------
csVSplit1            Class(csVSplitClass)
Init                   PROCEDURE (),VIRTUAL
                     End  ! csVSplit1
! ----- end csVSplit1 -----------------------------------------------------------------------
! ----- csVSplit4 --------------------------------------------------------------------------
csVSplit4            Class(csVSplitClass)
Init                   PROCEDURE (),VIRTUAL
                     End  ! csVSplit4
! ----- end csVSplit4 -----------------------------------------------------------------------
! ----- csHSplit7 --------------------------------------------------------------------------
csHSplit7            Class(csHSplitClass)
Init                   PROCEDURE (),VIRTUAL
                     End  ! csHSplit7
! ----- end csHSplit7 -----------------------------------------------------------------------
! ----- csHSplit6 --------------------------------------------------------------------------
csHSplit6            Class(csHSplitClass)
Init                   PROCEDURE (),VIRTUAL
                     End  ! csHSplit6
! ----- end csHSplit6 -----------------------------------------------------------------------
FileLookup2          SelectFileClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
  !------------------------------------
  !Style for ?Messages
  !------------------------------------
!---------------------------------------------------------------------------

ThisWindow.Ask PROCEDURE

 
  CODE
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
    
        udb_Settings.ModuleName = 'UDOverView002.clw'
        udb_Settings.AppName    = 'UDOverView.EXE'
        udb_Settings.Modified   = '08/26/2016 @ 09:08AM'
        UD.Init('Main',udb_Settings)
    
    
  GlobalErrors.SetProcedureName('Main')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?STRING5
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.Open(Window)                                        ! Open window
    RecentFinds.Init  (qRecentFinds  , ?qRecentFinds:Find    , ?Content, ?BUTTONFindHighlighted  , ?BUTTONNext , 'RecentFinds')
    RecentFilters.Init(qRecentFilters, ?qRecentFilters:Filter, ?Content, ?BUTTONFilterHighlighted, ?BUTTONApply, 'RecentFilters')
    LoadListBoxStyles()
    
     
   
    
  ?SHEET{PROP:TabSheetStyle} = TabStyle:Boxed
  ?SHEETContent{PROP:TabSheetStyle} = TabStyle:Boxed
  WinAlertMouseZoom()
  WinAlert(WE::WM_QueryEndSession,,Return1+PostUser)
  !Setting the LineHeight for every control of type LIST/DROP or COMBO in the window using the global setting.
  ?qRecentFiles:RecentFile{PROP:LineHeight} = 12
  ?qRecentFinds:Find{PROP:LineHeight} = 12
  ?qRecentFilters:Filter{PROP:LineHeight} = 12
  ?LISTProcs{PROP:LineHeight} = 12
  ?LISTFlat{PROP:LineHeight} = 12
  ?LISTElapsed{PROP:LineHeight} = 12
  ?LISTStats{PROP:LineHeight} = 12
  ?LISTPrefix{PROP:LineHeight} = 12
  ?LISTPID{PROP:LineHeight} = 12
  ?LISTProcess{PROP:LineHeight} = 12
  ?LISTThreads{PROP:LineHeight} = 12
  ?LISTProcedures{PROP:LineHeight} = 12
  ?LISTFilterHighlighted{PROP:LineHeight} = 12
  ?LISTProperties{PROP:LineHeight} = 12
  ?LISTProfileDetails{PROP:LineHeight} = 12
  ?LISTEvent{PROP:LineHeight} = 12
  ?Messages{PROP:LineHeight} = 12
  Do DefineListboxStyle
  Window{Prop:Alrt,255} = CtrlShiftP
  csResize.Init('Main',Window,0)
  INIMgr.Fetch('Main',Window)                              ! Restore window settings from non-volatile store
  FileLookup2.Init
  FileLookup2.ClearOnCancel = True
  FileLookup2.Flags=BOR(FileLookup2.Flags,FILE:LongName)   ! Allow long filenames
  FileLookup2.SetMask('DebugView Log','*.dblog')           ! Set the file mask
  FileLookup2.AddMask('All Files','*.*')                   ! Add additional masks
  FileLookup2.WindowTitle='Open DebugLog'
  csResize.Open()
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  If self.opened Then WinAlert().
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  csResize.Update()
  IF SELF.Opened
    INIMgr.Update('Main',Window)                           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    OF ?ITEMLoad
        LoadDBLog()
        
    OF ?ITEMSave
        SaveDBLog()
        
    OF ?qRecentFinds:Find
        IF RecentFinds.TakeNewValue(qRecentFinds:Find) END
        RecentFinds.TakeQueueAccepted()
    OF ?qRecentFilters:Filter
        IF RecentFilters.TakeNewValue(qRecentFilters:Filter) END
        RecentFilters.TakeQueueAccepted()
        
    OF ?BUTTONNext
        MarkAllFinds()
        RecentFinds.TakeNextButtonAccepted()
        
    OF ?BUTTONLoad
        LoadReportControl()
        
    OF ?BUTTONPrevious
        FindPreviousValue(qRecentFinds:Find)
        
    OF ?BUTTONApply
        RecentFilters.TakeNextButtonAccepted()
        
    OF ?BUTTONReset
        GET(q,?Messages{PROP:Selected}+0)
        CurrentLine = q.Line
        RecentFilters.ClearFilter()
        stFilterText.Free()
        InitializeLists()
        SelectCurrentLine()
        
    OF ?BUTTONContract
        CollapseTree()
        
    OF ?BUTTONExpand
        ExpandTree()
        
    OF ?BUTTONSeeQueue
        UD.DebugQueue(qProcs)
        
    OF ?BUTTONListFilter
        ApplyListFilter()
    OF ?BUTTONListClear
        RecentFilters.ClearFilter()
        SelectCurrentLine()
        
    OF ?BUTTONPause
        myPause = ABS(myPause - 1)
        ?BUTTONPause{PROP:Text} = CHOOSE(~myPause,'Pause','Resume')
        0{PROP:Timer} = CHOOSE(~myPause,10,0)
        
    OF ?BUTTONClearLog
        ClearLog()
      !!        SelectCurrentLine()
    OF ?Minimal
        SetMinimalView()
        
    OF ?StayOnTop
        EXECUTE StayOnTop + 1
            WinOnTop()
            WinNotOnTop()
        END
        
    OF ?LISTPrefix
        ApplyQuickFilters()
        
    OF ?LISTPID
        ApplyQuickFilters()
    OF ?LISTProcess
        ApplyQuickFilters()
    OF ?LISTThreads
        ApplyQuickFilters()
        
    OF ?LISTProcedures
        ApplyQuickFilters()
        
    OF ?LISTFilterHighlighted
        ApplyQuickFilters()
        
    OF ?BUTTON2
        UD.DebugQueue(qProfileDetail)
        
    OF ?BUTTONFillInValues
        FillInValues()
        
    OF ?WordWrap
        ?Content{PROP:HScroll} = ABS(WordWrap-1)
        
    OF ?BUTTONFilterHighlighted
      RecentFilters.TakeNewValueButtonAccepted()
    OF ?BUTTONFindHighlighted
      RecentFinds.TakeNewValueButtonAccepted()
    OF ?myAutoScroll
        IF myAutoScroll 
            ?Messages{PROP:Selected} =  RECORDS(q)
        END
            
    OF ?ShowAllMessages
        osdkODSMessagePump.ShowAllMessages = ShowAllMessages
        
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?ITEMSettings
      ThisWindow.Update()
      Settings()
      ThisWindow.Reset
        IF GlobalResponse = RequestCompleted
            LoadListBoxStyles()
        END
        
    OF ?ITEMAbout
      ThisWindow.Update()
      About()
      ThisWindow.Reset
    OF ?LookupFile
      ThisWindow.Update()
      qRecentFiles:RecentFile = FileLookup2.Ask(1)
      DISPLAY
    OF ?Messages
        ProcessKeycode()
        
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
    
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    IF csVSplit1.IsMoved() THEN CYCLE.
    IF csVSplit4.IsMoved() THEN CYCLE.
        
        
        
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
       
        
  ReturnValue = PARENT.TakeEvent()
    csResize.TakeEvent()
  CASE EVENT()
    OF EVENT:SplitMove  ! Defaults to EQUATE(EVENT:User + 498)
    
        
  END
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('Main',UD.SetApplicationName('UDOverView','EXE'),Window{PROP:Hlp},'05/23/2016 @ 10:33PM','08/26/2016 @ 09:08AM','08/26/2016 @ 02:05PM')  
    
       CYCLE
     END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
        
  CASE FIELD()
  OF ?Content
    CASE EVENT()
    OF EVENT:Selecting
        
    END
  OF ?Messages
    CASE EVENT()
    OF EVENT:Selecting
        
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE FIELD()
    OF ?LISTProcs
        IF FOCUS() = ?LISTProcs
            GET(qProcs,?LISTProcs{PROP:Selected}+0)
            ?Messages{PROP:Selected} = qProcs.Line
            GET(q,qProcs.Line)
            Content = CHOOSE(~ViewRawMessage,q.Message,q.RawMessage)
        
            ShowProperties(qProcs.Message)
        
            DISPLAY()
        END
        
        
    OF ?LISTFlat
        IF FOCUS() = ?LISTFlat
            GET(qFlat,?LISTFlat{PROP:Selected}+0)
            ?Messages{PROP:Selected} = qFlat.Line
            GET(q,qProcs.Line)
            Content = CHOOSE(~ViewRawMessage,q.Message,q.RawMessage)
        
            ShowProperties(qFlat.Message)
            DISPLAY()
            
        END
        
    OF ?LISTElapsed
        IF FOCUS() = ?LISTElapsed
            GET(qElapsed,?LISTElapsed{PROP:Selected}+0)
            ?Messages{PROP:Selected} = qElapsed.Line
            GET(q,qProcs.Line)
            Content = CHOOSE(~ViewRawMessage,q.Message,q.RawMessage)
        
            ShowProperties(qElapsed.Message)
        
            DISPLAY()
        END
        
    OF ?LISTStats
        IF FOCUS() = ?LISTStats
            GET(qStats,?LISTStats{PROP:Selected}+0)
            ?Messages{PROP:Selected} = qStats.Line
            GET(q,qProcs.Line)
            Content = CHOOSE(~ViewRawMessage,q.Message,q.RawMessage)
        
            ShowProperties(qStats.Message)
        
            DISPLAY()
        END
        
    OF ?LISTProfileDetails
        GET(qProfileDetailDisplay,?LISTProfileDetails{PROP:Selected}+0) 
        TraceValue = qProfileDetailDisplay.Value
        Display(?TraceValue)
        
    OF ?Messages
        GET(q,?Messages{PROP:Selected}+0)
        CurrentLine = q.Line
        IF KEYCODE() = MouseLeft
            myAutoScroll = FALSE
            CYCLE
        END
        
    END
  ReturnValue = PARENT.TakeNewSelection()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE FIELD()
    OF ?LISTProfileDetails
        
        
    END
  ReturnValue = PARENT.TakeSelected()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:CloseDown
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
    OF EVENT:OpenWindow
        LoadRecents()
        InitializeLists()
        InitializeDebugOutputMonitoring()
        
      
        
    OF EVENT:Timer
        RetrieveDebugMessages()
        
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        SELECT(?Messages)
        
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!----------------------------------------------------
csResize.Init   PROCEDURE ()
  CODE
  PARENT.Init ()
  Self.CornerStyle = Ras:CornerDots
  SELF.GrabCornerLines() !
  SELF.Strategy(?SHEET,,100,,0)
  SELF.Strategy(?LISTProcs,,100,,0)
  SELF.Strategy(?BUTTONSeeQueue,100,100,0,0)
  SELF.Strategy(?LISTFlat,,100,,0)
  SELF.Strategy(?LISTElapsed,,100,,0)
  SELF.Strategy(?LISTStats,,100,,0)
  SELF.Strategy(?Filters,,100,,0)
  SELF.Strategy(?STRING8,,100,,0)
  SELF.Strategy(?EasyHSplit,,0,,100)
  SELF.Strategy(?EasyVSplit,0,100,100,0)
  SELF.Strategy(?BUTTONListFilter,,100,,0)
  SELF.Strategy(?BUTTONListClear,,100,,0)
  SELF.Strategy(?BUTTONPause,100,,0,)
  SELF.Strategy(?BUTTONClearLog,100,,0,)
  SELF.Strategy(?SHEETContent,100,100,0,0)
  SELF.Strategy(?LISTProperties,100,100,0,0)
  SELF.Strategy(?TraceValue,100,100,0,0)
  SELF.Strategy(?LISTProfileDetails,100,100,0,0)
  SELF.Strategy(?BUTTON2,100,100,0,0)
  SELF.Strategy(?EasyVSplit:2,100,100,0,0)
  SELF.Strategy(?LISTEvent,100,100,0,0)
  SELF.Strategy(?Content,0,100,100,0)
  SELF.Strategy(?BUTTONFillInValues,100,100,0,0)
  SELF.Strategy(?WordWrap,,100,,0)
  SELF.Strategy(?BUTTONFilterHighlighted,,100,,0)
  SELF.Strategy(?BUTTONFindHighlighted,,100,,0)
  SELF.Strategy(?Messages,0,0,100,100)
  SELF.Strategy(?EasyHSplit:2,100,100,0,0)
  SELF.Strategy(?myAutoScroll,100,,0,)
  SELF.Strategy(?ShowAllMessages,100,,0,)
  ?EasyVSplit{prop:cursor} = Cursor:SizeNS
  csVSplit1.Init('EasyVSplit',SELF,?EasyVSplit,'PANEL',RAS:NotDynamic)
  ?EasyVSplit:2{prop:cursor} = Cursor:SizeNS
  csVSplit4.Init('EasyVSplit:2',SELF,?EasyVSplit:2,'PANEL',RAS:NotDynamic)
  ?EasyHSplit{prop:cursor} = Cursor:SizeWE
  csHSplit7.Init('EasyHSplit',SELF,?EasyHSplit,'PANEL',RAS:NotDynamic)
  ?EasyHSplit:2{prop:cursor} = Cursor:SizeWE
  csHSplit6.Init('EasyHSplit:2',SELF,?EasyHSplit:2,'PANEL',RAS:NotDynamic)
!----------------------------------------------------
csVSplit1.Init   PROCEDURE ()
  CODE
  SELF.ResizedControl(?SHEET)
  SELF.ResizedControl(?LISTProcs)
  SELF.ResizedControl(?LISTFlat)
  SELF.ResizedControl(?LISTElapsed)
  SELF.ResizedControl(?LISTStats)
  SELF.ResizedControl(?EasyHSplit)
  SELF.ResizedControl(?SHEETContent)
  SELF.ResizedControl(?LISTProperties)
  SELF.ResizedControl(?LISTProfileDetails)
  SELF.ResizedControl(?LISTEvent)
  SELF.ResizedControl(?Content)
  SELF.ResizedControl(?Messages)
  SELF.ResizedControl(?EasyHSplit:2)
  SELF.MovedControl(?BUTTONContract)
  SELF.MovedControl(?BUTTONExpand)
  SELF.MovedControl(?BUTTONListFilter)
  SELF.MovedControl(?BUTTONListClear)
  SELF.MovedControl(?ViewRawMessage)
  SELF.MovedControl(?BUTTONFindHighlighted)
  SELF.MovedControl(?BUTTONFilterHighlighted)
  SELF.MovedControl(?WordWrap)
  PARENT.Init ()
!----------------------------------------------------
csVSplit4.Init   PROCEDURE ()
  CODE
  SELF.ResizedControl(?TraceValue)
  SELF.ResizedControl(?LISTProfileDetails)
  PARENT.Init ()
!----------------------------------------------------
csHSplit7.Init   PROCEDURE ()
  CODE
  SELF.ResizedControl(?SHEET)
  SELF.ResizedControl(?LISTProcs)
  SELF.ResizedControl(?LISTFlat)
  SELF.ResizedControl(?LISTElapsed)
  SELF.ResizedControl(?LISTStats)
  SELF.ResizedControl(?Content)
  SELF.MovedControl(?BUTTONListFilter)
  SELF.MovedControl(?BUTTONListClear)
  SELF.MovedControl(?ViewRawMessage)
  SELF.MovedControl(?BUTTONFindHighlighted)
  SELF.MovedControl(?BUTTONFilterHighlighted)
  SELF.MovedControl(?WordWrap)
  PARENT.Init()
  PARENT.Init ()
!----------------------------------------------------
csHSplit6.Init   PROCEDURE ()
  CODE
  SELF.ResizedControl(?SHEETContent)
  SELF.ResizedControl(?LISTProperties)
  SELF.ResizedControl(?TraceValue)
  SELF.ResizedControl(?LISTProfileDetails)
  SELF.ResizedControl(?EasyVSplit:2)
  SELF.ResizedControl(?LISTEvent)
  SELF.ResizedControl(?Content)
  SELF.InitFixedControls(?ViewRawMessage)
  PARENT.Init()
  PARENT.Init ()
RecentsHandler.Init             PROCEDURE(QUEUE pQ,SIGNED pListFEQ,SIGNED ContentFEQ,SIGNED FindSelectedButtonFEQ,SIGNED FindNextButtonFEQ,STRING SaveFilename)
    CODE
    SELF.Q                    &=  pQ
    SELF.ListFEQ               =  pListFEQ
    SELF.ContentFEQ            =  ContentFEQ
    SELF.FindSelectedButtonFEQ =  FindSelectedButtonFEQ
    SELF.FindNextButtonFEQ     =  FindNextButtonFEQ
    SELF.SaveFilename          =  CLIP(SaveFilename)

    
RecentsHandler.Load             PROCEDURE(STRING pFileName)
stFinds                             StringTheory
lCount                              LONG
    CODE
    FREE(SELF.Q)
    stFinds.LoadFile(pFileName)
    stFinds.Split('<13,10>')
    LOOP lCount = 1 TO stFinds.Records()
        SELF.Q =  stFinds.GetLine(lCount)
        IF SELF.Q <> ''
            ADD(SELF.Q)
        END
    END
    GET(SELF.Q,1)
    CLEAR(SELF.Q)
    DISPLAY(SELF.ListFEQ)
  
    
RecentsHandler.TakeQueueAccepted        PROCEDURE

    CODE
    
    SELF.TakeNextButtonAccepted()
  
    
RecentsHandler.TakeNextButtonAccepted   PROCEDURE

    CODE
!Abstract Virtual Method
    ASSERT(FALSE, 'This method is supposed to be derived by the instance.')
  
    
RecentsHandler.TakeNewValueButtonAccepted       PROCEDURE

    CODE
    
    IF SELF.TakeNewValue(GetSelectedText(SELF.ContentFEQ))
        POST(EVENT:Accepted, SELF.FindNextButtonFEQ)
    END

    
RecentsHandler.TakeNewValue     PROCEDURE(STRING NewValue)!,BOOL

stFinds                             StringTheory
lCount                              LONG
FindValue                           STRING(100)

    CODE
    
!--- Determine working value
    IF OMITTED(NewValue)
        FindValue =  SELF.Q
    ELSE
        FindValue =  NewValue
    END

    IF FindValue <> ''
        !--- Delete from recents, if it exists
        LOOP lCount = 1 TO RECORDS(SELF.Q)
            GET(SELF.Q, lCount)
            IF SELF.Q = FindValue
                DELETE(SELF.Q)
                BREAK
            END
        END

        !--- Add to the top of recents
        SELF.Q =  FindValue
        ADD(SELF.Q, 1)

        !--- Prune any recents beyond 20
        LOOP WHILE RECORDS(SELF.Q) > 20
            GET(SELF.Q, RECORDS(SELF.Q))
            DELETE(SELF.Q)
        END

        !--- Remember Recents
        LOOP lCount = 1 TO RECORDS(SELF.Q)
            GET(SELF.Q, lCount)
            stFinds.Append(CLIP(SELF.Q), TRUE, '<13,10>')
        END
        stFinds.SaveFile(SELF.SaveFilename &'.dat')
        !--- Show Recent
        GET(SELF.Q, 1)
        DISPLAY(SELF.ListFEQ)
        RETURN TRUE
    ELSE
        RETURN FALSE
    END
 
!==============================================================================
RecentFinds.FindNextValue       PROCEDURE(STRING pFindValue)
lCount                              LONG
    CODE
    CurrentFindPointer =  ?Messages{PROP:Selected}+1
    LOOP lCount = CurrentFindPointer TO RECORDS(q)
        GET(q,lCount)
        IF INSTRING(UPPER(CLIP(pFindValue)),UPPER(q.Message),1,1)
            ?Messages{PROP:Selected} =  lCount
            POST(EVENT:NewSelection,?Messages)
            Content =  CHOOSE(~ViewRawMessage,q.Message,q.RawMessage)
            ShowProperties(qProcs.Message)
            DISPLAY()
            BREAK
        END
    END
    
!==============================================================================
RecentFinds.TakeNextButtonAccepted      PROCEDURE

    CODE
    
    SELF.FindNextValue(qRecentFinds:Find)

!==============================================================================
RecentFilters.TakeNextButtonAccepted    PROCEDURE

    CODE
    
    SELF.CurrentFilter =  qRecentFilters:Filter
    SELF.ApplyFilter(qRecentFilters:Filter)

!==============================================================================
RecentFilters.ApplyFilter       PROCEDURE(STRING pFilter,<LONG pType>)

lCount                              LONG

    CODE
    
    FREE(q)
    
    LOOP lCount = 1 TO RECORDS(qMaster)  
        GET(qMaster,lCount)
        IF pType = ft:Thread
            IF qMaster.Thread = pFilter + 0
                AddQ()
            END
            
        ELSIF pType = ft:FilterProcedure
            IF CLIP(qMaster.ProcedureName) = CLIP(pFilter)
                AddQ()
            END
            
        ELSIF pType = ft:FilterPrefix
            IF CLIP(qMaster.Prefix) = CLIP(pFilter)
                AddQ()
            END
            
        ELSE
            IF INSTRING(CLIP(UPPER(pFilter)),UPPER(qMaster.Message),1,1)
                AddQ()
            END
            
        END
        
    END
    
    
!==============================================================================
RecentFilters.ClearFilter       PROCEDURE()
lCount                              LONG
    CODE
    SELF.CurrentFilter =  ''
    FREE(q)
    LOOP lCount = 1 TO RECORDS(qMaster)
        GET(qMaster,lCount)
        AddQ()
    END
    qRecentFilters:Filter =  ''
    DISPLAY()
    
    
LoadReportControl               PROCEDURE()

                                MAP
IncrementCount                      PROCEDURE()
                                END

stText                              StringTheory
stLines                             StringTheory
stParse                             StringTheory
stFields                            StringTheory
stMessage                           StringTheory
stTime                              StringTheory
stProperties                        StringTheory
stPropertyValue                     StringTheory


dbThread                            LONG
dbProcedure                         STRING(100)
dbDate                              STRING(40)


lCount                              LONG
RowID                               STRING(20)
OrderCount                          LONG(0)

RowObject                           STRING(20)

CurrentThread                       LONG(0)



    CODE
    
    ClearLog()
    
    stText.LoadFile(qRecentFiles:RecentFile)
    stText.Split('<13,10>')
    
    LOOP lCount = 1 TO stText.Records()
        stLines.Free()
        stLines.SetValue(stText.GetLine(lCount))
        
        IF stLines.Instring('[||]')
            stLines.Split('[||]')
        ELSE
            CYCLE
        END
        
        IF stLines.Records() = 1
        ELSE
            
            CLEAR(q)
            
            stParse.Free()
            stParse.SetValue(stLines.GetLine(2))
            stParse.Split(',')
            
            !Thread
            stFields.Free()
            stFields.SetValue(stParse.GetLine(2))
            stFields.Split(' ')
            dbThread =  stFields.GetLine(2)
            q.Thread =  stFields.GetLine(2)
            
            !ProcedureName
            stFields.Free()
            stFields.SetValue(stParse.GetLine(3))
            stFields.Split(' ')
            q.ProcedureName =  stFields.GetLine(2)
            
            !Message
            stFields.Free()
            q.Message =  stParse.GetLine(4)
            
            
            stParse.Free()
            stParse.SetValue(stLines.GetLine(1))
            stParse.Split('<9>')
            
            stTime.SetValue(stParse.GetLine(2))
            stTime.Split(' ')
            q.Date    =  stTime.GetLine(2)
            q.PID     =  stParse.GetLine(3)
            q.Process =  stParse.GetLine(4)
            ADD(q)
            UpdateAllQueues()
            
        END
        
    END
    
!    InitializeLists()
    
    
InitializeLists                 PROCEDURE()

    CODE
    
    qPrefix.Prefix = 'All'
    GET(qPrefix,qPrefix.Prefix)
    IF ERROR()
        ADD(qPrefix,1)
    END
    ?ListPrefix{PROP:Selected} = 1
    
    qThreads.ThreadNo = 'All'
    GET(qThreads,qThreads.ThreadNo)
    IF ERROR()
        ADD(qThreads,1)
    END
    ?ListThreads{PROP:Selected} = 1
    
    qPID.PID = 'All'
    GET(qPID,qPid.PID)
    IF ERROR()
        ADD(qPID,1)
    END
    ?ListPID{PROP:Selected} = 1
    
    qProcess.Process = 'All'
    GET(qProcess,qProcess.Process)
    IF ERROR()
        ADD(qProcess,1)
    END
    ?ListProcess{PROP:Selected} = 1
    
!!    SORT(qProcedures,qProcedures.ProcedureName)
    qProcedures.ProcedureName = 'All'
    GET(qProcedures,qProcedures.ProcedureName)
    IF ERROR()
        ADD(qProcedures,1)
    END
    ?ListProcedures{PROP:Selected} = 1
    
    SORT(qProcs,qProcs.Thread,qProcs.Date)
    SORT(qElapsed,-qElapsed.Elapsed)  
    
    ?ListProcs{PROP:Selected} = 1
    POST(EVENT:NewSelection,?ListProcs)
    
    ?LISTFilterHighlighted{PROP:Selected} = 1

    
UpdateAllQueues                  PROCEDURE()

    CODE
    
    IF SUB(qMaster.Message,1,2) = '>>'
            
        CLEAR(qL)
        qL.Thread =  qMaster.Thread
        GET(qL,qL.Thread)
        IF ERROR()
            qL.POINTER =  RECORDS(qProcs)
            ADD(qL)
        END
        qL.CurrentLevel     +=  1
                
        qProcs.Date          =  qMaster.Date
        qProcs.Thread        =  qMaster.Thread
        qProcs.ProcedureName =  '> ' & qMaster.ProcedureName
        qProcs.Level         =  qL.CurrentLevel * -1
        qProcs.Line          =  qMaster.Line
                
        ADD(qProcs,qL.POINTER+1)
                
        qL.POINTER =  POINTER(qProcs)
        PUT(qL)
               
        CLEAR(qStats)
        qStats.PID           =  qMaster.PID
        qStats.ProcedureName =  qMaster.ProcedureName
        GET(qStats,qStats.PID,qStats.ProcedureName)
        IF ERROR()
            qStats.Line    =  qMaster.Line
            qStats.Message =  qMaster.Message
            ADD(qStats)
        END
        qStats.Count +=  1
        PUT(qStats)
                
    END
            
    IF SUB(qMaster.Message,1,2) = '<60><60>'
            
        CLEAR(qL)
        qL.Thread =  qMaster.Thread
        GET(qL,qL.Thread)
        IF ERROR()
            qL.POINTER =  RECORDS(qProcs)
            ADD(qL)
        END
                
        qProcs.Date          =  qMaster.Date
        qProcs.Thread        =  qMaster.Thread
        qProcs.ProcedureName =  '< ' & qMaster.ProcedureName
        qProcs.Level         =  (qL.CurrentLevel+1) * -1
        qProcs.Line          =  qMaster.Line
        ADD(qProcs,qL.POINTER+1)
        
        qL.CurrentLevel -=  1
        qL.POINTER       =  POINTER(qProcs)
        PUT(qL)
                
    END
    
    IF qMaster.ProcedureName = ''
    ELSE
        qProcedures.ProcedureName =  qMaster.ProcedureName
        GET(qProcedures,qProcedures.ProcedureName)
        IF ERROR()
            ADD(qProcedures,qProcedures.ProcedureName)
            qProcedures.ProcedureName = 'All'
            GET(qProcedures,qProcedures.ProcedureName)
            IF ~ERROR()
                DELETE(qProcedures)
            END
            ADD(qProcedures,1)
        END
    END
    
            
    qElapsed :=: qMaster
    ADD(qElapsed)
            
    qFlat :=: qProcs
    ADD(qFlat)
            
    qPID.PID =  qMaster.PID
    GET(qPID,qPID.PID)
    IF ERROR()
        ADD(qPID,RECORDS(qPID)+1) 
    END
    
    IF qmaster.Process = ''
    ELSE
        qProcess.Process =  qMaster.Process
        GET(qProcess,qProcess.Process)
        IF ERROR()
            ADD(qProcess,qProcess.Process) 
            qProcess.Process = 'All'
            GET(qProcess,qProcess.Process)
            IF ~ERROR()
                DELETE(qProcess)
            END
            ADD(qProcess,1)
        END
    END
    
    
    IF qMaster.Thread = ''
    ELSE
        qThreads.ThreadNo =  qMaster.Thread
        GET(qThreads,qThreads.ThreadNo)
        IF ERROR()
            qThreads.SortNumber = qThreads.ThreadNo
            ADD(qThreads)
            qThreads.ThreadNo = 'All'
            GET(qThreads,qThreads.ThreadNo)
            IF ~ERROR()
                DELETE(qThreads)
            END
            SORT(qThreads,qThreads.SortNumber)
            ADD(qThreads,1)
        END
    END
    
    
    IF qMaster.Prefix = ''
    ELSE
        qPrefix.Prefix =  qMaster.Prefix
        GET(qPrefix,qPrefix.Prefix)
        IF ERROR()
            ADD(qPrefix,qPrefix.Prefix)
            qPrefix.Prefix = 'All'
            GET(qPrefix,qPrefix.Prefix)
            IF ~ERROR()
                DELETE(qPrefix)
            END
            ADD(qPrefix,1)
        END
    END
    
    

    
    
IncrementCount                  PROCEDURE()
    
    CODE
    
    OrderCount += 1
    RowID = OrderCount
 
    
FindPreviousValue                   PROCEDURE(STRING pFindValue)

lCount                              LONG

    CODE
    
    CurrentFindPointer = ?Messages{PROP:Selected}-1
    
    LOOP lCount = CurrentFindPointer TO 1 BY -1
        GET(q,lCount)
        IF INSTRING(UPPER(CLIP(pFindValue)),UPPER(q.Message),1,1)
            ?Messages{PROP:Selected} = lCount
            POST(EVENT:NewSelection,?Messages)
            Content = CHOOSE(~ViewRawMessage,q.Message,q.RawMessage)
            ShowProperties(qProcs.Message)
            DISPLAY()
            BREAK
        END
    END
    
    
TimeDifference                  PROCEDURE(STRING pFirstNumber,STRING pSecondNumber)  !,STRING

stNumber                       StringTheory

fHour                               LONG
fMinute                             LONG
fSecond                             LONG
fMilli                              LONG

sHour                               LONG
sMinute                             LONG
sSecond                             LONG
sMilli                              LONG

rHour                               LONG
rMinute                             LONG
rSecond                             LONG
rMilli                              LONG

Remainder                           LONG

    CODE
    
    IF pSecondNumber = ''
        RETURN '-'
    END
    
    stNumber.SetValue(pFirstNumber)
    stNumber.Replace('.',':')
    stNumber.Split(':')
    fHour = stNumber.GetLine(1)
    fMinute = stNumber.GetLine(2)
    fSecond = stNumber.GetLine(3)
    fMilli = stNumber.GetLine(4)
    
    stNumber.Free()
    stNumber.SetValue(pSecondNumber)
    stNumber.Replace('.',':')
    stNumber.Split(':')
    sHour = stNumber.GetLine(1)
    sMinute = stNumber.GetLine(2)
    sSecond = stNumber.GetLine(3)
    sMilli = stNumber.GetLine(4)
    
    rHour = fHour - sHour
    
    rMinute = fMinute - sMinute
    IF rMinute < 0
        rHour -= 1
        rMinute = 60 + rMinute
    END
    
    rSecond = fSecond - sSecond
    IF rSecond < 0
        rMinute -= 1
        rSecond = 60 + rSecond
    END
    
    rMilli = fMilli - sMilli
    IF rMilli < 0
        rSecond -= 1
        rMilli = 1000 + rMilli
    END
    
    RETURN  FORMAT(rHour,@N02) & ':' & FORMAT(rMinute,@N02) & ':' & FORMAT(rSecond,@N02) & '.' & FORMAT(rMilli,@N03) & ':'

    
ExpandTree                      PROCEDURE()

lCount                              LONG

    CODE
    
    LOOP lCount = 1 TO RECORDS(qProcs)
        GET(qProcs,lCount)
        qProcs.Level = ABS(qProcs.Level)
        PUT(qProcs)
    END

    
CollapseTree                    PROCEDURE()  

lCount                              LONG
   
    CODE
    
    LOOP lCount = 1 TO RECORDS(qProcs)
        GET(qProcs,lCount)
        qProcs.Level = ABS(qProcs.Level) * -1
        PUT(qProcs)
    END
    
    
ShowProperties                  PROCEDURE(STRING pMessage)

stProperties                        StringTheory
stPropertyValue                     StringTheory

    CODE
    
    FREE(qProperties)
    
    qProperties.PropName = 'Line'
    qProperties.PropValue = q.Line
    qProperties.Line = q.Line
    ADD(qProperties)
    
    qProperties.PropName = 'PID'
    qProperties.PropValue = q.PID
    qProperties.Line = q.Line
    ADD(qProperties)
    
    qProperties.PropName = 'Process'
    qProperties.PropValue = q.Process
    qProperties.Line = q.Line
    ADD(qProperties)
    
    qProperties.PropName = 'Time'
    qProperties.PropValue = q.Date
    qProperties.Line = q.Line
    ADD(qProperties)
    
    qProperties.PropName = 'Thread'
    qProperties.PropValue = q.Thread
    qProperties.Line = q.Line
    ADD(qProperties)
    
    qProperties.PropName = 'Prefix'
    qProperties.PropValue = q.Prefix
    qProperties.Line = q.Line
    ADD(qProperties)
    
    qProperties.PropName = 'App'
    qProperties.PropValue = q.App
    qProperties.Line = q.Line
    ADD(qProperties)
     
    qProperties.PropName = 'Module'
    qProperties.PropValue = q.Module
    qProperties.Line = q.Line
    ADD(qProperties)
     
    qProperties.PropName = 'Modified'
    qProperties.PropValue = q.Modified
    qProperties.Line = q.Line
    ADD(qProperties)
    

ApplyQuickFilters                      PROCEDURE()
    
lCount                              LONG

    CODE
    
    GET(q,?Messages{PROP:Selected}+0)
    
    FREE(q)
    
    EXECUTE CHOICE(?LISTFilterHighlighted)
        BEGIN   !None
        END
        BEGIN   !All
            qPrefix.Prefix = q.Prefix
            GET(qPrefix,qPrefix.Prefix)
            IF ~ERROR()
                ?ListPrefix{PROP:Selected} = POINTER(qPrefix)
            END
            qPID.PID = q.PID
            GET(qPID,qPID:PID)
            IF ~ERROR()
                ?ListPID{PROP:Selected} = POINTER(qPID)
            END
            
            qProcess.Process = q.Process
            GET(qProcess,qProcess.Process)
            IF ~ERROR()
                ?ListProcess{PROP:Selected} = POINTER(qProcess)
            END
            
            qThreads.ThreadNo = q.Thread
            GET(qThreads,qThreads.ThreadNo)
            IF ~ERROR()
                ?ListThreads{PROP:Selected} = POINTER(qThreads)
            END
            
            qProcedures.ProcedureName = q.ProcedureName
            GET(qProcedures,qProcedures.ProcedureName)
            IF ~ERROR()
                ?ListProcedures{PROP:Selected} = POINTER(qProcedures)
            END
            
        END
        BEGIN   !Prefix
            qPrefix.Prefix = q.Prefix
            GET(qPrefix,qPrefix.Prefix)
            IF ~ERROR()
                ?ListPrefix{PROP:Selected} = POINTER(qPrefix)
            END
        END
        BEGIN   !PID
            qPID.PID = q.PID
            GET(qPID,qPID:PID)
            IF ~ERROR()
                ?ListPID{PROP:Selected} = POINTER(qPID)
            END
        END
        BEGIN   !Process
            qProcess.Process = q.Process
            GET(qProcess,qProcess.Process)
            IF ~ERROR()
                ?ListProcess{PROP:Selected} = POINTER(qProcess)
            END
        END
        BEGIN   !Thread
            qThreads.ThreadNo = q.Thread
            GET(qThreads,qThreads.ThreadNo)
            IF ~ERROR()
                ?ListThreads{PROP:Selected} = POINTER(qThreads)
            END
        END
        BEGIN   !Procedure
            qProcedures.ProcedureName = q.ProcedureName
            GET(qProcedures,qProcedures.ProcedureName)
            IF ~ERROR()
                ?ListProcedures{PROP:Selected} = POINTER(qProcedures)
            END
        END
        
    END
    
    ?LISTFilterHighlighted{PROP:Selected} = 1
    
    stFilterText.Free()
    
    GET(qThreads,?ListThreads{PROP:Selected}+0)
    IF qThreads.ThreadNo <> 'ALL'
        stFilterText.Append(qThreads.ThreadNo & '|ThreadNo',TRUE,'<13,10>')
    END
    
    GET(qProcedures,?ListProcedures{PROP:Selected}+0)
    IF qProcedures.ProcedureName <> 'ALL'
        stFilterText.Append(qProcedures.ProcedureName & '|ProcedureName',TRUE,'<13,10>')
    END
    
    GET(qProcess,?ListProcess{PROP:Selected}+0)
    IF qProcess.Process <> 'ALL'
        stFilterText.Append(qProcess.Process & '|Process',TRUE,'<13,10>')
    END
    
    GET(qPID,?ListPID{PROP:Selected}+0)
    IF qPID.PID <> 'ALL'
        stFilterText.Append(qPID.PID & '|PID',TRUE,'<13,10>')
    END
    
    GET(qPrefix,?ListPrefix{PROP:Selected}+0)
    IF qPrefix.Prefix <> 'ALL'
        stFilterText.Append(qPrefix.Prefix & '|Prefix',TRUE,'<13,10>')
    END
    
    LOOP lCount = 1 TO RECORDS(qMaster)
        GET(qMaster,lCount)
        UpdateDisplayQueue()
    END
    
    Select(?Messages)
    SelectCurrentLine() 
   
    
ProcessKeycode                  PROCEDURE()

StartRead                           LONG
EndRead                             LONG
lCount                              LONG
stMessage                           StringTheory
ProfileCount                        LONG

stEvent                             StringTheory
stEventLine                         StringTheory

    CODE
    
    IF KEYCODE() = CtrlMouseLeft
        
    ELSIF KEYCODE() = EndKey 
        ?Messages{PROP:Selected} =  RECORDS(q)
        myAutoScroll             =  TRUE
            
            
    ELSIF KEYCODE() = ShiftMouseLeft
        StartRead = CHOOSE(LastLineSelected < ?Messages{PROP:Selected}+0,LastLineSelected,?Messages{PROP:Selected})
        EndRead = CHOOSE(LastLineSelected < ?Messages{PROP:Selected}+0,?Messages{PROP:Selected},LastLineSelected)
        
        LOOP lCount = StartRead TO EndRead
            GET(q,lCount)
            stMessage.Append(CHOOSE(~ViewRawMessage,q.Message,q.RawMessage),TRUE,'<13,10>')                
        END
        Content = stMessage.GetValue()
        DISPLAY()
        
    ELSE
        LastLineSelected = ?Messages{PROP:Selected}+0
        
        GET(q,?Messages{PROP:Selected}+0)
        Content = CHOOSE(~ViewRawMessage,q.Message,q.RawMessage)
        DISPLAY()
        
        FREE(qProfileDetailDisplay)
        CLEAR(qProfileDetailDisplay)
        IF INSTRING('Preparing Statement',q.Message,1,1)
            FillInValues()
            DISPLAY()
        END
        
        qProcs.Line = q.ProcedureLine
        GET(qProcs,qProcs.Line)
        ?LISTProcs{PROP:Selected} = POINTER(qProcs)
        ShowProperties(qProcs.Message)
        
        qFlat.Line = q.ProcedureLine
        GET(qFlat,qFlat.Line)
        ?LISTFlat{PROP:Selected} = POINTER(qFlat)
        
        qElapsed.Line = q.ProcedureLine
        GET(qElapsed,qElapsed.Line)
        ?LISTElapsed{PROP:Selected} = POINTER(qElapsed)
        
        qProperties.Line = q.ProcedureLine
        GET(qProperties,qProperties.Line)
        ?LISTProperties{PROP:Selected} = POINTER(qProperties)
        
        IF ~RECORDS(qProfileDetailDisplay)
            LOOP ProfileCount = 1 TO RECORDS(qProfileDetail)
                GET(qProfileDetail,ProfileCount)
                IF qProfileDetail.Line = q.Line
                    qProfileDetailDisplay = qProfileDetail
                    ADD(qProfileDetailDisplay)
                END
            END
        END
        
        FREE(qEvent)
        IF q.Prefix = '[Events]'
            stEvent.SetValue(q.Message)
            stEvent.Split(',')
            LOOP C# = 1 TO stEvent.Records()
                stEventLine.SetValue(stEvent.GetLine(C#))
                stEventLine.Split('*')
                qEvent.Description = stEventLine.GetLine(1)
                qEvent.Value = stEventLine.GetLine(2)
                Add(qEvent)
            END
        
        END
        
        ?ListProfileDetails{PROP:Selected} = 1
    
    END
 
    
LoadRecentFiles               PROCEDURE()

stFinds                             StringTheory
lCount                              LONG

    CODE

    FREE(qRecentFiles)
    stFinds.LoadFile('RecentFiles.dat')
    stFinds.Split('<13,10>')
    LOOP lCount = 1 TO stFinds.Records()
        qRecentFiles.RecentFile = stFinds.GetLine(lCount)
        ADD(qRecentFiles)
    END
    
    IF RECORDS(qRecentFiles) = 0
        qRecentFiles.RecentFile = 'AllMessagesInMemory.dblog'
        ADD(qRecentFiles,1)
    END
    
    GET(qRecentFiles,1)
    
    

ManageRecentFiles             PROCEDURE()

stFinds                             StringTheory
lCount                              LONG

    CODE
    
    GET(qRecentFiles,qRecentFiles.RecentFile)    
    IF ~ERROR()
        DELETE(qRecentFiles)
    END
    
    ADD(qRecentFiles,1)
    
    LOOP lCount = 1 TO RECORDS(qRecentFiles)
        IF lCount > 20;BREAK.
        GET(qRecentFiles,lCount)
        stFinds.Append(qRecentFiles.RecentFile,TRUE,'<13,10>')
        
    END
    
    stFinds.SaveFile('RecentFiles.dat')
    
    GET(qRecentFiles,1)
    

ApplyListFilter                 PROCEDURE()

LocalFilter                         STRING(200)


    CODE
    
    EXECUTE ?Sheet{PROP:Selected}
        BEGIN
            GET(qProcs,?LISTProcs{PROP:Selected}+0)
            qMaster.Line = qProcs.Line
            GET(qMaster,qMaster.Line)
            LocalFilter = qMaster.ProcedureName
        END
        BEGIN
            GET(qFlat,?LISTFlat{PROP:Selected}+0)
            LocalFilter = qFlat.ProcedureName
        END
        BEGIN
            GET(qElapsed,?LISTElapsed{PROP:Selected}+0)
            LocalFilter = qElapsed.ProcedureName
        END
        BEGIN
            GET(qStats,?LISTStats{PROP:Selected}+0)
            LocalFilter = qStats.ProcedureName
        END
!        ApplyFilters()
    END
    RecentFilters.ApplyFilter(LocalFilter,ft:FilterProcedure)
    SelectCurrentLine()
        
    
LoadRecents                     PROCEDURE()

    CODE
    
    RecentFinds.Load('RecentFinds.dat')
    RecentFilters.Load('RecentFilters.dat')
    LoadRecentFiles()
    
    
InitializeDebugOutputMonitoring         PROCEDURE()

    CODE
    
    osdkODSMessagePump.Monitor(EVENT:User, false)
    
   
MarkAllFinds                    PROCEDURE()
    
qPointer                            LONG
lCount                              LONG

    CODE
    
    IF LastFind = UPPER(CLIP(qRecentFinds.Find))
        RETURN
    END
    LastFind = UPPER(CLIP(qRecentFinds.Find))
    
    qPointer = POINTER(q)
    
    LOOP lCount = 1 TO RECORDS(q)
        GET(q,lCount)
        q.Style = 0
        IF INSTRING(UPPER(CLIP(qRecentFinds.Find)),UPPER(q.Message),1,1)
            q.Style = 2
        END
        PUT(q)
        
    END
    GET(q,qPointer)
    
ParseDebugMessages              PROCEDURE()

lCount                              LONG

    CODE
    
    LOOP lCount = 1 TO RECORDS(q)
        GET(q,lCount)
        UpdateAllQueues()
        
    END
    
    
ClearLog                        PROCEDURE()

    CODE
    
    FREE(q)
    CLEAR(q)
    
    FREE(qL)
    CLEAR(qL)
    
    FREE(qFlat)
    CLEAR(qFlat)
    
    FREE(qElapsed)
    CLEAR(qElapsed)
    
    FREE(qMaster)
    CLEAR(qMaster)
    
    FREE(qProperties)
    CLEAR(qProperties)
    
    FREE(qProcs)
    CLEAR(qProcs)
    
    FREE(qThreads)
    CLEAR(qThreads)
    
    FREE(qPreFix)
    CLEAR(qPreFix)
    
    FREE(qPID)
    CLEAR(qPID)
    
    FREE(qProcedures)
    CLEAR(qProcedures)
    
    FREE(qProcess)
    CLEAR(qProcess)
    
    InitializeLists()
    stFilterText.Free()
    myAutoScroll = TRUE
    myLineNumber = 0
    DISPLAY()
    
    
    
RetrieveDebugMessages           PROCEDURE()

stProperties                        StringTheory
stPropertyValue                     StringTheory
stProfile                           StringTheory
ProfilePosition                     LONG
ProfileThread                       LONG
ProfilePID                          LONG


    CODE
    
    osdkODSMessagePump.DataOut(myMessagesIn) 
    
    IF myPause = false 
        myRecordCount =  records(myMessageQ) 
        LOOP myPtr = 1 to records(myMessagesIn) 
            GET(myMessagesIn, myPtr) 
            IF INSTRING('DBGVIEWCLEAR',UPPER(myMessagesIn.Text),1,1)
                ClearLog()
                CYCLE
            END
            IF INSTRING('[||FieldNames||]',myMessagesIn.Text,1,1)
                UpdateFieldNameList()
                CYCLE
            END
            
            IF WatchForProfileDetails
                ProfilePosition =  Instring('  ',CLIP(myMessagesIn.Text),1,1)
                IF ProfilePosition = 0
                    WatchForProfileDetails = 0
                    CYCLE
                        
                ELSE
                    stProfile.SetValue(myMessagesIn.Text)
                    stProfile.SetValue(stProfile.Sub(ProfilePosition,5000))
                    IF stProfile.GetValue() = ''
                        WatchForProfileDetails = 0
                        CYCLE
                    END
                    
                    stProfile.Split(': ')
                    qProfileDetail.Line = WatchForProfileDetails
                    qProfileDetail.Column = LEFT(CLIP(stProfile.GetLine(1)))
                    qProfileDetail.Value = LEFT(CLIP(stProfile.GetLine(2)))
                    ADD(qProfileDetail)
                    CYCLE
                        
                END
                    
            END
            IF INSTRING(osdkODSMessagePump.ProfileID,myMessagesIn.Text,1,1) AND osdkODSMessagePump.ProfileID <> ''  
                IF INSTRING('CREATE(',myMessagesIn.Text,1,1)  |
                        OR INSTRING('OPEN(',myMessagesIn.Text,1,1)  |
                        OR INSTRING('Preparing Statement',myMessagesIn.Text,1,1)
                    
                    
                ELSE
                    IF INSTRING('ADD(',myMessagesIn.Text,1,1)  |
                            OR INSTRING('PUT(',myMessagesIn.Text,1,1)  |
                            OR INSTRING('NEXT(',myMessagesIn.Text,1,1)  |
                            OR INSTRING('PREVIOUS(',myMessagesIn.Text,1,1)  |
                            OR INSTRING('GETfilekey',myMessagesIn.Text,1,1)
                        
                        WatchForProfileDetails =  myLineNumber + 1
                    ELSE
                        CYCLE
                    END
                    
                END
                
                stProfile.SetValue(SUB(myMessagesIn.Text,1,12))
                ProfileThread = stProfile.Between('(',')')
                
                stProfile.SetValue(stProfile.Sub(1,stProfile.Instring('(')-1))
                myMessagesIn.PID = ConvertHexToLong(stProfile.GetValue())
                
                stProfile.SetValue(myMessagesIn.Text)
                stProfile.SetValue(stProfile.Sub(stProfile.Instring(' ',1,12),6000))
                stProfile.Remove('Time Taken:')
                myMessagesIn.Text = '[||]X [Trace],T ' & ProfileThread  & ',P [||]' & stProfile.GetValue()
                
            END
            
            CLEAR(qMaster) 
            myLineNumber      +=  1
            qMaster.RawMessage =  myMessagesIn.Text
            qMaster.Line       =  myLineNumber
            qMaster.ProcedureLine = myLineNumber
            qMaster.Date       =  myMessagesIn.Time
            qMaster.PID        =  myMessagesIn.PID
            qMaster.Process =  myMessagesIn.Process
            stParseMessage.SetValue(myMessagesIn.Text)
            stParseMessage.Split('[||]')
            qMaster.Message    =  stParseMessage.GetLine(3)
            IF ShowAllMessages
                qMaster.Message    =  myMessagesIn.Text
            END
                
            stParseProperties.SetValue(stParseMessage.GetLine(2))
            stParseProperties.Split(',')
                
            stParseLine.SetValue(stParseProperties.GetLine(1))
            stParseLine.Split(' ')
            qMaster.Prefix =  stParseLine.GetLine(2)
            
            stParseLine.SetValue(stParseProperties.GetLine(2))
            stParseLine.Split(' ')
            qMaster.Thread =  stParseLine.GetLine(2)
                
            stParseLine.SetValue(stParseProperties.GetLine(3))
            stParseLine.Split(' ')
            qMaster.ProcedureName =  stParseLine.GetLine(2)
                
            IF SUB(qMaster.Message,1,2) = '>>'
                stProperties.SetValue(qMaster.Message)
                stProperties.Split(',')
                stPropertyValue.SetValue(stProperties.GetLine(2))
                stPropertyValue.Split(' ')
             
                qMaster.Module = stPropertyValue.GetLine(2)
                
                stPropertyValue.SetValue(stProperties.GetLine(3))
                stPropertyValue.Split(' ')
                qMaster.App = stPropertyValue.GetLine(2)
                
                stPropertyValue.SetValue(stProperties.GetLine(4))
                 
                qMaster.Modified = stPropertyValue.Sub(3,20)
                CLEAR(qLast)
                qLast.Thread = qMaster.Thread
                qLast.LastApp = qMaster.App
                qLast.LastModule = qMaster.Module
                qLast.LastModified = qMaster.Modified
                qLast.ProcedureLine = qMaster.Line
                ADD(qLast)
                
            ELSIF SUB(qMaster.Message,1,2) = '<<<<'
                CLEAR(qLast)
                LOOP C# = RECORDS(qLast) TO 1 BY -1
                    GET(qLast,C#)
                    IF qLast.Thread = qMaster.Thread
                        qMaster.App = qLast.LastApp
                        qMaster.Module = qLast.LastModule
                        qMaster.Modified = qLast.LastModified
                        DELETE(qLast)
                        BREAK
                    END
                END
                
            ELSE
                CLEAR(qLast)
                LOOP C# = RECORDS(qLast) TO 1 BY -1
                    GET(qLast,C#)
                    IF qLast.Thread = qMaster.Thread
                        qMaster.App = qLast.LastApp
                        qMaster.Module = qLast.LastModule
                        qMaster.Modified = qLast.LastModified
                        qMaster.ProcedureLine = qLast.ProcedureLine
                        BREAK
                    END
                    
                END
                
            END
            
            IF qMaster.Prefix = '[Events]'
                qMaster.Style = 3
            END
            
            ADD(qMaster)
            UpdateElapsedTimes()
            UpdateDisplayQueue()
            
            UpdateAllQueues()
            
        END  
        
        IF myRecordCount <> records(q) AND myAutoScroll
            ?Messages{PROP:Selected} =  records(q) 
        END 
    END  
    
    RETURN     
    

UpdateElapsedTimes              PROCEDURE()

    CODE
    
    CLEAR(qTimes)
    qTimes.Thread =  qMaster.Thread
    GET(qTimes,qTimes.Thread)
    IF ERROR()
        ADD(qTimes)
    END
            
    IF qMaster.ProcedureName = ''
        qMaster.ProcedureName =  qTimes.LastProcedure
    END
            
    qMaster.Elapsed =  TimeDifference(qMaster.Date,qTimes.LastTime)
    PUT(qMaster)
            
    qTimes.LastTime      =  qMaster.Date
    qTimes.LastProcedure =  qMaster.ProcedureName
    PUT(qTimes)
    

SetMinimalView                  PROCEDURE()

lCount                              LONG

    CODE
    
    IF Minimal
        LOOP lCount = 2 TO 5
            ColumnWidths[lCount] = ?Messages{PROPLIST:width,lCount}
        END
        LOOP lCount = 2 TO 5
            ?Messages{PROPLIST:width,lCount} = 0
        END
    ELSE
        LOOP lCount = 2 TO 5
            ?Messages{PROPLIST:width,lCount} = ColumnWidths[lCount]
        END
    END
    
    
SelectCurrentLine               PROCEDURE()

    CODE
    
    q.Line = CurrentLine
    GET(q,q.Line)
    ?Messages{PROP:Selected} = POINTER(q)
    POST(EVENT:NewSelection,?Messages)

    
    
ConvertHexToLong                PROCEDURE(STRING hexstring) !,LONG

number                              long
stringposition                      LONG
counter                             LONG
tempnumber                          LONG

    CODE
    
    number = 0  
    stringposition = len(clip(hexstring))
    tempnumber = 0
    counter = 0
    LOOP WHILE (stringposition )  
        if not counter  
            counter = 1
        else
            counter = counter * 16  
        end
        CASE hexstring[stringposition]
        OF '0' to '9'
            number +=  counter * hexstring[stringposition]
        ELSE
            number += counter * (10 + (VAL(hexstring[stringposition])  - VAL('A') ) )
        END
        tempnumber += 1
        stringposition -= 1
    END
    
    RETURN number
    

FillInValues                    PROCEDURE()

stSQLStatement                      StringTheory
stContent                           StringTheory

ProfileCount                        LONG
NumberOfRecords                     LONG

LocalLine                           LONG
lCount                              LONG
AddCRLFPosition                     LONG

    CODE
    LocalLine =  q.Line
    LOOP
        q.Line +=  1
        GET(q,q.Line)
        IF ERROR();BREAK.
        IF INSTRING('ADD(',q.Message,1,1)
            stSQLStatement.SetValue(LEFT(SUB(Content,1,INSTRING(')',Content,1,1)+1)))
            stSQLStatement.Append(' VALUES (')
            LOOP ProfileCount = 1 TO RECORDS(qProfileDetail)
                GET(qProfileDetail,ProfileCount)  
                IF qProfileDetail.Line = CurrentLine+1
                    stSQLStatement.Append(CHOOSE(ProfileCount = 1,'',',') & CLIP(qProfileDetail.Value))
                    qProfileDetailDisplay =  qProfileDetail
                    ADD(qProfileDetailDisplay)
                END
        
            END
    
            stSQLStatement.Append(')')
            stSQLStatement.Split(',')
            NumberOfRecords =  stSQLStatement.Records()
            LOOP ProfileCount = 1 TO NumberOfRecords
                stContent.Append(stSQLStatement.GetLine(ProfileCount) & CHOOSE(ProfileCount = NumberOfRecords,'',','),TRUE,'<13,10>')
            END
            AddCRLFPosition =  stContent.Instring(':') + 1
            stContent.Replace(': ',':<13,10>',,,AddCRLFPosition)
            Content =  stContent.GetValue()
            DISPLAY()
            BREAK
        END
        IF INSTRING('PUT(',q.Message,1,1) |
                OR INSTRING('GET(',q.Message,1,1) |
                OR INSTRING('NEXT(',q.Message,1,1) |
                OR INSTRING('PREVIOUS(',q.Message,1,1) |
                OR INSTRING('RESETfile(',q.Message,1,1) |
                OR INSTRING('POSITIONfile(',q.Message,1,1) |
                OR INSTRING('GETfilekey(',q.Message,1,1)  
            FREE(qProfileDetailDisplay)
            LOOP ProfileCount = 1 TO RECORDS(qProfileDetail)
                GET(qProfileDetail,ProfileCount)
                IF qProfileDetail.Line = q.Line
                    qProfileDetailDisplay =  qProfileDetail
                    ADD(qProfileDetailDisplay)
                
                END
            END
            BREAK
        END    
    END
    
    stContent.SetValue(LEFT(Content))
    LOOP lCount = 1 TO RECORDS(qColumns)
        GET(qColumns,lCount)
        IF stContent.Instring(CLIP(qColumns.ExternalName),,,,TRUE,TRUE)
            qProfileDetailDisplay.Column =  CLIP(qColumns.Label)
            GET(qProfileDetailDisplay,qProfileDetailDisplay.Column)
            IF ~ERROR()
                stContent.Replace(CLIP(qColumns.ExternalName) & ' = ?',CLIP(qColumns.ExternalName) & ' = ' & CLIP(qProfileDetailDisplay.Value)) 
                stContent.Replace(CLIP(qColumns.ExternalName) & ' >= ?',CLIP(qColumns.ExternalName) & ' >= ' & CLIP(qProfileDetailDisplay.Value)) 
                stContent.Replace(CLIP(qColumns.ExternalName) & ' > ?',CLIP(qColumns.ExternalName) & ' > ' & CLIP(qProfileDetailDisplay.Value)) 
                stContent.Replace(CLIP(qColumns.ExternalName) & ' < ?',CLIP(qColumns.ExternalName) & ' < ' & CLIP(qProfileDetailDisplay.Value)) 
                stContent.Replace(CLIP(qColumns.ExternalName) & ' <= ?',CLIP(qColumns.ExternalName) & ' <= ' & CLIP(qProfileDetailDisplay.Value)) 
                    
            END
                
        END
            
    END
    
    AddCRLFPosition =  stContent.Instring(':') + 1
    stContent.Replace(': ',':<13,10>',,,AddCRLFPosition)
    Content =  stContent.GetValue()
        
    DISPLAY()
    
    q.Line =  LocalLine
    GET(q,q.Line)
    
    
GetSelectedText                 PROCEDURE(SIGNED FEQ) !,STRING

    CODE
    
    IF INRANGE(FEQ{PROP:SelStart}, 1, FEQ{PROP:SelEnd})
        RETURN SUB(CONTENTS(FEQ), | 
                FEQ{PROP:SelStart}, | 
                FEQ{PROP:SelEnd} - FEQ{PROP:SelStart} + 1)
    ELSE
        RETURN ''
    END
    
    
UpdateFieldNameList             PROCEDURE()

stColumnRecords                     StringTheory
stColumns                           StringTheory
lCount                              LONG

    CODE
    
    stColumnRecords.SetValue(myMessagesIn.Text)
    stColumnRecords.SetValue(stColumnRecords.After('[||FieldNames||]'))
    stColumnRecords.Split(',')
    LOOP lCount = 1 TO stColumnRecords.Records()
        stColumns.SetValue(stColumnRecords.GetLine(lCount))
        stColumns.Split('|')
        qColumns.Label        =  stColumns.GetLine(1)
        qColumns.ExternalName =  stColumns.GetLine(2)
        GET(qColumns,qColumns.Label,qColumns.ExternalName)
        IF ERROR()
            ADD(qColumns,qColumns.Label,qColumns.ExternalName)
        END
        
    END
    
    
SaveDBLog                       PROCEDURE

Parameters                      STRING(100)
ReturnedFileName                STRING(MAX_PATH)
stLine                          StringTheory
stRecord                        StringTheory
lCount                          LONG

    CODE
    
    Parameters = 'dblog|*.dblog|All|*.*'
    FileDialog('Choose File To Save',ReturnedFileName,Parameters,FILE:Save+FILE:KeepDir+FILE:LongName)
    IF ReturnedFileName
        LOOP lCount = 1 TO RECORDS(q)
            GET(q,lCount)
            stLine.Free()
            stLine.Append(q:Line,TRUE,'<9>')
            stLine.Append(q:PID,TRUE,'<9>')
            stLine.Append(q:Process,TRUE,'<9>')
            stLine.Append(q:Date,TRUE,'<9>')
            stLine.Append(q:Elapsed,TRUE,'<9>')
            stLine.Append(q:Thread,TRUE,'<9>')
            stLine.Append(q:Prefix,TRUE,'<9>')
            stLine.Append(q:App,TRUE,'<9>')
            stLine.Append(q:Module,TRUE,'<9>')
            stLine.Append(q:ProcedureName,TRUE,'<9>')
            stLine.Append(q:Message,TRUE,'<9>')
            stLine.Append(q:Level,TRUE,'<9>')
            stLine.Append(q:RawMessage,TRUE,'<9>')
            stRecord.Append(stLine.GetValue(),TRUE,'<13,10>')
        END
        stRecord.SaveFile(ReturnedFileName)
    END
    

LoadDBLog                       PROCEDURE

Parameters                          STRING(100)
ReturnedFileName                    STRING(MAX_PATH)
stLine                              StringTheory
stRecord                            StringTheory
rCount                              LONG
lCount                              LONG

    CODE
    
    ClearLog()
    
    Parameters = 'dblog|*.dblog|All|*.*'
    FileDialog('Choose File To Load',ReturnedFileName,Parameters,FILE:KeepDir+FILE:LongName)
    IF ReturnedFileName
        stRecord.LoadFile(ReturnedFileName)
        stRecord.Split('<13,10>')
        LOOP rCount = 1 TO stRecord.Records()
            stLine.SetValue(stRecord.GetLine(rCount))
            stLine.Split('<9>')
            qMaster:Line = stLine.GetLine(1)
            qMaster:PID = stLine.GetLine(2)
            qMaster:Process = stLine.GetLine(3)
            qMaster:Date = stLine.GetLine(4)
            qMaster:Elapsed = stLine.GetLine(5)
            qMaster:Thread = stLine.GetLine(6)
            qMaster:Prefix = stLine.GetLine(7)
            qMaster:App = stLine.GetLine(8)
            qMaster:Module = stLine.GetLine(9)
            qMaster:ProcedureName = stLine.GetLine(10)
            qMaster:Message = stLine.GetLine(11)
            qMaster:Style = 0
            qMaster:Level = stLine.GetLine(12)
            qMaster:RawMessage = stLine.GetLine(13)
            ADD(qMaster)
            AddQ()
            UpdateAllQueues()
        END
        
    END

    
LoadListBoxStyles               PROCEDURE()

stStyles                            StringTheory

    CODE
    
    stStyles.LoadFile('Settings.dat')
    stStyles.Split('|')
    ?Messages{PROPSTYLE:FontName, 2}      = 'Segoe UI'
    ?Messages{PROPSTYLE:FontSize, 2}      = 10
    ?Messages{PROPSTYLE:FontStyle, 2}     = 700
    ?Messages{PROPSTYLE:TextColor, 2}     = CHOOSE(stStyles.GetLine(1) = '',10485760,stStyles.GetLine(1))
    ?Messages{PROPSTYLE:BackColor, 2}     = CHOOSE(stStyles.GetLine(2) = '',8454143,stStyles.GetLine(2))
    ?Messages{PROPSTYLE:TextSelected, 2}  = CHOOSE(stStyles.GetLine(3) = '',16777215,stStyles.GetLine(3))
    ?Messages{PROPSTYLE:BackSelected, 2}  = CHOOSE(stStyles.GetLine(4) = '',32768,stStyles.GetLine(4))    
    
    ?Messages{PROPSTYLE:FontName, 3}      = 'Segoe UI'
    ?Messages{PROPSTYLE:FontSize, 3}      = 10
    ?Messages{PROPSTYLE:FontStyle, 3}     = 700
    ?Messages{PROPSTYLE:TextColor, 3}     = CHOOSE(stStyles.GetLine(5) = '',8404992,stStyles.GetLine(5))
    ?Messages{PROPSTYLE:BackColor, 3}     = CHOOSE(stStyles.GetLine(6) = '',14220502,stStyles.GetLine(6))
    ?Messages{PROPSTYLE:TextSelected, 3}  = CHOOSE(stStyles.GetLine(7) = '',16777215,stStyles.GetLine(7))
    ?Messages{PROPSTYLE:BackSelected, 3}  = CHOOSE(stStyles.GetLine(8) = '',16512,stStyles.GetLine(8))    
    

AddQ                            PROCEDURE()

    CODE
    
    q =  qMaster
    IF SUB(qMaster.Message,1,2) = '>>'
        q.Message = 'Entering: ' & qMaster.ProcedureName
    END
    IF SUB(qMaster.Message,1,2) = '<<<<'
        q.Message = 'Leaving: ' & qMaster.ProcedureName
    END
    ADD(q)    
    
    
UpdateDisplayQueue              PROCEDURE()

stFilter                            StringTheory
stFilterLine                        StringTheory

LocalCount                          LONG

    CODE
    
    stFilter.SetValue(stFilterText.GetValue())
    stFilter.Split('<13,10>')
    LOOP LocalCount = 1 TO stFilter.Records()
        stFilterLine.SetValue(stFilter.GetLine(LocalCount))
        stFilterLine.Split('|')
        IF stFilterLine.GetLine(1) = 'All';CYCLE.
        CASE stFilterLine.GetLine(2)
        OF 'ThreadNo'
            IF stFilterLine.GetLine(1) <> qMaster.Thread;RETURN.
        OF 'ProcedureName'
            IF stFilterLine.GetLine(1) <> qMaster.ProcedureName;RETURN.
        OF 'PID'
            IF stFilterLine.GetLine(1) <> qMaster.PID;RETURN.
        OF 'Prefix'
            IF stFilterLine.GetLine(1) <> qMaster.Prefix;RETURN.
        OF 'Process'
            IF stFilterLine.GetLine(1) <> qMaster.Process;RETURN.
        END
        
        
    END
    
    IF RecentFilters.CurrentFilter
        IF INSTRING(UPPER(CLIP(RecentFilters.CurrentFilter)),UPPER(CLIP(MyMessagesIn.Text)),1,1) 
        ELSE
            RETURN
        END
    END
    
    AddQ()
    

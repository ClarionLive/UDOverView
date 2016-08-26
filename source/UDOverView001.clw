

   MEMBER('UDOverView.clw')                                ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('UDOVERVIEW001.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
Settings PROCEDURE 

st              StringTheory
UD                   UltimateDebug
CurrentField         LONG                                  !
ColorRGB             LONG                                  !
TextColor            STRING(20)                            !
BackgroundColor      STRING(20)                            !
SelectedTextColor    STRING(20)                            !
SelectedBackgroundColor STRING(20)                         !
TextColorEvents      STRING(20)                            !
BackgroundColorEvents STRING(20)                           !
SelectedTextColorEvents STRING(20)                         !
SelectedBackgroundColorEvents STRING(20)                   !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Settings'),AT(,,401,247),FONT('Segoe UI',10),GRAY,IMM,SYSTEM
                       GROUP('Search Text'),AT(2,11,209,76),USE(?GROUPSearchText),BOXED
                         ENTRY(@s20),AT(108,24,77,10),USE(TextColor),LEFT
                         PROMPT('Background Color'),AT(11,38),USE(?BackgroundColor:Prompt)
                         ENTRY(@s20),AT(108,38,77,10),USE(BackgroundColor),LEFT
                         PROMPT('Selected Text Color'),AT(11,52),USE(?SelectedTextColor:Prompt)
                         ENTRY(@s20),AT(108,51,77,10),USE(SelectedTextColor),LEFT
                         PROMPT('Selected Background Color'),AT(11,65),USE(?SelectedBackgroundColor:Prompt)
                         ENTRY(@s20),AT(108,65,77,10),USE(SelectedBackgroundColor),LEFT
                         PROMPT('Text Color'),AT(11,24),USE(?TextColor:Prompt)
                         BUTTON('...'),AT(189,24,16,11),USE(?HLColorButton),SKIP
                         BUTTON('...'),AT(189,37,16,11),USE(?HLColorButton:2),SKIP
                         BUTTON('...'),AT(189,51,16,11),USE(?HLColorButton:3),SKIP
                         BUTTON('...'),AT(189,64,16,11),USE(?HLColorButton:4),SKIP
                       END
                       BUTTON('OK'),AT(289,224,54,22),USE(?BUTTONOK)
                       BUTTON('Cancel'),AT(346,224,54,22),USE(?BUTTONCancel)
                       GROUP('Events'),AT(3,97,209,80),USE(?GROUPEvents),BOXED
                         PROMPT('Text Color'),AT(11,112),USE(?TextColorEvents:Prompt)
                         ENTRY(@s20),AT(108,112,77,10),USE(TextColorEvents),LEFT
                         PROMPT('Background Color'),AT(11,127),USE(?BackgroundColorEvents:Prompt)
                         ENTRY(@s20),AT(108,126,77,10),USE(BackgroundColorEvents),LEFT
                         PROMPT('Selected Text Color'),AT(11,141),USE(?SelectedTextColorEvents:Prompt)
                         ENTRY(@s20),AT(108,140,77,10),USE(SelectedTextColorEvents),LEFT
                         PROMPT('Selected Background Color'),AT(11,155),USE(?SelectedBackgroundColorEvents:Prompt)
                         ENTRY(@s20),AT(108,154,77,10),USE(SelectedBackgroundColorEvents),LEFT
                         BUTTON('...'),AT(189,112,16,11),USE(?HLColorButton:5),SKIP
                         BUTTON('...'),AT(189,126,16,11),USE(?HLColorButton:6),SKIP
                         BUTTON('...'),AT(189,140,16,11),USE(?HLColorButton:7),SKIP
                         BUTTON('...'),AT(189,154,16,11),USE(?HLColorButton:8),SKIP
                       END
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udb_Settings.ModuleName = 'UDOverView001.clw'
        udb_Settings.AppName    = 'UDOverView.EXE'
        udb_Settings.Modified   = '07/10/2016 @ 03:47PM'
        UD.Init('Settings',udb_Settings)
    
    st.LoadFile('Settings.dat')
    st.Split('|')
    TextColor                     =  st.GetLine(1)
    BackgroundColor               =  st.GetLine(2)
    SelectedTextColor             =  st.GetLine(3)
    SelectedBackgroundColor       =  st.GetLine(4)
    
    TextColorEvents               =  st.GetLine(5)
    BackgroundColorEvents         =  st.GetLine(6)
    SelectedTextColorEvents       =  st.GetLine(7)
    SelectedBackgroundColorEvents =  st.GetLine(8)
    
  GlobalErrors.SetProcedureName('Settings')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?TextColor
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.Open(Window)                                        ! Open window
  WinAlertMouseZoom()
  WinAlert(WE::WM_QueryEndSession,,Return1+PostUser)
  !Setting the LineHeight for every control of type LIST/DROP or COMBO in the window using the global setting.
  Do DefineListboxStyle
  Window{Prop:Alrt,255} = CtrlShiftP
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  If self.opened Then WinAlert().
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF Window{Prop:AcceptAll} THEN RETURN.
      ?TextColor{PROP:FONTCOLOR} = TextColor
      ?TextColor{PROP:BACKGROUND} = TextColor
      ?BackgroundColor{PROP:FONTCOLOR} = BackgroundColor
      ?BackgroundColor{PROP:BACKGROUND} = BackgroundColor
      ?SelectedTextColor{PROP:FONTCOLOR} = SelectedTextColor
      ?SelectedTextColor{PROP:BACKGROUND} = SelectedTextColor
      ?SelectedBackgroundColor{PROP:FONTCOLOR} = SelectedBackgroundColor
      ?SelectedBackgroundColor{PROP:BACKGROUND} = SelectedBackgroundColor
      ?TextColorEvents{PROP:FONTCOLOR} = TextColorEvents
      ?TextColorEvents{PROP:BACKGROUND} = TextColorEvents
      ?BackgroundColorEvents{PROP:FONTCOLOR} = BackgroundColorEvents
      ?BackgroundColorEvents{PROP:BACKGROUND} = BackgroundColorEvents
      ?SelectedTextColorEvents{PROP:FONTCOLOR} = SelectedTextColorEvents
      ?SelectedTextColorEvents{PROP:BACKGROUND} = SelectedTextColorEvents
      ?SelectedBackgroundColorEvents{PROP:FONTCOLOR} = SelectedBackgroundColorEvents
      ?SelectedBackgroundColorEvents{PROP:BACKGROUND} = SelectedBackgroundColorEvents
  PARENT.Reset(Force)


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
    OF ?HLColorButton
          IF COLORDIALOG('Select A Color',TextColor)
            ?TextColor{PROP:FONTCOLOR} = TextColor
            ?TextColor{PROP:BACKGROUND} = TextColor
          END
          Display(?HLColorButton)
    OF ?HLColorButton:2
          IF COLORDIALOG('Select A Color',BackgroundColor)
            ?BackgroundColor{PROP:FONTCOLOR} = BackgroundColor
            ?BackgroundColor{PROP:BACKGROUND} = BackgroundColor
          END
          Display(?HLColorButton:2)
    OF ?HLColorButton:3
          IF COLORDIALOG('Select A Color',SelectedTextColor)
            ?SelectedTextColor{PROP:FONTCOLOR} = SelectedTextColor
            ?SelectedTextColor{PROP:BACKGROUND} = SelectedTextColor
          END
          Display(?HLColorButton:3)
    OF ?HLColorButton:4
          IF COLORDIALOG('Select A Color',SelectedBackgroundColor)
            ?SelectedBackgroundColor{PROP:FONTCOLOR} = SelectedBackgroundColor
            ?SelectedBackgroundColor{PROP:BACKGROUND} = SelectedBackgroundColor
          END
          Display(?HLColorButton:4)
    OF ?BUTTONOK
        st.SetValue(TextColor & '|' & BackgroundColor & '|' & SelectedTextColor & '|' & SelectedBackgroundColor & '|' & |
                TextColorEvents & '|' & BackgroundColorEvents & '|' & SelectedTextColorEvents & '|' & SelectedBackgroundColorEvents)
        st.SaveFile('Settings.dat')
        ThisWindow.Response = RequestCompleted
        POST(EVENT:CloseWindow)
        
    OF ?BUTTONCancel
        ThisWindow.Response = RequestCancelled
        POST(EVENT:CloseWindow)
        
    OF ?HLColorButton:5
          IF COLORDIALOG('Select A Color',TextColorEvents)
            ?TextColorEvents{PROP:FONTCOLOR} = TextColorEvents
            ?TextColorEvents{PROP:BACKGROUND} = TextColorEvents
          END
          Display(?HLColorButton:5)
    OF ?HLColorButton:6
          IF COLORDIALOG('Select A Color',BackgroundColorEvents)
            ?BackgroundColorEvents{PROP:FONTCOLOR} = BackgroundColorEvents
            ?BackgroundColorEvents{PROP:BACKGROUND} = BackgroundColorEvents
          END
          Display(?HLColorButton:6)
    OF ?HLColorButton:7
          IF COLORDIALOG('Select A Color',SelectedTextColorEvents)
            ?SelectedTextColorEvents{PROP:FONTCOLOR} = SelectedTextColorEvents
            ?SelectedTextColorEvents{PROP:BACKGROUND} = SelectedTextColorEvents
          END
          Display(?HLColorButton:7)
    OF ?HLColorButton:8
          IF COLORDIALOG('Select A Color',SelectedBackgroundColorEvents)
            ?SelectedBackgroundColorEvents{PROP:FONTCOLOR} = SelectedBackgroundColorEvents
            ?SelectedBackgroundColorEvents{PROP:BACKGROUND} = SelectedBackgroundColorEvents
          END
          Display(?HLColorButton:8)
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  !    UD.DebugEvent()
    
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('Settings',UD.SetApplicationName('UDOverView','EXE'),Window{PROP:Hlp},'06/24/2016 @ 02:01PM','07/10/2016 @ 03:47PM','08/26/2016 @ 02:05PM')  
    
       CYCLE
     END
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
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


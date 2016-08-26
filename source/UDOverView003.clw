

   MEMBER('UDOverView.clw')                                ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('UDOVERVIEW003.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
About PROCEDURE 

UD                   UltimateDebug
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('UltimateDebug OverView+++ With Sprinkles'),AT(,,401,171),FONT('Segoe UI',10),CENTER, |
  COLOR(COLOR:White),ICON('UDOverView.ico'),GRAY,SYSTEM,IMM
                       STRING('UltimateDebug OverView+++ With Sprinkles'),AT(2,1),USE(?STRING1),FONT(,16,,FONT:bold)
                       PROMPT('Code Contributors:<0DH,0AH,0DH,0AH>John Hickey<0DH,0AH>Simon Kemp<0DH,0AH,0DH,0AH>' & |
  'Special Thanks to Simon Kemp for contributing the output debug monitoring code!'),AT(200, |
  68,186,70),USE(?PROMPT1)
                       STRING('A ClarionLive! Community Project'),AT(200,35),USE(?STRING2),FONT(,14)
                       PROMPT('copyright 2016 ClarionLive!, all rights reserved<0DH,0AH>Free to use, don''t resell it!'), |
  AT(200,149,175,20),USE(?PROMPT2)
                       STRING(@s30),AT(200,20,160),USE(Version)
                       IMAGE('antsorin-Magnifying-Glass-Color-300px.png'),AT(11,28),USE(?IMAGE1)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
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

ThisWindow.Ask PROCEDURE

  CODE
    
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udb_Settings.ModuleName = 'UDOverView003.clw'
        udb_Settings.AppName    = 'UDOverView.EXE'
        udb_Settings.Modified   = '08/05/2016 @ 01:26PM'
        UD.Init('About',udb_Settings)
    
  GlobalErrors.SetProcedureName('About')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?STRING1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.Open(Window)                                        ! Open window
    Version = 'Version: ' & ds_GetFileVersionInfo(,WE::ProgramName)
    
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
        UD.ShowProcedureInfo('About',UD.SetApplicationName('UDOverView','EXE'),Window{PROP:Hlp},'06/06/2016 @ 10:01AM','08/05/2016 @ 01:26PM','08/26/2016 @ 02:05PM')  
    
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


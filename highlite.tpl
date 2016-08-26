#TEMPLATE(HighLighter,'Highlighter Template'),FAMILY('ABC'),FAMILY('CW20')
#!Copyright 1998, John Hickey, All Rights Reserved
#!
#EXTENSION(HighLighterGlobal,'HighLighter Global Template'),APPLICATION(HighLighterExtension)
#!
#HELP ('HIGHLITE.HLP')
#SHEET
#TAB    ('General'),HLP('The Global Template')
#IMAGE ('HIGHLITE.BMP')
#DISPLAY('Highlighter Pro Global Template 2.0'),AT(,70,,)
#DISPLAY('')
#PROMPT ('Activate HighLighter',CHECK),%HLActivate, Default(1),AT(10,,,)
#BOXED  (''),Where(%HLActivate)
#PROMPT ('Global On/Off Variable',@s50),%HLGlobalVar
#DISPLAY('')
#DISPLAY('If Variable set to 1, HighLighter is ON')
#DISPLAY('If Variable set to 0, HighLighter is OFF')
#DISPLAY('If you don''t specify a variable,HighLighter is always ON')
#DISPLAY('')
#ENDBOXED
#PROMPT ('Procedure Extension Defaults To OFF',CHECK),%TSOff,AT(10,,,)
#DISPLAY('  By Default, the Procedure Extenstion is turned ON')
#DISPLAY('  If you only want to activate the Highlighter')
#DISPLAY('  Code for a few procedures, check this box ON')
#DISPLAY('')
#PROMPT ('De-Activate Conditional Code',CHECK),%GHLDeActivateConditional,AT(10)
#PROMPT ('Do Not Set Window Background',CHECK),%GHLDoNotSetWindow,AT(10)
#PROMPT ('Use Underlined Entry Fields',CHECK),%TSUseUnderlinedFields,AT(10,,,)
#PROMPT ('Use "Flat" entry fields',CHECK),%TSFlatEntry,AT(10,,,)
#PROMPT ('Shadow Controls',CHECK),%TSShadow,AT(10,,,)
#PROMPT ('Shadow Color:',@S100),%TSShadowColor,DEFAULT('Color:Black')
#PROMPT('Color Picker:',COLOR),%TSDoesNothing6
#PROMPT('Enable PROP:BUFFER',CHECK),%TSPropBuffer,AT(10),Default(0)
#PROMPT('Activate Maximize Control',CHECK),%TSMaxControl,AT(10),Default(1) 
#ENDTAB
#TAB    ('Green Bar')
#PROMPT ('Activate Green Bar Effect',CHECK),%HLActivateGreenBarEffect,DEFAULT(1),AT(10)
#PROMPT ('Green Bar Color:',COLOR),%HSGreenBarColor,DEFAULT(0D0F8D0H)
#PROMPT ('Green Bar Background:',COLOR),%HSGreenBarBackground,DEFAULT(0FFFFFFH)
#PROMPT ('Green Bar Control #:',@N_7),%HSGreenBarControl,DEFAULT(850)
#PROMPT ('Selected Foreground Color:',COLOR),%HSSelectedColor,DEFAULT('Color:Black')
#PROMPT ('Selected Background Color:',COLOR),%HSSelectedFillColor,DEFAULT(080FFFFH)
#PROMPT ('Auto-Correct List Box Height',CHECK),%HSAutoCorrect,DEFAULT(0),AT(10)
#DISPLAY('Set "HL::DeactivateGreenBar" variable to disable')
#ENDTAB
#TAB    ('Colors'),HLP('The Global Template')
#BOXED  ('Selected Highlight Field Colors')
#PROMPT ('Selected Backgrnd Color',COLOR),%HLHighLightColorDef, Default('Color:Yellow')
#PROMPT ('Selected Text Color',COLOR),%HLHighLightTextDef, Default('Color:Black')
#PROMPT ('Background Color Variable',@S50),%HLHighLightColor,DEFAULT('')
#PROMPT ('Text Color Variable',@S50),%HLHighLightText,DEFAULT('')
#ENDBOXED
#DISPLAY('')
#PROMPT ('Use different color for Required Fields',CHECK),%HLRequired,AT(10,,,)
#BOXED  ('Required Fields Color'),Where(%HLRequired)
#PROMPT ('Selected Backgrnd Color',COLOR),%HLHighLightReqDef, Default('Color:Aqua')
#PROMPT ('Selected Text Color',COLOR),%HLHighLightTextReqDef, Default('Color:Black')
#PROMPT ('Background Color Variable',@S50),%HLHighLightReq,DEFAULT('')
#PROMPT ('Text Color Variable',@S50),%HLHighLightTextReq,DEFAULT('')
#ENDBOXED
#ENDTAB
#TAB    ('Painter'),HLP('The Global Template')
#PROMPT ('Color All Required Fields',CHECK),%HLColorReqFields
#BOXED  ('Required Fields Colors'),Where(%HLColorReqFields)
#PROMPT ('Normal Backgrnd Color',COLOR),%HLColorReqDef, Default('Color:Lime')
#PROMPT ('Normal Text Color',COLOR),%HLColorTextReqDef, Default('Color:Black')
#PROMPT ('Field Color Variable',@S50),%HLColorReq,DEFAULT('')
#PROMPT ('Text Color Variable',@S50),%HLColorTextReq,DEFAULT('')
#ENDBOXED
#BOXED  ('Conditional')
#DISPLAY ('The Variable HL::HLCondition should be TRUE')
#PROMPT ('Window Background',COLOR),%HLWindowColorBackground
#PROMPT ('String/Prompt Color',COLOR),%HLStringPromptColor
#PROMPT ('List Box Background',COLOR),%HLListBoxBackground
#PROMPT ('Button Color',COLOR),%HLButtonColor
#PROMPT ('Button Text',COLOR),%HLButtonText
#ENDBOXED
#ENDTAB
#TAB    ('Advanced')
#DISPLAY('You can choose to NOT highlight certain types')
#DISPLAY('of fields.')
#BOXED  ('Do NOT Highlight:')
#PROMPT ('Buttons',CHECK),%TSNoButtons,default(1)
#PROMPT ('List Boxes',CHECK),%TSNoListBoxes
#PROMPT ('Radio Buttons',CHECK),%TSNoRadio
#PROMPT ('Text Controls',CHECK),%TSNoText
#PROMPT ('Check Box Controls',CHECK),%TSNoCheck
#PROMPT ('Combo Controls',CHECK),%TSNoCombo
#PROMPT ('Drop Combo Controls',CHECK),%TSNoDropCombo
#ENDBOXED
#ENDTAB
#TAB    ('Info'),HLP('Contents')
#BOXED  ('')
#DISPLAY('Copyright 2010')
#DISPLAY('POSitive Software Company')
#DISPLAY('2290 Robertson Drive')
#DISPLAY('Richland, WA  99354')
#DISPLAY('Not For Resale, Use freely!')
#DISPLAY('')
#ENDBOXED
#ENDTAB
#ENDSHEET
#GLOBALDATA
#ENDGLOBALDATA
#AT(%GLOBALDATA)
#IF (%GlobalExternal)
HL::DeactivateGreenBar     Byte(0),EXTERNAL,DLL(dll_mode)
HL::GreenBarColor          Long(%HSGreenBarColor),EXTERNAL,DLL(dll_mode)
HL::GreenBarBackground     Long(%HSGreenBarBackground),EXTERNAL,DLL(dll_mode)
HL::SelectedColor          Long(%HSSelectedColor),EXTERNAL,DLL(dll_mode)
HL::SelectedFillColor      Long(%HSSelectedFillColor),EXTERNAL,DLL(dll_mode)
HL::HLCondition            Byte,EXTERNAL,DLL(dll_mode)
HL::WindowBackground       Long(%HLWindowColorBackground),EXTERNAL,DLL(dll_mode)
HL::StringPrompt           Long(%HLStringPromptColor),EXTERNAL,DLL(dll_mode)
HL::ListBoxBackground      Long(%HLListBoxBackground),EXTERNAL,DLL(dll_mode)
HL::ButtonColor            Long(%HLButtonColor),EXTERNAL,DLL(dll_mode)
HL::ButtonText             Long(%HLButtonText),EXTERNAL,DLL(dll_mode)
#IF(%TSMaxControl)
HL::FrameWidth             Long,EXTERNAL,DLL(dll_mode)
HL::FrameHeight            Long,EXTERNAL,DLL(dll_mode)
#ENDIF
#ELSE
HL::DeactivateGreenBar     Byte(0)
HL::GreenBarColor          Long(%HSGreenBarColor)
HL::GreenBarBackground     Long(%HSGreenBarBackground)
HL::SelectedColor          Long(%HSSelectedColor)
HL::SelectedFillColor      Long(%HSSelectedFillColor)
HL::HLCondition            Byte
HL::WindowBackground       Long(%HLWindowColorBackground)
HL::StringPrompt           Long(%HLStringPromptColor)
HL::ListBoxBackground      Long(%HLListBoxBackground)
HL::ButtonColor            Long(%HLButtonColor)
HL::ButtonText             Long(%HLButtonText)
#IF(%TSMaxControl)
HL::FrameWidth             Long
HL::FrameHeight            Long
#ENDIF
#ENDIF
#ENDAT
#AT (%DLLExportList)
#IF (%GlobalExternal)
#ELSE
 #IF (%ProgramExtension = 'DLL')
  $HL::DeactivateGreenBar  @?
  $HL::GreenBarColor       @?
  $HL::GreenBarBackground  @?
  $HL::SelectedColor       @?
  $HL::SelectedFillColor   @?
  $HL::HLCondition         @?    
  $HL::WindowBackground    @?    
  $HL::StringPrompt        @?    
  $HL::ListBoxBackground   @?    
  $HL::ButtonColor         @?    
  $HL::ButtonText          @?
  #IF(%TSMaxControl)
  $HL::FrameWidth          @?
  $HL::FrameHeight         @?
  #ENDIF
 #ENDIF
#ENDIF
#ENDAT
#AT(%ProgramSetup)
#IF(%HLActivate)
#IF(%HLHighLightColor<>'')
 %HLHighLightColor=%HLHighLightColorDef
#ENDIF
#IF(%HLHighLightText<>'')
 %HLHighLightText=%HLHighLightTextDef
#ENDIF
#IF(%HLRequired)
#IF(%HLHighLightReq<>'')
 %HLHighLightReq=%HLHighLightReqDef
#ENDIF
#IF(%HLHighLightTextReq<>'')
 %HLHighLightTextReq=%HLHighLightTextReqDef
#ENDIF
#ENDIF
#IF(%HLColorReqFields)
#IF(%HLColorReq<>'')
 %HLColorReq=%HLColorReqDef
#ENDIF
#IF(%HLColorTextReq<>'')
 %HLColorTextReq=%HLColorTextReqDef
#ENDIF
#ENDIF
#ENDIF
#ENDAT
#!----------------------------------------------------------------
#EXTENSION(HighLighterExtension,'HighLighter Extension Template'),PROCEDURE,HLP('The Extension Template')
#SHEET
#TAB    ('Highlighter')
#BOXED  ('')
#DISPLAY('HighLighter Extension Template')
#DISPLAY('This Template generates code to highlight entry fields with')
#DISPLAY('the color of your choice when the field is active.')
#DISPLAY('')
#BOXED(''),WHERE(~%TSOff)
#PROMPT ('De-Activate For This Procedure',CHECK),%HLDeActivate,AT(10)
#ENDBOXED
#BOXED(''),WHERE(%TSOff)
#PROMPT ('Activate For This Procedure',CHECK),%HLActivate2,AT(10)
#ENDBOXED
#BOXED  (''),Where((~%TSOff AND~%HLDeActivate) OR (%TSOff AND %HLActivate2))
#DISPLAY('You can elect to OMIT specific controls')
#DISPLAY('from being highlighted.')
#BUTTON ('Controls To Exclude'), MULTI(%HLExclude, %HLControlsToExclude), INLINE
#PROMPT ('Control To Exclude', CONTROL), %HLControlsToExclude
#ENDBUTTON
#ENDBOXED
#ENDBOXED
#ENDTAB
#TAB   ('Greenbar')
#PROMPT ('Deactivate Green_Bar Effect',CHECK),%HLDeActivateGreenBar,DEFAULT(0),AT(10)
#BUTTON  ('Controls To Ignore'), MULTI(%HLIgnore, %HLControlsToIgnore), INLINE,AT(,,,60)
#PROMPT  ('Control To Ignore', FROM(%CONTROL,%ControlType='LIST')), %HLControlsToIgnore
#ENDBUTTON
#ENDTAB
#ENDSHEET

#ATSTART
#DECLARE(%HLFlag)
#DECLARE(%HLCount)
#ENDAT
#AT (%DataSectionBeforeWindow),PRIORITY(1)
#IF ((%ProcedureTemplate <> 'Report') AND (%ProcedureTemplate <> 'UnivReport') AND (%ProcedureTemplate <> 'UnivAbcReport') AND (%ProcedureTemplate <> 'Process') AND (%ProcedureTemplate <> 'Source') AND (%ProcedureTemplate <> 'ExportBasic'))
#IF(%HLActivateGreenBarEffect AND ~%HLDeActivateGreenBar)
HL::GreenQ          Queue
HL::ControlNo       LONG
                    END
HL::GreenListQ      Queue
HL::ListControlNo   LONG
HL::ListEquate      LONG
                    END
#ENDIF
#ENDIF
#IF(%HLActivate AND ((~%TSOff AND ~%HLDeActivate) OR (%TSOff AND %HLActivate2)))
#IF(%ProcedureTemplate<>'Frame')
HL::LastSelected    LONG
HL::LastBackground  LONG
HL::LastText        LONG
HL::Q   Queue
HL::Q:Control   LONG
HL::Q:Background  LONG
HL::Q:TextColor   LONG
    END
#ENDIF
#ENDIF
#ENDAT

#AT(%PostWindowEventHandling,'OpenWindow')
#IF(~%GHLDoNotSetWindow)
 IF HL::HLCondition
    0{PROP:Background} = HL::WindowBackground
 END
#ENDIF
#ENDAT
#AT(%AfterWindowOpening)
#IF ((%ProcedureTemplate <> 'Report') AND (%ProcedureTemplate <> 'UnivReport') AND (%ProcedureTemplate <> 'UnivAbcReport') AND (%ProcedureTemplate <> 'Process') AND (%ProcedureTemplate <> 'Source') AND (%ProcedureTemplate <> 'ExportBasic'))
#IF(%HLActivateGreenBarEffect AND ~%HLDeActivateGreenBar)
 IF ~HL::DeactivateGreenBar
   DO HL::CreateGreenBar
 END
#ENDIF
#ENDIF
#ENDAT

#AT(%AfterWindowOpening)
#IF(((~%TSOff AND ~%HLDeActivate) OR (%TSOff AND %HLActivate2)) AND %ProcedureTemplate<>'Frame' AND %ProcedureTemplate<>'Report' AND %ProcedureTemplate<>'UnivReport' AND %ProcedureTemplate<>'Process' AND (%ProcedureTemplate <> 'Source') AND (%ProcedureTemplate <> 'ExportBasic'))
#IF(%HLActivate AND ((~%TSOff AND ~%HLDeActivate) OR (%TSOff AND %HLActivate2)))
#IF(%TSUseUnderlinedFields)
 DO HL::SetUnderlinedFields
#ENDIF
#IF(%HLActivate AND ((~%TSOff AND~%HLDeActivate) OR (%TSOff AND %HLActivate2)))
 #IF(%HLColorReqFields)
 DO HL::SetFields
 #ENDIF
#ENDIF
#IF(%TSFlatEntry)
 DO HL::SetFlatEntryFields
#ENDIF
#IF(%TSShadow)
 DO HL::SetShadows
#ENDIF
#IF(%TSPropBuffer)
0{PROP:BUFFER} = True
#ENDIF
#ENDIF
#ENDIF
#IF(~%GHLDeActivateConditional)
DO HLConditionRoutine
#ENDIF
#ENDAT

#AT(%XPTaskPanelInitBeforeParent)
#IF(~%GHLDeActivateConditional)
IF HL::HLCondition
  Self.SetColorGrp(COLORGRP_PANEL, HL::WindowBackground,HL::WindowBackground,HL::WindowBackground,HL::WindowBackground,HL::WindowBackground)
END
#ENDIF
#ENDAT

#AT(%AcceptLoopBeforeFieldHandling)
#IF ((%ProcedureTemplate <> 'Report') AND (%ProcedureTemplate <> 'UnivReport') AND (%ProcedureTemplate <> 'UnivAbcReport') AND (%ProcedureTemplate <> 'Process') AND (%ProcedureTemplate <> 'Source') AND (%ProcedureTemplate <> 'ExportBasic'))
#IF(%HLActivateGreenBarEffect AND ~%HLDeActivateGreenBar)
 IF ~HL::DeactivateGreenBar
   IF EVENT() <> EVENT:Sized |
   AND event() <> EVENT:Suspend |
   AND EVENT() <> EVENT:Resume |
   AND EVENT() <> EVENT:Restore |
   AND EVENT() <> Event:PreAlertKey |
   AND EVENT() <> Event:Maximize |
   AND EVENT() <> Event:Move |
   AND EVENT() <> Event:Iconize |
   AND EVENT() <> Event:GainFocus
     HL::Reset# = 0
   #SET(%HLCount,1)
   #FOR(%Control)
     #IF(%ControlType = 'LIST')
      #SET (%HLFlag, 0)
      #IF (%ControlType = 'LIST')
       #IF (EXTRACT(%ControlStatement, 'DROP'))
         #CYCLE
       #ENDIF
       #SET (%HLFlag, 0)
       #FOR(%HLIgnore)
         #IF(%Control=%HLControlsToIgnore)
           #SET(%HLFlag,1)
           #BREAK
         #ENDIF
       #ENDFOR
       #IF (%HLFlag)
         #CYCLE
       #ENDIF
      #ENDIF
      #SET(%HLCount,%HLCount + 1)
     IF (HL::%HLCount::LH# <> %Control{PROP:Height} OR HL::%HLCount::LW# <> %Control{PROP:Width}) AND ~HL::Reset#
       HL::%HLCount::LH# = %Control{PROP:Height}
       HL::%HLCount::LW# = %Control{PROP:Width}
       DO HL::CreateGreenBar
       HL::Reset# = 1
     END
    #ENDIF
  #ENDFOR
   .
 END
#ENDIF
#ENDIF
#IF(%HLActivate AND ((~%TSOff AND ~%HLDeActivate) OR (%TSOff AND %HLActivate2)))
#IF(((~%TSOff AND ~%HLDeActivate) OR (%TSOff AND %HLActivate2)) AND %ProcedureTemplate<>'Frame' AND %ProcedureTemplate<>'Report' AND %ProcedureTemplate<>'UnivReport' AND %ProcedureTemplate<>'Process' AND (%ProcedureTemplate <> 'Source') AND (%ProcedureTemplate <> 'ExportBasic'))
#IF(%HLGlobalVar)
 IF %HLGlobalVar
#ENDIF
   Do HL::HighLight
#IF(%HLGlobalVar)
 End
#ENDIF
#ENDIF
#ENDIF
#ENDAT

#AT(%ProcedureRoutines)
#IF(%ProcedureTemplate <> 'Source')
#IF(~%GHLDeActivateConditional)
HLConditionRoutine   Routine

  DATA
  
r:WindowBackground   LONG
r:ListBoxBackground  LONG
r:StringPrompt   LONG
r:ButtonColor   LONG
r:ButtonText   LONG

  CODE
 r:WindowBackground   = HL::WindowBackground
 r:ListBoxBackground  = HL::ListBoxBackground
 r:StringPrompt       = HL::StringPrompt
 r:ButtonColor        = HL::ButtonColor
 r:ButtonText         = HL::ButtonText
 #EMBED(%HLBeforeColorCondition,'HL Before Color Condition')
 IF HL::HLCondition
 #IF(~%GHLDoNotSetWindow)
   0{PROP:Background} = HL::WindowBackground 
 #ENDIF  
   LOOP HL# = FirstField() To LastField()
        IF HL#{PROP:Type} = CREATE:STRING OR |
           HL#{PROP:Type} = CREATE:sstring OR |
           HL#{PROP:Type} = CREATE:Text OR |
           HL#{PROP:Type} = CREATE:PROMPT OR |
           HL#{PROP:Type} = CREATE:TAB OR |
           HL#{PROP:Type} = CREATE:SHEET OR |
           HL#{PROP:Type} = CREATE:CHECK OR |
           HL#{PROP:Type} = CREATE:GROUP OR |
           HL#{PROP:Type} = CREATE:OPTION OR |
           HL#{PROP:Type} = CREATE:RADIO           
            HL#{PROP:FontColor} = r:StringPrompt
            HL#{PROP:Background} = r:WindowBackground
            IF HL#{PROP:Type} = CREATE:CHECK
	       HL#{PROP:TRN} = False
            END
        END
        IF HL#{PROP:Type} = CREATE:PANEL
          HL#{PROP:Fill} = r:WindowBackground
          IF HL#{PROP:BevelStyle} = 0
	      HL#{PROP:BevelStyle} = 26182
          END
        END
        IF HL#{PROP:Type} = CREATE:LIST OR |
           HL#{PROP:Type} = CREATE:SPIN OR |
           HL#{PROP:Type} = CREATE:ENTRY
           IF HL#{PROP:TRN} = True
	      HL#{PROP:FontColor} = r:StringPrompt
	      HL#{PROP:Background} = r:WindowBackground
	   ELSE
	      HL#{PROP:Background} = r:ListBoxBackground
           END
        END   
        IF HL#{PROP:Type} = CREATE:BUTTON
          HL#{PROP:Background} = r:ButtonColor
          HL#{PROP:FontColor} = r:ButtonText
        END
   END
 END
 #EMBED(%HLAfterColorCondition,'HL After Color Condition')
#ENDIF 
#ENDIF
#IF(%ProcedureTemplate<>'Frame' AND %ProcedureTemplate<>'Report' AND %ProcedureTemplate<>'UnivReport' AND %ProcedureTemplate<>'Process' AND (%ProcedureTemplate <> 'Source') AND (%ProcedureTemplate <> 'ExportBasic'))
  #IF(%HLActivate AND ((~%TSOff AND ~%HLDeActivate) OR (%TSOff AND %HLActivate2)))
   #IF(%TSShadow)
HL::SetShadows            Routine
  DATA
HL::FIELDCONTROL    LONG
  CODE
    #FOR(%CONTROL)
    #IF(%CONTROLTYPE='LIST' OR %CONTROLTYPE='BUTTON')
    IF %CONTROL{PROP:TRN} = FALSE AND %CONTROL{PROP:HIDE} = FALSE
        HL::FIELDCONTROL = %CONTROL + 2500
            #IF(%ControlParent <> '')
        CREATE(HL::FIELDCONTROL,Create:Box,%ControlParent)
            #ELSE
        CREATE(HL::FIELDCONTROL,Create:Box)
            #ENDIF
        HL::FIELDCONTROL{PROP:XPos}   = %CONTROL{PROP:XPos}-2
        HL::FIELDCONTROL{PROP:YPos}   = %CONTROL{PROP:YPos}+2
        HL::FIELDCONTROL{PROP:Width}  = %CONTROL{PROP:Width}
        HL::FIELDCONTROL{PROP:Height} = %CONTROL{PROP:Height}
        HL::FIELDCONTROL{PROP:Fill}   = %TSShadowColor
        HL::FIELDCONTROL{PROP:Hide}   = False
    END
    #ENDIF
    #ENDFOR
  #ENDIF
  #IF(%TSFlatEntry)
HL::SetFlatEntryFields    Routine
    #FOR(%CONTROL)
      #IF(%CONTROLTYPE='ENTRY' OR %CONTROLTYPE='SPIN' OR %CONTROLTYPE='DROPLIST')
    %CONTROL{PROP:TRN}=True
    HL::FIELDCONTROL# = %CONTROL + 1500
        #IF(%ControlParent <> '')
    CREATE(HL::FIELDCONTROL#,Create:Box,%ControlParent)
        #ELSE
    CREATE(HL::FIELDCONTROL#,Create:Box)
        #ENDIF
    HL::FIELDCONTROL#{PROP:XPos}=%CONTROL{PROP:XPos}-1
    HL::FIELDCONTROL#{PROP:YPos} = %CONTROL{PROP:YPos}+1
    HL::FIELDCONTROL#{PROP:Width} = %CONTROL{PROP:Width}
    HL::FIELDCONTROL#{PROP:Height} = %CONTROL{PROP:Height}
    HL::FIELDCONTROL#{PROP:Fill}=Color:Blue
    !HL::FIELDCONTROL#{PROP:Round}=True
    HL::FIELDCONTROL#{PROP:Hide}=False
    HL::FIELDCONTROL#{PROP:Hide} = %CONTROL{PROP:Hide}
    HL::FIELDCONTROL# = %CONTROL + 2000
        #IF(%ControlParent <> '')
    CREATE(HL::FIELDCONTROL#,Create:Box,%ControlParent)
        #ELSE
    CREATE(HL::FIELDCONTROL#,Create:Box)
        #ENDIF
    HL::FIELDCONTROL#{PROP:XPos}=%CONTROL{PROP:XPos}
    HL::FIELDCONTROL#{PROP:YPos} = %CONTROL{PROP:YPos}
    HL::FIELDCONTROL#{PROP:Width} = %CONTROL{PROP:Width}
    HL::FIELDCONTROL#{PROP:Height} = %CONTROL{PROP:Height}
    HL::FIELDCONTROL#{PROP:Fill}=Color:White
    HL::FIELDCONTROL#{PROP:FillColor}=Color:Black
    !HL::FIELDCONTROL#{PROP:Round}=True
    HL::FIELDCONTROL#{PROP:Hide}=False
    HL::FIELDCONTROL#{PROP:Hide} = %CONTROL{PROP:Hide}
      #ENDIF
    #ENDFOR
  #ENDIF
  #IF(%HLColorReqFields)
HL::SetFields  Routine
  #FOR(%CONTROL),WHERE(INSTRING('REQ',%ControlUnsplitStatement,1,1))
     #IF(%TSFlatEntry)
        HL::FIELDCONTROL# = %CONTROL + 2000
     #ELSE
        HL::FIELDCONTROL# = %CONTROL
     #ENDIF
       #IF(%HLHighLightReq<>'')
        HL::FIELDCONTROL#{PROP:Background}=%HLColorReq
       #ELSE
        HL::FIELDCONTROL#{PROP:Background}=%HLColorReqDef
       #ENDIF
       #IF(%HLHighLightTextReq<>'')
        HL::FIELDCONTROL#{PROP:FontColor}=%HLColorTextReq
       #ELSE
        HL::FIELDCONTROL#{PROP:FontColor}=%HLColorTextReqDef
       #ENDIF
  #ENDFOR
  #ENDIF
  #IF(%TSUseUnderlinedFields)
HL::SetUnderlinedFields   Routine
    HL::FIELDCONTROL#=1000
    #FOR(%CONTROL)
    #IF(%CONTROLTYPE='ENTRY' OR %CONTROLTYPE='SPIN')
    %CONTROL{PROP:TRN}=True
      #IF(%ControlParent <> '')
    CREATE(HL::FIELDCONTROL#,Create:Line,%ControlParent)
      #ELSE
    CREATE(HL::FIELDCONTROL#,Create:Line)
      #ENDIF
    HL::FIELDCONTROL#{PROP:XPos} = %CONTROL{PROP:XPos}
    HL::FIELDCONTROL#{PROP:YPos} = %CONTROL{PROP:YPos} + %CONTROL{PROP:Height}
    HL::FIELDCONTROL#{PROP:Width} = %CONTROL{PROP:Width}
    HL::FIELDCONTROL#{PROP:Height} = 0
    HL::FIELDCONTROL#{PROP:Hide}=False
    HL::FIELDCONTROL#+=1
    #IF(%ControlParent <> '')
    CREATE(HL::FIELDCONTROL#,Create:Line,%ControlParent)
      #ELSE
    CREATE(HL::FIELDCONTROL#,Create:Line)
      #ENDIF
    HL::FIELDCONTROL#{PROP:XPos}=%CONTROL{PROP:XPos}
    HL::FIELDCONTROL#{PROP:YPos} = %CONTROL{PROP:YPos}
    HL::FIELDCONTROL#{PROP:Width} = %CONTROL{PROP:Width}
    HL::FIELDCONTROL#{PROP:Height} = %CONTROL{PROP:Height}
    HL::FIELDCONTROL#{PROP:Fillcolor}=Color:White
    HL::FIELDCONTROL#{PROP:Hide}=False
    HL::FIELDCONTROL#+=1
    #ENDIF
    #ENDFOR
  #ENDIF


HL::HighLight   Routine
    IF Selected()
       IF HL::LastSelected
          HL::Q.HL::Q:Control = HL::LastSelected
	  GET(HL::Q,HL::Q.HL::Q:Control)
          IF ~ERROR()
              HL::LastBackground = HL::Q.HL::Q:Background
              HL::LastText = HL::Q.HL::Q:TextColor
          END
          #IF(%TSFlatEntry)
            HL::FIELDCONTROL# = HL::LastSelected + 2000
            HL::FIELDCONTROL#{PROP:Fill}=HL::LastBackground
          #ELSE
            HL::FIELDCONTROL# = HL::LastSelected
            HL::FIELDCONTROL#{PROP:Background}=HL::LastBackground
          #ENDIF
          HL::LastSelected{PROP:FontColor}=HL::LastText
       END
       #IF(%TSFlatEntry)
          HL::FIELDCONTROL# = ? + 2000
          HL::LastBackground=HL::FIELDCONTROL#{PROP:Fill}
       #ELSE
          HL::LastBackground=?{PROP:Background}
       #ENDIF
       HL::LastText=?{PROP:FontColor}
       HL::Q.HL::Q:Control = Selected()
       GET(HL::Q,HL::Q.HL::Q:Control)
       IF ERROR()
          HL::Q.HL::Q:Background  = HL::LastBackground 
          HL::Q.HL::Q:TextColor   = HL::LastText
          ADD(HL::Q,HL::Q.HL::Q:Control)
       END
       #FOR(%HLExclude)
       IF SELECTED()=%HLControlsToExclude;exit.
       #ENDFOR
       #EMBED(%HLAfterExcludingControls,'HL After Excluding Controls')
     #IF(%HLActivateGreenBarEffect AND ~%HLDeActivateGreenBar)
      ! IF ~HL::DeactivateGreenBar
       #FOR(%Control)
        #IF(%ControlType = 'LIST')
          #SET (%HLFlag, 0)
          #IF (%ControlType = 'LIST')
            #IF (EXTRACT(%ControlStatement, 'DROP'))
              #CYCLE
            #ENDIF
            #SET (%HLFlag, 0)
            #FOR(%HLIgnore)
             #IF(%Control=%HLControlsToIgnore)
               #SET(%HLFlag,1)
               #BREAK
             #ENDIF
            #ENDFOR
            #IF (%HLFlag)
             #CYCLE
            #ENDIF
          #ENDIF
      !    IF SELECTED()=%Control;exit.
        #ENDIF
       #ENDFOR
      ! END
     #ENDIF
       #IF(%TSNoButtons)
       IF SELECTED(){PROP:Type}=CREATE:BUTTON;Exit.
       #ENDIF
       #IF(%TSNoRadio)
       IF SELECTED(){PROP:Type}=CREATE:RADIO;Exit.
       #ENDIF
       #IF(%TSNoListBoxes)
       IF SELECTED(){PROP:Type}=CREATE:LIST;Exit.
       #ENDIF
       #IF(%TSNoText)
       IF SELECTED(){PROP:Type}=CREATE:TEXT;Exit.
       #ENDIF
       #IF(%TSNoCheck)
       IF SELECTED(){PROP:Type}=CREATE:CHECK;Exit.
       #ENDIF
       #IF(%TSNoCombo)
       IF SELECTED(){PROP:Type}=CREATE:COMBO;Exit.
       #ENDIF
       #IF(%TSNoDropCombo)
       IF SELECTED(){PROP:Type}=CREATE:DROPCOMBO;Exit.
       #ENDIF
       IF SELECTED(){PROP:Readonly}<>True
       #IF(%HLRequired)
         IF ?{PROP:req}=True
         #IF(%HLHighLightReq<>'')
          #IF(%HLActivateGreenBarEffect AND ~%HLDeActivateGreenBar)
          HL::GreenListQ.HL::ListEquate = FIELD()
          GET(HL::GreenListQ,HL::GreenListQ.HL::ListEquate)
          IF ~ERROR() AND ~HL::DeactivateGreenBar
             HL::GreenListQ.HL::ListControlNo{PROP:Fill}=%HLHighLightReq
             IF HL::LastSelected AND HL::LastSelected<>selected()
                HL::GreenListQ.HL::ListEquate = HL::LastSelected
                GET(HL::GreenListQ,HL::GreenListQ.HL::ListEquate)
                IF ~ERROR()
                   HL::GreenListQ.HL::ListControlNo{PROP:Fill} = HL::GreenBarBackground
                .
             .
          ELSE
          #ENDIF
            !?{PROP:Background}=%HLHighLightReq
            #IF(%TSFlatEntry)
            HL::FIELDCONTROL# = ? + 2000
              HL::FIELDCONTROL#{PROP:Fill}=%HLHighLightReq
            #ELSE
              HL::FIELDCONTROL# = ?
              HL::FIELDCONTROL#{PROP:Background}=%HLHighLightReq
            #ENDIF
          #IF(%HLActivateGreenBarEffect AND ~%HLDeActivateGreenBar)
          END
          #ENDIF
         #ELSE
          #IF(%HLActivateGreenBarEffect AND ~%HLDeActivateGreenBar)
          HL::GreenListQ.HL::ListEquate = FIELD()
          GET(HL::GreenListQ,HL::GreenListQ.HL::ListEquate)
          IF ~ERROR() AND ~HL::DeactivateGreenBar
             HL::GreenListQ.HL::ListControlNo{PROP:Fill}=%HLHighLightReqDef
             IF HL::LastSelected AND HL::LastSelected<>selected()
                HL::GreenListQ.HL::ListEquate = HL::LastSelected
                GET(HL::GreenListQ,HL::GreenListQ.HL::ListEquate)
                IF ~ERROR()
                   HL::GreenListQ.HL::ListControlNo{PROP:Fill} = HL::GreenBarBackground
                .
             .
          ELSE
          #ENDIF
          #IF(%TSFlatEntry)
            HL::FIELDCONTROL# = ? + 2000
            HL::FIELDCONTROL#{PROP:Fill}=%HLHighLightReqDef
          #ELSE
            HL::FIELDCONTROL# = ?
            HL::FIELDCONTROL#{PROP:Background}=%HLHighLightReqDef
          #ENDIF
          #IF(%HLActivateGreenBarEffect AND ~%HLDeActivateGreenBar)
          END
          #ENDIF
         #ENDIF
         #IF(%HLHighLightTextReq<>'')
          ?{PROP:FontColor}=%HLHighLightTextReq
         #ELSE
          ?{PROP:FontColor}=%HLHighLightTextReqDef
         #ENDIF
         ELSE
       #ENDIF
         #IF(%HLHighLightColor<>'')
          #IF(%HLActivateGreenBarEffect AND ~%HLDeActivateGreenBar)
          HL::GreenListQ.HL::ListEquate = FIELD()
          GET(HL::GreenListQ,HL::GreenListQ.HL::ListEquate)
          IF ~ERROR() AND ~HL::DeactivateGreenBar
             HL::GreenListQ.HL::ListControlNo{PROP:Fill}=%HLHighLightColor
             IF HL::LastSelected AND HL::LastSelected<>selected()
                HL::GreenListQ.HL::ListEquate = HL::LastSelected
                GET(HL::GreenListQ,HL::GreenListQ.HL::ListEquate)
                IF ~ERROR()
                   HL::GreenListQ.HL::ListControlNo{PROP:Fill} = HL::GreenBarBackground
                .
             .
          ELSE
          #ENDIF
          #IF(%TSFlatEntry)
            HL::FIELDCONTROL# = ? + 2000
            HL::FIELDCONTROL#{PROP:Fill}=%HLHighLightColor
          #ELSE
            HL::FIELDCONTROL# = ?
            HL::FIELDCONTROL#{PROP:Background}=%HLHighLightColor
          #ENDIF
          !HL::FIELDCONTROL#{PROP:Background}=%HLHighLightColor
          #IF(%HLActivateGreenBarEffect AND ~%HLDeActivateGreenBar)
          END
          #ENDIF
         #ELSE
          #IF(%HLActivateGreenBarEffect AND ~%HLDeActivateGreenBar)
          HL::GreenListQ.HL::ListEquate = FIELD()
          GET(HL::GreenListQ,HL::GreenListQ.HL::ListEquate)
          IF ~ERROR() AND ~HL::DeactivateGreenBar
             HL::GreenListQ.HL::ListControlNo{PROP:Fill}=%HLHighLightColorDef
             IF HL::LastSelected AND HL::LastSelected<>selected()
                HL::GreenListQ.HL::ListEquate = HL::LastSelected
                GET(HL::GreenListQ,HL::GreenListQ.HL::ListEquate)
                IF ~ERROR()
                   HL::GreenListQ.HL::ListControlNo{PROP:Fill} = HL::GreenBarBackground
                .
             .
          ELSE
          #ENDIF
          #IF(%TSFlatEntry)
            HL::FIELDCONTROL# = ? + 2000
            HL::FIELDCONTROL#{PROP:Fill}=%HLHighLightColorDef
          #ELSE
            HL::FIELDCONTROL# = ?
            HL::FIELDCONTROL#{PROP:Background}=%HLHighLightColorDef
          #ENDIF
          !HL::FIELDCONTROL#{PROP:Background}=%HLHighLightColorDef
          #IF(%HLActivateGreenBarEffect AND ~%HLDeActivateGreenBar)
          END
          #ENDIF
         #ENDIF
         #IF(%HLHighLightText<>'')
          ?{PROP:FontColor}=%HLHighLightText
         #ELSE
          ?{PROP:FontColor}=%HLHighLightTextDef
         #ENDIF
       #IF(%HLRequired)
         END
       #ENDIF
       .
       HL::LastSelected=selected()
    End
  #ENDIF
#ENDIF

#IF ((%ProcedureTemplate <> 'Report') AND (%ProcedureTemplate <> 'UnivReport') AND (%ProcedureTemplate <> 'UnivAbcReport') AND (%ProcedureTemplate <> 'Process') AND (%ProcedureTemplate <> 'Source'))
#IF(%HLActivateGreenBarEffect AND ~%HLDeActivateGreenBar)
HL::CreateGreenBar    Routine
  IF Records(HL::GreenQ)
     LOOP HL::Temp# = 1 To Records(HL::GreenQ)
          GET(HL::GreenQ,HL::Temp#)
          DESTROY(HL::GreenQ.HL::ControlNo)
     END
  END
  FREE(HL::GreenQ)
  FREE(HL::GreenListQ)
  IF HL::DeactivateGreenBar;EXIT.
  COUNT# = %HSGreenBarControl
  #FOR(%Control)
  #IF(%ControlType = 'LIST')
   #SET (%HLFlag, 0)
   #IF (%ControlType = 'LIST')
   #IF (EXTRACT(%ControlStatement, 'DROP'))
   #CYCLE
   #ENDIF
   #SET (%HLFlag, 0)
   #FOR(%HLIgnore)
     #IF(%Control=%HLControlsToIgnore)
       #SET(%HLFlag,1)
       #BREAK
     #ENDIF
   #ENDFOR
   #IF (%HLFlag)
    #CYCLE
   #ENDIF
  #ENDIF
  %Control{PROP:TRN} = True
  %Control{PROP:SelectedColor}     = HL::SelectedColor
  %Control{PROP:SelectedFillColor} = HL::SelectedFillColor
  HLY# = %Control{PROP:YPos} + %Control{PROP:HeaderHeight}
  HLH# = %Control{PROP:Height} - %Control{PROP:HeaderHeight}
  HLL# = %Control{PROP:LineHeight}
  HLYPOS# = HLY# + HLL#
  #IF(%ControlParent)
  CREATE(COUNT#,Create:Box,%ControlParent)
  #ELSE
  CREATE(COUNT#,Create:Box)
  #ENDIF
  HL::GreenQ.HL::ControlNo = COUNT#
  ADD(HL::GreenQ)
  HL::GreenListQ.HL::ListControlNo = COUNT#
  HL::GreenListQ.HL::ListEquate = %Control
  ADD(HL::GreenListQ,HL::GreenListQ.HL::ListEquate)
  HLBox# = COUNT#
  COUNT#{PROP:Height} = HLH#
  COUNT#{PROP:Width} = %Control{PROP:Width}
  COUNT#{PROP:XPos} = %Control{PROP:XPos}
  COUNT#{PROP:YPos} = HLY#
  COUNT#{Prop:Hide} = False
  COUNT#{Prop:Color} = HL::GreenBarBackground
  COUNT#{Prop:Fill} = HL::GreenBarBackground
  COUNT#+=1
  HLLT# = 0
  LOOP
       #IF(%ControlParent)
       CREATE(COUNT#,Create:Box,%ControlParent)
       #ELSE
       CREATE(COUNT#,Create:Box)
       #ENDIF
       HL::GreenQ.HL::ControlNo = COUNT#
       ADD(HL::GreenQ)
       COUNT#{PROP:Height} = %Control{PROP:LineHeight}
       COUNT#{PROP:Width}  = %Control{PROP:Width}
       COUNT#{PROP:XPos}   = %Control{PROP:XPos}
       COUNT#{PROP:YPos}   = HLYPOS#
       COUNT#{Prop:Color}  = HL::GreenBarColor
       COUNT#{Prop:Fill}   = HL::GreenBarColor
       COUNT#{Prop:Hide}   = False
       COUNT#+=1
       IF HLLT#;Break.
       HLYPOS# += HLL#*2
       #IF(%HSAutoCorrect)
       IF HLYPOS# + HLL# > HLH# + HLY# + %Control{PROP:HeaderHeight}
          IF (HLYPOS# + HLL#) - (HLH# + HLY# + %Control{PROP:HeaderHeight}) < HLL#/2
             %Control{PROP:Height} = HLYPOS# + HLL# - HLY#   + 4
             HLLT# = 1
             Cycle
          ELSE
             %Control{PROP:Height} = HLYPOS# - HLY#   + 4
             Break
          END
       END
       #ELSE
       IF HLYPOS# + HLL# >= HLH# + HLY#;Break.
       #ENDIF
  END
  HLBox#{PROP:Height} = %Control{PROP:Height} - %Control{PROP:HeaderHeight}
  #ENDIF
  #ENDFOR
  #SET(%HLCount,1)
   #FOR(%Control)
     #IF(%ControlType = 'LIST')
      #SET (%HLFlag, 0)
      #IF (%ControlType = 'LIST')
       #IF (EXTRACT(%ControlStatement, 'DROP'))
         #CYCLE
       #ENDIF
       #SET (%HLFlag, 0)
       #FOR(%HLIgnore)
         #IF(%Control=%HLControlsToIgnore)
           #SET(%HLFlag,1)
           #BREAK
         #ENDIF
       #ENDFOR
       #IF (%HLFlag)
         #CYCLE
       #ENDIF
      #ENDIF
      #SET(%HLCount,%HLCount + 1)
  HL::%HLCount::LH# = %Control{PROP:Height}
  HL::%HLCount::LW# = %Control{PROP:Width}
    #ENDIF
  #ENDFOR
#ENDIF
#ENDIF
#ENDAT
!-------------------------------------------
#CONTROL(HLColorButton,'Highlighter Color Set Button'),DESCRIPTION('Highlighter Color Set Button'),PROCEDURE,MULTI,HLP('The Control Template')
    #DISPLAY('Highlighter Color Set Button')
    #DISPLAY('')
    #DISPLAY('Calls the Color Dialog and sets a Field to the')
    #DISPLAY('selected color value.')
    #DISPLAY('')
    #PROMPT('Field To Set',CONTROL),%HLFieldToSet
    #PROMPT('Dialog Title',@s25),%HLDialogTitle,DEFAULT('Select A Color')
     CONTROLS
        BUTTON('...'),AT(,,16,14),USE(?HLColorButton)
     END
#ATSTART
  #DECLARE(%HLLookupControl)
  #DECLARE(%HLLookupControlUse)
  #FOR(%Control),WHERE(%ControlInstance=%ActiveTemplateInstance)
    #SET(%HLLookupControl,%Control)
  #ENDFOR
  #FIX(%Control,%HLFieldToSet)
  #IF(%ControlType<>'ENTRY' AND %CONTROLTYPE <> 'SPIN')
    #ERROR(%Procedure & 'Error: %Control needs to refer to Entry Control')
  #ENDIF
  #SET(%HLLookupControlUse,%ControlUse)
#ENDAT

#AT(%ControlPreEventHandling,%HLLookupControl,'Accepted')
    IF COLORDIALOG('%HLDialogTitle',%HLLookupControlUse)
      %HLFieldToSet{PROP:FONTCOLOR} = %HLLookupControlUse
      %HLFieldToSet{PROP:BACKGROUND} = %HLLookupControlUse
    END
    Display(%HLLookupControl)
#ENDAT
  
#AT(%RefreshWindowBeforeLookup)
#IF(SUB(%CWTemplateVersion,1,2)='v2')
    %HLFieldToSet{PROP:FONTCOLOR} = %HLLookupControlUse
    %HLFieldToSet{PROP:BACKGROUND} = %HLLookupControlUse
#ENDIF
#ENDAT

#AT(%WindowManagerMethodCodeSection,'Reset','(BYTE Force=0)'),PRIORITY(4000)
#IF(SUB(%CWTemplateVersion,1,2)<>'v2')
    %HLFieldToSet{PROP:FONTCOLOR} = %HLLookupControlUse
    %HLFieldToSet{PROP:BACKGROUND} = %HLLookupControlUse
#ENDIF
#ENDAT

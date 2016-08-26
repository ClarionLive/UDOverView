                                MEMBER()

    INCLUDE('EQUATES.CLW')
    INCLUDE('sdkODSMessagePump.INC'),ONCE
    INCLUDE('stringtheory.inc'),ONCE

                                
stProfile                       StringTheory

sdkODSMessagePump.Construct     procedure!,private        

    code 
    
    SELF.ODSMessageQ &=  new sdkODSMessageQ
    SELF.ODSProcessQ &=  new sdkODSProcessQ
    SELF.csQ         &=  new CriticalSection
    
    
sdkODSMessagePump.Destruct      procedure!,private                    

    code 
    
    dispose(SELF.ODSMessageQ)
    dispose(SELF.ODSProcessQ) 
    dispose(SELF.csQ)

    
sdkODSMessagePump.DataIn        procedure(*sdkODSMessage pMessage) 

    CODE 
    
    SELF.csQ.Wait
    SELF.ODSMessageQ         =  pMessage
    SELF.ODSMessageQ.Process =  self.GetProcessName(pMessage.PID)
    IF INSTRING('||',SELF.ODSMessageQ.Text,1,1) 
        ADD(SELF.ODSMessageQ) 

    ELSIF INSTRING(CLIP(SELF.ProfileID),SELF.ODSMessageQ.Text,1,1)
        ADD(SELF.ODSMessageQ)
              
    ELSIF INSTRING('Time Taken:',SELF.ODSMessageQ.Text,1,1)
        stProfile.SetValue(SELF.ODSMessageQ.Text)
        stProfile.Split(' ')
        SELF.ProfileID =  stProfile.GetLine(1)
        ADD(SELF.ODSMessageQ)
     
    ELSIF SELF.ShowAllMessages
        ADD(SELF.ODSMessageQ) 
         
    END
    
    SELF.csQ.Release
    

sdkODSMessagePump.DataOut       procedure(*sdkODSMessageQ pMessageQ) 
myPtr                               long 

    CODE
    
    SELF.csQ.Wait
    FREE(pMessageQ) 
    LOOP myPtr = 1 to records(SELF.ODSMessageQ) 
        get(SELF.ODSMessageQ, myPtr) 
        pMessageQ =  SELF.ODSMessageQ
        add(pMessageQ) 
    END 
    FREE(SELF.ODSMessageQ) 
    SELF.csQ.Release
    

sdkODSMessagePump.Register      procedure(long pDataEvent)  
    code 
    self.RegisteredThread =  thread() 
    self.DataEvent        =  pDataEvent 
    

sdkODSMessagePump.GetProcessName        PROCEDURE(long pProcessID)!,string (fails with 64-bit processes?)
myphandle                                   long
myresult                                    long
mylong                                      long
mycstring                                   cstring(261)

    CODE
    
    SELF.ODSProcessQ.pid =  pProcessID
    GET(SELF.ODSProcessQ, +SELF.ODSProcessQ.pid) 
    IF errorcode() 
        SELF.ODSProcessQ.name =  '??'
        myphandle             =  sdkOpenProcess(sdk:PROCESS_VM_READ+sdk:PROCESS_QUERY_INFORMATION, false, pProcessID)
        if myphandle
            myresult =  sdkGetModuleFileNameExA(myphandle, mylong, mycstring, size(mycstring)-1)
            sdkCloseHandle(myphandle) 
            if myresult > 0
                SELF.ODSProcessQ.name =  mycstring[1 : myresult]
                case sub(SELF.ODSProcessQ.name, 1, 4)
                of '\??\'
                    SELF.ODSProcessQ.name =  sub(mycstring, 5, myresult) 
                end
            end
        end
        mylong =  instring('\', SELF.ODSProcessQ.name, -1, len(clip(SELF.ODSProcessQ.name)))
        IF mylong 
            SELF.ODSProcessQ.name =  sub(SELF.ODSProcessQ.Name, mylong + 1, size(SELF.ODSProcessQ.Name))
        END 
        ADD(SELF.ODSProcessQ)
    END
    RETURN SELF.ODSProcessQ.name


sdkODSMessagePump.Monitor       procedure(long pCloseEvent, long pGlobalMessages=false)!,long,proc 
                                map 
myODSMonitor                        procedure(string pParameters) 
                                end 
sdkODSMonitorPars                   group,type 
MainThread                              long 
MainWindowHandle                        long 
CloseEvent                              long 
GlobalMessages                          long 
Pump                                    &sdkODSMessagePump
                                    end                     
myParameters_                       like(sdkODSMonitorPars)

    CODE 
    
    myParameters_.MainThread       =  thread()
    myParameters_.MainWindowHandle =  0{PROP:Handle} 
    myParameters_.CloseEvent       =  pCloseEvent 
    myParameters_.GlobalMessages   =  pGlobalMessages 
    myParameters_.Pump            &=  self 
    return start(myODSMonitor, , myParameters_) 
    

myODSMonitor                    PROCEDURE(string pParameters)
myParameters                        like(sdkODSMonitorPars)
myBufferReady                       cstring(101)
myDataReady                         cstring(101)
myBufferName                        cstring(101)
myProblem                           cstring(201) 
myBufferReadyEvent                  long 
myDataReadyEvent                    long 
mySharedFile                        long 
myMappedBuffer                      long 
myWaitResult                        long 
myMessageIn                         group
PID                                     ulong 
Text                                    cstring(4092) 
                                    end 
mySystemTime                        like(sdk:SYSTEMTIME)                         
myTime                              long 
myMilliSeconds                      long 
myMessageOut                        like(sdkODSMessage) 

    CODE 
    
    myParameters  =  pParameters
    myBufferReady =  'DBWIN_BUFFER_READY'
    myDataReady   =  'DBWIN_DATA_READY'
    myBufferName  =  'DBWIN_BUFFER'
    if myParameters.GlobalMessages
        myBufferReady =  'Global\' & myBufferReady
        myDataReady   =  'Global\' & myDataReady
        myBufferName  =  'Global\' & myBufferName
    end 
    loop 1 times 
        myBufferReadyEvent =  sdkCreateEvent(0, false, false, myBufferReady)
        if myBufferReadyEvent = 0
            myProblem =  'CreateEvent ' & myBufferReady & ' failed'
            break 
        elsif sdkGetLastError() = sdk:ERROR_ALREADY_EXISTS
            myProblem =  'another'
            break 
        end   
        myDataReadyEvent =  sdkCreateEvent(0, false, false, myDataReady)
        if myDataReadyEvent = 0
            myProblem =  'CreateEvent ' & myDataReady & ' failed'
            break 
        elsif sdkGetLastError() = sdk:ERROR_ALREADY_EXISTS
            myProblem =  'another'
            break 
        end   
        mySharedFile =  sdkCreateFileMapping(-1, 0, sdk:PAGE_READWRITE, 0, 4*1024, myBufferName) 
        if mySharedFile = 0
            myProblem =  'CreateFileMapping ' & myBufferName & ' failed'
            break 
        elsif sdkGetLastError() = sdk:ERROR_ALREADY_EXISTS
            myProblem =  'another'
            break 
        end 
        myMappedBuffer =  sdkMapViewOfFile(mySharedFile, sdk:SECTION_MAP_READ, 0, 0, 0) 
        if myMappedBuffer = 0
            myProblem =  'MapViewOfFile failed'
            break 
        end 
        loop 
            sdkSetEvent(myBufferReadyEvent)
            myWaitResult =  sdkWaitForSingleObject(myDataReadyEvent, sdk:TIMEOUT_WIN_DEBUG)
            if sdkIsWindow(myParameters.MainWindowHandle) = false  
                break 
            end   
            case myWaitResult
            of sdk:WAIT_FAILED
                myProblem =  'WAIT_FAILED'
                break 
            of sdk:WAIT_OBJECT_0
                peek(myMappedBuffer, myMessageIn) 
                myMessageOut.PID         =  myMessageIn.PID
                myMessageOut.MessageType =  choose(myParameters.GlobalMessages=true, 'Global', 'Win32')
                sdkGetLocalTime(mySystemTime) 
                myMilliSeconds    =  (mySystemTime.wHour * 3600000) + (mySystemTime.wMinute * 60000) + (mySystemTime.wSecond * 1000) + mySystemTime.wMilliseconds
                myTime            =  (myMilliSeconds / 10) + 1
                myMessageOut.Time =  format(myTime, @t04) & '.' & format(myMilliSeconds % 1000, @n03) 
                myMessageOut.Text =  myMessageIn.Text
                myParameters.Pump.DataIn(myMessageOut) 
            of sdk:WAIT_ABANDONED
            of sdk:WAIT_TIMEOUT
            end   
        end 
    end ! 1 times     
    if myProblem
        case myProblem 
        of 'another'
            myProblem =  'Unable to capture ' & choose(myParameters.GlobalMessages=true, 'Global', '') & ' Win32 messages||DbgView (or a similar application) is running?||Or insufficent rights perhaps?'
        else 
            if sdkGetLastError() 
                myProblem =  myProblem & ' [' & sdkGetLastError() & ' ]'
            end   
        end   
        message(myProblem, 'myODSMonitor', ICON:Hand)  
    end 
    if myBufferReadyEvent
        sdkCloseHandle(myBufferReadyEvent) 
    end 
    if myDataReadyEvent
        sdkCloseHandle(myDataReadyEvent) 
    end 
    if mySharedFile
        sdkCloseHandle(mySharedFile) 
    end 
    if myParameters.CloseEvent
        post(myParameters.CloseEvent, 0, myParameters.MainThread)
    end   


!-----------------------------------
sdkODSMessagePump.Init          PROCEDURE()
!-----------------------------------

    CODE

    RETURN

!-----------------------------------
sdkODSMessagePump.Kill          PROCEDURE()
!-----------------------------------

    CODE

    RETURN




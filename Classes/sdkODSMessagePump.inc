include('cwsynchc.inc'),once

                                MAP     
                                    MODULE('psapi')
sdkGetModuleFileNameExA                 procedure(long hProcess,long hModule,*cstring lpFilename,long nSize),long,pascal,raw,name('GetModuleFileNameExA')
                                    END 

                                    MODULE('win32') ! other api calls used by myODSMonitor, all available in clarion's win32.lib (c10 anyway)
sdkCloseHandle                          procedure(long),pascal,name('CloseHandle')
sdkCreateEvent                          procedure(long lpEventAttributes, long bManualReset, long bInitialState, *cstring lpName),long,pascal,raw,name('CreateEventA')
sdkCreateFileMapping                    procedure(long hFile, long lpFileMappingAttributes, long flProtect, long dwMaximumSizeHigh, long dwMaximumSizeLow, *cstring lpName),long,pascal,raw,name('CreateFileMappingA')
sdkGetLastError                         procedure,long,pascal,name('GetLastError')
sdkGetLocalTime                         procedure(*sdk:SYSTEMTIME lpSystemTime),pascal,raw,name('GetLocalTime')
sdkIsWindow                             procedure(long hwnd),long,pascal,name('IsWindow')
sdkMapViewOfFile                        procedure(long hFileMappingObject, long dwDesiredAccess, long dwFileOffsetHigh, long dwFileOffsetLow, long dwNumberOfBytesToMap),long,pascal,name('MapViewOfFile')
sdkOpenEvent                            procedure(long dwDesiredAccess, long bInheritHandle, *cstring lpName),long,pascal,raw,name('OpenEventA')
sdkOpenFileMapping                      procedure(long dwDesiredAccess, long bInheritHandle, *cstring lpName),long,pascal,raw,name('OpenFileMappingA')
sdkOpenProcess                          procedure(long dwDesiredAccess, long bInheritHandle, long dwProcessId),long,pascal,name('OpenProcess')
sdkSetEvent                             procedure(long hEvent),long,pascal,proc,name('SetEvent')
sdkWaitForSingleObject                  procedure(long hHandle, long dwMilliseconds),long,pascal,name('WaitForSingleObject')
                                    END

                                END

sdk:SECTION_MAP_READ            equate(4)
sdk:FILE_MAP_READ               equate(sdk:SECTION_MAP_READ)
sdk:PAGE_READONLY               equate(2)
sdk:PAGE_READWRITE              equate(4)
sdk:TIMEOUT_WIN_DEBUG           equate(100) 
sdk:WAIT_FAILED                 equate(-1)
sdk:WAIT_OBJECT_0               equate(0)
sdk:WAIT_ABANDONED              equate(80h)
sdk:WAIT_TIMEOUT                equate(102h)
sdk:EVENT_ALL_ACCESS            equate(1F0003h)
sdk:SYNCHRONIZE                 equate(100000h)
sdk:PROCESS_VM_READ             equate(10h)
sdk:PROCESS_QUERY_INFORMATION   equate(400h)
sdk:PROCESS_ALL_ACCESS          equate(1F0FFFh)
sdk:ERROR_ALREADY_EXISTS        equate(183)

sdk:SYSTEMTIME                  group,type
wYear                               short
wMonth                              short
wDayOfWeek                          short
wDay                                short
wHour                               short
wMinute                             short
wSecond                             short
wMilliseconds                       short
                                end

sdkODSMessage                   GROUP,type 
Time                                string(12) 
PID                                 ulong 
Process                             string(100)  
Text                                string(50000) 
MessageType                         string(12)  
                                END 

sdkODSMessageQ                  queue(sdkODSMessage),type 
                                end 

sdkODSProcessQ                  queue,type 
pid                                 ulong 
name                                string(260) 
                                end  
                                
!--------------------------------------------------------------------------------
sdkODSMessagePump               CLASS,TYPE,MODULE('sdkODSMessagePump.CLW'),LINK('sdkODSMessagePump.CLW')   !,_ABCLinkMode_),DLL(_ABCDllMode_)
!
!Properties


!----------
ODSMessageQ                         &sdkODSMessageQ,private 
ODSProcessQ                         &sdkODSProcessQ,private 
csQ                                 &CriticalSection,private 

RegisteredThread                    long,private 
DataEvent                           long,private 
ProfileID                           STRING(9)
ShowAllMessages                     BYTE(0)

!Methods
!-------
Init                                PROCEDURE()
Kill                                PROCEDURE()

Construct                           procedure,private                    
Destruct                            procedure,private                    
DataIn                              procedure(*sdkODSMessage pMessage) 
DataOut                             procedure(*sdkODSMessageQ pMessageQ)
Register                            procedure(long pDataEvent)  
GetProcessName                      procedure(long pProcessID),string 
Monitor                             procedure(long pCloseEvent, long pGlobalMessages=false),long,proc 

                                END



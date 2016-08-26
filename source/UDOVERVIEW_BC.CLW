  MEMBER('UDOverView.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('UDOverView_BC0.CLW')
UDOverView_BC0:DctInit             PROCEDURE
UDOverView_BC0:DctKill             PROCEDURE
UDOverView_BC0:FilesInit           PROCEDURE
    END
  END

DctInit PROCEDURE
  CODE
  UDOverView_BC0:DctInit
  UDOverView_BC0:FilesInit


DctKill PROCEDURE
  CODE
  UDOverView_BC0:DctKill


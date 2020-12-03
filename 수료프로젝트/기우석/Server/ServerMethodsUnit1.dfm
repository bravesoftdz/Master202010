object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  Height = 829
  Width = 1119
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=dbmarek'
      'User_Name=marek'
      'Password=gixugo#!#59'
      'Server=db.dvr.raintin.co.kr'
      'CharacterSet=utf8'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 56
  end
  object qryAddCafe: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'insert into cafe (cafecode, cafename, phone, closed)'
      'values (:cafecode, :cafename, :phone, :closed);')
    Left = 64
    Top = 144
    ParamData = <
      item
        Name = 'CAFECODE'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CAFENAME'
        ParamType = ptInput
      end
      item
        Name = 'PHONE'
        ParamType = ptInput
      end
      item
        Name = 'CLOSED'
        ParamType = ptInput
      end>
  end
  object qryAddEmp: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'insert into staff (empcode, empdate, id, password, position, caf' +
        'ecode, nyear, nseq, sname, onwork)'
      
        'values (:empcode, :empdate, :id, :password, :position, :cafecode' +
        ', :nyear, :nseq, :sname, :onwork)')
    Left = 160
    Top = 144
    ParamData = <
      item
        Name = 'EMPCODE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMPDATE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PASSWORD'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'POSITION'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CAFECODE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NYEAR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NSEQ'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SNAME'
        ParamType = ptInput
      end
      item
        Name = 'ONWORK'
        ParamType = ptInput
      end>
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'D:\Dev\Delph\'#44060#51064' '#54532#47196#51229#53944'\Server\Win32\Debug\libmysql.dll'
    Left = 160
    Top = 56
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 272
    Top = 56
  end
  object qryCafeseq: TFDQuery
    Connection = FDConnection1
    Left = 64
    Top = 216
  end
  object qryEmpseq: TFDQuery
    Connection = FDConnection1
    Left = 160
    Top = 216
  end
  object qryGetCafelist: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '')
    Left = 272
    Top = 144
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qryCafe
    Left = 144
    Top = 360
  end
  object tbStaff: TFDTable
    IndexFieldNames = 'empcode'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'dbmarek.staff'
    TableName = 'dbmarek.staff'
    Left = 64
    Top = 448
    object tbStaffempcode: TWideStringField
      FieldName = 'empcode'
      Origin = 'empcode'
      Required = True
      Size = 7
    end
    object tbStaffempdate: TWideStringField
      FieldName = 'empdate'
      Origin = 'empdate'
      Required = True
      Size = 8
    end
    object tbStaffid: TWideStringField
      FieldName = 'id'
      Origin = 'id'
      Required = True
      Size = 10
    end
    object tbStaffpassword: TWideStringField
      FieldName = 'password'
      Origin = '`password`'
      Required = True
      Size = 200
    end
    object tbStaffposition: TWideStringField
      DisplayWidth = 1
      FieldName = 'position'
      Origin = 'position'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tbStaffcafecode: TWideStringField
      FieldName = 'cafecode'
      Origin = 'cafecode'
      Required = True
      FixedChar = True
      Size = 2
    end
    object tbStaffnyear: TIntegerField
      FieldName = 'nyear'
      Origin = 'nyear'
      Required = True
    end
    object tbStaffnseq: TIntegerField
      FieldName = 'nseq'
      Origin = 'nseq'
      Required = True
    end
    object tbStaffsname: TWideStringField
      FieldName = 'sname'
      Origin = 'sname'
      Required = True
    end
    object tbStaffonwork: TWideStringField
      FieldName = 'onwork'
      Origin = 'onwork'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tbStaffposition_name: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'position_name'
      Calculated = True
    end
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = tbStaff
    Left = 144
    Top = 448
  end
  object qryCafe: TFDQuery
    OnCalcFields = qryCafeCalcFields
    Connection = FDConnection1
    SQL.Strings = (
      
        'select A.cafecode, A.cafename, A.phone, ifnull(B.position, '#39#39') a' +
        's pposition, B.sname, A.closed from cafe as A'#10
      'left join staff as B'
      #10'on B.cafecode = A.cafecode and B.position = '#39'1'#39
      'order by A.cafecode;')
    Left = 64
    Top = 360
    object qryCafecafecode: TWideStringField
      FieldName = 'cafecode'
      Origin = 'cafecode'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryCafecafename: TWideStringField
      FieldName = 'cafename'
      Origin = 'cafename'
      Required = True
      Size = 100
    end
    object qryCafephone: TWideStringField
      FieldName = 'phone'
      Origin = 'phone'
      Required = True
    end
    object qryCafepposition: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'pposition'
      Origin = 'pposition'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object qryCafesname: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'sname'
      Origin = 'sname'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCafeclosed: TWideStringField
      FieldName = 'closed'
      Origin = 'closed'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryCafeclosed_yn: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'closed_yn'
      Calculated = True
    end
  end
  object qryUpdatecafe: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'update cafe set cafename = :cafename, phone = :phone, closed = :' +
        'closed '
      'where cafecode = :cafecode')
    Left = 248
    Top = 360
    ParamData = <
      item
        Name = 'CAFENAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PHONE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CLOSED'
        ParamType = ptInput
      end
      item
        Name = 'CAFECODE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrySelectMenu: TFDQuery
    Connection = FDConnection1
    Left = 416
    Top = 384
  end
  object qryLogin: TFDQuery
    Connection = FDConnection1
    Left = 432
    Top = 24
  end
  object qryPosMenu: TFDQuery
    Connection = FDConnection1
    Left = 720
    Top = 40
  end
  object qryMenuPrice: TFDQuery
    Connection = FDConnection1
    Left = 800
    Top = 40
  end
  object qryGetMenulist: TFDQuery
    Connection = FDConnection1
    Left = 720
    Top = 208
  end
  object qrySalesReport: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sales_master'
      'where cafecode = :cafecode and sdate = :sdate')
    Left = 720
    Top = 128
    ParamData = <
      item
        Name = 'CAFECODE'
        DataType = ftString
        ParamType = ptInput
        Value = '01'
      end
      item
        Name = 'SDATE'
        DataType = ftString
        ParamType = ptInput
        Value = '20201126'
      end>
    object qrySalesReportcafecode: TWideStringField
      FieldName = 'cafecode'
      Origin = 'cafecode'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object qrySalesReportslipno: TWideStringField
      FieldName = 'slipno'
      Origin = 'slipno'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 12
    end
    object qrySalesReportseq: TIntegerField
      FieldName = 'seq'
      Origin = 'seq'
      Required = True
    end
    object qrySalesReportsdate: TWideStringField
      FieldName = 'sdate'
      Origin = 'sdate'
      Required = True
      Size = 8
    end
    object qrySalesReportstime: TWideStringField
      FieldName = 'stime'
      Origin = 'stime'
      Required = True
      Size = 6
    end
    object qrySalesReportposno: TWideStringField
      FieldName = 'posno'
      Origin = 'posno'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qrySalesReportsaleprice: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'saleprice'
      Origin = 'saleprice'
    end
    object qrySalesReportvat: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'vat'
      Origin = 'vat'
    end
    object qrySalesReportsales: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'sales'
      Origin = 'sales'
    end
  end
  object dspSalesReport: TDataSetProvider
    DataSet = qrySalesReport
    Left = 800
    Top = 128
  end
  object qrySaveSales: TFDQuery
    Connection = FDConnection1
    Left = 720
    Top = 288
  end
  object qryCommon: TFDQuery
    Connection = FDConnection1
    Left = 520
    Top = 240
  end
  object qrySaveSales_detail: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'insert into sales_detail (cafecode, slipno, seq, menucode, unitp' +
        'rice, count, menutotal)'
      
        'values (:cafecode, :slipno, :seq, :menucode, :unitprice, :count,' +
        ' :menutotal)')
    Left = 720
    Top = 352
    ParamData = <
      item
        Name = 'CAFECODE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SLIPNO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SEQ'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'MENUCODE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'UNITPRICE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COUNT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'MENUTOTAL'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end>
  end
  object dspSaveSales_detail: TDataSetProvider
    DataSet = qrySaveSales_detail
    Left = 824
    Top = 352
  end
  object qryUpdateStaff: TFDQuery
    Connection = FDConnection1
    Left = 256
    Top = 448
  end
  object qrySalesList: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select sum(saleprice), sdate from sales_master '
      #10'where sdate >= :sdate '
      #10'group by sdate')
    Left = 344
    Top = 600
    ParamData = <
      item
        Name = 'SDATE'
        DataType = ftWideString
        ParamType = ptInput
        Value = '20201126'
      end>
  end
  object dspSalesList: TDataSetProvider
    DataSet = qrySalesList
    Left = 432
    Top = 600
  end
  object dspSalesTotal: TDataSetProvider
    DataSet = qrySalesTotal
    Left = 208
    Top = 560
  end
  object qryStaffPositionList: TFDQuery
    Connection = FDConnection1
    Left = 80
    Top = 696
  end
  object qrySalesTotal: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select sdate, sum(saleprice) salesum from sales_master'
      'where sdate >= :sdatefrom and sdate <= :sdateto'
      'group by sdate')
    Left = 88
    Top = 560
    ParamData = <
      item
        Name = 'SDATEFROM'
        DataType = ftWideString
        ParamType = ptInput
        Value = '20201123'
      end
      item
        Name = 'SDATETO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '20201201'
      end>
    object qrySalesTotalsdate: TWideStringField
      FieldName = 'sdate'
      Origin = 'sdate'
      Required = True
      Size = 8
    end
    object qrySalesTotalsalesum: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'salesum'
      Origin = 'salesum'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qrySalesTotalByCafe: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select sdate, sum(saleprice) salesum from sales_master'
      
        'where sdate >= :sdatefrom and sdate <= :sdateto and cafecode = :' +
        'cafecode'
      'group by sdate')
    Left = 88
    Top = 616
    ParamData = <
      item
        Name = 'SDATEFROM'
        DataType = ftWideString
        ParamType = ptInput
        Value = '20201123'
      end
      item
        Name = 'SDATETO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '20201201'
      end
      item
        Name = 'CAFECODE'
        DataType = ftWideString
        ParamType = ptInput
        Value = '01'
      end>
    object qrySalesTotalByCafesdate: TWideStringField
      FieldName = 'sdate'
      Origin = 'sdate'
      Required = True
      Size = 8
    end
    object qrySalesTotalByCafesalesum: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'salesum'
      Origin = 'salesum'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dspSalesTotalByCafe: TDataSetProvider
    DataSet = qrySalesTotalByCafe
    Left = 208
    Top = 624
  end
  object qryMobile: TFDQuery
    IndexFieldNames = 'salesum'
    Connection = FDConnection1
    Left = 880
    Top = 512
    object qryMobilesalesum: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'salesum'
      Origin = 'salesum'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end

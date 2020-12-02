object MobileDM: TMobileDM
  OldCreateOrder = False
  Height = 438
  Width = 568
  object SQLConnection1: TSQLConnection
    ConnectionName = 'DataSnapCONNECTION'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DataSnap'
      'HostName=localhost'
      'port=211')
    Connected = True
    Left = 72
    Top = 72
    UniqueId = '{2A03B275-86ED-4DCD-9CCF-4B4AD12AD2EE}'
  end
  object SqlServerMethod1: TSqlServerMethod
    Params = <>
    SQLConnection = SQLConnection1
    Left = 400
    Top = 72
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethod1'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 192
    Top = 72
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMobile'
    RemoteServer = DSProviderConnection1
    Left = 296
    Top = 72
  end
end

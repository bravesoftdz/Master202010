//
// Created by the DataSnap proxy generator.
// 2020-12-03 ¿ÀÈÄ 12:09:00
//

unit uDatasnap_Client;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    FqryCafeCalcFieldsCommand: TDBXCommand;
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FAddCafeCommand: TDBXCommand;
    FAddStaffCommand: TDBXCommand;
    FUpdateCafeCommand: TDBXCommand;
    FUpdateStaffCommand: TDBXCommand;
    FGetSelectedMenuCommand: TDBXCommand;
    FLoginidpwCommand: TDBXCommand;
    FGetMenulistCommand: TDBXCommand;
    FGetMenuPriceCommand: TDBXCommand;
    FGetCafeMenulistCommand: TDBXCommand;
    FSaveSalesCommand: TDBXCommand;
    FSaveSalesDetailCommand: TDBXCommand;
    FGetCafeListCommand: TDBXCommand;
    FGetStaffPositionListCommand: TDBXCommand;
    FMobileCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure qryCafeCalcFields(DataSet: TDataSet);
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    procedure AddCafe(pcafename: string; pphone: string; pCafemenu: string);
    procedure AddStaff(pcafecode: string; psname: string; pId: string; ppassword: string; pempdate: string; pposition: string; pempyear: Integer);
    procedure UpdateCafe(pCafecode: string; pCafename: string; pPhone: string; pClosed: string);
    procedure UpdateStaff(pname: string; pcafecode: string; pposition: string; ponwork: string; pempcode: string);
    function GetSelectedMenu(pcafecode: string; pcafemenu: string): string;
    function Loginidpw(pid: string; ppassword: string): string;
    function GetMenulist: string;
    function GetMenuPrice(pmenuname: string): Integer;
    function GetCafeMenulist(pcafecode: string): TDataSet;
    function SaveSales(pdate: string; ptime: string; pcafecode: string; pposno: string; psaleprice: Double): string;
    procedure SaveSalesDetail(pcafecode: string; slipno: string; pmenucode: string; punitprice: Integer; pcount: Integer; pmenutotal: Double);
    function GetCafeList: string;
    function GetStaffPositionList(pcafecode: string; pposition: string): Integer;
    function Mobile(pdate: string; pcafecode: string): string;
  end;

implementation

procedure TServerMethods1Client.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TServerMethods1.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.qryCafeCalcFields(DataSet: TDataSet);
begin
  if FqryCafeCalcFieldsCommand = nil then
  begin
    FqryCafeCalcFieldsCommand := FDBXConnection.CreateCommand;
    FqryCafeCalcFieldsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FqryCafeCalcFieldsCommand.Text := 'TServerMethods1.qryCafeCalcFields';
    FqryCafeCalcFieldsCommand.Prepare;
  end;
  FqryCafeCalcFieldsCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FqryCafeCalcFieldsCommand.ExecuteUpdate;
end;

function TServerMethods1Client.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

procedure TServerMethods1Client.AddCafe(pcafename: string; pphone: string; pCafemenu: string);
begin
  if FAddCafeCommand = nil then
  begin
    FAddCafeCommand := FDBXConnection.CreateCommand;
    FAddCafeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAddCafeCommand.Text := 'TServerMethods1.AddCafe';
    FAddCafeCommand.Prepare;
  end;
  FAddCafeCommand.Parameters[0].Value.SetWideString(pcafename);
  FAddCafeCommand.Parameters[1].Value.SetWideString(pphone);
  FAddCafeCommand.Parameters[2].Value.SetWideString(pCafemenu);
  FAddCafeCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.AddStaff(pcafecode: string; psname: string; pId: string; ppassword: string; pempdate: string; pposition: string; pempyear: Integer);
begin
  if FAddStaffCommand = nil then
  begin
    FAddStaffCommand := FDBXConnection.CreateCommand;
    FAddStaffCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAddStaffCommand.Text := 'TServerMethods1.AddStaff';
    FAddStaffCommand.Prepare;
  end;
  FAddStaffCommand.Parameters[0].Value.SetWideString(pcafecode);
  FAddStaffCommand.Parameters[1].Value.SetWideString(psname);
  FAddStaffCommand.Parameters[2].Value.SetWideString(pId);
  FAddStaffCommand.Parameters[3].Value.SetWideString(ppassword);
  FAddStaffCommand.Parameters[4].Value.SetWideString(pempdate);
  FAddStaffCommand.Parameters[5].Value.SetWideString(pposition);
  FAddStaffCommand.Parameters[6].Value.SetInt32(pempyear);
  FAddStaffCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.UpdateCafe(pCafecode: string; pCafename: string; pPhone: string; pClosed: string);
begin
  if FUpdateCafeCommand = nil then
  begin
    FUpdateCafeCommand := FDBXConnection.CreateCommand;
    FUpdateCafeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUpdateCafeCommand.Text := 'TServerMethods1.UpdateCafe';
    FUpdateCafeCommand.Prepare;
  end;
  FUpdateCafeCommand.Parameters[0].Value.SetWideString(pCafecode);
  FUpdateCafeCommand.Parameters[1].Value.SetWideString(pCafename);
  FUpdateCafeCommand.Parameters[2].Value.SetWideString(pPhone);
  FUpdateCafeCommand.Parameters[3].Value.SetWideString(pClosed);
  FUpdateCafeCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.UpdateStaff(pname: string; pcafecode: string; pposition: string; ponwork: string; pempcode: string);
begin
  if FUpdateStaffCommand = nil then
  begin
    FUpdateStaffCommand := FDBXConnection.CreateCommand;
    FUpdateStaffCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUpdateStaffCommand.Text := 'TServerMethods1.UpdateStaff';
    FUpdateStaffCommand.Prepare;
  end;
  FUpdateStaffCommand.Parameters[0].Value.SetWideString(pname);
  FUpdateStaffCommand.Parameters[1].Value.SetWideString(pcafecode);
  FUpdateStaffCommand.Parameters[2].Value.SetWideString(pposition);
  FUpdateStaffCommand.Parameters[3].Value.SetWideString(ponwork);
  FUpdateStaffCommand.Parameters[4].Value.SetWideString(pempcode);
  FUpdateStaffCommand.ExecuteUpdate;
end;

function TServerMethods1Client.GetSelectedMenu(pcafecode: string; pcafemenu: string): string;
begin
  if FGetSelectedMenuCommand = nil then
  begin
    FGetSelectedMenuCommand := FDBXConnection.CreateCommand;
    FGetSelectedMenuCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetSelectedMenuCommand.Text := 'TServerMethods1.GetSelectedMenu';
    FGetSelectedMenuCommand.Prepare;
  end;
  FGetSelectedMenuCommand.Parameters[0].Value.SetWideString(pcafecode);
  FGetSelectedMenuCommand.Parameters[1].Value.SetWideString(pcafemenu);
  FGetSelectedMenuCommand.ExecuteUpdate;
  Result := FGetSelectedMenuCommand.Parameters[2].Value.GetWideString;
end;

function TServerMethods1Client.Loginidpw(pid: string; ppassword: string): string;
begin
  if FLoginidpwCommand = nil then
  begin
    FLoginidpwCommand := FDBXConnection.CreateCommand;
    FLoginidpwCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLoginidpwCommand.Text := 'TServerMethods1.Loginidpw';
    FLoginidpwCommand.Prepare;
  end;
  FLoginidpwCommand.Parameters[0].Value.SetWideString(pid);
  FLoginidpwCommand.Parameters[1].Value.SetWideString(ppassword);
  FLoginidpwCommand.ExecuteUpdate;
  Result := FLoginidpwCommand.Parameters[2].Value.GetWideString;
end;

function TServerMethods1Client.GetMenulist: string;
begin
  if FGetMenulistCommand = nil then
  begin
    FGetMenulistCommand := FDBXConnection.CreateCommand;
    FGetMenulistCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetMenulistCommand.Text := 'TServerMethods1.GetMenulist';
    FGetMenulistCommand.Prepare;
  end;
  FGetMenulistCommand.ExecuteUpdate;
  Result := FGetMenulistCommand.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.GetMenuPrice(pmenuname: string): Integer;
begin
  if FGetMenuPriceCommand = nil then
  begin
    FGetMenuPriceCommand := FDBXConnection.CreateCommand;
    FGetMenuPriceCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetMenuPriceCommand.Text := 'TServerMethods1.GetMenuPrice';
    FGetMenuPriceCommand.Prepare;
  end;
  FGetMenuPriceCommand.Parameters[0].Value.SetWideString(pmenuname);
  FGetMenuPriceCommand.ExecuteUpdate;
  Result := FGetMenuPriceCommand.Parameters[1].Value.GetInt32;
end;

function TServerMethods1Client.GetCafeMenulist(pcafecode: string): TDataSet;
begin
  if FGetCafeMenulistCommand = nil then
  begin
    FGetCafeMenulistCommand := FDBXConnection.CreateCommand;
    FGetCafeMenulistCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetCafeMenulistCommand.Text := 'TServerMethods1.GetCafeMenulist';
    FGetCafeMenulistCommand.Prepare;
  end;
  FGetCafeMenulistCommand.Parameters[0].Value.SetWideString(pcafecode);
  FGetCafeMenulistCommand.ExecuteUpdate;
  Result := TCustomSQLDataSet.Create(nil, FGetCafeMenulistCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FGetCafeMenulistCommand.FreeOnExecute(Result);
end;

function TServerMethods1Client.SaveSales(pdate: string; ptime: string; pcafecode: string; pposno: string; psaleprice: Double): string;
begin
  if FSaveSalesCommand = nil then
  begin
    FSaveSalesCommand := FDBXConnection.CreateCommand;
    FSaveSalesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSaveSalesCommand.Text := 'TServerMethods1.SaveSales';
    FSaveSalesCommand.Prepare;
  end;
  FSaveSalesCommand.Parameters[0].Value.SetWideString(pdate);
  FSaveSalesCommand.Parameters[1].Value.SetWideString(ptime);
  FSaveSalesCommand.Parameters[2].Value.SetWideString(pcafecode);
  FSaveSalesCommand.Parameters[3].Value.SetWideString(pposno);
  FSaveSalesCommand.Parameters[4].Value.SetDouble(psaleprice);
  FSaveSalesCommand.ExecuteUpdate;
  Result := FSaveSalesCommand.Parameters[5].Value.GetWideString;
end;

procedure TServerMethods1Client.SaveSalesDetail(pcafecode: string; slipno: string; pmenucode: string; punitprice: Integer; pcount: Integer; pmenutotal: Double);
begin
  if FSaveSalesDetailCommand = nil then
  begin
    FSaveSalesDetailCommand := FDBXConnection.CreateCommand;
    FSaveSalesDetailCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSaveSalesDetailCommand.Text := 'TServerMethods1.SaveSalesDetail';
    FSaveSalesDetailCommand.Prepare;
  end;
  FSaveSalesDetailCommand.Parameters[0].Value.SetWideString(pcafecode);
  FSaveSalesDetailCommand.Parameters[1].Value.SetWideString(slipno);
  FSaveSalesDetailCommand.Parameters[2].Value.SetWideString(pmenucode);
  FSaveSalesDetailCommand.Parameters[3].Value.SetInt32(punitprice);
  FSaveSalesDetailCommand.Parameters[4].Value.SetInt32(pcount);
  FSaveSalesDetailCommand.Parameters[5].Value.SetDouble(pmenutotal);
  FSaveSalesDetailCommand.ExecuteUpdate;
end;

function TServerMethods1Client.GetCafeList: string;
begin
  if FGetCafeListCommand = nil then
  begin
    FGetCafeListCommand := FDBXConnection.CreateCommand;
    FGetCafeListCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetCafeListCommand.Text := 'TServerMethods1.GetCafeList';
    FGetCafeListCommand.Prepare;
  end;
  FGetCafeListCommand.ExecuteUpdate;
  Result := FGetCafeListCommand.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.GetStaffPositionList(pcafecode: string; pposition: string): Integer;
begin
  if FGetStaffPositionListCommand = nil then
  begin
    FGetStaffPositionListCommand := FDBXConnection.CreateCommand;
    FGetStaffPositionListCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetStaffPositionListCommand.Text := 'TServerMethods1.GetStaffPositionList';
    FGetStaffPositionListCommand.Prepare;
  end;
  FGetStaffPositionListCommand.Parameters[0].Value.SetWideString(pcafecode);
  FGetStaffPositionListCommand.Parameters[1].Value.SetWideString(pposition);
  FGetStaffPositionListCommand.ExecuteUpdate;
  Result := FGetStaffPositionListCommand.Parameters[2].Value.GetInt32;
end;

function TServerMethods1Client.Mobile(pdate: string; pcafecode: string): string;
begin
  if FMobileCommand = nil then
  begin
    FMobileCommand := FDBXConnection.CreateCommand;
    FMobileCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FMobileCommand.Text := 'TServerMethods1.Mobile';
    FMobileCommand.Prepare;
  end;
  FMobileCommand.Parameters[0].Value.SetWideString(pdate);
  FMobileCommand.Parameters[1].Value.SetWideString(pcafecode);
  FMobileCommand.ExecuteUpdate;
  Result := FMobileCommand.Parameters[2].Value.GetWideString;
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethods1Client.Destroy;
begin
  FDSServerModuleCreateCommand.DisposeOf;
  FqryCafeCalcFieldsCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FAddCafeCommand.DisposeOf;
  FAddStaffCommand.DisposeOf;
  FUpdateCafeCommand.DisposeOf;
  FUpdateStaffCommand.DisposeOf;
  FGetSelectedMenuCommand.DisposeOf;
  FLoginidpwCommand.DisposeOf;
  FGetMenulistCommand.DisposeOf;
  FGetMenuPriceCommand.DisposeOf;
  FGetCafeMenulistCommand.DisposeOf;
  FSaveSalesCommand.DisposeOf;
  FSaveSalesDetailCommand.DisposeOf;
  FGetCafeListCommand.DisposeOf;
  FGetStaffPositionListCommand.DisposeOf;
  FMobileCommand.DisposeOf;
  inherited;
end;

end.


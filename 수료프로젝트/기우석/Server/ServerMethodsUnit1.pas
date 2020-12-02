unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider;

type
  TServerMethods1 = class(TDSServerModule)
    FDConnection1: TFDConnection;
    qryAddCafe: TFDQuery;
    qryAddEmp: TFDQuery;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryCafeseq: TFDQuery;
    qryEmpseq: TFDQuery;
    qryGetCafelist: TFDQuery;
    DataSetProvider1: TDataSetProvider;
    tbStaff: TFDTable;
    DataSetProvider2: TDataSetProvider;
    tbStaffempcode: TWideStringField;
    tbStaffempdate: TWideStringField;
    tbStaffid: TWideStringField;
    tbStaffpassword: TWideStringField;
    tbStaffposition: TWideStringField;
    tbStaffcafecode: TWideStringField;
    tbStaffnyear: TIntegerField;
    tbStaffnseq: TIntegerField;
    tbStaffsname: TWideStringField;
    qryCafe: TFDQuery;
    qryCafecafecode: TWideStringField;
    qryCafecafename: TWideStringField;
    qryCafephone: TWideStringField;
    qryCafepposition: TWideStringField;
    qryCafesname: TWideStringField;
    qryUpdatecafe: TFDQuery;
    qrySelectMenu: TFDQuery;
    qryLogin: TFDQuery;
    qryPosMenu: TFDQuery;
    qryMenuPrice: TFDQuery;
    qryGetMenulist: TFDQuery;
    qrySalesReport: TFDQuery;
    dspSalesReport: TDataSetProvider;
    qrySaveSales: TFDQuery;
    qryCommon: TFDQuery;
    qrySaveSales_detail: TFDQuery;
    dspSaveSales_detail: TDataSetProvider;
    tbStaffonwork: TWideStringField;
    qryUpdateStaff: TFDQuery;
    qrySalesList: TFDQuery;
    dspSalesList: TDataSetProvider;
    qryCafeclosed: TWideStringField;
    tbStaffposition_name: TWideStringField;
    qryCafeclosed_yn: TWideStringField;
    dspSalesTotal: TDataSetProvider;
    qryStaffPositionList: TFDQuery;
    qrySalesTotal: TFDQuery;
    qrySalesTotalByCafe: TFDQuery;
    dspSalesTotalByCafe: TDataSetProvider;
    qrySalesTotalByCafesdate: TWideStringField;
    qrySalesTotalByCafesalesum: TFloatField;
    qrySalesTotalsdate: TWideStringField;
    qrySalesTotalsalesum: TFloatField;
    qrySalesReportcafecode: TWideStringField;
    qrySalesReportslipno: TWideStringField;
    qrySalesReportseq: TIntegerField;
    qrySalesReportsdate: TWideStringField;
    qrySalesReportstime: TWideStringField;
    qrySalesReportposno: TWideStringField;
    qrySalesReportsaleprice: TFloatField;
    qrySalesReportvat: TFloatField;
    qrySalesReportsales: TFloatField;
    qryMobile: TFDQuery;
    qryMobilesalesum: TFloatField;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure qryCafeCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    procedure AddCafe(pcafename, pphone, pCafemenu: string);
    procedure AddStaff(pcafecode, psname, pId, ppassword, pempdate, pposition: string; pempyear: integer);
    procedure UpdateCafe(pCafecode, pCafename, pPhone, pClosed: string);
    procedure UpdateStaff(pname, pcafecode, pposition, ponwork, pempcode: string);
    function GetSelectedMenu(pcafecode, pcafemenu: string): string;
    function Loginidpw(pid, ppassword: string): string;
    function GetMenulist: string;
    function GetMenuPrice(pmenuname: string): Integer;
    function GetCafeMenulist(pcafecode: string): TDataSet;
    function SaveSales(pdate, ptime, pcafecode, pposno: string; psaleprice: Double): string;
    procedure SaveSalesDetail(pcafecode, slipno, pmenucode: string; punitprice, pcount: Integer; pmenutotal: Double);
    function GetCafeList: string;
    function GetStaffPositionList(pcafecode, pposition: string): Integer;
    function Mobile(pdate, pcafecode: string): string;

  end;

implementation


{$R *.dfm}


uses System.StrUtils, MainUnit;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.SaveSales(pdate, ptime, pcafecode, pposno: string;
  psaleprice: Double): string;
var
  iseq: Integer;
  sSlipno: String;
  dVat, dSales : Double;
begin
  qryCommon.Close;
  qryCommon.SQL.Clear;
  qryCommon.SQL.Add('select ifnull(max(seq), 0) nseq from sales_master');
  qryCommon.SQL.Add('where cafecode = :cafecode and sdate = :sdate');
  qryCommon.ParamByName('cafecode').AsString := pcafecode;
  qryCommon.ParamByName('sdate').AsString := pdate;
  qryCommon.Open;

  iseq := qryCommon.FieldByName('nseq').AsInteger + 1;
  sSlipno := pdate + Format('%.4d', [iseq]);

  dSales := Round(psaleprice / 1.1);
  dVat := psaleprice - dsales;

  qrySaveSales.Close;
  qrySaveSales.SQL.Clear;
  qrySaveSales.SQL.Add('insert into sales_master (cafecode, slipno, seq, sdate, stime, posno, saleprice, vat, sales)');
  qrySaveSales.SQL.Add('values (:cafecode, :slipno, :seq, :sdate, :stime, :posno, :saleprice, :vat, :sales)');
  qrySaveSales.ParamByName('cafecode').AsString := pcafecode;
  qrySaveSales.ParamByName('slipno').AsString := sSlipno;
  qrySaveSales.ParamByName('seq').AsInteger := iseq;
  qrySaveSales.ParamByName('sdate').AsString := pdate;
  qrySaveSales.ParamByName('stime').AsString := ptime;
  qrySaveSales.ParamByName('posno').AsString := pposno;
  qrySaveSales.ParamByName('saleprice').AsCurrency := psaleprice;
  qrySaveSales.ParamByName('vat').AsCurrency := dVat;
  qrySaveSales.ParamByName('sales').AsCurrency := dSales;
  qrySaveSales.ExecSQL;

  Result := sSlipno;

end;

procedure TServerMethods1.SaveSalesDetail(pcafecode, slipno, pmenucode: string;
  punitprice, pcount: Integer; pmenutotal: Double);
begin
  //qrySaveSales_detail.Close;
  //qrySaveSales_detail.SQL.Clear;
//  qrySaveSales_detail.SQL.Add(')
end;

procedure TServerMethods1.UpdateCafe(pCafecode, pCafename, pPhone, pClosed: string);
begin
  qryUpdatecafe.Close;
  qryUpdatecafe.ParamByName('cafecode').AsString := pCafecode;
  qryUpdatecafe.ParamByName('cafename').AsString := pCafename;
  qryUpdatecafe.ParamByName('phone').AsString := pPhone;
  qryUpdatecafe.ParamByName('closed').AsString := pClosed;
  qryUpdatecafe.ExecSQL;
end;

procedure TServerMethods1.UpdateStaff(pname, pcafecode, pposition, ponwork, pempcode: string);
begin
  // update cafe set cafename = :cafename, phone = :phone
  // where cafecode = :cafecode

  //if True then


  qryUpdateStaff.Close;
  qryUpdateStaff.SQL.Clear;
  qryUpdateStaff.SQL.Add('update staff set sname = :sname, ');
  qryUpdateStaff.SQL.Add('cafecode = :cafecode, position = :position, onwork = :onwork ');
  qryUpdateStaff.SQL.Add('where empcode = :empcode');
  qryUpdateStaff.ParamByName('sname').AsString := pname;
  qryUpdateStaff.ParamByName('cafecode').AsString := pcafecode;
  qryUpdateStaff.ParamByName('position').AsString := pposition;
  qryUpdateStaff.ParamByName('onwork').AsString := ponwork;
  qryUpdateStaff.ParamByName('empcode').AsString := pempcode;
  qryUpdateStaff.ExecSQL;
end;

procedure TServerMethods1.AddCafe(pcafename, pphone, pCafemenu: string);
var
  cafecode: string;
  sSEQ: string;
  stlList: TStringList;
  I: integer;
begin
  qryCafeseq.Close;
  qryCafeseq.SQL.Clear;
  qryCafeseq.SQL.Add('select ifnull(max(cafecode), ''0'') code from cafe');
  qryCafeseq.Open;
  sSEQ := qryCafeseq.FieldByName('code').AsString;
  cafecode := format('%.2d',[StrToInt(sSEQ) + 1]);


  qryAddCafe.Close;
  qryAddCafe.ParamByName('cafecode').AsString := cafecode;
  qryAddCafe.ParamByName('cafename').AsString := pcafename;
  qryAddCafe.ParamByName('phone').AsString := pphone;
  qryAddCafe.ParamByName('closed').AsString := '1';
  qryAddCafe.ExecSQL;

  stlList := TStringList.Create;
  ExtractStrings([','], [], PWideChar(pCafemenu), stlList);
  For I := 0 to stlList.Count - 1 do
  begin
    qryGetCafelist.Close;
    qryGetCafelist.SQL.Clear;
    qryGetCafelist.SQL.Add('insert into sellmenu (cafecode, menucode) ');
    qryGetCafelist.SQL.Add('values (:cafecode, :menucode)');
    qryGetCafelist.ParamByName('cafecode').AsString := cafecode;
    qryGetCafelist.ParamByName('menucode').AsString := stlList.Strings[I];
    qryGetCafelist.ExecSQL;
  end;
  stlList.Free;
end;

procedure TServerMethods1.AddStaff(pcafecode, psname, pId, ppassword, pempdate, pposition: string; pempyear: integer);
var
  empcode: string;
  seq: Integer;
begin
  qryEmpseq.Close;
  qryEmpseq.SQL.Clear;
  qryEmpseq.SQL.Add('select ifnull(max(nseq), 0) empcode from staff');
  qryEmpseq.SQL.Add('where nyear = :pyear');
  qryEmpseq.ParamByName('pyear').AsInteger := pempyear;
  qryEmpseq.Open;
  seq := qryEmpseq.FieldByName('empcode').AsInteger + 1;
  empcode := IntToStr(pempyear) + format('%.3d', [seq]);

  qryAddEmp.Close;
  qryAddEmp.ParamByName('id').AsString := pId;
  qryAddEmp.ParamByName('password').AsString := ppassword;
  qryAddEmp.ParamByName('sname').AsString := psname;
  qryAddEmp.ParamByName('empcode').AsString := empcode;
  qryAddEmp.ParamByName('empdate').AsString := pempdate;
  qryAddEmp.ParamByName('position').AsString := pposition;
  qryAddEmp.ParamByName('cafecode').AsString := pcafecode;
  qryAddEmp.ParamByName('nyear').AsInteger := pempyear;
  qryAddEmp.ParamByName('nseq').AsInteger := seq;
  qryAddEmp.ParamByName('onwork').AsString := '1';
  qryAddEmp.ExecSQL;
end;



procedure TServerMethods1.DSServerModuleCreate(Sender: TObject);
begin
  if not FDConnection1.Connected then
    FDConnection1.Connected := True;
end;



function TServerMethods1.GetCafeList: string;
var
  sCafelist: String;
  sData : string;
begin
  qryGetCafelist.Close;
  qryGetCafelist.SQL.Clear;
  qryGetCafelist.SQL.Add('select cafecode, cafename from cafe');
  qryGetCafelist.Open;
  qryGetCafelist.First;

  // //'01 asa:02 ee:03 tgr'
  while not qryGetCafelist.Eof do
  begin
    sData := qryGetCafelist.FieldByName('cafecode').AsString + ' ' +
      qryGetCafelist.FieldByName('cafename').AsString;

    sCafelist := sCafelist + sData + ':';
    //frmMain.Memo1.Lines.Add(sCafelist);
    qryGetCafelist.Next;
  end;

  Result := copy(sCafelist, 1, Length(sCafelist) - 1);

end;

function TServerMethods1.GetCafeMenulist(pcafecode: string): TDataSet;
begin
  qryGetMenulist.Close;
  qryGetMenulist.SQL.Clear;
  qryGetMenulist.SQL.Add('select A.cafecode, A.menucode, B.menuname, B.unitprice');
  qryGetMenulist.SQL.Add('from sellmenu A');
  qryGetMenulist.SQL.Add('left join menu B');
  qryGetMenulist.SQL.Add('on A.menucode = B.menucode');
  qryGetMenulist.SQL.Add('where A.cafecode = :cafecode');
  qryGetMenulist.ParamByName('cafecode').AsString := pcafecode;
  qryGetMenulist.Open;

  Result := qryGetMenulist;
end;

function TServerMethods1.GetMenulist: string;
begin
  qryPosMenu.Close;
  qryPosMenu.SQL.Clear;
  qryPosMenu.SQL.Add('select * from menu');
  qryPosMenu.SQL.Add('where menucode = :menucode');
  qryPosMenu.Open;
end;

function TServerMethods1.GetMenuPrice(pmenuname: string): Integer;
var
  menuprice: Integer;
begin
  qryMenuPrice.Close;
  qryMenuPrice.SQL.Clear;
  qryMenuPrice.SQL.Add('select unitprice from menu');
  qryMenuPrice.SQL.Add('where menuname = :menuname');
  qryMenuPrice.ParamByName('menuname').AsString := pmenuname;
  qryMenuPrice.Open;
  menuprice := qryMenuPrice.FieldByName('unitprice').AsInteger;

  Result := menuprice;

end;

function TServerMethods1.Loginidpw(pid, ppassword: string): string;
var
  sEmpcode, sSname, sCafecode: string;
begin
  Result := '';
  qryLogin.Close;
  qryLogin.SQL.Clear;
  qryLogin.SQL.Add('select empcode, sname, cafecode from staff ');
  qryLogin.SQL.Add('where id = :id and password = :password and');
  qryLogin.SQL.Add('onwork = ''1'' and position in (''0'', ''1'')');
  qryLogin.ParamByName('id').AsString := pid;
  qryLogin.ParamByName('password').AsString := ppassword;
  qryLogin.Open;
  if qryLogin.RecordCount = 1 then
  begin
    sEmpcode := qryLogin.FieldByName('empcode').AsString;
    sSname := qryLogin.FieldByName('sname').AsString;
    sCafecode := qryLogin.FieldByName('cafecode').AsString;
    Result := sEmpcode + ':' + sSname + ':' + sCafecode;
  end;


end;


function TServerMethods1.Mobile(pdate, pcafecode: string): string;
begin
  qryMobile.Close;
  qryMobile.SQL.Clear;
  qryMobile.SQL.Add('select sum(saleprice) salesum from sales_master');
  qryMobile.SQL.Add('where sdate = :sdate and cafecode = :cafecode');
  qryMobile.ParamByName('sdate').AsString := pdate;
  qryMobile.ParamByName('cafecode').AsString := pcafecode;
  qryMobile.Open;

  Result := qryMobile.FieldByName('salesum').AsString;
end;

procedure TServerMethods1.qryCafeCalcFields(DataSet: TDataSet);
begin
  if qryCafe.FieldByName('closed').AsString = '0' then
    qryCafe.FieldByName('closed_yn').AsString := '영업 중지'
  else if qryCafe.FieldByName('closed').AsString = '1' then
    qryCafe.FieldByName('closed_yn').AsString := '영업 중';
end;




function TServerMethods1.GetSelectedMenu(pcafecode, pcafemenu: string): string;
var
  stlList: TStringList;
  I: integer;
begin
  {Result := '';
  qrySelectMenu.Close;
  qrySelectMenu.SQL.Clear;
  qrySelectMenu.SQL.Add('select cafename from cafe');
  qrySelectMenu.SQL.Add('where cafecode = :cafecode');
  qrySelectmenu.ParamByName('cafecode').AsString := pcafecode;
  qrySelectMenu.Open;
  if qrySelectMenu.RecordCount > 0 then
    Result := qrySelectMenu.FieldByName('cafename').AsString; }

  qrySelectMenu.Close; // 동일 지점코드로 시작하는 것은 지우기.
  qrySelectMenu.SQL.Clear;
  qrySelectMenu.SQL.Add('delete from sellmenu');
  qrySelectMenu.SQL.Add('where cafecode = :cafecode');
  qrySelectMenu.ParamByName('cafecode').AsString := pcafecode;
  qrySelectMenu.ExecSQL;

  stlList := TStringList.Create;
  ExtractStrings([','], [], PWideChar(pCafemenu), stlList);
  For I := 0 to stlList.Count - 1 do
  begin
    // 처음부터 지우고...? 여기서 DB에 같은 값이 있다면 놔두고 없는 값이라면 추가하고

    qryGetCafelist.Close;
    qryGetCafelist.SQL.Clear;
    qryGetCafelist.SQL.Add('insert into sellmenu (cafecode, menucode) ');
    qryGetCafelist.SQL.Add('values (:cafecode, :menucode)');
    qryGetCafelist.ParamByName('cafecode').AsString := pcafecode;
    qryGetCafelist.ParamByName('menucode').AsString := stlList.Strings[I];
    qryGetCafelist.ExecSQL;
  end;
  stlList.Free;
end;

function TServerMethods1.GetStaffPositionList(pcafecode, pposition: string): Integer;
begin
  qryStaffPositionList.Close;
  qryStaffPositionList.SQL.Clear;
  qryStaffPositionList.SQL.Add('select count(*) icount from staff');
  qryStaffPositionList.SQL.Add('where cafecode = :cafecode and position = :position');
  qryStaffPositionList.ParamByName('cafecode').AsString := pcafecode;
  qryStaffPositionList.ParamByName('position').AsString := pposition;
  qryStaffPositionList.Open;

  Result := qryStaffPositionList.FieldByName('icount').AsInteger;
end;

end.


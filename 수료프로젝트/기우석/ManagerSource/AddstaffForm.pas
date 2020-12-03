unit AddstaffForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  uDatasnap_Client, DateUtils;

type
  TfrmAddStaff = class(TForm)
    lblID: TLabel;
    lblPW: TLabel;
    lblPWC: TLabel;
    edtId: TEdit;
    edtPW: TEdit;
    edtPWC: TEdit;
    rdgPosition: TRadioGroup;
    btnRegister: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtName: TEdit;
    dtpEmpdate: TDateTimePicker;
    Label3: TLabel;
    cboCafename: TComboBox;
    procedure btnRegisterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cboCafenameChange(Sender: TObject);
  private
    { Private declarations }
    cafeClass : TServerMethods1Client;
  public
    { Public declarations }
  end;

var
  frmAddStaff: TfrmAddStaff;

implementation

{$R *.dfm}

uses uDm, UpdateStaffForm;

procedure TfrmAddStaff.btnRegisterClick(Sender: TObject);
var
  sCafecode: string;
  sEmpdate: string;
begin
  if edtPW.Text <> edtPWC.Text then
  begin
    ShowMessage('비밀번호가 다릅니다.');
    Exit;
  end;

  sCafecode := cboCafename.Items.Strings[cboCafename.ItemIndex];
  sCafecode := copy(sCafecode, 1, 2);  // 1번째부터 2개를 가져오겠다는 뜻, 맨 앞이 1이다.

  if (rdgPosition.ItemIndex = 1) and (cafeClass.GetStaffPositionList(sCafecode, IntToStr(rdgPosition.ItemIndex)) = 1) then
  begin
    ShowMessage('점주는 이미 등록되어 있습니다.');
    Exit;
  end;


  if Application.MessageBox('저장하시겠습니까?', '저장확인', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    sEmpdate := FormatDateTime('yyyymmdd', dtpEmpdate.DateTime);
    cafeClass.AddStaff(sCafecode, edtName.Text, edtID.Text, edtPW.Text,
      sEmpdate, IntToStr(rdgPosition.ItemIndex), Yearof(dtpEmpdate.DateTime));

    Close;
  end;
end;

procedure TfrmAddStaff.cboCafenameChange(Sender: TObject);      // 본사의 경우 rdg
begin
  if cboCafename.Items.Strings[cboCafename.ItemIndex] = '01 본사' then
  begin
    rdgPosition.ItemIndex := 0;
    rdgPosition.Enabled := False;
  end else
  begin
    rdgPosition.Enabled := True;
  end;
end;

procedure TfrmAddStaff.FormCreate(Sender: TObject);
begin
  rdgPosition.ItemIndex := 0;
  rdgPosition.Enabled := False;

  cafeClass := TServerMethods1Client.Create(DM.SQLConnection1.DBXConnection);
end;

procedure TfrmAddStaff.FormShow(Sender: TObject);
var
  sList : TStringList;
  str : string;
begin
  dtpEmpdate.Date := Date;

  sList := TStringList.Create;

  str := cafeClass.GetCafelist; //'01 asa:02 ee:03 tgr'

  ExtractStrings([':'], [], PChar(str), sList);   //
  cboCafename.Items := sList;
  if cboCafename.Items.Count > 0 then
    cboCafeName.ItemIndex := 0;
end;

end.



unit UpdatecafeForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.Mask, uDatasnap_Client;

type
  TfrmUpdatecafe = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    Label4: TLabel;
    edtSearchCafe: TEdit;
    DBGrid1: TDBGrid;
    btnSave: TButton;
    dsCafe: TDataSource;
    dbedtManager: TDBEdit;
    dbedtCafename: TDBEdit;
    dbedtPhone: TDBEdit;
    dbedtCafecode: TDBEdit;
    ckbClosed: TCheckBox;
    btnSearch: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtSearchCafeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtSearchCafeKeyPress(Sender: TObject; var Key: Char);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
    cafeClass : TServerMethods1Client;
  public
    { Public declarations }
  end;

var
  frmUpdatecafe: TfrmUpdatecafe;

implementation

{$R *.dfm}

uses uDm;


procedure TfrmUpdatecafe.btnSaveClick(Sender: TObject);
var
  ClosedCheck: String;
begin
  if dbedtCafename.Text = '' then
  begin
    ShowMessage('지점명을 입력하세요.');
    dbedtCafename.SetFocus;
    Exit;
  end;

  if dbedtPhone.Text = '' then
  begin
    ShowMessage('전화번호를 입력하세요.');
    dbedtPhone.SetFocus;
  end;

  if ckbClosed.Checked then
  begin
    ClosedCheck := '0';
  end else
  begin
    ClosedCheck := '1';
  end;


  DM.cdsUpdateCafe.Edit;
  cafeClass.UpdateCafe(dbedtCafecode.Text, dbedtCafename.Text, dbedtPhone.Text, ClosedCheck);

  DM.cdsUpdateCafe.Post;
  DM.cdsUpdateCafe.ApplyUpdates(-1);
  //DM.cdsUpdateCafe.Refresh;
  ShowMessage('저장하였습니다.');
 // DM.cdsUpdateCafe.EnableControls;
end;

procedure TfrmUpdatecafe.btnSearchClick(Sender: TObject);
begin
  dbedtManager.SetFocus;
end;

procedure TfrmUpdatecafe.edtSearchCafeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnSearchClick(Self);
  end;
end;

procedure TfrmUpdatecafe.edtSearchCafeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Filter: string;
begin
  Filter := '';

  if edtSearchCafe.Text <> '' then
  begin
    Filter := Format('cafename like ''%%%s%%''', [edtSearchCafe.Text]);
  end;

  DM.cdsUpdateCafe.Filter := Filter;
  DM.cdsUpdateCafe.Filtered := (Filter <> '');
end;


procedure TfrmUpdatecafe.btnCancelClick(Sender: TObject);
begin
  DM.cdsUpdateCafe.Cancel;
end;


procedure TfrmUpdatecafe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ModalResult := mrOk;
end;

procedure TfrmUpdatecafe.FormCreate(Sender: TObject);
begin
  cafeClass := TServerMethods1Client.Create(DM.SQLConnection1.DBXConnection);

  DM.cdsUpdateCafe.ApplyUpdates(-1);
  DM.cdsUpdateCafe.Refresh;
end;

procedure TfrmUpdatecafe.FormDestroy(Sender: TObject);
begin
  cafeClass.Free;
end;

procedure TfrmUpdatecafe.FormShow(Sender: TObject);
begin
  DM.cdsUpdateCafe.Refresh;
end;

end.

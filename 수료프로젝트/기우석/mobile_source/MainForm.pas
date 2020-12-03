unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.MultiView,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, Data.DB, FMX.Edit,
  FMX.TabControl, uMobile_Client, System.Rtti, FMX.Grid.Style, FMX.Grid,
  FMX.ScrollBox, FMX.ListBox, FMX.Layouts, FMX.DateTimeCtrls;

type
  TfrmMain = class(TForm)
    Rectangle1: TRectangle;
    btnMultiView: TSpeedButton;
    Panel1: TPanel;
    MultiView1: TMultiView;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle6: TRectangle;
    Image1: TImage;
    Image2: TImage;
    Image4: TImage;
    Label2: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    dsSalesReportManager: TDataSource;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    Label3: TLabel;
    Label5: TLabel;
    edtID: TEdit;
    edtPW: TEdit;
    Button1: TButton;
    Label6: TLabel;
    TabItem2: TTabItem;
    ListBox1: TListBox;
    ListBoxHeader1: TListBoxHeader;
    Label7: TLabel;
    edtDate: TDateEdit;
    Rectangle5: TRectangle;
    Label8: TLabel;
    Label9: TLabel;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    cafeClass: TServerMethods1Client;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  Check: string;

implementation

{$R *.fmx}

uses uMobileDM;



procedure TfrmMain.Button1Click(Sender: TObject);
var
  dd, code, Today, str: string;
begin
  Check := '';
  Check := cafeClass.Loginidpw(edtID.Text, edtPW.Text);   //Result := sEmpcode + ':' + sSname + ':' + sCafecode;

  //code := Copy(Check, length(Check) - 1, 2);

  if Check = '' then
  begin
    ShowMessage('아이디와 비밀번호가 틀립니다.');
  end else
  begin
    TabControl1.Tabs[1].Visible := True;
    TabControl1.ActiveTab := TabControl1.Tabs[1];
    TabControl1.Tabs[0].Visible := False;
  end;

end;

procedure TfrmMain.Button2Click(Sender: TObject);
var
  PickedDate, Today, code, str: string;
begin
  PickedDate := FormatDateTime('yyyymmdd', edtDate.Date);

  code := Copy(Check, length(Check) - 1, 2);

  str := cafeClass.Mobile(PickedDate, code);
  if str = '' then
  begin
    ShowMessage('해당일 매출이 없습니다.');
    label9.Text := '0원'
  end else
  begin
    label9.Text := str + '원';
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  cafeClass := TServerMethods1Client.Create(MobileDM.SQLConnection1.DBXConnection);
  TabControl1.ActiveTab := TabControl1.Tabs[0];
  TabControl1.Tabs[1].Visible := False;
  btnMultiView.Enabled := False;
end;




end.

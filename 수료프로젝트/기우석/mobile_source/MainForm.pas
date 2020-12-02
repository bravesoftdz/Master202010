unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.MultiView,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, Data.DB, FMX.Edit,
  FMX.TabControl, uMobile_Client, System.Rtti, FMX.Grid.Style, FMX.Grid,
  FMX.ScrollBox, FMX.ListBox, FMX.Layouts;

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
    TabItem3: TTabItem;
    ListBox2: TListBox;
    ListBoxHeader2: TListBoxHeader;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    cafeClass: TServerMethods1Client;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses Unit2, uMobileDM;



procedure TfrmMain.Button1Click(Sender: TObject);
var
  Check: string;
  code, Today, sDateTo, sDateFrom, sCafecode, str: string;
begin
  Check := '';
  //Check := cafeClass.Loginidpw(edtID.Text, edtPW.Text);
  Check := cafeClass.Loginidpw(edtID.Text, edtPW.Text);   //Result := sEmpcode + ':' + sSname + ':' + sCafecode;

  code := Copy(Check, length(Check) - 1, 2);

  if Check = '' then
  begin
    ShowMessage('아이디와 비밀번호가 틀립니다.');
  end else
  begin
    TabControl1.Tabs[1].Visible := True;
    TabControl1.Tabs[2].Visible := True;
    TabControl1.ActiveTab := TabControl1.Tabs[1];
    TabControl1.Tabs[0].Visible := False;
  end;



  Today := FormatDateTime('yyyy-mm-dd', Date);


  ListBox1.Items.Add(Today);
  str := cafeClass.Mobile('20201127', code);
  if str = '' then
  begin
    ShowMessage('오늘 매출이 없습니다.');
    ListBox2.Items.Add('0원');
  end else
  begin
    ListBox2.Items.Add(str + '원');
  end;




end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  cafeClass := TServerMethods1Client.Create(MobileDM.SQLConnection1.DBXConnection);
  TabControl1.ActiveTab := TabControl1.Tabs[0];
  //TabControl1.TabIndex := 0;
  TabControl1.Tabs[1].Visible := False;
  TabControl1.Tabs[2].Visible := False;
  btnMultiView.Enabled := False;



end;




end.

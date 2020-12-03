object frmAddStaff: TfrmAddStaff
  Left = 0
  Top = 0
  Caption = #51649#50896' '#46321#47197
  ClientHeight = 464
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblID: TLabel
    Left = 101
    Top = 130
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object lblPW: TLabel
    Left = 84
    Top = 162
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object lblPWC: TLabel
    Left = 71
    Top = 194
    Width = 78
    Height = 13
    Caption = 'Password Check'
  end
  object Label1: TLabel
    Left = 89
    Top = 39
    Width = 33
    Height = 13
    Caption = #51648#51216#47749
  end
  object Label2: TLabel
    Left = 89
    Top = 67
    Width = 33
    Height = 13
    Caption = #51649#50896#47749
  end
  object Label3: TLabel
    Left = 83
    Top = 99
    Width = 44
    Height = 13
    Caption = #51077#49324#51068#51088
  end
  object edtId: TEdit
    Left = 189
    Top = 127
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtPW: TEdit
    Left = 189
    Top = 159
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object edtPWC: TEdit
    Left = 189
    Top = 191
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object rdgPosition: TRadioGroup
    Left = 72
    Top = 245
    Width = 241
    Height = 49
    Caption = #51649#52293' '#44396#48516
    Columns = 3
    Items.Strings = (
      #48376#49324
      #51216#51452
      #51216#50896)
    TabOrder = 3
  end
  object btnRegister: TButton
    Left = 75
    Top = 333
    Width = 238
    Height = 41
    Caption = #46321#47197
    TabOrder = 4
    OnClick = btnRegisterClick
  end
  object edtName: TEdit
    Left = 189
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object dtpEmpdate: TDateTimePicker
    Left = 189
    Top = 95
    Width = 121
    Height = 21
    Date = 44158.523007002320000000
    Time = 44158.523007002320000000
    TabOrder = 6
  end
  object cboCafename: TComboBox
    Left = 189
    Top = 32
    Width = 121
    Height = 21
    Style = csDropDownList
    DropDownCount = 20
    TabOrder = 7
    OnChange = cboCafenameChange
  end
end

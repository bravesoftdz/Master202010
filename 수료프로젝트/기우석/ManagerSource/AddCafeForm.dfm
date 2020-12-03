object frmAddCafe: TfrmAddCafe
  Left = 0
  Top = 0
  Caption = #51648#51216' '#46321#47197
  ClientHeight = 411
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 96
    Top = 32
    Width = 33
    Height = 13
    Caption = #51648#51216#47749
  end
  object Label4: TLabel
    Left = 82
    Top = 85
    Width = 69
    Height = 13
    Caption = #51648#51216' '#51204#54868#48264#54840
  end
  object btnRegister: TButton
    Left = 82
    Top = 328
    Width = 201
    Height = 49
    Caption = #46321#47197
    TabOrder = 0
    OnClick = btnRegisterClick
  end
  object edtCafeName: TEdit
    Left = 176
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtPhone: TEdit
    Left = 176
    Top = 82
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object clbMenuList: TCheckListBox
    Left = 32
    Top = 146
    Width = 297
    Height = 143
    Columns = 2
    ItemHeight = 13
    Items.Strings = (
      '001 '#50500#47700#47532#52852#45432'(H)'
      '002 '#50500#47700#47532#52852#45432'(I)'
      '003 '#52852#54168#46972#46524'(H)'
      '004 '#52852#54168#46972#46524'(I)'
      '005 '#52852#54392#52824#45432'(H)'
      '006 '#52852#54392#52824#45432'(I)'
      '007 '#53084#46300#48652#47336'(H)'
      '008 '#53084#46300#48652#47336'(I)'
      '009 '#53084#46300#48652#47336' '#46972#46524'(H)'
      '010 '#53084#46300#48652#47336' '#46972#46524'(I)'
      '011 '#50640#49828#54532#47112#49548
      '101 '#52824#51592#52992#51084
      '102 '#44256#44396#47560#52992#51084
      '103 '#49373#53356#47548#52992#51084
      '104 '#52488#53076#52992#51084
      '105 '#50500#51060#49828#53356#47548' '#52992#51084
      '106 '#51064#51208#48120#52992#51084)
    TabOrder = 3
  end
end

object frmUpdateStaff: TfrmUpdateStaff
  Left = 0
  Top = 0
  Caption = #51649#50896#51221#48372' '#49688#51221
  ClientHeight = 546
  ClientWidth = 1005
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
  DesignSize = (
    1005
    546)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 546
    Align = alClient
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 770
      Height = 64
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 80
        Top = 25
        Width = 58
        Height = 13
        Caption = #51649#50896#47749' '#44160#49353
      end
      object edtSearchStaff: TEdit
        Left = 146
        Top = 22
        Width = 221
        Height = 21
        TabOrder = 0
        OnKeyPress = edtSearchStaffKeyPress
        OnKeyUp = edtSearchStaffKeyUp
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 65
      Width = 770
      Height = 480
      Align = alClient
      DataSource = dsStaff
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'empcode'
          Title.Caption = #49324#50896#53076#46300
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'empdate'
          Title.Caption = #51077#49324#45216#51676
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'id'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'password'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'position'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'cafecode'
          Title.Caption = #45812#45817#51648#51216
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nyear'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'nseq'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'sname'
          Title.Caption = #51649#50896#51060#47492
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'position_name'
          Title.Caption = #51649#52293
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'onwork'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'onwork_yn'
          Title.Caption = #51116#51649#50668#48512
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 772
    Top = 0
    Width = 233
    Height = 546
    Align = alRight
    TabOrder = 1
    object Label2: TLabel
      Left = 33
      Top = 87
      Width = 22
      Height = 13
      Caption = #51060#47492
    end
    object Label3: TLabel
      Left = 33
      Top = 135
      Width = 44
      Height = 13
      Caption = #45812#45817#51648#51216
    end
    object Label4: TLabel
      Left = 33
      Top = 183
      Width = 22
      Height = 13
      Caption = #51649#52293
    end
    object Label5: TLabel
      Left = 32
      Top = 35
      Width = 44
      Height = 13
      Caption = #49324#50896#53076#46300
    end
    object btnSave: TButton
      Left = 38
      Top = 298
      Width = 153
      Height = 63
      Caption = #51200#51109
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object dbedtName: TDBEdit
      Left = 88
      Top = 84
      Width = 121
      Height = 21
      DataField = 'sname'
      DataSource = dsStaff
      TabOrder = 1
    end
    object dbedtCafecode: TDBEdit
      Left = 88
      Top = 132
      Width = 121
      Height = 21
      DataField = 'cafecode'
      DataSource = dsStaff
      TabOrder = 2
    end
    object dbedtPosition: TDBEdit
      Left = 88
      Top = 180
      Width = 121
      Height = 21
      DataField = 'position_name'
      DataSource = dsStaff
      TabOrder = 3
    end
    object cbxOnwork: TCheckBox
      Left = 88
      Top = 247
      Width = 97
      Height = 17
      Caption = #53748#49324#52376#47532
      TabOrder = 4
    end
    object DBEdit1: TDBEdit
      Left = 88
      Top = 32
      Width = 121
      Height = 21
      DataField = 'empcode'
      DataSource = dsStaff
      ReadOnly = True
      TabOrder = 5
    end
  end
  object btnSearch: TBitBtn
    Left = 343
    Top = 21
    Width = 25
    Height = 25
    Anchors = [akTop, akRight]
    Glyph.Data = {
      76050000424D7605000000000000360000002800000015000000150000000100
      1800000000004005000074120000741200000000000000000000BEBEBE000000
      222222EDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      000000000000E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00222222000000
      000000000000000000E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00EDEDED000000
      000000000000000000000000E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFE5E5E5
      000000000000000000000000000000E7E7E7FFFFFF9090902626260000000000
      000000001C1C1C818181FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      E5E5E50000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000A6A6A6FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFE5E5E50000000000000000000000000000000000007D7D7DCBCBCBE3E3
      E3C9C9C9797979000000000000000000737373FFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFE7E7E7000000000000000000515151FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF474747000000000000A9A9A9FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF000000000000515151FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF454545000000000000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFF909090000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000009A9A9A00FFFFFFFFFFFF
      FFFFFFFFFFFF2626260000007D7D7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF72727200000041414100FFFFFFFFFFFF
      FFFFFFFFFFFF000000000000CBCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C00000000F0F0F00FFFFFFFFFFFF
      FFFFFFFFFFFF000000000000E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8D8D800000000000000FFFFFFFFFFFF
      FFFFFFFFFFFF000000000000CFCFCFE5E5E5000000B9B9B9FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBEBE00000010101000FFFFFFFFFFFF
      FFFFFFFFFFFF1C1C1C0000007D7D7DFFFFFF000000000000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E6E6E00000044444400FFFFFFFFFFFF
      FFFFFFFFFFFF818181000000000000FFFFFF949494000000000000999999E7E7
      E7D9D9D9747474E5E5E5FFFFFFFFFFFF0000000000009E9E9E00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF000000000000474747FFFFFF9B9B9B0000000000000000
      000000000000006C6C6CFFFFFF3C3C3C000000000000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFA6A6A6000000000000454545FFFFFFFFFFFFA2A2A26C6C
      6C767676C7C7C7FFFFFF3D3D3D000000000000B2B2B2FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF737373000000000000000000747474CDCDCDEAEA
      EAD0D0D07878780000000000000000007F7F7FFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A90000000000000000000000000000
      00000000000000000000000000B2B2B2FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9A4141410F0F0F0000
      001010104343439E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
    Layout = blGlyphTop
    TabOrder = 2
    OnClick = btnSearchClick
  end
  object dsStaff: TDataSource
    DataSet = DM.cdsUpdateStaff
    Left = 488
    Top = 16
  end
end

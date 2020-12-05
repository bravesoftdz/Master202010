object frmUpdatecafe: TfrmUpdatecafe
  Left = 0
  Top = 0
  Caption = #51648#51216' '#49688#51221
  ClientHeight = 511
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 605
    Height = 511
    Align = alClient
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 603
      Height = 64
      Align = alTop
      TabOrder = 0
      DesignSize = (
        603
        64)
      object Label4: TLabel
        Left = 40
        Top = 25
        Width = 58
        Height = 13
        Caption = #51648#51216#47749' '#44160#49353
      end
      object edtSearchCafe: TEdit
        Left = 112
        Top = 22
        Width = 254
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnKeyPress = edtSearchCafeKeyPress
        OnKeyUp = edtSearchCafeKeyUp
      end
      object btnSearch: TBitBtn
        Left = 341
        Top = 20
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
        TabOrder = 1
        OnClick = btnSearchClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 65
      Width = 603
      Height = 445
      Align = alClient
      DataSource = dsCafe
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
          FieldName = 'cafecode'
          Title.Caption = #51648#51216#53076#46300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cafename'
          Title.Caption = #51648#51216#47749
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'phone'
          Title.Caption = #51204#54868#48264#54840
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pposition'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'sname'
          Title.Caption = #45824#54364#51088
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'closed'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'closed_yn'
          ReadOnly = False
          Title.Caption = #50689#50629#50668#48512
          Width = 60
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 605
    Top = 0
    Width = 247
    Height = 511
    Align = alRight
    TabOrder = 1
    object Label1: TLabel
      Left = 31
      Top = 80
      Width = 33
      Height = 13
      Caption = #45824#54364#51088
    end
    object Label2: TLabel
      Left = 31
      Top = 125
      Width = 33
      Height = 13
      Caption = #51648#51216#47749
    end
    object Label3: TLabel
      Left = 31
      Top = 173
      Width = 44
      Height = 13
      Caption = #51204#54868#48264#54840
    end
    object btnSave: TButton
      Left = 32
      Top = 267
      Width = 185
      Height = 25
      Caption = #51200#51109
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object dbedtManager: TDBEdit
      Left = 96
      Top = 77
      Width = 121
      Height = 21
      DataField = 'sname'
      DataSource = dsCafe
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object dbedtCafename: TDBEdit
      Left = 96
      Top = 122
      Width = 121
      Height = 21
      DataField = 'cafename'
      DataSource = dsCafe
      TabOrder = 2
    end
    object dbedtPhone: TDBEdit
      Left = 96
      Top = 170
      Width = 121
      Height = 21
      DataField = 'phone'
      DataSource = dsCafe
      TabOrder = 3
    end
    object dbedtCafecode: TDBEdit
      Left = 96
      Top = 18
      Width = 33
      Height = 21
      DataField = 'cafecode'
      DataSource = dsCafe
      TabOrder = 4
      Visible = False
    end
    object ckbClosed: TCheckBox
      Left = 96
      Top = 220
      Width = 97
      Height = 17
      Caption = #50689#50629' '#51473#51648
      TabOrder = 5
    end
  end
  object dsCafe: TDataSource
    DataSet = DM.cdsUpdateCafe
    Left = 512
    Top = 16
  end
end

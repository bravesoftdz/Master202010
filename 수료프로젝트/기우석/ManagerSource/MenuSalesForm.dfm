object frmMenuSales: TfrmMenuSales
  Left = 0
  Top = 0
  Caption = #54032#47588#54788#54889
  ClientHeight = 530
  ClientWidth = 933
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 933
    Height = 530
    Align = alClient
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 931
      Height = 54
      Align = alTop
      TabOrder = 0
      DesignSize = (
        931
        54)
      object Label1: TLabel
        Left = 549
        Top = 20
        Width = 44
        Height = 13
        Caption = #51648#51216#49440#53469
      end
      object Label2: TLabel
        Left = 16
        Top = 20
        Width = 24
        Height = 13
        Caption = 'From'
      end
      object Label3: TLabel
        Left = 304
        Top = 20
        Width = 12
        Height = 13
        Caption = 'To'
      end
      object cbxCafelist: TComboBox
        Left = 599
        Top = 17
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 0
      end
      object btnSearch: TButton
        Left = 844
        Top = 7
        Width = 73
        Height = 41
        Anchors = [akTop, akRight]
        Caption = #51312#54924
        TabOrder = 1
        OnClick = btnSearchClick
      end
      object dtpTo: TDateTimePicker
        Left = 328
        Top = 17
        Width = 186
        Height = 21
        Date = 44165.716616481480000000
        Time = 44165.716616481480000000
        TabOrder = 2
      end
      object dtpFrom: TDateTimePicker
        Left = 64
        Top = 17
        Width = 186
        Height = 21
        Date = 44165.938680347230000000
        Time = 44165.938680347230000000
        TabOrder = 3
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 55
      Width = 693
      Height = 474
      Align = alClient
      TabOrder = 1
      object DBChart1: TDBChart
        Left = 1
        Top = 1
        Width = 691
        Height = 472
        Title.Text.Strings = (
          #45216#51676#48324' '#47588#52636#54788#54889)
        View3D = False
        View3DWalls = False
        Align = alClient
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        PrintMargins = (
          15
          12
          15
          12)
        ColorPaletteIndex = 13
        object Series1: TBarSeries
          Legend.Visible = False
          Marks.Arrow.Visible = False
          Marks.Callout.Arrow.Visible = False
          Marks.Symbol.Bevel = bvLowered
          Marks.Symbol.Children = <
            item
            end>
          DataSource = DM.cdsSalesTotalByCafe
          SeriesColor = clBlack
          ShowInLegend = False
          XLabelsSource = 'sdate'
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          YValues.ValueSource = 'salesum'
        end
      end
    end
    object Panel4: TPanel
      Left = 694
      Top = 55
      Width = 238
      Height = 474
      Align = alRight
      TabOrder = 2
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 236
        Height = 472
        Align = alClient
        DataSource = dsSalesReportManager
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'sdate'
            Title.Caption = #45216#51676
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'salesum'
            Title.Caption = #51068#48324' '#47588#52636
            Visible = True
          end>
      end
    end
  end
  object dsSalesReportManager: TDataSource
    DataSet = DM.cdsSalesTotal
    Left = 184
    Top = 72
  end
end

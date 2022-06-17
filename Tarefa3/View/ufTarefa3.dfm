inherited fTarefa3: TfTarefa3
  Caption = 'Tarefa 3'
  ClientHeight = 397
  ClientWidth = 384
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 400
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTarefa3: TPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 397
    Align = alClient
    Caption = 'pnlTarefa3'
    ShowCaption = False
    TabOrder = 0
    object grpProjetos: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 376
      Height = 317
      Align = alClient
      Caption = 'Valores por Projeto:'
      TabOrder = 0
      object dbgrdProjetos: TDBGrid
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 366
        Height = 294
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object pnlTotal: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 327
      Width = 376
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'pnlTotal'
      ShowCaption = False
      TabOrder = 1
      object lblTotal: TLabel
        AlignWithMargins = True
        Left = 202
        Top = 3
        Width = 44
        Height = 24
        Align = alRight
        Caption = 'Total R$:'
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object btnTotal: TButton
        AlignWithMargins = True
        Left = 38
        Top = 3
        Width = 116
        Height = 24
        Margins.Right = 45
        Align = alRight
        Caption = 'Obter Total'
        TabOrder = 0
        OnClick = btnTotalClick
      end
      object edtTotal: TEdit
        AlignWithMargins = True
        Left = 252
        Top = 3
        Width = 121
        Height = 24
        Align = alRight
        ReadOnly = True
        TabOrder = 1
        ExplicitHeight = 21
      end
    end
    object pnlTotalDivisoes: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 363
      Width = 376
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Panel1'
      ShowCaption = False
      TabOrder = 2
      object lblTotalDivisoes: TLabel
        AlignWithMargins = True
        Left = 160
        Top = 3
        Width = 86
        Height = 24
        Align = alRight
        Caption = 'Total Divis'#245'es R$:'
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object edtTotalDivisoes: TEdit
        AlignWithMargins = True
        Left = 252
        Top = 3
        Width = 121
        Height = 24
        Align = alRight
        ReadOnly = True
        TabOrder = 0
        ExplicitHeight = 21
      end
      object btnTotalDivisoes: TButton
        AlignWithMargins = True
        Left = 38
        Top = 3
        Width = 116
        Height = 24
        Align = alRight
        Caption = 'Obter Total Divis'#245'es'
        TabOrder = 1
        OnClick = btnTotalDivisoesClick
      end
    end
  end
end

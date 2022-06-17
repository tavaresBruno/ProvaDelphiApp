inherited fTarefa1: TfTarefa1
  Caption = 'Tarefa 1'
  ClientHeight = 387
  ClientWidth = 608
  Position = poMainFormCenter
  ExplicitWidth = 624
  ExplicitHeight = 426
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTarefa1: TPanel
    Left = 0
    Top = 0
    Width = 608
    Height = 387
    Align = alClient
    Caption = 'pnlTarefa1'
    ShowCaption = False
    TabOrder = 0
    object grpColunas: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 197
      Height = 138
      Align = alLeft
      Caption = 'Colunas'
      TabOrder = 0
      object mmoColunas: TMemo
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 187
        Height = 115
        Align = alClient
        TabOrder = 0
      end
    end
    object grpTabelas: TGroupBox
      AlignWithMargins = True
      Left = 207
      Top = 4
      Width = 194
      Height = 138
      Align = alClient
      Caption = 'Tabelas'
      TabOrder = 1
      object mmoTabelas: TMemo
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 184
        Height = 115
        Align = alClient
        TabOrder = 0
      end
    end
    object grpCondicoes: TGroupBox
      AlignWithMargins = True
      Left = 407
      Top = 4
      Width = 197
      Height = 138
      Align = alRight
      Caption = 'Condi'#231#245'es'
      TabOrder = 2
      object mmoCondicoes: TMemo
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 187
        Height = 115
        Align = alClient
        TabOrder = 0
      end
    end
    object btnGeraSQL: TButton
      AlignWithMargins = True
      Left = 4
      Top = 148
      Width = 600
      Height = 30
      Align = alBottom
      Caption = 'GeraSQL'
      TabOrder = 3
      OnClick = btnGeraSQLClick
    end
    object grpSQLGerado: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 184
      Width = 600
      Height = 199
      Align = alBottom
      Caption = 'SQL Gerado'
      TabOrder = 4
      object mmoSQLGerado: TMemo
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 590
        Height = 176
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object spQuery: TspQuery
    Left = 546
    Top = 319
  end
end

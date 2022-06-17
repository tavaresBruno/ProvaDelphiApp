inherited fTarefa2: TfTarefa2
  Caption = 'Tarefa 2'
  ClientHeight = 271
  ClientWidth = 478
  Position = poMainFormCenter
  ExplicitWidth = 494
  ExplicitHeight = 310
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTarefa2: TPanel
    Left = 0
    Top = 0
    Width = 478
    Height = 271
    Align = alClient
    Caption = 'pnlTarefa2'
    ShowCaption = False
    TabOrder = 0
    object grpThread1: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 470
      Height = 109
      Align = alTop
      Caption = 'Thread 1'
      TabOrder = 0
      object lblThread1TempoMs: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 460
        Height = 13
        Align = alTop
        Caption = 'Tempo em Milisegundos:'
        ExplicitWidth = 116
      end
      object lblThread1Progresso: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 64
        Width = 460
        Height = 13
        Align = alTop
        Caption = 'Progresso:'
        ExplicitWidth = 52
      end
      object pbThread1: TProgressBar
        AlignWithMargins = True
        Left = 5
        Top = 83
        Width = 460
        Height = 17
        Align = alTop
        TabOrder = 0
      end
      object edtThread1TempoMs: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 37
        Width = 460
        Height = 21
        Align = alTop
        TabOrder = 1
      end
    end
    object grpThread2: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 119
      Width = 470
      Height = 114
      Align = alTop
      Caption = 'Thread 2'
      TabOrder = 1
      object lblThread2TempoMs: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 460
        Height = 13
        Align = alTop
        Caption = 'Tempo em Milisegundos:'
        ExplicitWidth = 116
      end
      object lblThread2Progresso: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 64
        Width = 460
        Height = 13
        Align = alTop
        Caption = 'Progresso:'
        ExplicitWidth = 52
      end
      object pbThread2: TProgressBar
        AlignWithMargins = True
        Left = 5
        Top = 83
        Width = 460
        Height = 17
        Align = alTop
        TabOrder = 0
      end
      object edtThread2TempoMs: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 37
        Width = 460
        Height = 21
        Align = alTop
        TabOrder = 1
      end
    end
    object btnExecutarThreads: TButton
      AlignWithMargins = True
      Left = 4
      Top = 239
      Width = 470
      Height = 25
      Align = alTop
      Caption = 'Executar Threads'
      TabOrder = 2
      OnClick = btnExecutarThreadsClick
    end
  end
end

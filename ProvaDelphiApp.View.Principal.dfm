object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'ProvaDelphiApp'
  ClientHeight = 511
  ClientWidth = 914
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmTarefas
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mmTarefas: TMainMenu
    Left = 32
    Top = 8
    object mniTarefas: TMenuItem
      Caption = 'Tarefas'
      object mniTarefa1: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = mniTarefa1Click
      end
      object mniTarefa2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = mniTarefa2Click
      end
      object mniTarefa3: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = mniTarefa3Click
      end
    end
  end
end

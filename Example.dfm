object frmExample: TfrmExample
  Left = 411
  Top = 127
  Width = 825
  Height = 677
  Caption = '�˺� �ѽ� SDK Examples'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 32
    Top = 28
    Width = 120
    Height = 13
    Caption = '�˺�ȸ�� ����ڹ�ȣ : '
  end
  object Label4: TLabel
    Left = 336
    Top = 28
    Width = 96
    Height = 13
    Caption = '�˺�ȸ�� ���̵� : '
  end
  object GroupBox8: TGroupBox
    Left = 24
    Top = 56
    Width = 777
    Height = 169
    Caption = '�˺� �⺻ API'
    TabOrder = 0
    object GroupBox9: TGroupBox
      Left = 8
      Top = 24
      Width = 137
      Height = 129
      Caption = 'ȸ�� ����'
      TabOrder = 0
      object btnJoin: TButton
        Left = 8
        Top = 24
        Width = 120
        Height = 25
        Caption = 'ȸ�� ����'
        TabOrder = 0
        OnClick = btnJoinClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = 'ID �ߺ� Ȯ��'
        TabOrder = 1
        OnClick = btnCheckIDClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 88
        Width = 121
        Height = 25
        Caption = '���Կ��� Ȯ��'
        TabOrder = 2
      end
    end
    object GroupBox11: TGroupBox
      Left = 152
      Top = 24
      Width = 145
      Height = 129
      Caption = '����Ʈ ����'
      TabOrder = 1
      object btnGetUnitCost: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = '���� �ܰ� Ȯ��'
        TabOrder = 0
        OnClick = btnGetUnitCostClick
      end
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 88
        Width = 129
        Height = 25
        Caption = '��Ʈ������Ʈ Ȯ��'
        TabOrder = 1
        OnClick = btnGetPartnerBalanceClick
      end
      object btnGetBalance: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '�ܿ�����Ʈ Ȯ��'
        TabOrder = 2
        OnClick = btnGetBalanceClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 312
      Top = 24
      Width = 137
      Height = 129
      Caption = '�˺� �⺻ URL'
      TabOrder = 2
      object btnGetPopBillURL_LOGIN: TButton
        Left = 8
        Top = 24
        Width = 121
        Height = 25
        Caption = '�˺� �α��� URL'
        TabOrder = 0
        OnClick = btnGetPopBillURL_LOGINClick
      end
      object btnGetPopbillURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = '����Ʈ ���� URL'
        TabOrder = 1
        OnClick = btnGetPopBillURL_LOGINClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 464
      Top = 24
      Width = 145
      Height = 129
      Caption = '����� ����'
      TabOrder = 3
      object btnLitContact: TButton
        Left = 10
        Top = 56
        Width = 121
        Height = 25
        Caption = '����� ��� ��ȸ'
        TabOrder = 0
        OnClick = btnLitContactClick
      end
      object btnUpdateContact: TButton
        Left = 10
        Top = 88
        Width = 121
        Height = 25
        Caption = '����� ���� ����'
        TabOrder = 1
        OnClick = btnUpdateContactClick
      end
      object btnRegistContact: TButton
        Left = 10
        Top = 24
        Width = 121
        Height = 25
        Caption = '����� �߰�'
        TabOrder = 2
        OnClick = btnRegistContactClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 616
      Top = 24
      Width = 145
      Height = 129
      Caption = 'ȸ������ ����'
      TabOrder = 4
      object btnGetCorpInfo: TButton
        Left = 10
        Top = 24
        Width = 121
        Height = 25
        Caption = 'ȸ������ ��ȸ'
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 10
        Top = 56
        Width = 121
        Height = 25
        Caption = 'ȸ������ ����'
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
  end
  object txtCorpNum: TEdit
    Left = 176
    Top = 24
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 1
    Text = '1234567890'
  end
  object txtUserID: TEdit
    Left = 448
    Top = 24
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 2
    Text = 'testkorea'
  end
  object GroupBox5: TGroupBox
    Left = 24
    Top = 240
    Width = 778
    Height = 387
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '�˺� FAX ���� ���'
    TabOrder = 3
    object Label1: TLabel
      Left = 112
      Top = 100
      Width = 60
      Height = 13
      Caption = '���� ��ȣ : '
    end
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 155
      Height = 13
      Caption = '����ð�(yyyyMMddHHmmss) : '
    end
    object txtReceiptNum: TEdit
      Left = 184
      Top = 96
      Width = 233
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 0
    end
    object btnGetMessage: TButton
      Left = 432
      Top = 94
      Width = 97
      Height = 25
      Caption = '���ۻ���Ȯ��'
      TabOrder = 1
      OnClick = btnGetMessageClick
    end
    object StringGrid1: TStringGrid
      Left = 8
      Top = 128
      Width = 729
      Height = 201
      ColCount = 14
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 2
    end
    object btnCancelReserve: TButton
      Left = 544
      Top = 94
      Width = 97
      Height = 25
      Caption = '�����������'
      TabOrder = 3
      OnClick = btnCancelReserveClick
    end
    object txtReserveDT: TEdit
      Left = 168
      Top = 22
      Width = 233
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 4
    end
    object btnSendFax_single: TButton
      Left = 16
      Top = 48
      Width = 97
      Height = 33
      Caption = '����'
      TabOrder = 5
      OnClick = btnSendFax_singleClick
    end
    object btnSendThousandSame: TButton
      Left = 128
      Top = 48
      Width = 121
      Height = 33
      Caption = '���� ����'
      TabOrder = 6
      OnClick = btnSendThousandSameClick
    end
    object btnMultiFile: TButton
      Left = 376
      Top = 48
      Width = 121
      Height = 33
      Caption = '�������� ���� ����'
      TabOrder = 7
      OnClick = btnMultiFileClick
    end
    object btnMultiFileSingle: TButton
      Left = 264
      Top = 48
      Width = 97
      Height = 33
      Caption = '�������� ����'
      TabOrder = 8
      OnClick = btnMultiFileSingleClick
    end
    object btnGetUrl: TButton
      Left = 592
      Top = 16
      Width = 145
      Height = 33
      Caption = '���۳��� ��ȸ �˾�'
      TabOrder = 9
      OnClick = btnGetUrlClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 736
    Top = 24
  end
end

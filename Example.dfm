object frmExample: TfrmExample
  Left = 665
  Top = 133
  Width = 1211
  Height = 855
  Caption = '�˺� �ѽ� SDK Examples'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 32
    Top = 20
    Width = 120
    Height = 13
    Caption = '�˺�ȸ�� ����ڹ�ȣ : '
  end
  object Label4: TLabel
    Left = 336
    Top = 20
    Width = 96
    Height = 13
    Caption = '�˺�ȸ�� ���̵� : '
  end
  object GroupBox8: TGroupBox
    Left = 24
    Top = 56
    Width = 1153
    Height = 162
    Caption = '�˺� �⺻ API'
    TabOrder = 1
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 153
      Height = 125
      Caption = 'ȸ�� ����'
      TabOrder = 0
      object btnJoin: TButton
        Left = 8
        Top = 88
        Width = 137
        Height = 25
        Caption = 'ȸ�� ����'
        TabOrder = 0
        OnClick = btnJoinClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = 'ID �ߺ� Ȯ��'
        TabOrder = 1
        OnClick = btnCheckIDClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '���Կ��� Ȯ��'
        TabOrder = 2
        OnClick = btnCheckIsMemberClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 177
      Top = 24
      Width = 153
      Height = 125
      Caption = '����Ʈ ����'
      TabOrder = 1
      object btnGetUnitCost: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '���� �ܰ� Ȯ��'
        TabOrder = 0
        OnClick = btnGetUnitCostClick
      end
      object btnGetChargeInfo: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '�������� Ȯ��'
        TabOrder = 1
        OnClick = btnGetChargeInfoClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 499
      Top = 24
      Width = 153
      Height = 125
      Caption = '�˺� �⺻ URL'
      TabOrder = 2
      object btnGetPopBillURL_LOGIN: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '�˺� �α��� URL'
        TabOrder = 0
        OnClick = btnGetPopBillURL_LOGINClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 821
      Top = 24
      Width = 153
      Height = 124
      Caption = '����� ����'
      TabOrder = 3
      object btnLitContact: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '����� ��� ��ȸ'
        TabOrder = 0
        OnClick = btnLitContactClick
      end
      object btnUpdateContact: TButton
        Left = 8
        Top = 88
        Width = 137
        Height = 25
        Caption = '����� ���� ����'
        TabOrder = 1
        OnClick = btnUpdateContactClick
      end
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '����� �߰�'
        TabOrder = 2
        OnClick = btnRegistContactClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 982
      Top = 24
      Width = 153
      Height = 124
      Caption = 'ȸ������ ����'
      TabOrder = 4
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = 'ȸ������ ��ȸ'
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = 'ȸ������ ����'
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 660
      Top = 24
      Width = 153
      Height = 126
      Caption = '��Ʈ�ʰ��� ����Ʈ'
      TabOrder = 5
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '��Ʈ������Ʈ Ȯ��'
        TabOrder = 0
        OnClick = btnGetPartnerBalanceClick
      end
      object btnGetPartnerURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '����Ʈ ���� URL'
        TabOrder = 1
        OnClick = btnGetPartnerURL_CHRGClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 338
      Top = 24
      Width = 153
      Height = 126
      Caption = '�������� ����Ʈ'
      TabOrder = 6
      object btnGetBalance: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '�ܿ�����Ʈ Ȯ��'
        TabOrder = 0
        OnClick = btnGetBalanceClick
      end
      object btnGetPopbillURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '����Ʈ ���� URL'
        TabOrder = 1
        OnClick = btnGetPopbillURL_CHRGClick
      end
    end
  end
  object txtCorpNum: TEdit
    Left = 176
    Top = 16
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 0
    Text = '1234567890'
  end
  object txtUserID: TEdit
    Left = 448
    Top = 16
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 2
    Text = 'testkorea'
  end
  object GroupBox5: TGroupBox
    Left = 24
    Top = 232
    Width = 1153
    Height = 561
    Caption = '�˺� FAX ���� ���'
    TabOrder = 3
    object Label2: TLabel
      Left = 24
      Top = 32
      Width = 155
      Height = 13
      Caption = '����ð�(yyyyMMddHHmmss) : '
    end
    object StringGrid1: TStringGrid
      Left = 16
      Top = 272
      Width = 1119
      Height = 273
      ColCount = 18
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 0
      ColWidths = (
        54
        53
        64
        64
        64
        56
        56
        59
        55
        54
        53
        64
        80
        76
        74
        74
        64
        64)
    end
    object txtReserveDT: TEdit
      Left = 184
      Top = 30
      Width = 233
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 1
    end
    object btnSendFax_single: TButton
      Left = 24
      Top = 72
      Width = 137
      Height = 25
      Caption = '����'
      TabOrder = 2
      OnClick = btnSendFax_singleClick
    end
    object btnSendThousandSame: TButton
      Left = 173
      Top = 72
      Width = 137
      Height = 25
      Caption = '���� ����'
      TabOrder = 3
      OnClick = btnSendThousandSameClick
    end
    object btnMultiFile: TButton
      Left = 472
      Top = 72
      Width = 137
      Height = 25
      Caption = '�������� ���� ����'
      TabOrder = 4
      OnClick = btnMultiFileClick
    end
    object btnMultiFileSingle: TButton
      Left = 323
      Top = 72
      Width = 137
      Height = 25
      Caption = '�������� ����'
      TabOrder = 5
      OnClick = btnMultiFileSingleClick
    end
    object GroupBox2: TGroupBox
      Left = 821
      Top = 16
      Width = 153
      Height = 105
      Caption = '�ΰ����'
      TabOrder = 6
      object btnGetUrl: TButton
        Left = 8
        Top = 32
        Width = 137
        Height = 25
        Caption = '���۳��� ��ȸ �˾�'
        TabOrder = 0
        OnClick = btnGetUrlClick
      end
      object btnSearch: TButton
        Left = 8
        Top = 64
        Width = 137
        Height = 25
        Caption = '���۳��� �˻���ȸ'
        TabOrder = 1
        OnClick = btnSearchClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 982
      Top = 16
      Width = 153
      Height = 105
      Caption = '�߽Ź�ȣ ���� ���'
      TabOrder = 7
      object btnGetSenderNumberList: TButton
        Left = 8
        Top = 32
        Width = 137
        Height = 25
        Caption = '�߽Ź�ȣ ��� ��ȸ'
        TabOrder = 0
        OnClick = btnGetSenderNumberListClick
      end
      object btnGetURL_SENDER: TButton
        Left = 8
        Top = 64
        Width = 137
        Height = 25
        Caption = '�߽Ź�ȣ ���� �˾�'
        TabOrder = 1
        OnClick = btnGetURL_SENDERClick
      end
    end
    object GroupBox10: TGroupBox
      Left = 16
      Top = 128
      Width = 385
      Height = 129
      Caption = '������ȣ ���� ��� (��û��ȣ ���Ҵ�)'
      TabOrder = 8
      object Label1: TLabel
        Left = 16
        Top = 28
        Width = 57
        Height = 13
        Caption = '������ȣ : '
      end
      object txtReceiptNum: TEdit
        Left = 88
        Top = 24
        Width = 281
        Height = 21
        ImeName = 'Microsoft IME 2010'
        TabOrder = 0
      end
      object btnGetMessage: TButton
        Left = 88
        Top = 56
        Width = 137
        Height = 25
        Caption = '���ۻ���Ȯ��'
        TabOrder = 1
        OnClick = btnGetMessageClick
      end
      object btnCancelReserve: TButton
        Left = 232
        Top = 56
        Width = 137
        Height = 25
        Caption = '�����������'
        TabOrder = 2
        OnClick = btnCancelReserveClick
      end
      object btnResendFax: TButton
        Left = 88
        Top = 88
        Width = 137
        Height = 25
        Caption = '������'
        TabOrder = 3
        OnClick = btnResendFaxClick
      end
      object btnResendFaxSame: TButton
        Left = 232
        Top = 88
        Width = 137
        Height = 25
        Caption = '���� ������'
        TabOrder = 4
        OnClick = btnResendFaxSameClick
      end
    end
    object GroupBox13: TGroupBox
      Left = 409
      Top = 128
      Width = 385
      Height = 129
      Caption = '��û��ȣ �Ҵ� ���۰� ó��'
      TabOrder = 9
      object Label5: TLabel
        Left = 16
        Top = 28
        Width = 57
        Height = 13
        Caption = '��û��ȣ : '
      end
      object txtRequestNum: TEdit
        Left = 88
        Top = 24
        Width = 281
        Height = 21
        ImeName = '�ѱ��� �Է� �ý��� (IME 2000)'
        TabOrder = 0
      end
      object btnGetMessageRN: TButton
        Left = 88
        Top = 56
        Width = 137
        Height = 25
        Caption = '���ۻ���Ȯ��'
        TabOrder = 1
        OnClick = btnGetMessageRNClick
      end
      object btnCancelReserveRN: TButton
        Left = 232
        Top = 56
        Width = 137
        Height = 25
        Caption = '���� ���� ���'
        TabOrder = 2
        OnClick = btnCancelReserveRNClick
      end
      object btnResendFaxRN: TButton
        Left = 88
        Top = 88
        Width = 137
        Height = 25
        Caption = '������'
        TabOrder = 3
        OnClick = btnResendFaxRNClick
      end
      object btnResendFaxSameRN: TButton
        Left = 232
        Top = 88
        Width = 137
        Height = 25
        Caption = '���� ������'
        TabOrder = 4
        OnClick = btnResendFaxSameRNClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 600
    Top = 8
  end
end

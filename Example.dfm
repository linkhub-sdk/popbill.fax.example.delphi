object frmExample: TfrmExample
  Left = 364
  Top = 168
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
    Width = 111
    Height = 13
    Caption = '�˺�ȸ�� ����ڹ�ȣ : '
  end
  object Label4: TLabel
    Left = 336
    Top = 20
    Width = 89
    Height = 13
    Caption = '�˺�ȸ�� ���̵� : '
  end
  object GroupBox8: TGroupBox
    Left = 24
    Top = 56
    Width = 1153
    Height = 185
    Caption = '�˺� �⺻ API'
    TabOrder = 1
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 153
      Height = 125
      Caption = 'ȸ�� ����'
      TabOrder = 0
      object btnJoinMember: TButton
        Left = 8
        Top = 88
        Width = 137
        Height = 25
        Caption = 'ȸ�� ����'
        TabOrder = 0
        OnClick = btnJoinMemberClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '���̵� �ߺ� Ȯ��'
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
      Left = 659
      Top = 24
      Width = 153
      Height = 125
      Caption = '�˺� �⺻ URL'
      TabOrder = 2
      object btnGetAccessURL: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '�˺� �α��� URL'
        TabOrder = 0
        OnClick = btnGetAccessURLClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 821
      Top = 24
      Width = 153
      Height = 153
      Caption = '����� ����'
      TabOrder = 3
      object btnLitContact: TButton
        Left = 8
        Top = 88
        Width = 137
        Height = 25
        Caption = '����� ��� ��ȸ'
        TabOrder = 0
        OnClick = btnLitContactClick
      end
      object btnUpdateContact: TButton
        Left = 8
        Top = 120
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
      object btnGetContactInfo: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '����� ���� Ȯ��'
        TabOrder = 3
        OnClick = btnGetContactInfoClick
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
      Left = 500
      Top = 24
      Width = 153
      Height = 153
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
      object btnGetPaymentURL: TButton
        Left = 8
        Top = 88
        Width = 137
        Height = 25
        Caption = '����Ʈ �������� URL'
        TabOrder = 2
        OnClick = btnGetPaymentURLClick
      end
      object btnGetUseHistoryURL: TButton
        Left = 8
        Top = 120
        Width = 137
        Height = 25
        Caption = '����Ʈ ��볻�� URL'
        TabOrder = 3
        OnClick = btnGetUseHistoryURLClick
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
      object btnGetChargeURL: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '����Ʈ ���� URL'
        TabOrder = 1
        OnClick = btnGetChargeURLClick
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
    Top = 248
    Width = 1153
    Height = 545
    Caption = '�˺� FAX ���� ���'
    TabOrder = 3
    object Label2: TLabel
      Left = 24
      Top = 32
      Width = 151
      Height = 13
      Caption = '����ð�(yyyyMMddHHmmss) : '
    end
    object StringGrid1: TStringGrid
      Left = 16
      Top = 272
      Width = 1119
      Height = 273
      ColCount = 23
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
        64
        64
        64
        64
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
      Top = 64
      Width = 137
      Height = 30
      Caption = '�ѽ� �ܰ� ����'
      TabOrder = 2
      OnClick = btnSendFax_singleClick
    end
    object btnSendThousandSame: TButton
      Left = 173
      Top = 64
      Width = 137
      Height = 30
      Caption = '���� ����'
      TabOrder = 3
      OnClick = btnSendThousandSameClick
    end
    object btnMultiFile: TButton
      Left = 472
      Top = 64
      Width = 137
      Height = 30
      Caption = '�������� ���� ����'
      TabOrder = 4
      OnClick = btnMultiFileClick
    end
    object btnMultiFileSingle: TButton
      Left = 323
      Top = 64
      Width = 137
      Height = 30
      Caption = '�������� ����'
      TabOrder = 5
      OnClick = btnMultiFileSingleClick
    end
    object GroupBox2: TGroupBox
      Left = 821
      Top = 16
      Width = 156
      Height = 121
      Caption = '�ΰ����'
      TabOrder = 6
      object btnGetSentListURL: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '���۳��� ��ȸ �˾�'
        TabOrder = 0
        OnClick = btnGetSentListURLClick
      end
      object btnSearch: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '���۳��� ��� ��ȸ'
        TabOrder = 1
        OnClick = btnSearchClick
      end
      object btnGetPreviewURL: TButton
        Left = 8
        Top = 88
        Width = 137
        Height = 25
        Caption = '�ѽ� �̸����� �˾� '
        TabOrder = 2
        OnClick = btnGetPreviewURLClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 982
      Top = 16
      Width = 153
      Height = 121
      Caption = '�߽Ź�ȣ ���� ���'
      TabOrder = 7
      object btnGetSenderNumberList: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '�߽Ź�ȣ ��� Ȯ��'
        TabOrder = 0
        OnClick = btnGetSenderNumberListClick
      end
      object btnGetSenderNumberMgtURL: TButton
        Left = 8
        Top = 88
        Width = 137
        Height = 25
        Caption = '�߽Ź�ȣ ���� �˾�'
        TabOrder = 1
        OnClick = btnGetSenderNumberMgtURLClick
      end
      object Button1: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '�߽Ź�ȣ ��� ����'
        TabOrder = 2
        OnClick = btnCheckSenderNumberClick
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
        Width = 53
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
        Left = 24
        Top = 56
        Width = 168
        Height = 27
        Caption = '���۳��� �� ���ۻ��� Ȯ��'
        TabOrder = 1
        OnClick = btnGetMessageClick
      end
      object btnCancelReserve: TButton
        Left = 200
        Top = 56
        Width = 168
        Height = 27
        Caption = '�������� ���'
        TabOrder = 2
        OnClick = btnCancelReserveClick
      end
      object btnResendFax: TButton
        Left = 24
        Top = 88
        Width = 168
        Height = 27
        Caption = '�ѽ� ������'
        TabOrder = 3
        OnClick = btnResendFaxClick
      end
      object btnResendFaxSame: TButton
        Left = 200
        Top = 88
        Width = 168
        Height = 27
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
        Width = 53
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
        Left = 24
        Top = 56
        Width = 168
        Height = 27
        Caption = '���۳��� �� ���ۻ��� Ȯ��'
        TabOrder = 1
        OnClick = btnGetMessageRNClick
      end
      object btnCancelReserveRN: TButton
        Left = 200
        Top = 56
        Width = 168
        Height = 27
        Caption = '�������� ���'
        TabOrder = 2
        OnClick = btnCancelReserveRNClick
      end
      object btnResendFaxRN: TButton
        Left = 24
        Top = 88
        Width = 168
        Height = 27
        Caption = '�ѽ� ������'
        TabOrder = 3
        OnClick = btnResendFaxRNClick
      end
      object btnResendFaxSameRN: TButton
        Left = 200
        Top = 88
        Width = 168
        Height = 27
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

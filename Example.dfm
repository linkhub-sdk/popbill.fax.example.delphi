object frmExample: TfrmExample
  Left = 364
  Top = 168
  Caption = #54045#48716' '#54057#49828' SDK Examples'
  ClientHeight = 816
  ClientWidth = 1195
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
    Caption = #54045#48716#54924#50896' '#49324#50629#51088#48264#54840' : '
  end
  object Label4: TLabel
    Left = 336
    Top = 20
    Width = 89
    Height = 13
    Caption = #54045#48716#54924#50896' '#50500#51060#46356' : '
  end
  object Label6: TLabel
    Left = 840
    Top = 21
    Width = 31
    Height = 13
    Caption = 'URL : '
  end
  object GroupBox8: TGroupBox
    Left = 24
    Top = 56
    Width = 1153
    Height = 185
    Caption = #54045#48716' '#44592#48376' API'
    TabOrder = 1
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 153
      Height = 153
      Caption = #54924#50896' '#51221#48372
      TabOrder = 0
      object btnJoinMember: TButton
        Left = 8
        Top = 88
        Width = 137
        Height = 25
        Caption = #54924#50896' '#44032#51077
        TabOrder = 0
        OnClick = btnJoinMemberClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = #50500#51060#46356' '#51473#48373' '#54869#51064
        TabOrder = 1
        OnClick = btnCheckIDClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = #44032#51077#50668#48512' '#54869#51064
        TabOrder = 2
        OnClick = btnCheckIsMemberClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 177
      Top = 24
      Width = 153
      Height = 153
      Caption = #54252#51064#53944' '#44288#47144
      TabOrder = 1
      object btnGetUnitCost: TButton
        Left = 8
        Top = 88
        Width = 137
        Height = 25
        Caption = #51068#48152#47581' '#51204#49569' '#45800#44032' '#54869#51064
        TabOrder = 0
        OnClick = btnGetUnitCostClick
      end
      object btnGetChargeInfo: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = #51068#48152#47581' '#44284#44552#51221#48372' '#54869#51064
        TabOrder = 1
        OnClick = btnGetChargeInfoClick
      end
      object btnGetChargeInfo2: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = #51648#45733#47581' '#44284#44552#51221#48372' '#54869#51064
        TabOrder = 2
        OnClick = btnGetChargeInfo2Click
      end
      object btnGetUnitCost2: TButton
        Left = 8
        Top = 120
        Width = 137
        Height = 25
        Caption = #51648#45733#47581' '#51204#49569' '#45800#44032' '#54869#51064
        TabOrder = 3
        OnClick = btnGetUnitCost2Click
      end
    end
    object GroupBox12: TGroupBox
      Left = 659
      Top = 24
      Width = 153
      Height = 153
      Caption = #54045#48716' '#44592#48376' URL'
      TabOrder = 2
      object btnGetAccessURL: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = #54045#48716' '#47196#44536#51064' URL'
        TabOrder = 0
        OnClick = btnGetAccessURLClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 821
      Top = 24
      Width = 153
      Height = 153
      Caption = #45812#45817#51088' '#44288#47144
      TabOrder = 3
      object btnLitContact: TButton
        Left = 8
        Top = 88
        Width = 137
        Height = 25
        Caption = #45812#45817#51088' '#47785#47197' '#51312#54924
        TabOrder = 0
        OnClick = btnLitContactClick
      end
      object btnUpdateContact: TButton
        Left = 8
        Top = 120
        Width = 137
        Height = 25
        Caption = #45812#45817#51088' '#51221#48372' '#49688#51221
        TabOrder = 1
        OnClick = btnUpdateContactClick
      end
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = #45812#45817#51088' '#52628#44032
        TabOrder = 2
        OnClick = btnRegistContactClick
      end
      object btnGetContactInfo: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = #45812#45817#51088' '#51221#48372' '#54869#51064
        TabOrder = 3
        OnClick = btnGetContactInfoClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 982
      Top = 24
      Width = 153
      Height = 153
      Caption = #54924#49324#51221#48372' '#44288#47144
      TabOrder = 4
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = #54924#49324#51221#48372' '#51312#54924
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = #54924#49324#51221#48372' '#49688#51221
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 500
      Top = 24
      Width = 153
      Height = 153
      Caption = #54028#53944#45320#44284#44552' '#54252#51064#53944
      TabOrder = 5
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = #54028#53944#45320#54252#51064#53944' '#54869#51064
        TabOrder = 0
        OnClick = btnGetPartnerBalanceClick
      end
      object btnGetPartnerURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = #54252#51064#53944' '#52649#51204' URL'
        TabOrder = 1
        OnClick = btnGetPartnerURL_CHRGClick
      end
      object btnGetPaymentURL: TButton
        Left = 8
        Top = 88
        Width = 137
        Height = 25
        Caption = #54252#51064#53944' '#44208#51228#45236#50669' URL'
        TabOrder = 2
        OnClick = btnGetPaymentURLClick
      end
      object btnGetUseHistoryURL: TButton
        Left = 8
        Top = 120
        Width = 137
        Height = 25
        Caption = #54252#51064#53944' '#49324#50857#45236#50669' URL'
        TabOrder = 3
        OnClick = btnGetUseHistoryURLClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 338
      Top = 24
      Width = 153
      Height = 153
      Caption = #50672#46041#44284#44552' '#54252#51064#53944
      TabOrder = 6
      object btnGetBalance: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = #51092#50668#54252#51064#53944' '#54869#51064
        TabOrder = 0
        OnClick = btnGetBalanceClick
      end
      object btnGetChargeURL: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = #54252#51064#53944' '#52649#51204' URL'
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
    Caption = #54045#48716' FAX '#44288#47144' '#44592#45733
    TabOrder = 3
    object Label2: TLabel
      Left = 24
      Top = 32
      Width = 151
      Height = 13
      Caption = #50696#50557#49884#44036'(yyyyMMddHHmmss) : '
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
      Caption = #54057#49828' '#45800#44148' '#51204#49569
      TabOrder = 2
      OnClick = btnSendFax_singleClick
    end
    object btnSendThousandSame: TButton
      Left = 173
      Top = 64
      Width = 137
      Height = 30
      Caption = #46041#48372' '#51204#49569
      TabOrder = 3
      OnClick = btnSendThousandSameClick
    end
    object btnMultiFile: TButton
      Left = 472
      Top = 64
      Width = 137
      Height = 30
      Caption = #45796#51473#54028#51068' '#46041#48372' '#51204#49569
      TabOrder = 4
      OnClick = btnMultiFileClick
    end
    object btnMultiFileSingle: TButton
      Left = 323
      Top = 64
      Width = 137
      Height = 30
      Caption = #45796#51473#54028#51068' '#51204#49569
      TabOrder = 5
      OnClick = btnMultiFileSingleClick
    end
    object GroupBox2: TGroupBox
      Left = 821
      Top = 16
      Width = 156
      Height = 121
      Caption = #48512#44032#44592#45733
      TabOrder = 6
      object btnGetSentListURL: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = #51204#49569#45236#50669' '#51312#54924' '#54045#50629
        TabOrder = 0
        OnClick = btnGetSentListURLClick
      end
      object btnSearch: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = #51204#49569#45236#50669' '#47785#47197' '#51312#54924
        TabOrder = 1
        OnClick = btnSearchClick
      end
      object btnGetPreviewURL: TButton
        Left = 8
        Top = 88
        Width = 137
        Height = 25
        Caption = #54057#49828' '#48120#47532#48372#44592' '#54045#50629' '
        TabOrder = 2
        OnClick = btnGetPreviewURLClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 982
      Top = 16
      Width = 153
      Height = 121
      Caption = #48156#49888#48264#54840' '#44288#47144' '#44592#45733
      TabOrder = 7
      object btnGetSenderNumberList: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = #48156#49888#48264#54840' '#47785#47197' '#54869#51064
        TabOrder = 0
        OnClick = btnGetSenderNumberListClick
      end
      object btnGetSenderNumberMgtURL: TButton
        Left = 8
        Top = 88
        Width = 137
        Height = 25
        Caption = #48156#49888#48264#54840' '#44288#47532' '#54045#50629
        TabOrder = 1
        OnClick = btnGetSenderNumberMgtURLClick
      end
      object Button1: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = #48156#49888#48264#54840' '#46321#47197' '#50668#48512
        TabOrder = 2
        OnClick = btnCheckSenderNumberClick
      end
    end
    object GroupBox10: TGroupBox
      Left = 16
      Top = 128
      Width = 385
      Height = 129
      Caption = #51217#49688#48264#54840' '#44288#47144' '#44592#45733' ('#50836#52397#48264#54840' '#48120#54624#45817')'
      TabOrder = 8
      object Label1: TLabel
        Left = 16
        Top = 28
        Width = 53
        Height = 13
        Caption = #51217#49688#48264#54840' : '
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
        Caption = #51204#49569#45236#50669' '#48143' '#51204#49569#49345#53468' '#54869#51064
        TabOrder = 1
        OnClick = btnGetMessageClick
      end
      object btnCancelReserve: TButton
        Left = 200
        Top = 56
        Width = 168
        Height = 27
        Caption = #50696#50557#51204#49569' '#52712#49548
        TabOrder = 2
        OnClick = btnCancelReserveClick
      end
      object btnResendFax: TButton
        Left = 24
        Top = 88
        Width = 168
        Height = 27
        Caption = #54057#49828' '#51116#51204#49569
        TabOrder = 3
        OnClick = btnResendFaxClick
      end
      object btnResendFaxSame: TButton
        Left = 200
        Top = 88
        Width = 168
        Height = 27
        Caption = #46041#48372' '#51116#51204#49569
        TabOrder = 4
        OnClick = btnResendFaxSameClick
      end
    end
    object GroupBox13: TGroupBox
      Left = 409
      Top = 128
      Width = 385
      Height = 129
      Caption = #50836#52397#48264#54840' '#54624#45817' '#51204#49569#44148' '#52376#47532
      TabOrder = 9
      object Label5: TLabel
        Left = 16
        Top = 28
        Width = 53
        Height = 13
        Caption = #50836#52397#48264#54840' : '
      end
      object txtRequestNum: TEdit
        Left = 88
        Top = 24
        Width = 281
        Height = 21
        ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
        TabOrder = 0
      end
      object btnGetMessageRN: TButton
        Left = 24
        Top = 56
        Width = 168
        Height = 27
        Caption = #51204#49569#45236#50669' '#48143' '#51204#49569#49345#53468' '#54869#51064
        TabOrder = 1
        OnClick = btnGetMessageRNClick
      end
      object btnCancelReserveRN: TButton
        Left = 200
        Top = 56
        Width = 168
        Height = 27
        Caption = #50696#50557#51204#49569' '#52712#49548
        TabOrder = 2
        OnClick = btnCancelReserveRNClick
      end
      object btnResendFaxRN: TButton
        Left = 24
        Top = 88
        Width = 168
        Height = 27
        Caption = #54057#49828' '#51116#51204#49569
        TabOrder = 3
        OnClick = btnResendFaxRNClick
      end
      object btnResendFaxSameRN: TButton
        Left = 200
        Top = 88
        Width = 168
        Height = 27
        Caption = #46041#48372' '#51116#51204#49569
        TabOrder = 4
        OnClick = btnResendFaxSameRNClick
      end
    end
  end
  object txtURL: TEdit
    Left = 880
    Top = 16
    Width = 297
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 600
    Top = 8
  end
end

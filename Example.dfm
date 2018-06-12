object frmExample: TfrmExample
  Left = 665
  Top = 133
  Width = 1211
  Height = 855
  Caption = '팝빌 팩스 SDK Examples'
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
    Caption = '팝빌회원 사업자번호 : '
  end
  object Label4: TLabel
    Left = 336
    Top = 20
    Width = 96
    Height = 13
    Caption = '팝빌회원 아이디 : '
  end
  object GroupBox8: TGroupBox
    Left = 24
    Top = 56
    Width = 1153
    Height = 162
    Caption = '팝빌 기본 API'
    TabOrder = 1
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 153
      Height = 125
      Caption = '회원 정보'
      TabOrder = 0
      object btnJoin: TButton
        Left = 8
        Top = 88
        Width = 137
        Height = 25
        Caption = '회원 가입'
        TabOrder = 0
        OnClick = btnJoinClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = 'ID 중복 확인'
        TabOrder = 1
        OnClick = btnCheckIDClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '가입여부 확인'
        TabOrder = 2
        OnClick = btnCheckIsMemberClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 177
      Top = 24
      Width = 153
      Height = 125
      Caption = '포인트 관련'
      TabOrder = 1
      object btnGetUnitCost: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '전송 단가 확인'
        TabOrder = 0
        OnClick = btnGetUnitCostClick
      end
      object btnGetChargeInfo: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '과금정보 확인'
        TabOrder = 1
        OnClick = btnGetChargeInfoClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 499
      Top = 24
      Width = 153
      Height = 125
      Caption = '팝빌 기본 URL'
      TabOrder = 2
      object btnGetPopBillURL_LOGIN: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '팝빌 로그인 URL'
        TabOrder = 0
        OnClick = btnGetPopBillURL_LOGINClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 821
      Top = 24
      Width = 153
      Height = 124
      Caption = '담당자 관련'
      TabOrder = 3
      object btnLitContact: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '담당자 목록 조회'
        TabOrder = 0
        OnClick = btnLitContactClick
      end
      object btnUpdateContact: TButton
        Left = 8
        Top = 88
        Width = 137
        Height = 25
        Caption = '담당자 정보 수정'
        TabOrder = 1
        OnClick = btnUpdateContactClick
      end
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '담당자 추가'
        TabOrder = 2
        OnClick = btnRegistContactClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 982
      Top = 24
      Width = 153
      Height = 124
      Caption = '회사정보 관련'
      TabOrder = 4
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '회사정보 조회'
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '회사정보 수정'
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 660
      Top = 24
      Width = 153
      Height = 126
      Caption = '파트너과금 포인트'
      TabOrder = 5
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '파트너포인트 확인'
        TabOrder = 0
        OnClick = btnGetPartnerBalanceClick
      end
      object btnGetPartnerURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '포인트 충전 URL'
        TabOrder = 1
        OnClick = btnGetPartnerURL_CHRGClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 338
      Top = 24
      Width = 153
      Height = 126
      Caption = '연동과금 포인트'
      TabOrder = 6
      object btnGetBalance: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 25
        Caption = '잔여포인트 확인'
        TabOrder = 0
        OnClick = btnGetBalanceClick
      end
      object btnGetPopbillURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '포인트 충전 URL'
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
    Caption = '팝빌 FAX 관련 기능'
    TabOrder = 3
    object Label2: TLabel
      Left = 24
      Top = 32
      Width = 155
      Height = 13
      Caption = '예약시간(yyyyMMddHHmmss) : '
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
      Caption = '전송'
      TabOrder = 2
      OnClick = btnSendFax_singleClick
    end
    object btnSendThousandSame: TButton
      Left = 173
      Top = 72
      Width = 137
      Height = 25
      Caption = '동보 전송'
      TabOrder = 3
      OnClick = btnSendThousandSameClick
    end
    object btnMultiFile: TButton
      Left = 472
      Top = 72
      Width = 137
      Height = 25
      Caption = '다중파일 동보 전송'
      TabOrder = 4
      OnClick = btnMultiFileClick
    end
    object btnMultiFileSingle: TButton
      Left = 323
      Top = 72
      Width = 137
      Height = 25
      Caption = '다중파일 전송'
      TabOrder = 5
      OnClick = btnMultiFileSingleClick
    end
    object GroupBox2: TGroupBox
      Left = 821
      Top = 16
      Width = 153
      Height = 105
      Caption = '부가기능'
      TabOrder = 6
      object btnGetUrl: TButton
        Left = 8
        Top = 32
        Width = 137
        Height = 25
        Caption = '전송내역 조회 팝업'
        TabOrder = 0
        OnClick = btnGetUrlClick
      end
      object btnSearch: TButton
        Left = 8
        Top = 64
        Width = 137
        Height = 25
        Caption = '전송내역 검색조회'
        TabOrder = 1
        OnClick = btnSearchClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 982
      Top = 16
      Width = 153
      Height = 105
      Caption = '발신번호 관련 기능'
      TabOrder = 7
      object btnGetSenderNumberList: TButton
        Left = 8
        Top = 32
        Width = 137
        Height = 25
        Caption = '발신번호 목록 조회'
        TabOrder = 0
        OnClick = btnGetSenderNumberListClick
      end
      object btnGetURL_SENDER: TButton
        Left = 8
        Top = 64
        Width = 137
        Height = 25
        Caption = '발신번호 관리 팝업'
        TabOrder = 1
        OnClick = btnGetURL_SENDERClick
      end
    end
    object GroupBox10: TGroupBox
      Left = 16
      Top = 128
      Width = 385
      Height = 129
      Caption = '접수번호 관련 기능 (요청번호 미할당)'
      TabOrder = 8
      object Label1: TLabel
        Left = 16
        Top = 28
        Width = 57
        Height = 13
        Caption = '접수번호 : '
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
        Caption = '전송상태확인'
        TabOrder = 1
        OnClick = btnGetMessageClick
      end
      object btnCancelReserve: TButton
        Left = 232
        Top = 56
        Width = 137
        Height = 25
        Caption = '예약전송취소'
        TabOrder = 2
        OnClick = btnCancelReserveClick
      end
      object btnResendFax: TButton
        Left = 88
        Top = 88
        Width = 137
        Height = 25
        Caption = '재전송'
        TabOrder = 3
        OnClick = btnResendFaxClick
      end
      object btnResendFaxSame: TButton
        Left = 232
        Top = 88
        Width = 137
        Height = 25
        Caption = '동보 재전송'
        TabOrder = 4
        OnClick = btnResendFaxSameClick
      end
    end
    object GroupBox13: TGroupBox
      Left = 409
      Top = 128
      Width = 385
      Height = 129
      Caption = '요청번호 할당 전송건 처리'
      TabOrder = 9
      object Label5: TLabel
        Left = 16
        Top = 28
        Width = 57
        Height = 13
        Caption = '요청번호 : '
      end
      object txtRequestNum: TEdit
        Left = 88
        Top = 24
        Width = 281
        Height = 21
        ImeName = '한국어 입력 시스템 (IME 2000)'
        TabOrder = 0
      end
      object btnGetMessageRN: TButton
        Left = 88
        Top = 56
        Width = 137
        Height = 25
        Caption = '전송상태확인'
        TabOrder = 1
        OnClick = btnGetMessageRNClick
      end
      object btnCancelReserveRN: TButton
        Left = 232
        Top = 56
        Width = 137
        Height = 25
        Caption = '예약 전송 취소'
        TabOrder = 2
        OnClick = btnCancelReserveRNClick
      end
      object btnResendFaxRN: TButton
        Left = 88
        Top = 88
        Width = 137
        Height = 25
        Caption = '재전송'
        TabOrder = 3
        OnClick = btnResendFaxRNClick
      end
      object btnResendFaxSameRN: TButton
        Left = 232
        Top = 88
        Width = 137
        Height = 25
        Caption = '동보 재전송'
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

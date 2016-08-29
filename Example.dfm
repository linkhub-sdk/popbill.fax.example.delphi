object frmExample: TfrmExample
  Left = 289
  Top = 184
  Width = 1186
  Height = 680
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
    Top = 28
    Width = 120
    Height = 13
    Caption = '팝빌회원 사업자번호 : '
  end
  object Label4: TLabel
    Left = 336
    Top = 28
    Width = 96
    Height = 13
    Caption = '팝빌회원 아이디 : '
  end
  object GroupBox8: TGroupBox
    Left = 24
    Top = 56
    Width = 777
    Height = 193
    Caption = '팝빌 기본 API'
    TabOrder = 0
    object GroupBox9: TGroupBox
      Left = 8
      Top = 24
      Width = 137
      Height = 129
      Caption = '회원 정보'
      TabOrder = 0
      object btnJoin: TButton
        Left = 8
        Top = 88
        Width = 120
        Height = 25
        Caption = '회원 가입'
        TabOrder = 0
        OnClick = btnJoinClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = 'ID 중복 확인'
        TabOrder = 1
        OnClick = btnCheckIDClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 121
        Height = 25
        Caption = '가입여부 확인'
        TabOrder = 2
        OnClick = btnCheckIsMemberClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 152
      Top = 24
      Width = 145
      Height = 153
      Caption = '포인트 관련'
      TabOrder = 1
      object btnGetUnitCost: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = '전송 단가 확인'
        TabOrder = 0
        OnClick = btnGetUnitCostClick
      end
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 88
        Width = 129
        Height = 25
        Caption = '파트너포인트 확인'
        TabOrder = 1
        OnClick = btnGetPartnerBalanceClick
      end
      object btnGetBalance: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '잔여포인트 확인'
        TabOrder = 2
        OnClick = btnGetBalanceClick
      end
      object btnGetChargeInfo: TButton
        Left = 8
        Top = 120
        Width = 129
        Height = 25
        Caption = '과금정보 확인'
        TabOrder = 3
        OnClick = btnGetChargeInfoClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 312
      Top = 24
      Width = 137
      Height = 129
      Caption = '팝빌 기본 URL'
      TabOrder = 2
      object btnGetPopBillURL_LOGIN: TButton
        Left = 8
        Top = 24
        Width = 121
        Height = 25
        Caption = '팝빌 로그인 URL'
        TabOrder = 0
        OnClick = btnGetPopBillURL_LOGINClick
      end
      object btnGetPopbillURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = '포인트 충전 URL'
        TabOrder = 1
        OnClick = btnGetPopbillURL_CHRGClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 464
      Top = 24
      Width = 145
      Height = 129
      Caption = '담당자 관련'
      TabOrder = 3
      object btnLitContact: TButton
        Left = 10
        Top = 56
        Width = 121
        Height = 25
        Caption = '담당자 목록 조회'
        TabOrder = 0
        OnClick = btnLitContactClick
      end
      object btnUpdateContact: TButton
        Left = 10
        Top = 88
        Width = 121
        Height = 25
        Caption = '담당자 정보 수정'
        TabOrder = 1
        OnClick = btnUpdateContactClick
      end
      object btnRegistContact: TButton
        Left = 10
        Top = 24
        Width = 121
        Height = 25
        Caption = '담당자 추가'
        TabOrder = 2
        OnClick = btnRegistContactClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 616
      Top = 24
      Width = 145
      Height = 129
      Caption = '회사정보 관련'
      TabOrder = 4
      object btnGetCorpInfo: TButton
        Left = 10
        Top = 24
        Width = 121
        Height = 25
        Caption = '회사정보 조회'
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 10
        Top = 56
        Width = 121
        Height = 25
        Caption = '회사정보 수정'
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
    Top = 264
    Width = 1137
    Height = 369
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '팝빌 FAX 관련 기능'
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 116
      Width = 60
      Height = 13
      Caption = '접수 번호 : '
    end
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 155
      Height = 13
      Caption = '예약시간(yyyyMMddHHmmss) : '
    end
    object txtReceiptNum: TEdit
      Left = 88
      Top = 112
      Width = 233
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 0
    end
    object btnGetMessage: TButton
      Left = 336
      Top = 110
      Width = 97
      Height = 25
      Caption = '전송상태확인'
      TabOrder = 1
      OnClick = btnGetMessageClick
    end
    object StringGrid1: TStringGrid
      Left = 8
      Top = 144
      Width = 1105
      Height = 209
      ColCount = 18
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 2
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
    object btnCancelReserve: TButton
      Left = 448
      Top = 110
      Width = 97
      Height = 25
      Caption = '예약전송취소'
      TabOrder = 3
      OnClick = btnCancelReserveClick
    end
    object txtReserveDT: TEdit
      Left = 176
      Top = 22
      Width = 233
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 4
    end
    object btnSendFax_single: TButton
      Left = 16
      Top = 56
      Width = 97
      Height = 33
      Caption = '전송'
      TabOrder = 5
      OnClick = btnSendFax_singleClick
    end
    object btnSendThousandSame: TButton
      Left = 128
      Top = 56
      Width = 121
      Height = 33
      Caption = '동보 전송'
      TabOrder = 6
      OnClick = btnSendThousandSameClick
    end
    object btnMultiFile: TButton
      Left = 376
      Top = 56
      Width = 121
      Height = 33
      Caption = '다중파일 동보 전송'
      TabOrder = 7
      OnClick = btnMultiFileClick
    end
    object btnMultiFileSingle: TButton
      Left = 264
      Top = 56
      Width = 97
      Height = 33
      Caption = '다중파일 전송'
      TabOrder = 8
      OnClick = btnMultiFileSingleClick
    end
    object btnGetUrl: TButton
      Left = 592
      Top = 24
      Width = 145
      Height = 34
      Caption = '전송내역 조회 팝업'
      TabOrder = 9
      OnClick = btnGetUrlClick
    end
    object btnSearch: TButton
      Left = 592
      Top = 64
      Width = 145
      Height = 34
      Caption = '전송내역 검색조회'
      TabOrder = 10
      OnClick = btnSearchClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 736
    Top = 24
  end
end

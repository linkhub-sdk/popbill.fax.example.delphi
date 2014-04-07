object frmExample: TfrmExample
  Left = 673
  Top = 182
  Width = 768
  Height = 617
  Caption = '팝빌 팩스 SDK Examples'
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
    Left = 16
    Top = 12
    Width = 69
    Height = 13
    Caption = '사업자번호 : '
  end
  object Label4: TLabel
    Left = 232
    Top = 12
    Width = 69
    Height = 13
    Caption = '팝빌아이디 : '
  end
  object GroupBox8: TGroupBox
    Left = 8
    Top = 40
    Width = 745
    Height = 121
    Caption = '팝빌 기본 API'
    TabOrder = 0
    object GroupBox9: TGroupBox
      Left = 8
      Top = 24
      Width = 137
      Height = 89
      Caption = '회원 정보'
      TabOrder = 0
      object btnJoin: TButton
        Left = 8
        Top = 24
        Width = 120
        Height = 25
        Caption = '회원 가입'
        TabOrder = 0
        OnClick = btnJoinClick
      end
      object btnGetBalance: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = '잔여포인트 확인'
        TabOrder = 1
        OnClick = btnGetBalanceClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 152
      Top = 24
      Width = 145
      Height = 89
      Caption = '포인트 관련'
      TabOrder = 1
      object btnGetUnitCost: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '단가 확인'
        TabOrder = 0
        OnClick = btnGetUnitCostClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 448
      Top = 24
      Width = 137
      Height = 89
      Caption = '기타'
      TabOrder = 2
      object btnGetPopBillURL: TButton
        Left = 8
        Top = 48
        Width = 121
        Height = 25
        Caption = 'Popbill URL'
        TabOrder = 0
        OnClick = btnGetPopBillURLClick
      end
      object cbTOGO: TComboBox
        Left = 8
        Top = 24
        Width = 121
        Height = 21
        ImeName = '한국어 입력 시스템 (IME 2000)'
        ItemHeight = 13
        TabOrder = 1
        Text = '-- URL코드 --'
        Items.Strings = (
          'LOGIN : SSO로그인'
          'CHRG : 포인트 충전'
          'CERT : 공인인증서 등록'
          'SEAL : 인감 등록'
          'BLICENSE : 사업자등록증 등록'
          'BANKBOOK : 통장사본 등록'
          '')
      end
    end
    object GroupBox4: TGroupBox
      Left = 592
      Top = 24
      Width = 145
      Height = 89
      Caption = '파트너 관련'
      TabOrder = 3
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '파트너포인트 확인'
        TabOrder = 0
        OnClick = btnGetPartnerBalanceClick
      end
    end
  end
  object txtCorpNum: TEdit
    Left = 88
    Top = 8
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 1
    Text = '4108600477'
  end
  object txtUserID: TEdit
    Left = 304
    Top = 8
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 2
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 168
    Width = 745
    Height = 404
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '팝빌 FAX 관련 기능'
    TabOrder = 3
    object Label1: TLabel
      Left = 200
      Top = 164
      Width = 60
      Height = 13
      Caption = '접수 번호 : '
    end
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 155
      Height = 13
      Caption = '예약시간(yyyyMMddHHmmss) : '
    end
    object txtReceiptNum: TEdit
      Left = 272
      Top = 160
      Width = 233
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 0
    end
    object btnGetMessage: TButton
      Left = 520
      Top = 158
      Width = 97
      Height = 25
      Caption = '전송상태확인'
      TabOrder = 1
      OnClick = btnGetMessageClick
    end
    object StringGrid1: TStringGrid
      Left = 8
      Top = 192
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
      Left = 632
      Top = 158
      Width = 97
      Height = 25
      Caption = '예약전송취소'
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
      Left = 248
      Top = 64
      Width = 81
      Height = 33
      Caption = '전송'
      TabOrder = 5
      OnClick = btnSendFax_singleClick
    end
    object btnSendThousandSame: TButton
      Left = 344
      Top = 64
      Width = 121
      Height = 33
      Caption = '동보 전송'
      TabOrder = 6
      OnClick = btnSendThousandSameClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 720
    Top = 8
  end
end

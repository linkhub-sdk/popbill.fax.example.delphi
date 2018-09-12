{******************************************************************************}
{ 팝빌 팩스 API Delphi SDK Example                                             }
{                                                                              }
{ - 델파이 SDK 적용방법 안내 : http://blog.linkhub.co.kr/572                   }
{ - 업데이트 일자 : 2018-06-28                                                 }
{ - 연동 기술지원 연락처 : 1600-9854 / 070-4304-2991                           }
{ - 연동 기술지원 이메일 : code@linkhub.co.kr                                  }
{                                                                              }
{ <테스트 연동개발 준비사항>                                                   }
{ (1) 32, 35번 라인에 선언된 링크아이디(LinkID)와 비밀키(SecretKey)를          }
{    링크허브 가입시 메일로 발급받은 인증정보로 수정                           }
{ (2) 팝빌 개발용 사이트(test.popbill.com)에 연동회원으로 가입                 }
{                                                                              }
{******************************************************************************}

unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo, Popbill, PopbillFax, ExtCtrls, Grids;

const
        {**********************************************************************}
        { - 인증정보(링크아이디, 비밀키)는 파트너의 연동회원을 식별하는        }
        {   인증에 사용되므로 유출되지 않도록 주의하시기 바랍니다              }
        { - 상업용 전환이후에도 인증정보는 변경되지 않습니다.                  }
        {**********************************************************************}

        // 링크아이디.
        LinkID = 'TESTER';

        // 파트너 통신용 비밀키. 유출 주의.
        SecretKey = 'SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I=';

type
  TfrmExample = class(TForm)
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnJoin: TButton;
    GroupBox11: TGroupBox;
    btnGetUnitCost: TButton;
    GroupBox12: TGroupBox;
    btnGetPopBillURL_LOGIN: TButton;
    txtCorpNum: TEdit;
    Label3: TLabel;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    txtUserID: TEdit;
    GroupBox5: TGroupBox;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    txtReserveDT: TEdit;
    btnSendFax_single: TButton;
    btnSendThousandSame: TButton;
    OpenDialog1: TOpenDialog;
    btnMultiFile: TButton;
    btnMultiFileSingle: TButton;
    btnCheckID: TButton;
    btnCheckIsMember: TButton;
    btnLitContact: TButton;
    btnUpdateContact: TButton;
    GroupBox1: TGroupBox;
    btnRegistContact: TButton;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    btnGetChargeInfo: TButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    btnGetSenderNumberList: TButton;
    btnGetURL_SENDER: TButton;
    GroupBox10: TGroupBox;
    GroupBox13: TGroupBox;
    Label1: TLabel;
    txtReceiptNum: TEdit;
    btnGetMessage: TButton;
    btnCancelReserve: TButton;
    btnResendFax: TButton;
    btnResendFaxSame: TButton;
    btnGetUrl: TButton;
    btnSearch: TButton;
    GroupBox7: TGroupBox;
    btnGetPartnerBalance: TButton;
    btnGetPartnerURL_CHRG: TButton;
    GroupBox6: TGroupBox;
    btnGetBalance: TButton;
    btnGetPopbillURL_CHRG: TButton;
    Label5: TLabel;
    txtRequestNum: TEdit;
    btnGetMessageRN: TButton;
    btnCancelReserveRN: TButton;
    btnResendFaxRN: TButton;
    btnResendFaxSameRN: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action:TCloseAction);
    procedure btnGetPopBillURL_LOGINClick(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetUnitCostClick(Sender: TObject);
    procedure btnGetPartnerBalanceClick(Sender: TObject);
    procedure btnSendFax_singleClick(Sender: TObject);
    procedure btnCancelReserveClick(Sender: TObject);
    procedure btnSendThousandSameClick(Sender: TObject);
    procedure btnGetMessageClick(Sender: TObject);
    procedure btnMultiFileClick(Sender: TObject);
    procedure btnMultiFileSingleClick(Sender: TObject);
    procedure btnGetUrlClick(Sender: TObject);
    procedure btnCheckIDClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnLitContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnCheckIsMemberClick(Sender: TObject);
    procedure btnGetPopbillURL_CHRGClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnGetChargeInfoClick(Sender: TObject);
    procedure btnResendFaxClick(Sender: TObject);
    procedure btnResendFaxSameClick(Sender: TObject);
    procedure btnGetSenderNumberListClick(Sender: TObject);
    procedure btnGetURL_SENDERClick(Sender: TObject);
    procedure btnGetPartnerURL_CHRGClick(Sender: TObject);
    procedure btnGetMessageRNClick(Sender: TObject);
    procedure btnCancelReserveRNClick(Sender: TObject);
    procedure btnResendFaxRNClick(Sender: TObject);
    procedure btnResendFaxSameRNClick(Sender: TObject);
  private
    faxService : TFaxService;
  public
    { Public declarations }
  end;

var
  frmExample: TfrmExample;
implementation

{$R *.DFM}

procedure TfrmExample.FormCreate(Sender: TObject);
begin
        faxService := TFaxService.Create(LinkID,SecretKey);
        
        //연동환경 설정값, true(개발용), false(상업용)
        faxService.IsTest := true;

        //Exception 처리 설정값, true(기본값)
        faxService.IsThrowException := true;
        
        //그리드 초기화
        stringgrid1.Cells[0,0] := 'state';
        stringgrid1.Cells[1,0] := 'result';
        stringgrid1.Cells[2,0] := 'sendnum';
        stringgrid1.Cells[3,0] := 'senderName';
        stringgrid1.Cells[4,0] := 'receiveNum';
        stringgrid1.Cells[5,0] := 'receiveName';

        stringgrid1.Cells[6,0] := 'sendCnt';
        stringgrid1.Cells[7,0] := 'successCnt';
        stringgrid1.Cells[8,0] := 'failCnt';
        stringgrid1.Cells[9,0] := 'refundCnt';
        stringgrid1.Cells[10,0] := 'cancelCnt';

        stringgrid1.Cells[11,0] := 'reserveDT';
        stringgrid1.Cells[12,0] := 'receiptDT';
        stringgrid1.Cells[13,0] := 'sendDT';
        stringgrid1.Cells[14,0] := 'resultDT';
        stringgrid1.Cells[15,0] := 'title';
        stringgrid1.Cells[16,0] := 'fileNames';
end;

procedure TfrmExample.FormClose(Sender:TObject; var Action:TCloseAction);
begin
	faxService.free;
	Action := caFree;
end;

function IfThen(condition :bool; trueVal :String ; falseVal : String) : string;
begin
    if condition then result := trueVal else result := falseVal;
end;

function BoolToStr(b:Boolean):String;
begin
    if b = true then BoolToStr:='True';
    if b = false then BoolToStr:='False';
end;

procedure TfrmExample.btnGetPopBillURL_LOGINClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        {    팝빌(www.popbill.com)에 로그인된 팝업 URL을 반환합니다.           }
        {    URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.      }
        {**********************************************************************}

        try
                resultURL := faxService.getPopbillURL(txtCorpNum.Text, 'LOGIN');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;



procedure TfrmExample.btnJoinClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin

        {**********************************************************************}
        {    파트너의 연동회원으로 회원가입을 요청합니다.                      }
        {    아이디 중복확인은 btnCheckIDClick 프로시져를 참조하시기 바랍니다. }
        {**********************************************************************}

        // 링크아이디
        joinInfo.LinkID := LinkID;

        // 사업자번호 '-' 제외, 10자리
        joinInfo.CorpNum := '4364364364';

        // 대표자성명, 최대 30자
        joinInfo.CEOName := '대표자성명';

        // 상호명, 최대 70자
        joinInfo.CorpName := '링크허브';

        // 주소, 최대 300자
        joinInfo.Addr := '주소';

        // 업태, 최대 40자
        joinInfo.BizType := '업태';

        // 종목, 최대 40자
        joinInfo.BizClass := '종목';

        // 아이디, 6자이상 20자 미만
        joinInfo.ID     := 'userid';

        // 비밀번호, 6자이상 20자 미만
        joinInfo.PWD    := 'pwd_must_be_long_enough';

        // 담당자명, 최대 30자
        joinInfo.ContactName := '담당자명';

        // 담당자 연락처, 최대 20자
        joinInfo.ContactTEL :='070-4304-2991';

        // 담당자 휴대폰번호, 최대 20자
        joinInfo.ContactHP := '010-000-1111';

        // 담당자 팩스번호, 최대 20자
        joinInfo.ContactFAX := '02-6442-9700';

        // 담당자 메일, 최대 70자
        joinInfo.ContactEmail := 'code@linkhub.co.kr';


        try
                response := faxService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 연동회원의 잔여포인트를 확인합니다.                                  }
        { - 과금방식이 연동과금이 아닌 파트너과금인 경우 파트너 잔여포인트     }
        {   확인(GetPartnerBalance API) 기능 이용하시기 바랍니다               }
        {**********************************************************************}
        
        try
                balance := faxService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { 팩스 전송단가를 확인합니다.                                          }
        {**********************************************************************}
        
        try
                unitcost := faxService.GetUnitCost(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('FAX 전송단가 : '+ FloatToStr(unitcost));
end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 파트너의 잔여포인트를 확인합니다. 과금방식이 파트너과금이 아닌       }
        { 연동과금인 경우 연동회원 잔여포인트 확인(GetBalance API)를           }
        { 이용하시기 바랍니다                                                  }
        {**********************************************************************}
        
        try
                balance := faxService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

end;


procedure TfrmExample.btnSendFax_singleClick(Sender: TObject);
var
        filePath, receiptNum, senderNum, senderName, receiverNum, receiverName,
        title, requestNum : string;
        adsYN : Boolean;
begin
        {**********************************************************************}
        { 팩스 전송을 요청합니다.                                              }
        { - 팩스 전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)        }
        { - 팩스전송 문서 파일포맷 안내 : http://blog.linkhub.co.kr/2561       }
        {**********************************************************************}

        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        // 발신번호
        senderNum := '07043042992';

        // 발신자명
        senderName := '발신자명';

        // 수신팩스번호
        receiverNum := '070111222';

        // 수신자명
        receiverName := '수신자명';

        // 광고팩스 전송여부
        adsYN := False;

        // 팩스제목
        title := '팩스 단건전송 제목';

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;

        try
                receiptNum := faxService.SendFAX(txtCorpNum.Text, senderNum,
                                                 senderName, receiverNum,
                                                 receiverName, filePath,
                                                 txtReserveDT.Text, txtUserID.Text,
                                                 adsYN, title,
                                                 requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호(receiptNum) :' + receiptNum);

end;

procedure TfrmExample.btnCancelReserveClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 팩스전송요청시 발급받은 접수번호(receiptNum)로                       }
        { 팩스 예약전송건을 취소합니다.                                        }
        { - 예약취소는 팩스변환 이후 가능합니다.                               }
        {**********************************************************************}

        try
                response := faxService.CancelReserve(txtCorpNum.Text, txtReceiptNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnSendThousandSameClick(Sender: TObject);
var
        receiptNum, filePath, senderNum, senderName, title, requestNum : String;
        adsYN : Boolean;
        receivers : TReceiverList;
        i :Integer;
begin
        {**********************************************************************}
        { 팩스 전송을 요청합니다.                                              }
        { - 팩스 전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)        }
        { - 팩스전송 문서 파일포맷 안내 : http://blog.linkhub.co.kr/2561       }
        {**********************************************************************}

        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        // 발신번호
        senderNum := '07043042992';

        // 발신자명
        senderName := '발신자명';

        // 광고팩스 전송여부
        adsYN := False;

        // 팩스제목
        title := '팩스전송 제목';

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;

        // 수신자 정보배열, 최대 1000건
        SetLength(receivers,5);
        for i :=0 to Length(receivers) -1 do begin
                receivers[i] := TReceiver.create;

                //수신번호
                receivers[i].receiveNum := '070111222';

                //수신자명
                receivers[i].receiveName := IntToStr(i) + '번째 수신자';
        end;

        try
                receiptNum := faxService.SendFAX(txtCorpNum.Text, senderNum,
                                                 senderName, receivers,
                                                 filePath, txtReserveDT.Text,
                                                 txtUserID.Text, adsYN,
                                                 title, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호(receiptNum) :' + receiptNum);
end;

procedure TfrmExample.btnGetMessageClick(Sender: TObject);
var
        FaxDetails : TFaxDetailList;
        i :integer;
        j : integer;
        fileNameList : String;
begin
        {**********************************************************************}
        { 팩스전송요청시 발급받은 접수번호(receiptNum)로 전송결과를 확인합니다 }
        { - 응답항목에 대한 자세한 사항은 "[팩스 API 연동매뉴얼] >  3.3.1      }
        {    GetFaxDetail (전송내역 및 전송상태 확인)을 참조하시기 바랍니다.   }
        {**********************************************************************}

        try
                FaxDetails := faxService.getSendDetail(txtCorpNum.Text,
                                        txtReceiptNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        stringgrid1.RowCount := Length(FaxDetails) + 1;                                          

        for i:= 0 to Length(FaxDetails) -1 do begin

               stringgrid1.Cells[0,i+1] := IntToStr(FaxDetails[i].state);
               stringgrid1.Cells[1,i+1] := IntToStr(FaxDetails[i].result);
               stringgrid1.Cells[2,i+1] := FaxDetails[i].sendNum;
               stringgrid1.Cells[3,i+1] := FaxDetails[i].senderName;
               stringgrid1.Cells[4,i+1] := FaxDetails[i].receiveNum;
               stringgrid1.Cells[5,i+1] := FaxDetails[i].receiveName;

               stringgrid1.Cells[6,i+1] := IntToStr(FaxDetails[i].sendPageCnt);
               stringgrid1.Cells[7,i+1] := IntToStr(FaxDetails[i].successPageCnt);
               stringgrid1.Cells[8,i+1] := IntToStr(FaxDetails[i].failPageCnt);
               stringgrid1.Cells[9,i+1] := IntToStr(FaxDetails[i].refundPageCnt);
               stringgrid1.Cells[10,i+1] := IntToStr(FaxDetails[i].cancelPageCnt);

               stringgrid1.Cells[11,i+1] := FaxDetails[i].reserveDT;
               stringgrid1.Cells[12,i+1] := FaxDetails[i].receiptDT;
               stringgrid1.Cells[13,i+1] := FaxDetails[i].sendDT;
               stringgrid1.Cells[14,i+1] := FaxDetails[i].resultDT;
               stringgrid1.Cells[15,i+1] := FaxDetails[i].title;

               fileNameList := '';

               for j:= 0 to length(FaxDetails[i].fileNames) -1 do begin
                        if j = length(FaxDetails[i].fileNames) -1 then
                                fileNameList := fileNameList +FaxDetails[i].fileNames[j]
                        else
                                fileNameList := fileNameList +FaxDetails[i].fileNames[j] + ', '
               end ;

               stringgrid1.Cells[16,i+1] := fileNameList;
        end;
end;

procedure TfrmExample.btnMultiFileClick(Sender: TObject);
var
        receiptNum, sendNum, senderName, title, requestNum : String;
        adsYN : Boolean;
        filePaths : Array Of string;
        receivers : TReceiverList;
        i :Integer;
begin
        {**********************************************************************}
        { 팩스 전송을 요청합니다.                                              }
        { - 팩스 전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)        }
        { - 팩스전송 문서 파일포맷 안내 : http://blog.linkhub.co.kr/2561       }
        {**********************************************************************}

        //팩스전송 파일경로 배열, 최대 20개
        setLength(filePaths, 2);

        if OpenDialog1.Execute then begin
              filePaths[0] := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        if OpenDialog1.Execute then begin
              filePaths[1] := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        // 발신번호
        sendNum := '07043042992';

        // 발신자명
        senderName := '발신자명';

        // 광고팩스 전송여부
        adsYN := False;

        // 팩스제목
        title := '팩스 다수파일 동보전송 제목';

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;

        // 수신정보배열 최대 1000건
        SetLength(receivers,5);

        for i := 0 to Length(receivers) - 1 do begin
                receivers[i] := TReceiver.create;

                //수신팩스번호
                receivers[i].receiveNum := '070111222';

                //수신자명
                receivers[i].receiveName := IntToStr(i) + '번째 수신자';
        end;
        
        try
                receiptNum := faxService.SendFAX(txtCorpNum.Text, sendNum,
                                                 senderName, receivers,
                                                 filePaths, txtReserveDT.Text,
                                                 txtUserID.Text, adsYN,
                                                 title, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);   
                        Exit;
                end;
        end;
        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호(receiptNum) :' + receiptNum);
end;

procedure TfrmExample.btnMultiFileSingleClick(Sender: TObject);
var
        receiptNum, senderNum, senderName, receiverNum, receiverName, title,
        requestNum : String;
        filePaths : Array Of string;
        adsYN : Boolean;

        Loop : Integer;
begin
        {**********************************************************************}
        { 팩스 전송을 요청합니다.                                              }
        { - 팩스 전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)        }
        { - 팩스전송 문서 파일포맷 안내 : http://blog.linkhub.co.kr/2561       }
        {**********************************************************************}

        // 팩스전송파일 경로 배열, 최대 20건
        setLength(filePaths, 2);

        if OpenDialog1.Execute then begin
              filePaths[0] := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        if OpenDialog1.Execute then begin
              filePaths[1] := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        // 발신번호
        senderNum := '07043042992';

        // 발신자명
        senderName := '발신자명';

        // 수신팩스번호
        receiverNum := '070111222';

        // 수신자명
        receiverName := '수신자명';

        // 광고팩스 전송여부
        adsYN := False;

        // 팩스제목
        title := '팩스 단건 다중파일 전송 제목';

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;


        try
                receiptNum := faxService.SendFAX(txtCorpNum.Text, senderNum,
                                                 senderName, receiverNum,
                                                 receiverName, filePaths,
                                                 txtReserveDT.Text, txtUserID.Text,
                                                 adsYN, title,
                                                 requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호(receiptNum) :' + receiptNum);
end;

procedure TfrmExample.btnGetUrlClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 팩스 전송내역 팝업 URL 반환합니다.                                   }
        {    URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.      }
        {**********************************************************************}

        try
                resultURL := faxService.getURL(txtCorpNum.Text, 'BOX');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;


procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 회원가입(JoinMember API)을 호출하기 전 아이디 중복을 확인합니다.     }
        {**********************************************************************}
        
        try
                response := faxService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { 연동회원의 담당자를 신규로 등록합니다.                               }
        {**********************************************************************}

        // [필수] 담당자 아이디 (6자 이상 20자 미만)
        joinInfo.id := 'userid';
        
        // [필수] 비밀번호 (6자 이상 20자 미만)
        joinInfo.pwd := 'thisispassword';

        // [필수] 담당자명(한글이나 영문 30자 이내)
        joinInfo.personName := '담당자성명';

        // [필수] 연락처
        joinInfo.tel := '070-4304-2991';

        // 휴대폰번호
        joinInfo.hp := '010-1111-2222';

        // 팩스번호
        joinInfo.fax := '02-6442-9700';
        
        // [필수] 이메일
        joinInfo.email := 'test@test.com';

        // 회사조회 권한여부, true-회사조회 / false-개인조회
        joinInfo.searchAllAllowYN := false;

        // 관리자 권한여부
        joinInfo.mgrYN := false;

        try
                response := faxService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);

end;

procedure TfrmExample.btnLitContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 연동회원의 담당자 목록을 확인합니다.                                 }
        {**********************************************************************}

        try
                InfoList := faxService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        tmp := 'id | email | hp | personName | searchAllAlloyYN | tel | fax | mgrYN | regDT' + #13;
        for i := 0 to Length(InfoList) - 1 do
        begin
            tmp := tmp + InfoList[i].id + ' | ';
            tmp := tmp + InfoList[i].email + ' | ';
            tmp := tmp + InfoList[i].hp + ' | ';
            tmp := tmp + InfoList[i].personName + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].searchAllAllowYN) + ' | ';
            tmp := tmp + InfoList[i].tel + ' | ';
            tmp := tmp + InfoList[i].fax + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
            tmp := tmp + InfoList[i].regDT + ' | ';
            tmp := tmp + IntToStr(InfoList[i].state) + #13;
        end;

        ShowMessage(tmp);
end;



procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 담당자 정보를 수정합니다.                                 }
        {**********************************************************************}
        
        contactInfo := TContactInfo.Create;
        
        // 담당자 아이디
        contactInfo.id := 'testkorea';

        // 담당자명
        contactInfo.personName := '테스트 담당자';

        // 연락처
        contactInfo.tel := '070-4304-2991';

        // 휴대폰번호
        contactInfo.hp := '010-000-111';

        // 이메일 주소
        contactInfo.email := 'test@test.com';
        
        // 팩스번호
        contactInfo.fax := '02-6442-9799';

        // 조회권한, true(회사조회), false(개인조회)
        contactInfo.searchAllAllowYN := true;

        // 관리자권한 설정여부
        contactInfo.mgrYN := false;


        try
                response := faxService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 확인합니다.                                    }
        {**********************************************************************}
        
        try
                corpInfo := faxService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName (상호) : ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName (대표자 성명) : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType (업태) : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass (종목) : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr (주소) : ' + corpInfo.Addr + #13;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 수정합니다.                                    }
        {**********************************************************************}
        
        corpInfo := TCorpInfo.Create;

        // 대표자명, 최대 30자
        corpInfo.ceoname := '대표자명';

        // 상호, 최대 70자
        corpInfo.corpName := '상호';

        // 업태, 최대 40자
        corpInfo.bizType := '업태';

        // 종목, 최대 40자
        corpInfo.bizClass := '종목';

        // 주소, 최대 300자
        corpInfo.addr := '서울특별시 강남구 영동대로 517';
        
        try
                response := faxService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);

end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 해당 사업자의 연동회원 가입여부를 확인합니다.                        }
        { - LinkID는 파트너를 식별하는 인증정보(32번라인)에 설정되어 있습니다. }
        {**********************************************************************}
        
        try
                response := faxService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnGetPopbillURL_CHRGClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 충전 URL을 반환합니다.                               }
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
        {**********************************************************************}
        
        try
                resultURL := faxService.getPopbillURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnSearchClick(Sender: TObject);
var
        SDate, EDate, tmp: String;
        Page, PerPage : Integer;
        Order : String;
        State : Array Of String;
        ReserveYN, SenderYN : boolean;
        SearchList : TFaxSearchList;
        i : integer;
        j : integer;
        fileNameList : String;
begin
        {**********************************************************************}
        { - 조회일자와 상세조건들을 사용해 팩스전송내역을 조회합니다.          }
        { - 응답항목에 대한 자세한 사항은 "[팩스 API 연동매뉴얼] >             }
        {   3.3.2. 전송내역 목록 조회" 을 참조하시기 바랍니다.                 }
        {**********************************************************************}

        // [필수] 검색기간 시작일자, 작성형태(yyyyMMdd)
        SDate := '20170601';
        
        // [필수] 검색기간 종료일자, 작성형태(yyyyMMdd)
        EDate := '20171231';

        // 팩스전송 상태값 배열, 1:대기, 2:성공, 3:실패, 4:취소 ex) State=1,2,4
        SetLength(State, 4);
        State[0] := '1';
        State[1] := '2';
        State[2] := '3';
        State[3] := '4';

        // 예약전송 검색여부, true-예약전송건 검색
        ReserveYN := false;

        // 개인조회여부, true(개인조회), false(회사조회).
        SenderYN := true;

        // 페이지 번호, 기본값 1
        Page := 1;
        
        // 페이지당 검색갯수, 기본값 500
        PerPage := 10;

        // 정렬방향, 'D' : 내림차순 , 'A' : 오름차순
        Order := 'D';

        try
                SearchList := faxService.search(txtCorpNum.text, SDate, EDate, State,
                                        ReserveYN, SenderYN, Page, PerPage, Order);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'code (응답코드) : '+IntToStr(SearchList.code) + #13;
        tmp := tmp + 'total (총 검색결과 건수) : '+ IntToStr(SearchList.total) + #13;
        tmp := tmp + 'perPage (페이지당 검색개수) : '+ IntToStr(SearchList.perPage) + #13;
        tmp := tmp + 'pageNum (페이지 번호) : '+ IntToStr(SearchList.pageNum) + #13;
        tmp := tmp + 'pageCount (페이지 개수) : '+ IntToStr(SearchList.pageCount) + #13;
        tmp := tmp + 'message (응답메시지) : '+ SearchList.message + #13#13;

        ShowMessage(tmp);

        stringgrid1.RowCount := Length(SearchList.list) + 1;

        for i:= 0 to Length(SearchList.list) - 1 do begin

               stringgrid1.Cells[0,i+1] := IntToStr(SearchList.list[i].state);
               stringgrid1.Cells[1,i+1] := IntToStr(SearchList.list[i].result);
               stringgrid1.Cells[2,i+1] := SearchList.list[i].sendNum;
               stringgrid1.Cells[3,i+1] := SearchList.list[i].senderName;
               stringgrid1.Cells[4,i+1] := SearchList.list[i].receiveNum;
               stringgrid1.Cells[5,i+1] := SearchList.list[i].receiveName;

               stringgrid1.Cells[6,i+1] := IntToStr(SearchList.list[i].sendPageCnt);
               stringgrid1.Cells[7,i+1] := IntToStr(SearchList.list[i].successPageCnt);
               stringgrid1.Cells[8,i+1] := IntToStr(SearchList.list[i].failPageCnt);
               stringgrid1.Cells[9,i+1] := IntToStr(SearchList.list[i].refundPageCnt);
               stringgrid1.Cells[10,i+1] := IntToStr(SearchList.list[i].cancelPageCnt);

               stringgrid1.Cells[11,i+1] := SearchList.list[i].reserveDT;
               stringgrid1.Cells[12,i+1] := SearchList.list[i].receiptDT;
               stringgrid1.Cells[13,i+1] := SearchList.list[i].sendDT;
               stringgrid1.Cells[14,i+1] := SearchList.list[i].resultDT;
               stringgrid1.Cells[15,i+1] := SearchList.list[i].title;

               fileNameList := '';

               for j:= 0 to length(SearchList.list[i].fileNames) -1 do begin
                        if j = length(SearchList.list[i].fileNames) -1 then
                                fileNameList := fileNameList +SearchList.list[i].fileNames[j]
                        else
                                fileNameList := fileNameList +SearchList.list[i].fileNames[j] + ', '
               end ;
               
               stringgrid1.Cells[16,i+1] := fileNameList;
        end;
        SearchList.Free;
end;

procedure TfrmExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : TFaxChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { 연동회원의 팩스 API 서비스 과금정보를 확인합니다.                    }
        {**********************************************************************}
        
        try
                chargeInfo := faxService.GetChargeInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
        tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
        tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnResendFaxClick(Sender: TObject);
var
        receiptNum, senderNum, senderName, receiverNum, receiverName, title,
        requestNum : String;
begin
        {**********************************************************************}
        { 팩스 재전송을 요청합니다.                                            }
        { - 발신/수신정보를 공백으로 처리하는 경우 원 팩스전송정보와 동일하게  }
        {   팩스가 전송됩니다.                                                 }
        { - 팩스 재전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)      }
        { - 팩스전송 문서 파일포맷 안내 : http://blog.linkhub.co.kr/2561       }
        {**********************************************************************}

        //발신번호, 공백처리시 기존발송정보로 전송
        senderNum := '';

        //발신자명, 공백처리시 기존발송정보로 전송
        senderName := '';

        // 수신자팩스번호와 수신자명을 모두 공백처리시 기존발송정보로 전송
        // 수신팩스번호
        receiverNum := '';

        // 수신자명
        receiverName := '';

        // 팩스제목
        title := '팩스 재전송 제목';

        // 재전송 팩스의 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        // 재전송 팩스의 전송상태확인(GetSendDetailRN) / 예약전송취소(CancelReserveRN) 에 이용됩니다.
        requestNum := '';

        try
                receiptNum := faxService.ResendFAX(txtCorpNum.Text,
                                                   txtReceiptNum.Text,
                                                   senderNum,
                                                   senderName,
                                                   receiverNum,
                                                   receiverName,
                                                   txtReserveDT.Text,
                                                   txtUserID.text,
                                                   title,
                                                   requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호(receiptNum) :' + receiptNum);
end;

procedure TfrmExample.btnResendFaxSameClick(Sender: TObject);
var
        receiptNum, senderNum, senderName, title, requestNum : String;
        receivers : TReceiverList;
        i : Integer;
begin
        {**********************************************************************}
        { 팩스 재전송을 요청합니다.                                            }
        { - 수신정보 배열의 길이를 0으로 선언하여 함수를 호출하는 경우         }
        {   기존 팩스전송정보와 동일하게 팩스가 전송됩니다.                    }
        { - 팩스 재전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)      }
        { - 팩스전송 문서 파일포맷 안내 : http://blog.linkhub.co.kr/2561       }
        {**********************************************************************}

        // 발신번호, 공백처리시 기존발송정보로 전송
        senderNum := '';

        // 발신자명, 공백처리시 기존발송정보로 전송
        senderName := '';

        // 팩스제목
        title := '팩스 재전송 동보전송 제목';

        // 재전송 팩스의 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        // 재전송 팩스의 전송상태확인(GetSendDetailRN) / 예약전송취소(CancelReserveRN) 에 이용됩니다.
        requestNum := '';        

        // 수신자 정보를 기존 팩스 전송정보와 동일하게 전송하는 경우
        // 아래 코드와 같이 receviers 배열의 길이를 0으로 선언하여 함수 호출
        //SetLength(receivers, 0);


        // 수신자 정보가 기존전송정보와 다른 경우 수신정보배열에 기재
        // 수신정보배열 최대 1000건
        SetLength(receivers,10);

        for i := 0 to Length(receivers) - 1 do begin
                receivers[i] := TReceiver.create;

                //수신팩스번호
                receivers[i].receiveNum := '01000011'+IntToStr(i);

                //수신자명
                receivers[i].receiveName := IntToStr(i)+ ' 번째 사용자';
        end;
        
        
        try
                receiptNum := faxService.ResendFAX(txtCorpNum.Text,
                                                   txtReceiptNum.Text,
                                                   senderNum,
                                                   senderName,
                                                   receivers,
                                                   txtReserveDT.
                                                   Text,
                                                   txtUserID.Text,
                                                   title,
                                                   requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호(receiptNum) :' + receiptNum);
end;
procedure TfrmExample.btnGetSenderNumberListClick(Sender: TObject);
var
        SenderNumberList : TFAXSenderNumberList;
        tmp : String;
        i : Integer;
begin
        {**********************************************************************}
        { 팩스 발신번호 목록을 조회합니다                                     }
        {**********************************************************************}

        try
             SenderNumberList := faxService.getSenderNumberList(txtCorpNum.Text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        for i := 0 to Length(SenderNumberList) -1 do
        begin
                tmp := tmp + '******** 팩스 발신번호 목록 ['+ IntToStr(i+1) + '] ********' + #13;
                tmp := tmp + '발신번호(number) : ' + SenderNumberList[i].number + #13;
                tmp := tmp + '등록상태(state) : ' + IntToStr(SenderNumberList[i].state) + #13;
                tmp := tmp + '대표번호 지정여부(representYN) : ' + BoolToStr(SenderNumberList[i].representYN) + #13 + #13;
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnGetURL_SENDERClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 팩스 발신번호 관리 팝업 URL 반환합니다.                              }
        { - URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.       }
        {**********************************************************************}

        try
                resultURL := faxService.getURL(txtCorpNum.Text, 'SENDER');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 파트너 포인트 충전 URL을 반환합니다.                                 }
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
        {**********************************************************************}
        
        try
                resultURL := faxService.getPartnerURl(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetMessageRNClick(Sender: TObject);
var
        FaxDetails : TFaxDetailList;
        i :integer;
        j : integer;
        fileNameList : String;
begin
        {****************************************************************************************}
        { 팩스전송요청시 할당한 전송요청번호(requestNum)으로 전송결과를 확인합니다               }
        { - 응답항목에 대한 자세한 사항은 "[팩스 API 연동매뉴얼] >  3.3.2                        }
        {    GetFaxDetailRN (전송내역 및 전송상태 확인 - 요청번호 할당)을 참조하시기 바랍니다.   }
        {****************************************************************************************}

        try
                FaxDetails := faxService.getSendDetailRN(txtCorpNum.Text,
                                                         txtRequestNum.Text,
                                                         txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        stringgrid1.RowCount := Length(FaxDetails) + 1;

        for i:= 0 to Length(FaxDetails) -1 do begin

               stringgrid1.Cells[0,i+1] := IntToStr(FaxDetails[i].state);
               stringgrid1.Cells[1,i+1] := IntToStr(FaxDetails[i].result);
               stringgrid1.Cells[2,i+1] := FaxDetails[i].sendNum;
               stringgrid1.Cells[3,i+1] := FaxDetails[i].senderName;
               stringgrid1.Cells[4,i+1] := FaxDetails[i].receiveNum;
               stringgrid1.Cells[5,i+1] := FaxDetails[i].receiveName;

               stringgrid1.Cells[6,i+1] := IntToStr(FaxDetails[i].sendPageCnt);
               stringgrid1.Cells[7,i+1] := IntToStr(FaxDetails[i].successPageCnt);
               stringgrid1.Cells[8,i+1] := IntToStr(FaxDetails[i].failPageCnt);
               stringgrid1.Cells[9,i+1] := IntToStr(FaxDetails[i].refundPageCnt);
               stringgrid1.Cells[10,i+1] := IntToStr(FaxDetails[i].cancelPageCnt);

               stringgrid1.Cells[11,i+1] := FaxDetails[i].reserveDT;
               stringgrid1.Cells[12,i+1] := FaxDetails[i].receiptDT;
               stringgrid1.Cells[13,i+1] := FaxDetails[i].sendDT;
               stringgrid1.Cells[14,i+1] := FaxDetails[i].resultDT;
               stringgrid1.Cells[15,i+1] := FaxDetails[i].title;

               fileNameList := '';

               for j:= 0 to length(FaxDetails[i].fileNames) -1 do begin
                        if j = length(FaxDetails[i].fileNames) -1 then
                                fileNameList := fileNameList +FaxDetails[i].fileNames[j]
                        else
                                fileNameList := fileNameList +FaxDetails[i].fileNames[j] + ', '
               end ;

               stringgrid1.Cells[16,i+1] := fileNameList;
        end;
end;

procedure TfrmExample.btnCancelReserveRNClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 팩스전송요청시 할당한 전송요청번호(requestNum)로                     }
        { 팩스 예약전송건을 취소합니다.                                        }
        { - 예약취소는 팩스변환 이후 가능합니다.                               }
        {**********************************************************************}

        try
                response := faxService.CancelReserveRN(txtCorpNum.Text, txtRequestNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
end;

procedure TfrmExample.btnResendFaxRNClick(Sender: TObject);
var
        receiptNum, senderNum, senderName, receiverNum, receiverName, title,
        originalFAXrequestNum, requestNum : String;
begin
        {**********************************************************************}
        { 전송요청번호(requestNum)을 할당한 팩스를 재전송합니다.               }
        { - 발신/수신정보를 공백으로 처리하는 경우 원 팩스전송정보와 동일하게  }
        {   팩스가 전송됩니다.                                                 }
        { - 팩스 재전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)      }
        { - 팩스전송 문서 파일포맷 안내 : http://blog.linkhub.co.kr/2561       }
        {**********************************************************************}

        //발신번호, 공백처리시 기존발송정보로 전송
        senderNum := '';

        //발신자명, 공백처리시 기존발송정보로 전송
        senderName := '';

        // 수신자팩스번호와 수신자명을 모두 공백처리시 기존발송정보로 전송
        // 수신팩스번호
        receiverNum := '';

        // 수신자명
        receiverName := '';

        // 팩스제목
        title := '팩스 재전송 제목';

        // 원본 팩스 전송시 할당한 전송요청번호 (requestNum)
        originalFAXrequestNum := '';

        // 재전송 팩스의 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        // 재전송 팩스의 전송상태확인(GetSendDetailRN) / 예약전송취소(CancelReserveRN) 에 이용됩니다.
        requestNum := txtRequestNum.Text;

        try
                receiptNum := faxService.ResendFAXRN(txtCorpNum.Text, requestNum,
                        senderNum, senderName, receiverNum, receiverName, txtReserveDT.Text,
                        originalFAXrequestNum, txtUserID.text, title);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호(receiptNum) :' + receiptNum);
end;

procedure TfrmExample.btnResendFaxSameRNClick(Sender: TObject);
var
        receiptNum, senderNum, senderName, title, originalFAXrequestNum, requestNum : String;
        receivers : TReceiverList;
        i : Integer;
begin
        {**********************************************************************}
        { 전송요청번호(requestNum)을 할당한 팩스를 재전송합니다.               }
        { - 수신정보 배열의 길이를 0으로 선언하여 함수를 호출하는 경우         }
        {   기존 팩스전송정보와 동일하게 팩스가 전송됩니다.                    }
        { - 팩스 재전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)      }
        { - 팩스전송 문서 파일포맷 안내 : http://blog.linkhub.co.kr/2561       }
        {**********************************************************************}

        // 발신번호, 공백처리시 기존발송정보로 전송
        senderNum := '';

        // 발신자명, 공백처리시 기존발송정보로 전송
        senderName := '';

        // 팩스제목
        title := '팩스 재전송 동보전송 제목';

        // 원본 팩스 전송시 할당한 전송요청번호 (requestNum)
        originalFAXrequestNum := '';

        // 재전송 팩스의 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        // 재전송 팩스의 전송상태확인(GetSendDetailRN) / 예약전송취소(CancelReserveRN) 에 이용됩니다.
        requestNum := txtRequestNum.text;


        // 수신자 정보를 기존 팩스 전송정보와 동일하게 전송하는 경우
        // 아래 코드와 같이 receviers 배열의 길이를 0으로 선언하여 함수 호출
        //SetLength(receivers, 0);

        
        // 수신자 정보가 기존전송정보와 다른 경우 수신정보배열에 기재
        // 수신정보배열 최대 1000건
        SetLength(receivers,10);

        for i := 0 to Length(receivers) - 1 do begin
                receivers[i] := TReceiver.create;

                //수신팩스번호
                receivers[i].receiveNum := '01000011'+IntToStr(i);

                //수신자명
                receivers[i].receiveName := IntToStr(i)+ ' 번째 사용자';
        end;
        
        
        try
                receiptNum := faxService.ResendFAXRN(txtCorpNum.Text, requestNum,
                        senderNum, senderName, receivers, txtReserveDT.Text,
                        originalFAXrequestNum, txtUserID.Text, title);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호(receiptNum) :' + receiptNum);
end;

end.


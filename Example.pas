{******************************************************************************}
{
{ 팝빌 팩스 API Delphi SDK Example
{ Delphi 연동 튜토리얼 안내 : https://developers.popbill.com/guide/fax/delphi/getting-started/tutorial
{
{ 업데이트 일자 : 2024-02-27
{ 연동기술지원 연락처 : 1600-9854
{ 연동기술지원 이메일 : code@linkhubcorp.com
{
{ <테스트 연동개발 준비사항>
{ 1) API Key 변경 (연동신청 시 메일로 전달된 정보)
{    - LinkID : 링크허브에서 발급한 링크아이디
{    - SecretKey : 링크허브에서 발급한 비밀키
{ 2) SDK 환경설정 옵션 설정
{    - IsTest : 연동환경 설정, true-테스트, false-운영(Production), (기본값:true)
{    - IsThrowException : 예외 처리 설정, true-사용, false-미사용, (기본값:true)
{    - IPRestrictOnOff : 인증토큰 IP 검증 설정, true-사용, false-미사용, (기본값:true)
{    - UseLocalTimeYN : 로컬시스템 시간 사용여부, true-사용, false-미사용, (기본값:true)
{ 3) 발신번호 사전등록을 합니다. (등록방법은 사이트/API 두가지 방식이 있습니다.)
{    - 1. 팝빌 사이트 로그인 > [문자/팩스] > [팩스] > [발신번호 사전등록] 메뉴에서 등록
{    - 2. getSenderNumberMgtURL API를 통해 반환된 URL을 이용하여 발신번호 등록
{                                                                              
{******************************************************************************}

unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo, Popbill, PopbillFax, ExtCtrls, Grids;

const

        // 링크아이디
        LinkID = 'TESTER';

        // 비밀키
        SecretKey = 'SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I=';

type
  TfrmExample = class(TForm)
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnJoinMember: TButton;
    GroupBox11: TGroupBox;
    btnGetUnitCost: TButton;
    GroupBox12: TGroupBox;
    btnGetAccessURL: TButton;
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
    btnGetSenderNumberMgtURL: TButton;
    GroupBox10: TGroupBox;
    GroupBox13: TGroupBox;
    Label1: TLabel;
    txtReceiptNum: TEdit;
    btnGetMessage: TButton;
    btnCancelReserve: TButton;
    btnResendFax: TButton;
    btnResendFaxSame: TButton;
    btnGetSentListURL: TButton;
    btnSearch: TButton;
    GroupBox7: TGroupBox;
    btnGetPartnerBalance: TButton;
    btnGetPartnerURL_CHRG: TButton;
    GroupBox6: TGroupBox;
    btnGetBalance: TButton;
    btnGetChargeURL: TButton;
    Label5: TLabel;
    txtRequestNum: TEdit;
    btnGetMessageRN: TButton;
    btnCancelReserveRN: TButton;
    btnResendFaxRN: TButton;
    btnResendFaxSameRN: TButton;
    btnGetPreviewURL: TButton;
    btnGetPaymentURL: TButton;
    btnGetUseHistoryURL: TButton;
    btnGetContactInfo: TButton;
    Button1: TButton;
    btnGetChargeInfo2: TButton;
    btnGetUnitCost2: TButton;
    txtURL: TEdit;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action:TCloseAction);
    procedure btnGetAccessURLClick(Sender: TObject);
    procedure btnJoinMemberClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetUnitCostClick(Sender: TObject);
    procedure btnGetPartnerBalanceClick(Sender: TObject);
    procedure btnSendFax_singleClick(Sender: TObject);
    procedure btnCancelReserveClick(Sender: TObject);
    procedure btnSendThousandSameClick(Sender: TObject);
    procedure btnGetMessageClick(Sender: TObject);
    procedure btnMultiFileClick(Sender: TObject);
    procedure btnMultiFileSingleClick(Sender: TObject);
    procedure btnGetSentListURLClick(Sender: TObject);
    procedure btnCheckIDClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnLitContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnCheckIsMemberClick(Sender: TObject);
    procedure btnGetChargeURLClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnGetChargeInfoClick(Sender: TObject);
    procedure btnGetChargeInfo2Click(Sender: TObject);
    procedure btnResendFaxClick(Sender: TObject);
    procedure btnResendFaxSameClick(Sender: TObject);
    procedure btnGetSenderNumberListClick(Sender: TObject);
    procedure btnGetSenderNumberMgtURLClick(Sender: TObject);
    procedure btnGetPartnerURL_CHRGClick(Sender: TObject);
    procedure btnGetMessageRNClick(Sender: TObject);
    procedure btnCancelReserveRNClick(Sender: TObject);
    procedure btnResendFaxRNClick(Sender: TObject);
    procedure btnResendFaxSameRNClick(Sender: TObject);
    procedure btnGetPreviewURLClick(Sender: TObject);
    procedure btnGetPaymentURLClick(Sender: TObject);
    procedure btnGetUseHistoryURLClick(Sender: TObject);
    procedure btnGetContactInfoClick(Sender: TObject);
    procedure btnCheckSenderNumberClick(Sender: TObject);
    procedure btnGetUnitCost2Click(Sender: TObject);
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
        // 팩스 모듈 초기화
        faxService := TFaxService.Create(LinkID,SecretKey);

        // 연동환경 설정, true-테스트, false-운영(Production), (기본값:true)
        faxService.IsTest := true;

        // 예외 처리 설정, true-사용, false-미사용, (기본값:true)
        faxService.IsThrowException := true;

        // 인증토큰 IP 검증 설정, true-사용, false-미사용, (기본값:true)
        faxService.IPRestrictOnOff := true;

        // 로컬시스템 시간 사용여부, true-사용, false-미사용, (기본값:true)
        faxService.UseLocalTimeYN := false;
        
        //그리드 초기화
        stringgrid1.Cells[0,0] := 'state';
        stringgrid1.Cells[1,0] := 'result';
        stringgrid1.Cells[2,0] := 'sendnum';
        stringgrid1.Cells[3,0] := 'senderName';
        stringgrid1.Cells[4,0] := 'receiveNum';
        stringgrid1.Cells[5,0] := 'receiveNumType';
        stringgrid1.Cells[6,0] := 'receiveName';
        stringgrid1.Cells[7,0] := 'title';
        stringgrid1.Cells[8,0] := 'sendCnt';
        stringgrid1.Cells[9,0] := 'successCnt';
        stringgrid1.Cells[10,0] := 'failCnt';
        stringgrid1.Cells[11,0] := 'refundCnt';
        stringgrid1.Cells[12,0] := 'cancelCnt';
        stringgrid1.Cells[13,0] := 'reserveDT';
        stringgrid1.Cells[14,0] := 'receiptDT';
        stringgrid1.Cells[15,0] := 'sendDT';
        stringgrid1.Cells[16,0] := 'resultDT';
        stringgrid1.Cells[17,0] := 'fileNames';
        stringgrid1.Cells[18,0] := 'receiptNum';
        stringgrid1.Cells[19,0] := 'requestNum';
        stringgrid1.Cells[20,0] := 'chargePageCnt';
        stringgrid1.Cells[21,0] := 'tiffFileSize';
        stringgrid1.Cells[22,0] := 'interOPRefKey';
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

procedure TfrmExample.btnGetAccessURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 팝빌 사이트에 로그인 상태로 접근할 수 있는 페이지의 팝업 URL을 반환합니다.           
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/member#GetAccessURL
        {**********************************************************************}

        try
                resultURL := faxService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnJoinMemberClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin

        {**********************************************************************}
        { 사용자를 연동회원으로 가입처리합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/member#JoinMember
        {**********************************************************************}

        // 링크아이디
        joinInfo.LinkID := LinkID;

        // 사업자번호 '-' 제외, 10자리
        joinInfo.CorpNum := '4364364364';

        // 대표자성명, 최대 100자
        joinInfo.CEOName := '대표자성명';

        // 상호명, 최대 200자
        joinInfo.CorpName := '링크허브';

        // 주소, 최대 300자
        joinInfo.Addr := '주소';

        // 업태, 최대 100자
        joinInfo.BizType := '업태';

        // 종목, 최대 100자
        joinInfo.BizClass := '종목';

        // 아이디, 6자이상 50자 미만
        joinInfo.ID     := 'userid';

        // 비밀번호 (8자 이상 20자 미만) 영문, 숫자 ,특수문자 조합
        joinInfo.Password := 'asdf123!@';

        // 담당자명, 최대 100자
        joinInfo.ContactName := '담당자명';

        // 담당자 연락처, 최대 20자
        joinInfo.ContactTEL :='070-4304-2991';

        // 담당자 메일, 최대 100자
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := faxService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
        end;

end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 연동회원의 잔여포인트를 확인합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/point#GetBalance
        {**********************************************************************}
        
        try
                balance := faxService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('잔여포인트 : ' + FloatToStr(balance));
        end;
end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        receiveNumType : String;
        unitcost : Single;
begin
        {**********************************************************************}
        { 팩스 일반망 전송시 과금되는 포인트 단가를 확인합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/point#GetUnitCost
        {**********************************************************************}

        try
                receiveNumType := '일반';
                unitcost := faxService.GetUnitCost(txtCorpNum.text, receiveNumType);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('FAX 전송단가 : '+ FloatToStr(unitcost));
        end;

end;

procedure TfrmExample.btnGetUnitCost2Click(Sender: TObject);
var
        receiveNumType : String;
        unitcost : Single;
begin
        {**********************************************************************}
        { 팩스 지능망 전송시 과금되는 포인트 단가를 확인합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/point#GetUnitCost
        {**********************************************************************}

        try
                receiveNumType := '지능';
                unitcost := faxService.GetUnitCost(txtCorpNum.text, receiveNumType);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('FAX 전송단가 : '+ FloatToStr(unitcost));
        end;

end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 파트너의 잔여포인트를 확인합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/point#GetPartnerBalance 
        {**********************************************************************}
        
        try
                balance := faxService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('잔여포인트 : ' + FloatToStr(balance));
        end;

end;

procedure TfrmExample.btnSendFax_singleClick(Sender: TObject);
var
        filePath, receiptNum, senderNum, senderName, receiverNum, receiverName,
        title, requestNum : string;
        adsYN : Boolean;
begin
        {***************************************************************************}
        { 팩스 1건을 전송합니다. (최대 전송파일 개수: 20개)
        { - https://developers.popbill.com/reference/fax/delphi/api/send#SendFAX
        {***************************************************************************}

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

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호(receiptNum) :' + receiptNum);
        end;

end;

procedure TfrmExample.btnCancelReserveClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 팝빌에서 반환받은 접수번호를 통해 예약접수된 팩스 전송을 취소합니다. (예약시간 10분 전까지 가능)
        { - https://developers.popbill.com/reference/fax/delphi/api/send#CancelReserve
        {**********************************************************************}

        try
                response := faxService.CancelReserve(txtCorpNum.Text, txtReceiptNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnSendThousandSameClick(Sender: TObject);
var
        receiptNum, filePath, senderNum, senderName, title, requestNum : String;
        adsYN : Boolean;
        receivers : TReceiverList;
        i :Integer;
begin
        {***************************************************************************}
        { 동일한 팩스파일을 다수의 수신자에게 전송하기 위해 팝빌에 접수합니다. (최대 전송파일 개수 : 20개) (최대 1,000건)
        { - https://developers.popbill.com/reference/fax/delphi/api/send#SendFAXSame
        {***************************************************************************}

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
        title := '동보전송 팩스전송 제목';

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;

        // 수신자 정보배열, 최대 1000건
        SetLength(receivers,5);
        for i :=0 to Length(receivers) -1 do begin
                receivers[i] := TReceiver.create;
                receivers[i].receiveNum := '070111222';                    //수신번호
                receivers[i].receiveName := IntToStr(i) + '번째 수신자';   //수신자명
                receivers[i].interOPRefKey := 'TEST' + IntToStr(i);   //파트너 지정키 
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

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호(receiptNum) :' + receiptNum);
        end;
end;

procedure TfrmExample.btnGetMessageClick(Sender: TObject);
var
        FaxDetails : TFaxDetailList;
        i :integer;
        j : integer;
        fileNameList : String;
begin
        {**********************************************************************}
        { 팝빌에서 반환 받은 접수번호를 통해 팩스 전송상태 및 결과를 확인합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/info#GetFaxResult
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

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);                
        end
        else
        begin
        
        stringgrid1.RowCount := Length(FaxDetails) + 1;                                          

        for i:= 0 to Length(FaxDetails) -1 do begin

               // 전송상태 코드
               stringgrid1.Cells[0,i+1]  := IntToStr(FaxDetails[i].state);

               // 전송결과 코드
               stringgrid1.Cells[1,i+1]  := IntToStr(FaxDetails[i].result);

               //발신번호
               stringgrid1.Cells[2,i+1]  := FaxDetails[i].sendNum;

               //발신자명
               stringgrid1.Cells[3,i+1]  := FaxDetails[i].senderName;

               //수신번호
               stringgrid1.Cells[4,i+1]  := FaxDetails[i].receiveNum;

               //수신번호 유형
               stringgrid1.Cells[5,i+1]  := FaxDetails[i].receiveNumType;

               //수신자명
               stringgrid1.Cells[6,i+1]  := FaxDetails[i].receiveName;

               //팩스제목
               stringgrid1.Cells[7,i+1]  := FaxDetails[i].title;

               //전체 페이지수
               stringgrid1.Cells[8,i+1]  := IntToStr(FaxDetails[i].sendPageCnt);

               //성공 페이지수
               stringgrid1.Cells[9,i+1]  := IntToStr(FaxDetails[i].successPageCnt);

               //실패 페이지수
               stringgrid1.Cells[10,i+1]  := IntToStr(FaxDetails[i].failPageCnt);

               //환불 페이지수
               stringgrid1.Cells[11,i+1] := IntToStr(FaxDetails[i].refundPageCnt);

               //취소 페이지수
               stringgrid1.Cells[12,i+1] := IntToStr(FaxDetails[i].cancelPageCnt);

               //에약시간
               stringgrid1.Cells[13,i+1] := FaxDetails[i].reserveDT;

               //접수시간
               stringgrid1.Cells[14,i+1] := FaxDetails[i].receiptDT;

               //발송시간
               stringgrid1.Cells[15,i+1] := FaxDetails[i].sendDT;

               //전송결과 수신시간
               stringgrid1.Cells[16,i+1] := FaxDetails[i].resultDT;

               //전송 파일명 리스트
               fileNameList := '';

               for j:= 0 to length(FaxDetails[i].fileNames) -1 do begin
                        if j = length(FaxDetails[i].fileNames) -1 then
                                fileNameList := fileNameList +FaxDetails[i].fileNames[j]
                        else
                                fileNameList := fileNameList +FaxDetails[i].fileNames[j] + ', '
               end ;
               stringgrid1.Cells[17,i+1] := fileNameList;

               //접수번호
               stringgrid1.Cells[18,i+1] := FaxDetails[i].receiptNum;

               //요청번호
               stringgrid1.Cells[19,i+1] := FaxDetails[i].requestNum;

               //과금 페이지수
               stringgrid1.Cells[20,i+1] := IntToStr(FaxDetails[i].chargePageCnt);

               //변환파일용량(단위:byte)
               stringgrid1.Cells[21,i+1] := FaxDetails[i].tiffFileSize + 'byte';

               //파트너 지정 키
               stringgrid1.Cells[22,i+1] := FaxDetails[i].interOPRefKey;
        end;

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
        {***************************************************************************}
        { 동일한 팩스파일을 다수의 수신자에게 전송하기 위해 팝빌에 접수합니다. (최대 전송파일 개수 : 20개) (최대 1,000건)
        { - https://developers.popbill.com/reference/fax/delphi/api/send#SendFAXMultiSame
        {***************************************************************************}

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
        title := '다중파일 동보 전송';

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;

        // 수신정보배열 최대 1000건
        SetLength(receivers,5);

        for i := 0 to Length(receivers) - 1 do begin
                receivers[i] := TReceiver.create;
                receivers[i].receiveNum := '070111222';                   //수신팩스번호
                receivers[i].receiveName := IntToStr(i) + '번째 수신자';  //수신자명
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

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호(receiptNum) :' + receiptNum);
        end;
end;

procedure TfrmExample.btnMultiFileSingleClick(Sender: TObject);
var
        receiptNum, senderNum, senderName, receiverNum, receiverName, title,
        requestNum : String;
        filePaths : Array Of string;
        adsYN : Boolean;

        Loop : Integer;
begin
        {***************************************************************************}
        { 동일한 팩스파일을 다수의 수신자에게 전송하기 위해 팝빌에 접수합니다. (최대 전송파일 개수 : 20개) (최대 1,000건)
        { - https://developers.popbill.com/reference/fax/delphi/api/send#SendFAXMulti
        {***************************************************************************}

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
        title := '다중파일 전송 제목';

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

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호(receiptNum) :' + receiptNum);
        end;
end;

procedure TfrmExample.btnGetSentListURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 팩스 전송내역 확인 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/info#GetSentListURL
        {**********************************************************************}

        try
                resultURL := faxService.getSentListURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 사용하고자 하는 아이디의 중복여부를 확인합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/member#CheckID
        {**********************************************************************}
        
        try
                response := faxService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 담당자(팝빌 로그인 계정)를 추가합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/member#RegistContact
        {**********************************************************************}

        // [필수] 담당자 아이디 (6자 이상 50자 미만)
        joinInfo.id := 'testkorea';

        // 비밀번호 (8자 이상 20자 미만) 영문, 숫자 ,특수문자 조합
        joinInfo.Password := 'asdf123!@';

        // [필수] 담당자명(한글이나 영문 100자 이내)
        joinInfo.personName := '담당자성명';

        // [필수] 연락처 (최대 20자)
        joinInfo.tel := '070-4304-2991';

        // [필수] 이메일 (최대 100자)
        joinInfo.email := 'test@test.com';

        // 담당자 권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        joinInfo.searchRole := '3';

        try
                response := faxService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;

end;

procedure TfrmExample.btnLitContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 목록을 확인합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/member#ListContact
        {**********************************************************************}

        try
                InfoList := faxService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                tmp := 'id(아이디) | email(이메일) | personName(성명) | searchRole(담당자 권한) | ';
                tmp := tmp + 'tel(연락처) | mgrYN(관리자 여부) | regDT(등록일시) | state(상태)' + #13;

                for i := 0 to Length(InfoList) - 1 do
                begin
                    tmp := tmp + InfoList[i].id + ' | ';
                    tmp := tmp + InfoList[i].email + ' | ';
                    tmp := tmp + InfoList[i].personName + ' | ';
                    tmp := tmp + InfoList[i].searchRole + ' | ';
                    tmp := tmp + InfoList[i].tel + ' | ';
                    tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
                    tmp := tmp + InfoList[i].regDT + ' | ';
                    tmp := tmp + IntToStr(InfoList[i].state) + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 정보를 수정합니다.                                 
        { - https://developers.popbill.com/reference/fax/delphi/api/member#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // 담당자 아이디
        contactInfo.id := 'testkorea';

        // 담당자명 (최대 100자)
        contactInfo.personName := '테스트 담당자';

        // 연락처 (최대 20자)
        contactInfo.tel := '070-4304-2991';

        // 이메일 주소 (최대 100자)
        contactInfo.email := 'test@test.com';

        // 담당자 권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        contactInfo.searchRole := '3';


        try
                response := faxService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;

end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 확인합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/member#GetCorpInfo
        {**********************************************************************}
        
        try
                corpInfo := faxService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                tmp := 'CorpName (상호) : ' + corpInfo.CorpName + #13;
                tmp := tmp + 'CeoName (대표자 성명) : ' + corpInfo.CeoName + #13;
                tmp := tmp + 'BizType (업태) : ' + corpInfo.BizType + #13;
                tmp := tmp + 'BizClass (종목) : ' + corpInfo.BizClass + #13;
                tmp := tmp + 'Addr (주소) : ' + corpInfo.Addr + #13;
                ShowMessage(tmp);
        end;

end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 수정합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/member#UpdateCorpInfo
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // 대표자명, 최대 100자
        corpInfo.ceoname := '대표자명';

        // 상호, 최대 200자
        corpInfo.corpName := '상호';

        // 업태, 최대 100자
        corpInfo.bizType := '업태';

        // 종목, 최대 100자
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
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 사업자번호를 조회하여 연동회원 가입여부를 확인합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/member#CheckIsMember
        {**********************************************************************}

        try
                response := faxService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;

end;

procedure TfrmExample.btnGetChargeURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 충전을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/point#GetChargeURL
        {**********************************************************************}
        
        try
                resultURL := faxService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
               ShowMessage('URL :  ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnSearchClick(Sender: TObject);
var
        SDate, EDate, tmp, Order, fileNameList, QString : String;
        Page, PerPage : Integer;
        State : Array Of String;
        ReserveYN, SenderYN : boolean;
        SearchList : TFaxSearchList;
        i : integer;
        j : integer;
begin
        {**********************************************************************}
        { 검색조건에 해당하는 팩스 전송내역 목록을 조회합니다. (조회기간 단위 : 최대 2개월)
        { - 팩스 접수일시로부터 2개월 이내 접수건만 조회할 수 있습니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/info#Search
        {**********************************************************************}

        // [필수] 검색기간 시작일자, 작성형태(yyyyMMdd)
        SDate := '20220701';

        // [필수] 검색기간 종료일자, 작성형태(yyyyMMdd)
        EDate := '20220730';

        // 팩스전송 상태값 배열, 1:대기, 2:성공, 3:실패, 4:취소
        SetLength(State, 4);
        State[0] := '1';
        State[1] := '2';
        State[2] := '3';
        State[3] := '4';

        // 예약전송 검색여부, true-예약전송 조회, fasle-즉시전송 조회
        ReserveYN := false;

        // 개인조회여부, true-개인조회, false-전체조회
        SenderYN := true;

        // 페이지 번호, 기본값 1
        Page := 1;

        // 페이지당 검색갯수, 기본값 500
        PerPage := 100;

        // 정렬방향, D-내림차순, A-오름차순
        Order := 'D';

        // 조회 검색어, 발신자명 또는 수신자명 기재
        QString := '';

        try
                SearchList := faxService.search(txtCorpNum.text, SDate, EDate, State,
                                        ReserveYN, SenderYN, Page, PerPage, Order, QString);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                tmp := 'code (응답코드) : '+IntToStr(SearchList.code) + #13;
                tmp := tmp + 'total (총 검색결과 건수) : '+ IntToStr(SearchList.total) + #13;
                tmp := tmp + 'perPage (페이지당 검색개수) : '+ IntToStr(SearchList.perPage) + #13;
                tmp := tmp + 'pageNum (페이지 번호) : '+ IntToStr(SearchList.pageNum) + #13;
                tmp := tmp + 'pageCount (페이지 개수) : '+ IntToStr(SearchList.pageCount) + #13;
                tmp := tmp + 'message (응답메시지) : '+ SearchList.message + #13#13;
                ShowMessage(tmp);

                stringgrid1.RowCount := Length(SearchList.list) + 1;

                for i:= 0 to Length(SearchList.list) - 1 do begin
                       stringgrid1.Cells[0,i+1] := IntToStr(SearchList.list[i].state);          // 전송상태 코드
                       stringgrid1.Cells[1,i+1] := IntToStr(SearchList.list[i].result);         // 전송결과 코드
                       stringgrid1.Cells[2,i+1] := SearchList.list[i].sendNum;                  // 발신번호
                       stringgrid1.Cells[3,i+1] := SearchList.list[i].senderName;               // 발신자명
                       stringgrid1.Cells[4,i+1] := SearchList.list[i].receiveNum;               // 수신번호
                       stringgrid1.Cells[5,i+1] := SearchList.list[i].receiveNumType;           // 수신번호 유형
                       stringgrid1.Cells[6,i+1] := SearchList.list[i].receiveName;              // 수신자명
                       stringgrid1.Cells[7,i+1] := SearchList.list[i].title;                    // 팩스제목
                       stringgrid1.Cells[8,i+1] := IntToStr(SearchList.list[i].sendPageCnt);    // 전체 페이지수
                       stringgrid1.Cells[9,i+1] := IntToStr(SearchList.list[i].successPageCnt); // 성공 페이지수
                       stringgrid1.Cells[10,i+1] := IntToStr(SearchList.list[i].failPageCnt);    // 실패 페이지수
                       stringgrid1.Cells[11,i+1] := IntToStr(SearchList.list[i].refundPageCnt); // 환불 페이지수
                       stringgrid1.Cells[12,i+1] := IntToStr(SearchList.list[i].cancelPageCnt); // 취소 페이지수
                       stringgrid1.Cells[13,i+1] := SearchList.list[i].reserveDT;               // 예약시간
                       stringgrid1.Cells[14,i+1] := SearchList.list[i].receiptDT;               // 접수시산
                       stringgrid1.Cells[15,i+1] := SearchList.list[i].sendDT;                  // 발송시간
                       stringgrid1.Cells[16,i+1] := SearchList.list[i].resultDT;                // 전송결과 수신시간
                       fileNameList := '';

                       for j:= 0 to length(SearchList.list[i].fileNames) -1 do begin            // 전송 파일명 리스트
                                if j = length(SearchList.list[i].fileNames) -1 then
                                        fileNameList := fileNameList +SearchList.list[i].fileNames[j]
                                else
                                        fileNameList := fileNameList +SearchList.list[i].fileNames[j] + ', '
                       end ;
                       stringgrid1.Cells[17,i+1] := fileNameList;
                       stringgrid1.Cells[18,i+1] := SearchList.list[i].receiptNum;              // 접수번호
                       stringgrid1.Cells[19,i+1] := SearchList.list[i].requestNum;              // 요청번호
                       stringgrid1.Cells[20,i+1] := IntToStr(SearchList.list[i].chargePageCnt); // 과금 페이지수
                       stringgrid1.Cells[21,i+1] := SearchList.list[i].tiffFileSize + 'byte';   // 변환파일용량 (단위: byte)
                       stringgrid1.Cells[22,i+1] := SearchList.list[i].interOPRefKey;                //파트너 지정 키
                end;
                SearchList.Free;
        end;
end;

procedure TfrmExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : TFaxChargeInfo;
        receiveNumType : String;
        tmp : String;
begin
        {**********************************************************************}
        { 팝빌 팩스 API 서비스 일반망 과금정보를 확인합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/point#GetChargeInfo
        {**********************************************************************}

        try
                receiveNumType := '일반';
                chargeInfo := faxService.GetChargeInfo(txtCorpNum.text, receiveNumType);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetChargeInfo2Click(Sender: TObject);
var
        chargeInfo : TFaxChargeInfo;
        receiveNumType : String;
        tmp : String;
begin
        {**********************************************************************}
        { 팝빌 팩스 API 서비스 지능망 과금정보를 확인합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/point#GetChargeInfo
        {**********************************************************************}

        try
                receiveNumType := '지능';
                chargeInfo := faxService.GetChargeInfo(txtCorpNum.text, receiveNumType);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnResendFaxClick(Sender: TObject);
var
        receiptNum, senderNum, senderName, receiverNum, receiverName, title,
        requestNum : String;
begin
        {***************************************************************************}
        { 팝빌에서 반환받은 접수번호를 통해 팩스 1건을 재전송합니다.
        { - 발신/수신 정보 미입력시 기존과 동일한 정보로 팩스가 전송되고, 접수일 기준 최대 60일이 경과되지 않는 건만 재전송이 가능합니다.
        { - 팩스 재전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)
        { - 변환실패 사유로 전송실패한 팩스 접수건은 재전송이 불가합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/send#ResendFAX
        {***************************************************************************}

        //발신번호, 공백처리시 기존발송정보로 전송
        senderNum := '';

        //발신자명, 공백처리시 기존발송정보로 전송
        senderName := '';

        // 수신팩스번호, 공백처리시 기존발송정보로 전송
        receiverNum := '';

        // 수신자명, 공백처리시 기존발송정보로 전송
        receiverName := '';

        // 팩스제목
        title := '팩스 재전송 제목';

        // 재전송 팩스의 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        // 재전송 팩스의 전송상태확인(GetSendDetailRN) / 예약전송취소(CancelReserveRN) 에 이용됩니다.
        requestNum := '';

        try
                receiptNum := faxService.ResendFAX(txtCorpNum.Text, txtReceiptNum.Text,
                                                   senderNum, senderName,
                                                   receiverNum, receiverName,
                                                   txtReserveDT.Text, txtUserID.text,
                                                   title, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호(receiptNum) :' + receiptNum);
        end;
end;

procedure TfrmExample.btnResendFaxSameClick(Sender: TObject);
var
        receiptNum, senderNum, senderName, title, requestNum : String;
        receivers : TReceiverList;
        i : Integer;
begin
        {***************************************************************************}
        { 동일한 팩스파일을 다수의 수신자에게 전송하기 위해 팝빌에 접수합니다. (최대 전송파일 개수: 20개) (최대 1,000건)
        { - 발신/수신 정보 미입력시 기존과 동일한 정보로 팩스가 전송되고, 접수일 기준 최대 60일이 경과되지 않는 건만 재전송이 가능합니다.
        { - 팩스 재전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)
        { - 변환실패 사유로 전송실패한 팩스 접수건은 재전송이 불가합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/send#ResendFAXSame
        {***************************************************************************}

        // 발신번호, 공백처리시 기존발송정보로 전송
        senderNum := '';

        // 발신자명, 공백처리시 기존발송정보로 전송
        senderName := '';

        // 팩스제목
        title := '팩스 재전송 동보전송 제목';

        // 재전송 팩스의 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := '';

        // 수신자 정보를 기존 팩스 전송정보와 동일하게 전송하는 경우
        // 아래 코드와 같이 receviers 배열의 길이를 0으로 선언하여 함수 호출
        //SetLength(receivers, 0);

        // 수신자 정보가 기존전송정보와 다른 경우 수신정보배열에 기재
        // 수신정보배열 최대 1000건
        SetLength(receivers,10);

        for i := 0 to Length(receivers) - 1 do begin
                receivers[i] := TReceiver.create;
                receivers[i].receiveNum := '01000011'+IntToStr(i);       //수신팩스번호
                receivers[i].receiveName := IntToStr(i)+ ' 번째 사용자'; //수신자명
                receivers[i].interOPRefKey := 'ResendTEST' + IntToStr(i); //파트너 지정 키 
        end;

        try
                receiptNum := faxService.ResendFAX(txtCorpNum.Text, txtReceiptNum.Text,
                                                   senderNum, senderName, receivers, txtReserveDT.
                                                   Text, txtUserID.Text, title, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호(receiptNum) :' + receiptNum);
        end;
end;

procedure TfrmExample.btnGetSenderNumberListClick(Sender: TObject);
var
        SenderNumberList : TFAXSenderNumberList;
        tmp : String;
        i : Integer;
begin
        {**********************************************************************}
        { 팝빌에 등록한 연동회원의 팩스 발신번호 목록을 확인합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/sendnum#GetSenderNumberList
        {**********************************************************************}

        try
             SenderNumberList := faxService.getSenderNumberList(txtCorpNum.Text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                for i := 0 to Length(SenderNumberList) -1 do
                begin
                        tmp := tmp + '******** 팩스 발신번호 목록 ['+ IntToStr(i+1) + '] ********' + #13;
                        tmp := tmp + 'number(발신번호) : ' + SenderNumberList[i].number + #13;
                        tmp := tmp + 'state(등록상태) : ' + IntToStr(SenderNumberList[i].state) + #13;
                        tmp := tmp + 'representYN(대표번호 지정여부) : ' + BoolToStr(SenderNumberList[i].representYN) + #13 + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnCheckSenderNumberClick(Sender: TObject);
var
        response : TResponse;
        senderNumber : String;
begin
        {**********************************************************************}
        { 팩스 발신번호 등록여부를 확인합니다.
        { - 발신번호 상태가 '승인'인 경우에만 리턴값 'TResponse'의 변수 'code'가 1로 반환됩니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/sendnum#CheckSenderNumber
        {**********************************************************************}

        //확인할 발신번호
        senderNumber := '070-4304-2981';

        try
                response := faxService.CheckSenderNumber(txtCorpNum.Text, senderNumber);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메지시 : '+ response.Message);
        end;

end;

procedure TfrmExample.btnGetSenderNumberMgtURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 발신번호를 등록하고 내역을 확인하는 팩스 발신번호 관리 페이지 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/sendnum#GetSenderNumberMgtURL
        {**********************************************************************}

        try
                resultURL := faxService.getSenderNumberMgtURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;        
end;

procedure TfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 파트너 포인트 충전을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/point#GetPartnerURL
        {**********************************************************************}
        
        try
                resultURL := faxService.getPartnerURl(txtCorpNum.Text, 'CHRG');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetMessageRNClick(Sender: TObject);
var
        FaxDetails : TFaxDetailList;
        i :integer;
        j : integer;
        fileNameList : String;
begin
        {**********************************************************************}
        { 파트너가 할당한 전송요청 번호를 통해 팩스 전송상태 및 결과를 확인합니다.          
        { - https://developers.popbill.com/reference/fax/delphi/api/info#GetFaxResultRN
        {**********************************************************************}

        try
                FaxDetails := faxService.getSendDetailRN(txtCorpNum.Text,
                                                         txtRequestNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
        
        stringgrid1.RowCount := Length(FaxDetails) + 1;

        for i:= 0 to Length(FaxDetails) -1 do begin

               // 전송상태 코드
               stringgrid1.Cells[0,i+1]  := IntToStr(FaxDetails[i].state);

               // 전송결과 코드
               stringgrid1.Cells[1,i+1]  := IntToStr(FaxDetails[i].result);

               //발신번호
               stringgrid1.Cells[2,i+1]  := FaxDetails[i].sendNum;

               //발신자명
               stringgrid1.Cells[3,i+1]  := FaxDetails[i].senderName;

               //수신번호
               stringgrid1.Cells[4,i+1]  := FaxDetails[i].receiveNum;

               //수신번호 유형
               stringgrid1.Cells[5,i+1]  := FaxDetails[i].receiveNumType;

               //수신자명
               stringgrid1.Cells[6,i+1]  := FaxDetails[i].receiveName;

               //팩스제목
               stringgrid1.Cells[7,i+1]  := FaxDetails[i].title;

               //전체 페이지수
               stringgrid1.Cells[8,i+1]  := IntToStr(FaxDetails[i].sendPageCnt);

               //성공 페이지수
               stringgrid1.Cells[9,i+1]  := IntToStr(FaxDetails[i].successPageCnt);

               //실패 페이지수
               stringgrid1.Cells[10,i+1]  := IntToStr(FaxDetails[i].failPageCnt);

               //환불 페이지수
               stringgrid1.Cells[11,i+1] := IntToStr(FaxDetails[i].refundPageCnt);

               //취소 페이지수
               stringgrid1.Cells[12,i+1] := IntToStr(FaxDetails[i].cancelPageCnt);

               //에약시간
               stringgrid1.Cells[13,i+1] := FaxDetails[i].reserveDT;

               //접수시간
               stringgrid1.Cells[14,i+1] := FaxDetails[i].receiptDT;

               //발송시간
               stringgrid1.Cells[15,i+1] := FaxDetails[i].sendDT;

               //전송결과 수신시간
               stringgrid1.Cells[16,i+1] := FaxDetails[i].resultDT;

               //전송 파일명 리스트
               fileNameList := '';

               for j:= 0 to length(FaxDetails[i].fileNames) -1 do begin
                        if j = length(FaxDetails[i].fileNames) -1 then
                                fileNameList := fileNameList +FaxDetails[i].fileNames[j]
                        else
                                fileNameList := fileNameList +FaxDetails[i].fileNames[j] + ', '
               end ;
               stringgrid1.Cells[17,i+1] := fileNameList;

               //접수번호
               stringgrid1.Cells[18,i+1] := FaxDetails[i].receiptNum;

               //요청번호
               stringgrid1.Cells[19,i+1] := FaxDetails[i].requestNum;

               //과금 페이지수
               stringgrid1.Cells[20,i+1] := IntToStr(FaxDetails[i].chargePageCnt);

               //변환파일용량(단위:byte)
               stringgrid1.Cells[21,i+1] := FaxDetails[i].tiffFileSize + 'byte';

               //파트너 지정 키
               stringgrid1.Cells[22,i+1] := FaxDetails[i].interOPRefKey;
        end;
        end;
end;

procedure TfrmExample.btnCancelReserveRNClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 파트너가 할당한 전송요청 번호를 통해 예약접수된 팩스 전송을 취소합니다. (예약시간 10분 전까지 가능)
        { - https://developers.popbill.com/reference/fax/delphi/api/send#CancelReserveRN
        {**********************************************************************}

        try
                response := faxService.CancelReserveRN(txtCorpNum.Text, txtRequestNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;

end;

procedure TfrmExample.btnResendFaxRNClick(Sender: TObject);
var
        receiptNum, senderNum, senderName, receiverNum, receiverName, title,
        originalFAXrequestNum, requestNum : String;
begin
        {**********************************************************************}
        { 파트너가 할당한 전송요청 번호를 통해 팩스 1건을 재전송합니다.
        { - 발신/수신 정보 미입력시 기존과 동일한 정보로 팩스가 전송되고, 접수일 기준 최대 60일이 경과되지 않는 건만 재전송이 가능합니다.
        { - 팩스 재전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)
        { - 변환실패 사유로 전송실패한 팩스 접수건은 재전송이 불가합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/send#ResendFAXRN
        {**********************************************************************}

        //발신번호, 공백처리시 기존발송정보로 전송
        senderNum := '';

        //발신자명, 공백처리시 기존발송정보로 전송
        senderName := '';

        // 수신팩스번호, 공백처리시 기존발송정보로 전송
        receiverNum := '';

        // 수신자명, 공백처리시 기존발송정보로 전송
        receiverName := '';

        // 팩스제목
        title := '팩스 재전송 제목';

        // 원본 팩스 전송시 할당한 전송요청번호 (requestNum)
        originalFAXrequestNum := '';

        // 재전송 팩스의 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당
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

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호(receiptNum) :' + receiptNum);
        end;
end;

procedure TfrmExample.btnResendFaxSameRNClick(Sender: TObject);
var
        receiptNum, senderNum, senderName, title, originalFAXrequestNum, requestNum : String;
        receivers : TReceiverList;
        i : Integer;
begin
        {**********************************************************************}
        { 파트너가 할당한 전송요청 번호를 통해 다수건의 팩스를 재전송합니다. (최대 전송파일 개수: 20개) (최대 1,000건)
        { - 발신/수신 정보 미입력시 기존과 동일한 정보로 팩스가 전송되고, 접수일 기준 최대 60일이 경과되지 않는 건만 재전송이 가능합니다.
        { - 팩스 재전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)
        { - 변환실패 사유로 전송실패한 팩스 접수건은 재전송이 불가합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/send#ResendFAXRNSame
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
                receivers[i].receiveNum := '01000011'+IntToStr(i);       //수신팩스번호
                receivers[i].receiveName := IntToStr(i)+ ' 번째 사용자'; //수신자명
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

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호(receiptNum) :' + receiptNum);
        end;
end;

procedure TfrmExample.btnGetPreviewURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 팩스 미리보기 팝업 URL을 반환하며, 팩스전송을 위한 TIF 포맷 변환 완료 후 호출 할 수 있습니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/info#GetPreviewURL
        {**********************************************************************}

        try
                resultURL := faxService.getPreviewURL(txtCorpNum.Text, txtReceiptNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;


        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnGetPaymentURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 결제내역 확인을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/point#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := faxService.getPaymentURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetUseHistoryURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 사용내역 확인을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/point#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := faxService.getUseHistoryURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                 ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetContactInfoClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        contactID : string;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 정보를 확인합니다.
        { - https://developers.popbill.com/reference/fax/delphi/api/member#GetContactInfo
        {**********************************************************************}

        contactID := 'testkorea';
        
        try
                contactInfo := faxService.getContactInfo(txtCorpNum.Text, contactID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(faxService.LastErrCode) + #10#13 +'응답메시지 : '+ faxService.LastErrMessage);
        end
        else
        begin
                tmp := 'id (아이디) : ' + contactInfo.id + #13;
                tmp := tmp + 'personName (담당자 성명) : ' + contactInfo.personName + #13;
                tmp := tmp + 'tel (담당자 연락처(전화번호)) : ' + contactInfo.tel + #13;
                tmp := tmp + 'email (담당자 이메일) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (등록 일시) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (담당자 권한) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (관리자 여부) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (계정상태) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;


end.

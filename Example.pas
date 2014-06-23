unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillFax, ExtCtrls, Grids;

const
        // 연동아이디.
        LinkID = 'LinkID';
        // 파트너 통신용 비밀키. 유출 주의.
        SecretKey = 'VGBaxxHL7T4o4LrwDRcALHo0j8LgAxsLGhKqjuCwlX8=';

type
  TfrmExample = class(TForm)
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnJoin: TButton;
    GroupBox11: TGroupBox;
    btnGetUnitCost: TButton;
    GroupBox12: TGroupBox;
    btnGetPopBillURL: TButton;
    cbTOGO: TComboBox;
    txtCorpNum: TEdit;
    Label3: TLabel;
    GroupBox4: TGroupBox;
    btnGetPartnerBalance: TButton;
    Label4: TLabel;
    txtUserID: TEdit;
    btnGetBalance: TButton;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    txtReceiptNum: TEdit;
    btnGetMessage: TButton;
    StringGrid1: TStringGrid;
    btnCancelReserve: TButton;
    Label2: TLabel;
    txtReserveDT: TEdit;
    btnSendFax_single: TButton;
    btnSendThousandSame: TButton;
    OpenDialog1: TOpenDialog;
    btnMultiFile: TButton;
    btnMultiFileSingle: TButton;
    btnGetUrl: TButton;
    procedure btnGetPopBillURLClick(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetUnitCostClick(Sender: TObject);
    procedure btnGetPartnerBalanceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSendFax_singleClick(Sender: TObject);
    procedure btnCancelReserveClick(Sender: TObject);
    procedure btnSendThousandSameClick(Sender: TObject);
    procedure btnGetMessageClick(Sender: TObject);
    procedure btnMultiFileClick(Sender: TObject);
    procedure btnMultiFileSingleClick(Sender: TObject);
    procedure btnGetUrlClick(Sender: TObject);
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
        faxService.IsTest := true;
        
        //그리드 초기화
        stringgrid1.Cells[0,0] := 'sendState';
        stringgrid1.Cells[1,0] := 'convState';
        stringgrid1.Cells[2,0] := 'sendnum';
        stringgrid1.Cells[3,0] := 'receiveNum';
        stringgrid1.Cells[4,0] := 'receiveName';

        stringgrid1.Cells[5,0] := 'sendCnt';
        stringgrid1.Cells[6,0] := 'successCnt';
        stringgrid1.Cells[7,0] := 'failCnt';
        stringgrid1.Cells[8,0] := 'refundCnt';
        stringgrid1.Cells[9,0] := 'cancelCnt';

        stringgrid1.Cells[10,0] := 'reserveDT';
        stringgrid1.Cells[11,0] := 'sendDT';
        stringgrid1.Cells[12,0] := 'resultDT';
        stringgrid1.Cells[13,0] := 'sendResult';
end;

function IfThen(condition :bool; trueVal :String ; falseVal : String) : string;
begin
    if condition then result := trueVal else result := falseVal;
end;

procedure TfrmExample.btnGetPopBillURLClick(Sender: TObject);
var
  resultURL : String;
  TOGO : String;
begin
        TOGO := cbTOGO.Text;

        if Pos(' : ',TOGO) = 0 then begin
                ShowMessage('URL 코드를 선택하세요.');
                Exit;
        end;

        Delete(TOGO, Pos(' : ',TOGO), Length(TOGO) - Pos(' : ',TOGO) + 1);

        try
                resultURL := faxService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,TOGO);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
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
        joinInfo.LinkID := LinkID; //연동아이디
        joinInfo.CorpNum := '1231212312'; //사업자번호 '-' 제외.
        joinInfo.CEOName := '대표자성명';
        joinInfo.CorpName := '상호';
        joinInfo.Addr := '주소';
        joinInfo.ZipCode := '500-100';
        joinInfo.BizType := '업태';
        joinInfo.BizClass := '업종';
        joinInfo.ID     := 'userid';  //6자 이상 20자 미만.
        joinInfo.PWD    := 'pwd_must_be_long_enough'; //6자 이상 20자 미만.
        joinInfo.ContactName := '담당자명';
        joinInfo.ContactTEL :='02-999-9999';
        joinInfo.ContactHP := '010-1234-5678';
        joinInfo.ContactFAX := '02-999-9998';
        joinInfo.ContactEmail := 'test@test.com';

        try
                response := faxService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
         try
                balance := faxService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        try
                unitcost := faxService.GetUnitCost(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('FAX 전송단가 : '+ FloatToStr(unitcost));
end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
         try
                balance := faxService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

end;


procedure TfrmExample.btnSendFax_singleClick(Sender: TObject);
var
        filePath : string;
        receiptNum : String;
begin
        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        try
                receiptNum := faxService.SendFAX(txtCorpNum.Text,'07075106766','07075106766','수신자',filePath,txtReserveDT.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        txtReceiptNum.Text := receiptNum;


        ShowMessage('접수번호 :' + receiptNum);



end;

procedure TfrmExample.btnCancelReserveClick(Sender: TObject);
var
        response : TResponse;
begin

        try
                response := faxService.CancelReserve(txtCorpNum.Text,txtReceiptNum.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('처리결과 : ' + IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnSendThousandSameClick(Sender: TObject);
var
        receiptNum :String;
        filePath : string;
        receivers : TReceiverList;
        i :Integer;
begin
        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        SetLength(receivers,500);

        for i :=0 to Length(receivers) -1 do begin
                receivers[i] := TReceiver.create;

                receivers[i].receiveNum := '07075106767';
                receivers[i].receiveName := IntToStr(i) + '번째 수신자';
        end;

        try
                receiptNum := faxService.SendFAX(txtCorpNum.Text,'07075106766',receivers,filePath,txtReserveDT.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호 :' + receiptNum);
end;

procedure TfrmExample.btnGetMessageClick(Sender: TObject);
var
        FaxDetails : TFaxDetailList;
        i :integer;
begin
        try
                FaxDetails := faxService.getSendDetail(txtCorpNum.Text,txtReceiptNum.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        stringgrid1.RowCount := Length(FaxDetails) + 1;                                          

        for i:= 0 to Length(FaxDetails) -1 do begin
               stringgrid1.Cells[0,i+1] := IntToStr(FaxDetails[i].sendState);
               stringgrid1.Cells[1,i+1] := IntToStr(FaxDetails[i].convState);
               stringgrid1.Cells[2,i+1] := FaxDetails[i].sendNum;
               stringgrid1.Cells[3,i+1] := FaxDetails[i].receiveNum;
               stringgrid1.Cells[4,i+1] := FaxDetails[i].receiveName;

               stringgrid1.Cells[5,i+1] := IntToStr(FaxDetails[i].sendPageCnt);
               stringgrid1.Cells[6,i+1] := IntToStr(FaxDetails[i].successPageCnt);
               stringgrid1.Cells[7,i+1] := IntToStr(FaxDetails[i].failPageCnt);
               stringgrid1.Cells[8,i+1] := IntToStr(FaxDetails[i].refundPageCnt);
               stringgrid1.Cells[9,i+1] := IntToStr(FaxDetails[i].cancelPageCnt);

               stringgrid1.Cells[10,i+1] := FaxDetails[i].reserveDT;
               stringgrid1.Cells[11,i+1] := FaxDetails[i].sendDT;
               stringgrid1.Cells[12,i+1] := FaxDetails[i].resultDT;
               stringgrid1.Cells[13,i+1] := IntToStr(FaxDetails[i].sendResult);

        end;
end;

procedure TfrmExample.btnMultiFileClick(Sender: TObject);
var
        receiptNum :String;
        filePaths : Array Of string;
        receivers : TReceiverList;
        i :Integer;
begin
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

        SetLength(receivers,500);

        for i :=0 to Length(receivers) -1 do begin
                receivers[i] := TReceiver.create;

                receivers[i].receiveNum := '07075106767';
                receivers[i].receiveName := IntToStr(i) + '번째 수신자';
        end;

        try
                receiptNum := faxService.SendFAX(txtCorpNum.Text,'07075106766',receivers,filePaths,txtReserveDT.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호 :' + receiptNum);
end;

procedure TfrmExample.btnMultiFileSingleClick(Sender: TObject);
var
        filePaths : Array Of string;
        receiptNum : String;
begin
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

        try
                receiptNum := faxService.SendFAX(txtCorpNum.Text,'07075106766','07075106766','수신자',filePaths,txtReserveDT.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        txtReceiptNum.Text := receiptNum;


        ShowMessage('접수번호 :' + receiptNum);



end;

procedure TfrmExample.btnGetUrlClick(Sender: TObject);
var
  resultURL : String;
begin

        try
                resultURL := faxService.getURL(txtCorpNum.Text,txtUserID.Text,'BOX');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;


end.

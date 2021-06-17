{******************************************************************************}
{ �˺� �ѽ� API Delphi SDK Example
{
{ - ������ SDK ������ �ȳ� : https://docs.popbill.com/fax/tutorial/delphi
{ - ������Ʈ ���� : 2021-06-15
{ - ���� ������� ����ó : 1600-9854 / 070-4304-2991
{ - ���� ������� �̸��� : code@linkhub.co.kr
{
{ <�׽�Ʈ �������� �غ����>
{ (1) 32, 35�� ���ο� ����� ��ũ���̵�(LinkID)�� ���Ű(SecretKey)��
{    ��ũ��� ���Խ� ���Ϸ� �߱޹��� ���������� ����
{ (2) �˺� ���߿� ����Ʈ(test.popbill.com)�� ����ȸ������ ����
{                                                                              
{******************************************************************************}

unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo, Popbill, PopbillFax, ExtCtrls, Grids;

const
        {**********************************************************************}
        { - ��������(��ũ���̵�, ���Ű)�� ��Ʈ���� ����ȸ���� �ĺ��ϴ�        }
        {   ������ ���ǹǷ� ������� �ʵ��� �����Ͻñ� �ٶ��ϴ�              }
        { - ����� ��ȯ���Ŀ��� ���������� ������� �ʽ��ϴ�.                  }
        {**********************************************************************}

        // ��ũ���̵�.
        LinkID = 'TESTER';

        // ��Ʈ�� ��ſ� ���Ű. ���� ����.
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
        
        //����ȯ�� ������, true(���߿�), false(�����)
        faxService.IsTest := true;

        //Exception ó�� ������, true(�⺻��)
        faxService.IsThrowException := true;

        //������ū IP���ѱ�� ��뿩��, true(����)
        faxService.IPRestrictOnOff := true;

        //���ýý��� �ð� ��뿩��, true(���), false(�̻��) - �⺻��
        faxService.UseLocalTimeYN := false;
        
        //�׸��� �ʱ�ȭ
        stringgrid1.Cells[0,0] := 'state';
        stringgrid1.Cells[1,0] := 'result';
        stringgrid1.Cells[2,0] := 'sendnum';
        stringgrid1.Cells[3,0] := 'senderName';
        stringgrid1.Cells[4,0] := 'receiveNum';
        stringgrid1.Cells[5,0] := 'receiveName';
        stringgrid1.Cells[6,0] := 'title';
        stringgrid1.Cells[7,0] := 'sendCnt';
        stringgrid1.Cells[8,0] := 'successCnt';
        stringgrid1.Cells[9,0] := 'failCnt';
        stringgrid1.Cells[10,0] := 'refundCnt';
        stringgrid1.Cells[11,0] := 'cancelCnt';
        stringgrid1.Cells[12,0] := 'reserveDT';
        stringgrid1.Cells[13,0] := 'receiptDT';
        stringgrid1.Cells[14,0] := 'sendDT';
        stringgrid1.Cells[15,0] := 'resultDT';
        stringgrid1.Cells[16,0] := 'fileNames';
        stringgrid1.Cells[17,0] := 'receiptNum';
        stringgrid1.Cells[18,0] := 'requestNum';
        stringgrid1.Cells[19,0] := 'chargePageCnt';
        stringgrid1.Cells[20,0] := 'tiffFileSize';
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
        { �˺�(www.popbill.com)�� �α��ε� �˾� URL�� ��ȯ�մϴ�.           
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/fax/delphi/api#GetAccessURL
        {**********************************************************************}

        try
                resultURL := faxService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL :  ' + #13 + resultURL);
end;

procedure TfrmExample.btnJoinMemberClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin

        {**********************************************************************}
        { ��Ʈ���� ����ȸ������ ȸ�������� ��û�մϴ�.                      
        { - ���̵� �ߺ�Ȯ���� btnCheckIDClick ���ν����� �����Ͻñ� �ٶ��ϴ�.
        { - https://docs.popbill.com/fax/delphi/api#JoinMember 
        {**********************************************************************}

        // ��ũ���̵�
        joinInfo.LinkID := LinkID;

        // ����ڹ�ȣ '-' ����, 10�ڸ�
        joinInfo.CorpNum := '4364364364';

        // ��ǥ�ڼ���, �ִ� 100��
        joinInfo.CEOName := '��ǥ�ڼ���';

        // ��ȣ��, �ִ� 200��
        joinInfo.CorpName := '��ũ���';

        // �ּ�, �ִ� 300��
        joinInfo.Addr := '�ּ�';

        // ����, �ִ� 100��
        joinInfo.BizType := '����';

        // ����, �ִ� 100��
        joinInfo.BizClass := '����';

        // ���̵�, 6���̻� 50�� �̸�
        joinInfo.ID     := 'userid';

        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';

        // ����ڸ�, �ִ� 100��
        joinInfo.ContactName := '����ڸ�';

        // ����� ����ó, �ִ� 20��
        joinInfo.ContactTEL :='070-4304-2991';

        // ����� �޴�����ȣ, �ִ� 20��
        joinInfo.ContactHP := '010-000-1111';

        // ����� �ѽ���ȣ, �ִ� 20��
        joinInfo.ContactFAX := '02-6442-9700';

        // ����� ����, �ִ� 100��
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := faxService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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
        { ����ȸ���� �ܿ�����Ʈ�� Ȯ���մϴ�.
        { - ���ݹ���� ���������� �ƴ� ��Ʈ�ʰ����� ��� ��Ʈ�� �ܿ�����Ʈ
        {   Ȯ��(GetPartnerBalance API) ��� �̿��Ͻñ� �ٶ��ϴ�
        { - https://docs.popbill.com/fax/delphi/api#GetBalance
        {**********************************************************************}
        
        try
                balance := faxService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { �ѽ� ���۴ܰ��� Ȯ���մϴ�.
        { - https://docs.popbill.com/fax/delphi/api#GetUnitCost
        {**********************************************************************}
        
        try
                unitcost := faxService.GetUnitCost(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);
        end
        else
        begin
                ShowMessage('FAX ���۴ܰ� : '+ FloatToStr(unitcost));
        end;

end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ��Ʈ���� �ܿ�����Ʈ�� Ȯ���մϴ�. ���ݹ���� ��Ʈ�ʰ����� �ƴ�
        { - ���������� ��� ����ȸ�� �ܿ�����Ʈ Ȯ��(GetBalance API)��
        { �̿��Ͻñ� �ٶ��ϴ�
        { - https://docs.popbill.com/fax/delphi/api#GetPartnerBalance 
        {**********************************************************************}
        
        try
                balance := faxService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
end;

procedure TfrmExample.btnSendFax_singleClick(Sender: TObject);
var
        filePath, receiptNum, senderNum, senderName, receiverNum, receiverName,
        title, requestNum : string;
        adsYN : Boolean;
begin
        {***************************************************************************}
        { �ѽ� ������ ��û�մϴ�.
        { - �˺��� ������ϵ��� ���� �߽Ź�ȣ�� ������ ��� �˺� ���� �߽Ź�ȣ��
        {   �ѽ��� ���� �˴ϴ�.
        { - https://docs.popbill.com/fax/delphi/api#SendFAX
        {***************************************************************************}

        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        // �߽Ź�ȣ
        senderNum := '07043042992';

        // �߽��ڸ�
        senderName := '�߽��ڸ�';

        // �����ѽ���ȣ
        receiverNum := '070111222';

        // �����ڸ�
        receiverName := '�����ڸ�';

        // �����ѽ� ���ۿ���
        adsYN := False;

        // �ѽ�����
        title := '�ѽ� �ܰ����� ����';

        // ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
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
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ(receiptNum) :' + receiptNum);
        end;

end;

procedure TfrmExample.btnCancelReserveClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { �ѽ� �������۰��� ����մϴ�.
        { - ������Ҵ� �ѽ���ȯ ���� �����մϴ�.
        { - https://docs.popbill.com/fax/delphi/api#CancelReserve                               
        {**********************************************************************}

        try
                response := faxService.CancelReserve(txtCorpNum.Text, txtReceiptNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnSendThousandSameClick(Sender: TObject);
var
        receiptNum, filePath, senderNum, senderName, title, requestNum : String;
        adsYN : Boolean;
        receivers : TReceiverList;
        i :Integer;
begin
        {***************************************************************************}
        { [��������] �ѽ� ������ ��û�մϴ�.
        { - �˺��� ������ϵ��� ���� �߽Ź�ȣ�� ������ ��� �˺� ���� �߽Ź�ȣ��
        {   �ѽ��� ���� �˴ϴ�.
        { - https://docs.popbill.com/fax/delphi/api#SendFAX_Same
        {***************************************************************************}

        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        // �߽Ź�ȣ
        senderNum := '07043042992';

        // �߽��ڸ�
        senderName := '�߽��ڸ�';

        // �����ѽ� ���ۿ���
        adsYN := False;

        // �ѽ�����
        title := '�������� �ѽ����� ����';

        // ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
        requestNum := txtRequestNum.text;

        // ������ �����迭, �ִ� 1000��
        SetLength(receivers,5);
        for i :=0 to Length(receivers) -1 do begin
                receivers[i] := TReceiver.create;
                receivers[i].receiveNum := '070111222';                    //���Ź�ȣ
                receivers[i].receiveName := IntToStr(i) + '��° ������';   //�����ڸ�
        end;

        try
                receiptNum := faxService.SendFAX(txtCorpNum.Text, senderNum,
                                                 senderName, receivers,
                                                 filePath, txtReserveDT.Text,
                                                 txtUserID.Text, adsYN,
                                                 title, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ(receiptNum) :' + receiptNum);
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
        { �ѽ����ۿ�û�� �߱޹��� ������ȣ(receiptNum)�� ���۰���� Ȯ���մϴ�
        { - https://docs.popbill.com/fax/delphi/api#GetSendDetail
        {**********************************************************************}

        try
                FaxDetails := faxService.getSendDetail(txtCorpNum.Text,
                                        txtReceiptNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);                
        end
        else
        begin
        
        stringgrid1.RowCount := Length(FaxDetails) + 1;                                          

        for i:= 0 to Length(FaxDetails) -1 do begin

               // ���ۻ��� �ڵ�
               stringgrid1.Cells[0,i+1]  := IntToStr(FaxDetails[i].state);

               // ���۰�� �ڵ�
               stringgrid1.Cells[1,i+1]  := IntToStr(FaxDetails[i].result);

               //�߽Ź�ȣ
               stringgrid1.Cells[2,i+1]  := FaxDetails[i].sendNum;

               //�߽��ڸ�
               stringgrid1.Cells[3,i+1]  := FaxDetails[i].senderName;

               //���Ź�ȣ
               stringgrid1.Cells[4,i+1]  := FaxDetails[i].receiveNum;

               //�����ڸ�
               stringgrid1.Cells[5,i+1]  := FaxDetails[i].receiveName;

               //�ѽ�����
               stringgrid1.Cells[6,i+1]  := FaxDetails[i].title;

               //��ü ��������
               stringgrid1.Cells[7,i+1]  := IntToStr(FaxDetails[i].sendPageCnt);

               //���� ��������
               stringgrid1.Cells[8,i+1]  := IntToStr(FaxDetails[i].successPageCnt);

               //���� ��������
               stringgrid1.Cells[9,i+1]  := IntToStr(FaxDetails[i].failPageCnt);

               //ȯ�� ��������
               stringgrid1.Cells[10,i+1] := IntToStr(FaxDetails[i].refundPageCnt);

               //��� ��������
               stringgrid1.Cells[11,i+1] := IntToStr(FaxDetails[i].cancelPageCnt);

               //����ð�
               stringgrid1.Cells[12,i+1] := FaxDetails[i].reserveDT;

               //�����ð�
               stringgrid1.Cells[13,i+1] := FaxDetails[i].receiptDT;

               //�߼۽ð�
               stringgrid1.Cells[14,i+1] := FaxDetails[i].sendDT;

               //���۰�� ���Žð�
               stringgrid1.Cells[15,i+1] := FaxDetails[i].resultDT;

               //���� ���ϸ� ����Ʈ
               fileNameList := '';

               for j:= 0 to length(FaxDetails[i].fileNames) -1 do begin
                        if j = length(FaxDetails[i].fileNames) -1 then
                                fileNameList := fileNameList +FaxDetails[i].fileNames[j]
                        else
                                fileNameList := fileNameList +FaxDetails[i].fileNames[j] + ', '
               end ;
               stringgrid1.Cells[16,i+1] := fileNameList;

               //������ȣ
               stringgrid1.Cells[17,i+1] := FaxDetails[i].receiptNum;

               //��û��ȣ
               stringgrid1.Cells[18,i+1] := FaxDetails[i].requestNum;

               //���� ��������
               stringgrid1.Cells[19,i+1] := IntToStr(FaxDetails[i].chargePageCnt);

               //��ȯ���Ͽ뷮(����:byte)
               stringgrid1.Cells[20,i+1] := FaxDetails[i].tiffFileSize + 'byte';
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
        { �ѽ� ������ ��û�մϴ�. (������ ���� ������ �ִ� 20������ ����)
        { - �˺��� ������ϵ��� ���� �߽Ź�ȣ�� ������ ��� �˺� ���� �߽Ź�ȣ��
        {   �ѽ��� ���� �˴ϴ�.
        { - https://docs.popbill.com/fax/delphi/api#SendFAX_Multi_Same
        {***************************************************************************}

        //�ѽ����� ���ϰ�� �迭, �ִ� 20��
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

        // �߽Ź�ȣ
        sendNum := '07043042992';

        // �߽��ڸ�
        senderName := '�߽��ڸ�';

        // �����ѽ� ���ۿ���
        adsYN := False;

        // �ѽ�����
        title := '�������� ���� ����';

        // ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
        requestNum := txtRequestNum.text;

        // ���������迭 �ִ� 1000��
        SetLength(receivers,5);

        for i := 0 to Length(receivers) - 1 do begin
                receivers[i] := TReceiver.create;
                receivers[i].receiveNum := '070111222';                   //�����ѽ���ȣ
                receivers[i].receiveName := IntToStr(i) + '��° ������';  //�����ڸ�
        end;

        try
                receiptNum := faxService.SendFAX(txtCorpNum.Text, sendNum,
                                                 senderName, receivers,
                                                 filePaths, txtReserveDT.Text,
                                                 txtUserID.Text, adsYN,
                                                 title, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ(receiptNum) :' + receiptNum);
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
        { �ѽ� ������ ��û�մϴ�. (������ ���� ������ �ִ� 20������ ����)
        { - �˺��� ������ϵ��� ���� �߽Ź�ȣ�� ������ ��� �˺� ���� �߽Ź�ȣ��
        {   �ѽ��� ���� �˴ϴ�.
        { - https://docs.popbill.com/fax/delphi/api#SendFAX_Multi           
        {***************************************************************************}

        // �ѽ��������� ��� �迭, �ִ� 20��
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

        // �߽Ź�ȣ
        senderNum := '07043042992';

        // �߽��ڸ�
        senderName := '�߽��ڸ�';

        // �����ѽ���ȣ
        receiverNum := '070111222';

        // �����ڸ�
        receiverName := '�����ڸ�';

        // �����ѽ� ���ۿ���
        adsYN := False;

        // �ѽ�����
        title := '�������� ���� ����';

        // ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
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
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ(receiptNum) :' + receiptNum);
        end;
end;

procedure TfrmExample.btnGetSentListURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { �ѽ� ���۳��� �˾� URL ��ȯ�մϴ�.
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/fax/delphi/api#GetSentListURL
        {**********************************************************************}

        try
                resultURL := faxService.getSentListURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);
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
        { ȸ������(JoinMember API)�� ȣ���ϱ� �� ���̵� �ߺ��� Ȯ���մϴ�.
        { - https://docs.popbill.com/fax/delphi/api#CheckID
        {**********************************************************************}
        
        try
                response := faxService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { ����ȸ���� ����ڸ� �űԷ� ����մϴ�.
        { - https://docs.popbill.com/fax/delphi/api#RegistContact
        {**********************************************************************}

        // [�ʼ�] ����� ���̵� (6�� �̻� 50�� �̸�)
        joinInfo.id := 'testkorea';

        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';

        // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 100�� �̳�)
        joinInfo.personName := '����ڼ���';

        // [�ʼ�] ����ó (�ִ� 20��)
        joinInfo.tel := '070-4304-2991';

        // �޴�����ȣ (�ִ� 20��)
        joinInfo.hp := '010-1111-2222';

        // �ѽ���ȣ (�ִ� 20��)
        joinInfo.fax := '02-6442-9700';

        // [�ʼ�] �̸��� (�ִ� 100��)
        joinInfo.email := 'test@test.com';

        // ����� ��ȸ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        joinInfo.searchRole := '3';

        try
                response := faxService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnLitContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ����ȸ���� ����� ����� Ȯ���մϴ�.
        { - https://docs.popbill.com/fax/delphi/api#ListContact
        {**********************************************************************}

        try
                InfoList := faxService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        tmp := 'id(���̵�) | email(�̸���) | hp(�޴���) | personName(����) | searchRole(����� ��ȸ ����) | ';
        tmp := tmp + 'tel(����ó) | fax(�ѽ�) | mgrYN(������ ����) | regDT(����Ͻ�) | state(����)' + #13;

        for i := 0 to Length(InfoList) - 1 do
        begin
            tmp := tmp + InfoList[i].id + ' | ';
            tmp := tmp + InfoList[i].email + ' | ';
            tmp := tmp + InfoList[i].hp + ' | ';
            tmp := tmp + InfoList[i].personName + ' | ';
            tmp := tmp + InfoList[i].searchRole + ' | ';
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
        { ����ȸ���� ����� ������ �����մϴ�.                                 
        { - https://docs.popbill.com/fax/delphi/api#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // ����� ���̵�
        contactInfo.id := 'testkorea';

        // ����ڸ� (�ִ� 100��)
        contactInfo.personName := '�׽�Ʈ �����';

        // ����ó (�ִ� 20��)
        contactInfo.tel := '070-4304-2991';

        // �޴�����ȣ (�ִ� 20��)
        contactInfo.hp := '010-4324-1111';

        // �̸��� �ּ� (�ִ� 100��)
        contactInfo.email := 'test@test.com';

        // �ѽ���ȣ (�ִ� 20��)
        contactInfo.fax := '02-6442-9799';

        // ����� ��ȸ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        contactInfo.searchRole := '3';


        try
                response := faxService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� Ȯ���մϴ�.
        { - https://docs.popbill.com/fax/delphi/api#GetCorpInfo
        {**********************************************************************}
        
        try
                corpInfo := faxService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName (��ȣ) : ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName (��ǥ�� ����) : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType (����) : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass (����) : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr (�ּ�) : ' + corpInfo.Addr + #13;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� �����մϴ�.
        { - https://docs.popbill.com/fax/delphi/api#UpdateCorpInfos
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // ��ǥ�ڸ�, �ִ� 100��
        corpInfo.ceoname := '��ǥ�ڸ�';

        // ��ȣ, �ִ� 200��
        corpInfo.corpName := '��ȣ';

        // ����, �ִ� 100��
        corpInfo.bizType := '����';

        // ����, �ִ� 100��
        corpInfo.bizClass := '����';

        // �ּ�, �ִ� 300��
        corpInfo.addr := '����Ư���� ������ ������� 517';

        try
                response := faxService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ��Ʈ���� ����ȸ������ ���Ե� ����ڹ�ȣ���� Ȯ���մϴ�.
        { - https://docs.popbill.com/fax/delphi/api#CheckIsMember 
        {**********************************************************************}

        try
                response := faxService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnGetChargeURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ���� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/fax/delphi/api#GetChargeURL
        {**********************************************************************}
        
        try
                resultURL := faxService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL :  ' + #13 + resultURL);
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
        { ��ȸ���ڿ� �����ǵ��� ����� �ѽ����۳����� ��ȸ�մϴ�.
        { - �ִ� �˻��Ⱓ : 6���� �̳�
        { - https://docs.popbill.com/fax/delphi/api#Search
        {**********************************************************************}

        // [�ʼ�] �˻��Ⱓ ��������, �ۼ�����(yyyyMMdd)
        SDate := '20210601';

        // [�ʼ�] �˻��Ⱓ ��������, �ۼ�����(yyyyMMdd)
        EDate := '20210615';

        // �ѽ����� ���°� �迭, 1:���, 2:����, 3:����, 4:���
        SetLength(State, 4);
        State[0] := '1';
        State[1] := '2';
        State[2] := '3';
        State[3] := '4';

        // �������� �˻�����, true-�������� ��ȸ, fasle-������� ��ȸ
        ReserveYN := false;

        // ������ȸ����, true-������ȸ, false-��ü��ȸ
        SenderYN := true;

        // ������ ��ȣ, �⺻�� 1
        Page := 1;

        // �������� �˻�����, �⺻�� 500
        PerPage := 100;

        // ���Ĺ���, D-��������, A-��������
        Order := 'D';

        // ��ȸ �˻���, �߽��ڸ� �Ǵ� �����ڸ� ����
        QString := '';

        try
                SearchList := faxService.search(txtCorpNum.text, SDate, EDate, State,
                                        ReserveYN, SenderYN, Page, PerPage, Order, QString, txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        tmp := 'code (�����ڵ�) : '+IntToStr(SearchList.code) + #13;
        tmp := tmp + 'total (�� �˻���� �Ǽ�) : '+ IntToStr(SearchList.total) + #13;
        tmp := tmp + 'perPage (�������� �˻�����) : '+ IntToStr(SearchList.perPage) + #13;
        tmp := tmp + 'pageNum (������ ��ȣ) : '+ IntToStr(SearchList.pageNum) + #13;
        tmp := tmp + 'pageCount (������ ����) : '+ IntToStr(SearchList.pageCount) + #13;
        tmp := tmp + 'message (����޽���) : '+ SearchList.message + #13#13;
        ShowMessage(tmp);

        stringgrid1.RowCount := Length(SearchList.list) + 1;

        for i:= 0 to Length(SearchList.list) - 1 do begin
               stringgrid1.Cells[0,i+1] := IntToStr(SearchList.list[i].state);          // ���ۻ��� �ڵ�
               stringgrid1.Cells[1,i+1] := IntToStr(SearchList.list[i].result);         // ���۰�� �ڵ�
               stringgrid1.Cells[2,i+1] := SearchList.list[i].sendNum;                  // �߽Ź�ȣ
               stringgrid1.Cells[3,i+1] := SearchList.list[i].senderName;               // �߽��ڸ�
               stringgrid1.Cells[4,i+1] := SearchList.list[i].receiveNum;               // ���Ź�ȣ
               stringgrid1.Cells[5,i+1] := SearchList.list[i].receiveName;              // �����ڸ�
               stringgrid1.Cells[6,i+1] := SearchList.list[i].title;                    // �ѽ�����
               stringgrid1.Cells[7,i+1] := IntToStr(SearchList.list[i].sendPageCnt);    // ��ü ��������
               stringgrid1.Cells[8,i+1] := IntToStr(SearchList.list[i].successPageCnt); // ���� ��������
               stringgrid1.Cells[9,i+1] := IntToStr(SearchList.list[i].failPageCnt);    // ���� ��������
               stringgrid1.Cells[10,i+1] := IntToStr(SearchList.list[i].refundPageCnt); // ȯ�� ��������
               stringgrid1.Cells[11,i+1] := IntToStr(SearchList.list[i].cancelPageCnt); // ��� ��������
               stringgrid1.Cells[12,i+1] := SearchList.list[i].reserveDT;               // ����ð�
               stringgrid1.Cells[13,i+1] := SearchList.list[i].receiptDT;               // �����û�
               stringgrid1.Cells[14,i+1] := SearchList.list[i].sendDT;                  // �߼۽ð�
               stringgrid1.Cells[15,i+1] := SearchList.list[i].resultDT;                // ���۰�� ���Žð�
               fileNameList := '';

               for j:= 0 to length(SearchList.list[i].fileNames) -1 do begin            // ���� ���ϸ� ����Ʈ
                        if j = length(SearchList.list[i].fileNames) -1 then
                                fileNameList := fileNameList +SearchList.list[i].fileNames[j]
                        else
                                fileNameList := fileNameList +SearchList.list[i].fileNames[j] + ', '
               end ;
               stringgrid1.Cells[16,i+1] := fileNameList;
               stringgrid1.Cells[17,i+1] := SearchList.list[i].receiptNum;              // ������ȣ
               stringgrid1.Cells[18,i+1] := SearchList.list[i].requestNum;              // ��û��ȣ
               stringgrid1.Cells[19,i+1] := IntToStr(SearchList.list[i].chargePageCnt); // ���� ��������
               stringgrid1.Cells[20,i+1] := SearchList.list[i].tiffFileSize + 'byte';   // ��ȯ���Ͽ뷮 (����: byte)
        end;
        SearchList.Free;
end;

procedure TfrmExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : TFaxChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { ����ȸ���� �ѽ� API ���� ���������� Ȯ���մϴ�.
        { - https://docs.popbill.com/fax/delphi/api#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := faxService.GetChargeInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnResendFaxClick(Sender: TObject);
var
        receiptNum, senderNum, senderName, receiverNum, receiverName, title,
        requestNum : String;
begin
        {***************************************************************************}
        { �߱޹��� ������ȣ(receiptNum)�� �ѽ� �������� ��û�մϴ�.
        { - �����Ϸκ��� 60���� ������� ���� ���۰Ǹ� �������� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/fax/delphi/api#ResendFAX
        {***************************************************************************}

        //�߽Ź�ȣ, ����ó���� �����߼������� ����
        senderNum := '';

        //�߽��ڸ�, ����ó���� �����߼������� ����
        senderName := '';

        // �����ѽ���ȣ, ����ó���� �����߼������� ����
        receiverNum := '';

        // �����ڸ�, ����ó���� �����߼������� ����
        receiverName := '';

        // �ѽ�����
        title := '�ѽ� ������ ����';

        // ������ �ѽ��� ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
        // ������ �ѽ��� ���ۻ���Ȯ��(GetSendDetailRN) / �����������(CancelReserveRN) �� �̿�˴ϴ�.
        requestNum := '';

        try
                receiptNum := faxService.ResendFAX(txtCorpNum.Text, txtReceiptNum.Text,
                                                   senderNum, senderName,
                                                   receiverNum, receiverName,
                                                   txtReserveDT.Text, txtUserID.text,
                                                   title, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ(receiptNum) :' + receiptNum);
        end;
end;

procedure TfrmExample.btnResendFaxSameClick(Sender: TObject);
var
        receiptNum, senderNum, senderName, title, requestNum : String;
        receivers : TReceiverList;
        i : Integer;
begin
        {***************************************************************************}
        { �߱޹��� ������ȣ(receiptNum)�� �ѽ� �������� ��û�մϴ�.
        { - �����Ϸκ��� 60���� ������� ���� ���۰Ǹ� �������� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/fax/delphi/api#ResendFAX_Same
        {***************************************************************************}

        // �߽Ź�ȣ, ����ó���� �����߼������� ����
        senderNum := '';

        // �߽��ڸ�, ����ó���� �����߼������� ����
        senderName := '';

        // �ѽ�����
        title := '�ѽ� ������ �������� ����';

        // ������ �ѽ��� ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
        requestNum := '';

        // ������ ������ ���� �ѽ� ���������� �����ϰ� �����ϴ� ���
        // �Ʒ� �ڵ�� ���� receviers �迭�� ���̸� 0���� �����Ͽ� �Լ� ȣ��
        //SetLength(receivers, 0);

        // ������ ������ �������������� �ٸ� ��� ���������迭�� ����
        // ���������迭 �ִ� 1000��
        SetLength(receivers,10);

        for i := 0 to Length(receivers) - 1 do begin
                receivers[i] := TReceiver.create;
                receivers[i].receiveNum := '01000011'+IntToStr(i);       //�����ѽ���ȣ
                receivers[i].receiveName := IntToStr(i)+ ' ��° �����'; //�����ڸ�
        end;

        try
                receiptNum := faxService.ResendFAX(txtCorpNum.Text, txtReceiptNum.Text,
                                                   senderNum, senderName, receivers, txtReserveDT.
                                                   Text, txtUserID.Text, title, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ(receiptNum) :' + receiptNum);
        end;
end;

procedure TfrmExample.btnGetSenderNumberListClick(Sender: TObject);
var
        SenderNumberList : TFAXSenderNumberList;
        tmp : String;
        i : Integer;
begin
        {**********************************************************************}
        { �˺��� ��ϵ� �ѽ� �߽Ź�ȣ ����� ��ȸ�մϴ�
        { - https://docs.popbill.com/fax/delphi/api#GetSenderNumberList
        {**********************************************************************}

        try
             SenderNumberList := faxService.getSenderNumberList(txtCorpNum.Text);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);
        end
        else
        begin
                for i := 0 to Length(SenderNumberList) -1 do
                begin
                        tmp := tmp + '******** �ѽ� �߽Ź�ȣ ��� ['+ IntToStr(i+1) + '] ********' + #13;
                        tmp := tmp + 'number(�߽Ź�ȣ) : ' + SenderNumberList[i].number + #13;
                        tmp := tmp + 'state(��ϻ���) : ' + IntToStr(SenderNumberList[i].state) + #13;
                        tmp := tmp + 'representYN(��ǥ��ȣ ��������) : ' + BoolToStr(SenderNumberList[i].representYN) + #13 + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetSenderNumberMgtURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { �ѽ� �߽Ź�ȣ ���� �˾� URL ��ȯ�մϴ�.
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/fax/delphi/api#GetSenderNumberMgtURL
        {**********************************************************************}

        try
                resultURL := faxService.getSenderNumberMgtURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);
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
        { ��Ʈ�� ����Ʈ ���� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/fax/delphi/api#GetPartnerURL
        {**********************************************************************}
        
        try
                resultURL := faxService.getPartnerURl(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL :  ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetMessageRNClick(Sender: TObject);
var
        FaxDetails : TFaxDetailList;
        i :integer;
        j : integer;
        fileNameList : String;
begin
        {**********************************************************************}
        { �ѽ����۽� �Ҵ��� ���ۿ�û��ȣ(requestNum)���� ���۰���� Ȯ���մϴ�               
        { - https://docs.popbill.com/fax/delphi/api#GetSendDetailRN
        {**********************************************************************}

        try
                FaxDetails := faxService.getSendDetailRN(txtCorpNum.Text,
                                                         txtRequestNum.Text,
                                                         txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);
        end
        else
        begin
        
        stringgrid1.RowCount := Length(FaxDetails) + 1;

        for i:= 0 to Length(FaxDetails) -1 do begin

               // ���ۻ��� �ڵ�
               stringgrid1.Cells[0,i+1]  := IntToStr(FaxDetails[i].state);

               // ���۰�� �ڵ�
               stringgrid1.Cells[1,i+1]  := IntToStr(FaxDetails[i].result);

               //�߽Ź�ȣ
               stringgrid1.Cells[2,i+1]  := FaxDetails[i].sendNum;

               //�߽��ڸ�
               stringgrid1.Cells[3,i+1]  := FaxDetails[i].senderName;

               //���Ź�ȣ
               stringgrid1.Cells[4,i+1]  := FaxDetails[i].receiveNum;

               //�����ڸ�
               stringgrid1.Cells[5,i+1]  := FaxDetails[i].receiveName;

               //�ѽ�����
               stringgrid1.Cells[6,i+1]  := FaxDetails[i].title;

               //��ü ��������
               stringgrid1.Cells[7,i+1]  := IntToStr(FaxDetails[i].sendPageCnt);

               //���� ��������
               stringgrid1.Cells[8,i+1]  := IntToStr(FaxDetails[i].successPageCnt);

               //���� ��������
               stringgrid1.Cells[9,i+1]  := IntToStr(FaxDetails[i].failPageCnt);

               //ȯ�� ��������
               stringgrid1.Cells[10,i+1] := IntToStr(FaxDetails[i].refundPageCnt);

               //��� ��������
               stringgrid1.Cells[11,i+1] := IntToStr(FaxDetails[i].cancelPageCnt);

               //����ð�
               stringgrid1.Cells[12,i+1] := FaxDetails[i].reserveDT;

               //�����ð�
               stringgrid1.Cells[13,i+1] := FaxDetails[i].receiptDT;

               //�߼۽ð�
               stringgrid1.Cells[14,i+1] := FaxDetails[i].sendDT;

               //���۰�� ���Žð�
               stringgrid1.Cells[15,i+1] := FaxDetails[i].resultDT;

               //���� ���ϸ� ����Ʈ
               fileNameList := '';

               for j:= 0 to length(FaxDetails[i].fileNames) -1 do begin
                        if j = length(FaxDetails[i].fileNames) -1 then
                                fileNameList := fileNameList +FaxDetails[i].fileNames[j]
                        else
                                fileNameList := fileNameList +FaxDetails[i].fileNames[j] + ', '
               end ;
               stringgrid1.Cells[16,i+1] := fileNameList;

               //������ȣ
               stringgrid1.Cells[17,i+1] := FaxDetails[i].receiptNum;

               //��û��ȣ
               stringgrid1.Cells[18,i+1] := FaxDetails[i].requestNum;

               //���� ��������
               stringgrid1.Cells[19,i+1] := IntToStr(FaxDetails[i].chargePageCnt);

               //��ȯ���Ͽ뷮(����:byte)
               stringgrid1.Cells[20,i+1] := FaxDetails[i].tiffFileSize + 'byte';
        end;
        end;
end;

procedure TfrmExample.btnCancelReserveRNClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { �ѽ����۽� �Ҵ��� ���ۿ�û��ȣ(requestNum)�� �ѽ� �������۰��� ����մϴ�.
        { - ������Ҵ� �ѽ���ȯ ���� �����մϴ�.
        { - https://docs.popbill.com/fax/delphi/api#CancelReserveRN
        {**********************************************************************}

        try
                response := faxService.CancelReserveRN(txtCorpNum.Text, txtRequestNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
end;

procedure TfrmExample.btnResendFaxRNClick(Sender: TObject);
var
        receiptNum, senderNum, senderName, receiverNum, receiverName, title,
        originalFAXrequestNum, requestNum : String;
begin
        {**********************************************************************}
        { ���ۿ�û��ȣ(requestNum)�� �Ҵ��� �ѽ��� �������մϴ�.                    
        { - �����Ϸκ��� 60���� ������� ���� ���۰Ǹ� �������� �� �ֽ��ϴ�.
        { - �߽�/���������� �������� ó���ϴ� ��� ���� �ѽ�����������
        {   �����ϰ� �ѽ��� ���۵˴ϴ�.
        { - https://docs.popbill.com/fax/delphi/api#ResendFAXRN
        {**********************************************************************}

        //�߽Ź�ȣ, ����ó���� �����߼������� ����
        senderNum := '';

        //�߽��ڸ�, ����ó���� �����߼������� ����
        senderName := '';

        // �����ѽ���ȣ, ����ó���� �����߼������� ����
        receiverNum := '';

        // �����ڸ�, ����ó���� �����߼������� ����
        receiverName := '';

        // �ѽ�����
        title := '�ѽ� ������ ����';

        // ���� �ѽ� ���۽� �Ҵ��� ���ۿ�û��ȣ (requestNum)
        originalFAXrequestNum := '';

        // ������ �ѽ��� ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�
        requestNum := txtRequestNum.Text;

        try
                receiptNum := faxService.ResendFAXRN(txtCorpNum.Text, requestNum,
                        senderNum, senderName, receiverNum, receiverName, txtReserveDT.Text,
                        originalFAXrequestNum, txtUserID.text, title);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ(receiptNum) :' + receiptNum);
        end;
end;

procedure TfrmExample.btnResendFaxSameRNClick(Sender: TObject);
var
        receiptNum, senderNum, senderName, title, originalFAXrequestNum, requestNum : String;
        receivers : TReceiverList;
        i : Integer;
begin
        {**********************************************************************}
        { ���ۿ�û��ȣ(requestNum)�� �Ҵ��� �ѽ��� �������մϴ�.
        { - �����Ϸκ��� 60���� ������� ���� ���۰Ǹ� �������� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/fax/delphi/api#ResendFAXRN_Same           
        {**********************************************************************}

        // �߽Ź�ȣ, ����ó���� �����߼������� ����
        senderNum := '';

        // �߽��ڸ�, ����ó���� �����߼������� ����
        senderName := '';

        // �ѽ�����
        title := '�ѽ� ������ �������� ����';

        // ���� �ѽ� ���۽� �Ҵ��� ���ۿ�û��ȣ (requestNum)
        originalFAXrequestNum := '';

        // ������ �ѽ��� ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
        // ������ �ѽ��� ���ۻ���Ȯ��(GetSendDetailRN) / �����������(CancelReserveRN) �� �̿�˴ϴ�.
        requestNum := txtRequestNum.text;

        // ������ ������ ���� �ѽ� ���������� �����ϰ� �����ϴ� ���
        // �Ʒ� �ڵ�� ���� receviers �迭�� ���̸� 0���� �����Ͽ� �Լ� ȣ��
        //SetLength(receivers, 0);

        // ������ ������ �������������� �ٸ� ��� ���������迭�� ����
        // ���������迭 �ִ� 1000��
        SetLength(receivers,10);

        for i := 0 to Length(receivers) - 1 do begin
                receivers[i] := TReceiver.create;
                receivers[i].receiveNum := '01000011'+IntToStr(i);       //�����ѽ���ȣ
                receivers[i].receiveName := IntToStr(i)+ ' ��° �����'; //�����ڸ�
        end;

        try
                receiptNum := faxService.ResendFAXRN(txtCorpNum.Text, requestNum,
                        senderNum, senderName, receivers, txtReserveDT.Text,
                        originalFAXrequestNum, txtUserID.Text, title);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ(receiptNum) :' + receiptNum);
        end;
end;

procedure TfrmExample.btnGetPreviewURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { �ѽ� �̸����� URL�� ��ȯ�մϴ�.           
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/fax/delphi/api#GetPreviewURL
        {**********************************************************************}

        try
                resultURL := faxService.getPreviewURL(txtCorpNum.Text, txtReceiptNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;


        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);
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
        { ����ȸ�� ����Ʈ �������� �˾� URL�� ��ȯ�Ѵ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/fax/delphi/api#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := faxService.getPaymentURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL :  ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetUseHistoryURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ��볻�� �˾� URL�� ��ȯ�Ѵ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/fax/delphi/api#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := faxService.getUseHistoryURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL :  ' + #13 + resultURL);

end;

procedure TfrmExample.btnGetContactInfoClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        contactID : string;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� ����� ������ Ȯ���Ѵ�.
        { - https://docs.popbill.com/fax/delphi/api#GetContactInfo
        {**********************************************************************}

        contactID := 'testkorea';
        
        try
                contactInfo := faxService.getContactInfo(txtCorpNum.Text, contactID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if faxService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(faxService.LastErrCode) + #10#13 +'����޽��� : '+ faxService.LastErrMessage);
        end
        else
        begin
                tmp := 'id (���̵�) : ' + contactInfo.id + #13;
                tmp := tmp + 'personName (����� ����) : ' + contactInfo.personName + #13;
                tmp := tmp + 'tel (����� ����ó(��ȭ��ȣ)) : ' + contactInfo.tel + #13;
                tmp := tmp + 'hp (����� �޴�����ȣ) : ' + contactInfo.hp + #13;
                tmp := tmp + 'fax (����� �ѽ���ȣ) : ' + contactInfo.fax + #13;
                tmp := tmp + 'email (����� �̸���) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (��� �Ͻ�) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (����� ��ȸ����) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (������ ����) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (��������) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

end.


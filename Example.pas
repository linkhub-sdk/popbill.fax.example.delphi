unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillFax, ExtCtrls, Grids;

const
        // ��ũ���̵�.
        LinkID = 'TESTER';
        // ��Ʈ�� ��ſ� ���Ű. ���� ����.
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
    btnGetPartnerBalance: TButton;
    btnGetBalance: TButton;
    btnCheckID: TButton;
    btnCheckIsMember: TButton;
    btnLitContact: TButton;
    btnUpdateContact: TButton;
    GroupBox1: TGroupBox;
    btnRegistContact: TButton;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    btnGetPopbillURL_CHRG: TButton;
    btnSearch: TButton;
    procedure btnGetPopBillURL_LOGINClick(Sender: TObject);
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
    procedure btnCheckIDClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnLitContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnCheckIsMemberClick(Sender: TObject);
    procedure btnGetPopbillURL_CHRGClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
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
        
        //����ȯ�� ������, true(�׽�Ʈ��), false(�����)
        faxService.IsTest := true;

        //Exception ó�� ������, true(�⺻��)
        faxService.IsThrowException := true;
        
        //�׸��� �ʱ�ȭ
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
        stringgrid1.Cells[14,0] := 'fileNames';        
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
        try
                resultURL := faxService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,'LOGIN');
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
        joinInfo.LinkID := LinkID; //��ũ���̵�
        joinInfo.CorpNum := '1231212312'; //����ڹ�ȣ '-' ����.
        joinInfo.CEOName := '��ǥ�ڼ���';
        joinInfo.CorpName := '��ȣ';
        joinInfo.Addr := '�ּ�';
        joinInfo.ZipCode := '500-100';
        joinInfo.BizType := '����';
        joinInfo.BizClass := '����';
        joinInfo.ID     := 'userid';  //6�� �̻� 20�� �̸�.
        joinInfo.PWD    := 'pwd_must_be_long_enough'; //6�� �̻� 20�� �̸�.
        joinInfo.ContactName := '����ڸ�';
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

        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));

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

        ShowMessage('FAX ���۴ܰ� : '+ FloatToStr(unitcost));
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

        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));

end;


procedure TfrmExample.btnSendFax_singleClick(Sender: TObject);
var
        filePath : string;
        receiptNum : String;
        senderNum : String;
        receiverNum : String;
        receiverName : string;
begin
        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;
        
        senderNum := '07075103710';     //�߽Ź�ȣ
        receiverNum := '070111222';     //���Ź�ȣ
        receiverName := '�����ڸ�';     //�����ڸ�

        try
                receiptNum := faxService.SendFAX(txtCorpNum.Text, senderNum, receiverNum, receiverName, filePath,txtReserveDT.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        txtReceiptNum.Text := receiptNum;


        ShowMessage('������ȣ :' + receiptNum);



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
        ShowMessage('ó����� : ' + IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnSendThousandSameClick(Sender: TObject);
var
        receiptNum :String;
        filePath : string;
        senderNum : string;
        receivers : TReceiverList;
        i :Integer;
begin
        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        senderNum := '07075103710';     // �߽Ź�ȣ

        // ������ �����迭, �ִ� 1000�� 
        SetLength(receivers,5);
        for i :=0 to Length(receivers) -1 do begin
                receivers[i] := TReceiver.create;

                receivers[i].receiveNum := '070111222';         //���Ź�ȣ
                receivers[i].receiveName := IntToStr(i) + '��° ������';        //�����ڸ�
        end;

        try
                receiptNum := faxService.SendFAX(txtCorpNum.Text,senderNum,receivers,filePath,txtReserveDT.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        txtReceiptNum.Text := receiptNum;

        ShowMessage('������ȣ :' + receiptNum);
end;

procedure TfrmExample.btnGetMessageClick(Sender: TObject);
var
        FaxDetails : TFaxDetailList;
        i :integer;
        j : integer;
        fileNameList : String;
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

               fileNameList := '';

               for j:= 0 to length(FaxDetails[i].fileNames) -1 do begin
                        if j = length(FaxDetails[i].fileNames) -1 then
                                fileNameList := fileNameList +FaxDetails[i].fileNames[j]
                        else
                                fileNameList := fileNameList +FaxDetails[i].fileNames[j] + ', '
               end ;
               
               stringgrid1.Cells[14,i+1] := fileNameList;
        end;
end;

procedure TfrmExample.btnMultiFileClick(Sender: TObject);
var
        receiptNum :String;
        sendNum : String;
        filePaths : Array Of string;
        receivers : TReceiverList;
        i :Integer;
begin
        //�ѽ����� ���ϰ�� �迭, �ִ� 5��
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

        sendNum := '07075103710';  //�ѽ� �߽Ź�ȣ

        // ���������迭 �ִ� 1000��
        SetLength(receivers,500);

        for i :=0 to Length(receivers) -1 do begin
                receivers[i] := TReceiver.create;

                receivers[i].receiveNum := '070111222';    //���Ź�ȣ
                receivers[i].receiveName := IntToStr(i) + '��° ������';    //�����ڸ�
        end;

        try
                receiptNum := faxService.SendFAX(txtCorpNum.Text,sendNum,receivers,filePaths,txtReserveDT.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        txtReceiptNum.Text := receiptNum;

        ShowMessage('������ȣ :' + receiptNum);
end;

procedure TfrmExample.btnMultiFileSingleClick(Sender: TObject);
var
        filePaths : Array Of string;
        receiptNum : String;
        senderNum : string;
        receiverNum : string;
        receiverName : string;
begin
        // �ѽ��������� ��� �迭, �ִ� 5��
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

        senderNum := '07075103710';     //�߽Ź�ȣ
        receiverNum := '070000111';     //���Ź�ȣ
        receiverName := '�����ڸ�';     //�����ڸ�

        try
                receiptNum := faxService.SendFAX(txtCorpNum.Text,senderNum,receiverNum,receiverName,filePaths,txtReserveDT.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        txtReceiptNum.Text := receiptNum;


        ShowMessage('������ȣ :' + receiptNum);



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


procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        try
                response := faxService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        joinInfo.id := 'userid';                        // [�ʼ�] ���̵� (6�� �̻� 20�� �̸�)
        joinInfo.pwd := 'thisispassword';               // [�ʼ�] ��й�ȣ (6�� �̻� 20�� �̸�)
        joinInfo.personName := '����ڼ���';            // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 30�� �̳�)
        joinInfo.tel := '070-7510-3710';                // [�ʼ�] ����ó
        joinInfo.hp := '010-1111-2222';                 // �޴�����ȣ
        joinInfo.fax := '02-6442-9700';                 // �ѽ���ȣ
        joinInfo.email := 'test@test.com';              // [�ʼ�] �̸���
        joinInfo.searchAllAllowYN := false;             // ��ȸ����(true ȸ����ȸ/ false ������ȸ)
        joinInfo.mgrYN     := false;                    // ������ ���ѿ���

        try
                response := faxService.RegistContact(txtCorpNum.text,joinInfo,txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnLitContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin

        try
                InfoList := faxService.ListContact(txtCorpNum.text,txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        tmp := 'id | email | hp | personName | searchAllAlloyYN | tel | fax | mgrYN | regDT' + #13;
        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].id + ' | ';
            tmp := tmp + InfoList[i].email + ' | ';
            tmp := tmp + InfoList[i].hp + ' | ';
            tmp := tmp + InfoList[i].personName + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].searchAllAllowYN) + ' | ';
            tmp := tmp + InfoList[i].tel + ' | ';
            tmp := tmp + InfoList[i].fax + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
            tmp := tmp + InfoList[i].regDT + #13;
        end;

        ShowMessage(tmp);
end;



procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        contactInfo := TContactInfo.Create;

        contactInfo.personName := '�׽�Ʈ �����';      // ����ڸ�
        contactInfo.tel := '070-7510-3710';             // ����ó
        contactInfo.hp := '010-4324-1111';              // �޴�����ȣ
        contactInfo.email := 'test@test.com';           // �̸��� �ּ�
        contactInfo.fax := '02-6442-9799';              // �ѽ���ȣ
        contactInfo.searchAllAllowYN := true;           // ȸ����ȸ ���ѿ���
        contactInfo.mgrYN := false;                     // ������ ��ȯ ���� 

        try
                response := faxService.UpdateContact(txtCorpNum.text,contactInfo,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        try
                corpInfo := faxService.GetCorpInfo(txtCorpNum.text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName : ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr : ' + corpInfo.Addr + #13;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        corpInfo := TCorpInfo.Create;

        corpInfo.ceoname := '��ǥ�ڸ�_����';            //��ǥ�ڸ�
        corpInfo.corpName := '�˺�_����';               // ȸ���
        corpInfo.bizType := '����';                     // ����
        corpInfo.bizClass := '����';                    // ����
        corpInfo.addr := '����Ư���� ������ ������� 517';  // �ּ�
        
        try
                response := faxService.UpdateCorpInfo(txtCorpNum.text,corpInfo,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        try
                response := faxService.CheckIsMember(txtCorpNum.text,LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnGetPopbillURL_CHRGClick(Sender: TObject);
var
        resultURL : String;
begin
        try
                resultURL := faxService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnSearchClick(Sender: TObject);
var
        SDate, EDate, tmp: String;
        Page, PerPage : Integer;
        State : Array Of String;
        ReserveYN, SenderYN : boolean;
        SearchList : TFaxSearchList;
        i : integer;
        j : integer;
        fileNameList : String;
begin

        SDate := '20151001';    // [�ʼ�] �˻��Ⱓ ��������, �ۼ�����(yyyyMMdd)
        EDate := '20151225';    // [�ʼ�] �˻��Ⱓ ��������, �ۼ�����(yyyyMMdd)

        SetLength(State, 4);    // �ѽ����� ���°� �迭, 1:���, 2:����, 3:����, 4:��� ex) State=1,2,4
        State[0] := '1';
        State[1] := '2';
        State[2] := '3';
        State[3] := '4';

        ReserveYN := false;   // �������� �˻�����, true-�������۰� �˻�
        SenderYN := true;    // ������ȸ����, true(������ȸ), false(ȸ����ȸ).

        Page := 1;           // ������ ��ȣ, �⺻�� 1
        PerPage := 10;       // �������� �˻�����, �⺻�� 500

        try
                SearchList := faxService.search(txtCorpNum.text,SDate,EDate,State,ReserveYN,SenderYN,Page,PerPage,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'code : '+IntToStr(SearchList.code) + #13;
        tmp := tmp + 'total : '+ IntToStr(SearchList.total) + #13;
        tmp := tmp + 'perPage : '+ IntToStr(SearchList.perPage) + #13;
        tmp := tmp + 'pageNum : '+ IntToStr(SearchList.pageNum) + #13;
        tmp := tmp + 'pageCount : '+ IntToStr(SearchList.pageCount) + #13;
        tmp := tmp + 'message : '+ SearchList.message + #13#13;

        ShowMessage(tmp);

        stringgrid1.RowCount := Length(SearchList.list) + 1;

        for i:= 0 to Length(SearchList.list) -1 do begin

               stringgrid1.Cells[0,i+1] := IntToStr(SearchList.list[i].sendState);
               stringgrid1.Cells[1,i+1] := IntToStr(SearchList.list[i].convState);
               stringgrid1.Cells[2,i+1] := SearchList.list[i].sendNum;
               stringgrid1.Cells[3,i+1] := SearchList.list[i].receiveNum;
               stringgrid1.Cells[4,i+1] := SearchList.list[i].receiveName;

               stringgrid1.Cells[5,i+1] := IntToStr(SearchList.list[i].sendPageCnt);
               stringgrid1.Cells[6,i+1] := IntToStr(SearchList.list[i].successPageCnt);
               stringgrid1.Cells[7,i+1] := IntToStr(SearchList.list[i].failPageCnt);
               stringgrid1.Cells[8,i+1] := IntToStr(SearchList.list[i].refundPageCnt);
               stringgrid1.Cells[9,i+1] := IntToStr(SearchList.list[i].cancelPageCnt);

               stringgrid1.Cells[10,i+1] := SearchList.list[i].reserveDT;
               stringgrid1.Cells[11,i+1] := SearchList.list[i].sendDT;
               stringgrid1.Cells[12,i+1] := SearchList.list[i].resultDT;
               stringgrid1.Cells[13,i+1] := IntToStr(SearchList.list[i].sendResult);

               fileNameList := '';

               for j:= 0 to length(SearchList.list[i].fileNames) -1 do begin
                        if j = length(SearchList.list[i].fileNames) -1 then
                                fileNameList := fileNameList +SearchList.list[i].fileNames[j]
                        else
                                fileNameList := fileNameList +SearchList.list[i].fileNames[j] + ', '
               end ;
               
               stringgrid1.Cells[14,i+1] := fileNameList;
        end;
end;

end.

program prjFaxExample;

uses
  Forms,
  Example in 'Example.pas' {frmExample},
  Linkhub in 'Linkhub\Linkhub.pas',
  Popbill in 'Popbill\Popbill.pas',
  PopbillFax in 'PopbillFax\PopbillFax.pas';

  {$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmExample, frmExample);
  Application.Run;
end.

program IBF;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  ufrmOdometro in 'ufrmOdometro.pas' {frmOdometro},
  uiVeiculo in 'uiVeiculo.pas',
  uVeiculo in 'uVeiculo.pas',
  ufrmBalcao in 'ufrmBalcao.pas' {frmBalcao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmBalcao, frmBalcao);
  Application.Run;
end.

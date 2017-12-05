unit ufrmOdometro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Spin, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask, uiVeiculo, uVeiculo, System.UITypes;

type
  TfrmOdometro = class(TForm)
    pnlPrincipal: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edtValorViagem: TEdit;
    Label7: TLabel;
    edtAutonomia: TEdit;
    Label10: TLabel;
    edtKmLitro: TEdit;
    Label9: TLabel;
    edtKmRodado: TEdit;
    Label8: TLabel;
    edtLitrosCombustivel: TEdit;
    Label4: TLabel;
    edtValorCombustivel: TEdit;
    edtCapacidadeTanque: TEdit;
    Label5: TLabel;
    btnCalcular: TButton;
    edtKmInicial: TEdit;
    edtKmFinal: TEdit;
    btnLimpar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCalcularClick(Sender: TObject);
    procedure edtKmInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtKmFinalKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparClick(Sender: TObject);
    procedure edtLitrosCombustivelKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorCombustivelKeyPress(Sender: TObject; var Key: Char);
    procedure edtCapacidadeTanqueKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    _Veiculo: TVeiculo;
    procedure Clear;
  public
    { Public declarations }
  end;

var
  frmOdometro: TfrmOdometro;

implementation

{$R *.dfm}

procedure TfrmOdometro.btnCalcularClick(Sender: TObject);
begin
  _Veiculo := TVeiculo.Create(StrToIntDef(edtKmInicial.Text ,0),
                              StrToIntDef(edtKmFinal.Text,0),
                              StrToCurrDef(edtLitrosCombustivel.Text,0),
                              StrToCurrDef(edtValorCombustivel.Text,0),
                              StrToCurrDef(edtCapacidadeTanque.Text,0));
  {$REGION 'valida edits'}
  if edtKmInicial.Text = EmptyStr then
  begin
    MessageDlg('Informe a Quilometragem inicial da viagem!',mtConfirmation,[mbok],1);
    edtKmInicial.SetFocus;
    Exit;
  end;

  if edtKmFinal.Text = EmptyStr then
  begin
    MessageDlg('Informe a Quilometragem final da viagem!',mtConfirmation,[mbok],1);
    edtKmFinal.SetFocus;
    Exit;
  end;

  if (StrToInt(edtKmInicial.Text) > StrToInt(edtKmFinal.Text)) then
  begin
    MessageDlg('Quilometragem final n�o pode ser inferior a in�cial!',mtConfirmation,[mbok],1);
    edtKmFinal.SetFocus;
    Exit;
  end;

  if edtKmInicial.Text = edtKmFinal.Text then
  begin
    MessageDlg('Quilometragem in�cial e final n�o podem ter o mesmo valor!',mtConfirmation,[mbok],1);
    edtKmInicial.SetFocus;
    Exit;
  end;

  if edtLitrosCombustivel.Text = EmptyStr then
  begin
    MessageDlg('Informe a quantidade de litros gasta!',mtConfirmation,[mbok],1);
    edtLitrosCombustivel.SetFocus;
    Exit;
  end;

  if edtValorCombustivel.Text = EmptyStr then
  begin
    MessageDlg('Informe o valor do litro do combust�vel!',mtConfirmation,[mbok],1);
    edtValorCombustivel.SetFocus;
    Exit;
  end;

  if edtCapacidadeTanque.Text = EmptyStr then
  begin
    MessageDlg('Informe a capacidade do tanque!',mtConfirmation,[mbok],1);
    edtCapacidadeTanque.SetFocus;
    Exit;
  end;

  if (StrToInt(edtKmInicial.Text) > StrToInt(edtKmFinal.Text)) then
  begin
    MessageDlg('Quilometragem final inferior a in�cial, informe um novo valor!',mtConfirmation,[mbok],1);
    edtKmFinal.SetFocus;
    Exit;
  end;
  {$REGION 'valida edits'}

  edtKmRodado.Text := FormatFloat(',0.00', _Veiculo.QuilometragemRodada) + ' Km';
  edtKmLitro.Text := FormatFloat(',0.00',_Veiculo.QuilometrosPorLitro)+ ' Km/L';
  edtAutonomia.Text := FormatFloat(',0.00',_Veiculo.Autonomia) + ' Km/L';
  edtValorViagem.Text := 'R$ ' + FormatFloat(',0.00',_Veiculo.CustoDaViagem);
end;

procedure TfrmOdometro.btnLimparClick(Sender: TObject);
begin
  Clear;
end;

procedure TfrmOdometro.Clear;
begin
  edtValorViagem.Clear;
  edtAutonomia.Clear;
  edtKmLitro.Clear;
  edtKmRodado.Clear;
  edtLitrosCombustivel.Clear;
  edtCapacidadeTanque.Clear;
  edtKmInicial.Clear;
  edtKmFinal.Clear;
end;

procedure TfrmOdometro.edtCapacidadeTanqueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then
    key := #0;
end;

procedure TfrmOdometro.edtKmFinalKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then
    key := #0;
end;

procedure TfrmOdometro.edtKmInicialKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then
    key := #0;
end;

procedure TfrmOdometro.edtLitrosCombustivelKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then
    key := #0;
end;

procedure TfrmOdometro.edtValorCombustivelKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then
    key := #0;
end;

procedure TfrmOdometro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmOdometro := nil;
end;


end.

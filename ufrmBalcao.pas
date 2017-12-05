unit ufrmBalcao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, System.UITypes;

type
  TfrmBalcao = class(TForm)
    pnlBalcao: TPanel;
    imgSand: TImage;
    imgSuco: TImage;
    edtSand: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtSuco: TEdit;
    pnlDetalhe: TPanel;
    mmDetalhe: TMemo;
    btnLancar: TButton;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    lblTotal: TLabel;
    pnlTroco: TPanel;
    imgUmReal: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    btnConfirmarTroco: TButton;
    lblUm: TLabel;
    lblCinco: TLabel;
    lblVinte: TLabel;
    lblCem: TLabel;
    lblDois: TLabel;
    lblDez: TLabel;
    lbl50: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLancarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarTrocoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure CalcularTroco(pcValor: Currency);
    procedure Clear;
    procedure btnCancelarClick(Sender: TObject);
    procedure edtSandKeyPress(Sender: TObject; var Key: Char);
    procedure edtSucoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FTotal: Currency;
  public
    { Public declarations }
  end;

const
  valorSuco =  0.35;
  valorSanduiche = 1.70;

var
  frmBalcao: TfrmBalcao;

implementation

{$R *.dfm}

procedure TfrmBalcao.btnCancelarClick(Sender: TObject);
begin
  Clear;
  pnlTroco.Visible := False;
end;

procedure TfrmBalcao.btnConfirmarClick(Sender: TObject);
begin
  if lblTotal.Caption = EmptyStr then
  begin
    MessageDlg('Lance um produto para confirmar a compra!', mtInformation, [mbok],1 );
    Exit
  end;

  pnlTroco.BringToFront;
  pnlTroco.Visible := True;
  CalcularTroco(FTotal);
end;

procedure TfrmBalcao.btnLancarClick(Sender: TObject);
begin
 if edtSand.Text <> EmptyStr then
 begin
   mmDetalhe.Lines.Add('Sanduíche' + '            '
     + edtSand.Text + '          '
     +'R$ '+ CurrToStr(valorSanduiche) + '         '
     +'R$' + CurrToStr(StrToInt(edtSand.Text) * valorSanduiche));

   FTotal := FTotal + StrToInt(edtSand.Text) * valorSanduiche;
 end;

 if edtSuco.Text <> EmptyStr then
 begin
   mmDetalhe.Lines.Add('Suco' + '            '
     + edtSuco.Text + '          '
     +'R$ '+ FormatFloat(',0.00', valorSuco) + '         '
     +'R$' + FormatFloat(',0.00', StrToInt(edtSuco.Text) * valorSuco));

   FTotal := FTotal + StrToInt(edtSuco.Text) * valorSuco;
 end;
 lblTotal.Caption := EmptyStr;
 lblTotal.Caption := 'Total: R$' + FormatFloat(',0.00',FTotal);

 edtSand.Text := EmptyStr;
 edtSuco.Text := EmptyStr;
end;

procedure TfrmBalcao.btnConfirmarTrocoClick(Sender: TObject);
begin
  MessageDlg('Venda confirmada com sucesso!', mtInformation, [mbok],1 );
  pnlTroco.Visible := False;
  Clear;
end;

procedure TfrmBalcao.CalcularTroco(pcValor: Currency);
var
  v100, v50, v20, v10, v5, v2, v1: Integer;
begin
  v100 := Trunc(pcValor) div 100;
  pcValor := Trunc(pcValor) - v100 * 100;

  v50 := Trunc(pcValor) div 50;
  pcValor := Trunc(pcValor) - v50 * 50;

  v20 := Trunc(pcValor) div 20;
  pcValor := Trunc(pcValor) - v20 * 20;

  v10 := Trunc(pcValor) div 10;
  pcValor := Trunc(pcValor) - v10 * 10;

  v5 := Trunc(pcValor) div 5;
  pcValor := Trunc(pcValor) - v5 * 5;

  v2 := Trunc(pcValor) div 2;
  pcValor := Trunc(pcValor) - v2 * 2;

  v1 := Trunc(pcValor);

  lblUm.Caption    := 'Quant: ' + IntToStr(v1);
  lblDois.Caption  := 'Quant: ' + IntToStr(v2);
  lblCinco.Caption := 'Quant: ' + IntToStr(v5);
  lblDez.Caption   := 'Quant: ' + IntToStr(v10);
  lblVinte.Caption := 'Quant: ' + IntToStr(v20);
  lbl50.Caption    := 'Quant: ' + IntToStr(v50);
  lblCem.Caption   := 'Quant: ' + IntToStr(v100);
end;

procedure TfrmBalcao.Clear;
var
  i: Integer;
begin
  lblUm.Caption    := EmptyStr;
  lblDois.Caption  := EmptyStr;
  lblCinco.Caption := EmptyStr;
  lblDez.Caption   := EmptyStr;
  lblVinte.Caption := EmptyStr;
  lbl50.Caption    := EmptyStr;
  lblCem.Caption   := EmptyStr;
  edtSand.Clear;
  edtSuco.Clear;
  lblTotal.Caption := EmptyStr;
  FTotal := 0;

  for i := 2 to mmDetalhe.Lines.Count - 1 do
    mmDetalhe.Lines[i] := EmptyStr;
end;

procedure TfrmBalcao.edtSandKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then
    key := #0;
end;

procedure TfrmBalcao.edtSucoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then
    key := #0;
end;

procedure TfrmBalcao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Clear;
  Action := caFree;
  frmBalcao := nil;
end;

procedure TfrmBalcao.FormCreate(Sender: TObject);
begin
  lblTotal.Caption := EmptyStr;
  FTotal := 0;
end;

end.

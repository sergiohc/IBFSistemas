unit uVeiculo;

interface

uses uiVeiculo;
  type
    TVeiculo = class(TInterfacedObject, iVeiculo)
    private
      { private declarations }
      FkmInicial: Integer;
      FkmFinal: Integer;
      FquantLitros: Currency;
      FvalorCombustivel: Currency;
      FcapacidadeTanque: Currency;
      function GetKmInicial: Integer;
      function GetKmFinal: Integer;
      function GetQuantLitros: Currency;
      function GetValorCombustivel: Currency;
      function GetCapacidadeTanque: Currency;
    public
      { public declarations }
      constructor Create( pckmInicial,
                          pckmFinal: Integer;
                          pcquantLitros,
                          pcvalorCombustivel,
                          pccapacidadeTanque: Currency);

      property kmInicial: Integer read GetKmInicial;
      property kmFinal: Integer read GetKmFinal;
      property quantLitros: Currency read GetQuantLitros;
      property valorCombustivel: Currency read GetValorCombustivel;
      property capacidadeTanque: Currency read GetCapacidadeTanque;

      function QuilometragemRodada: Currency;
      function QuilometrosPorLitro: Currency;
      function CustoDaViagem: Currency;
      function Autonomia: Currency;
    end;

implementation



{ TVeiculo }

function TVeiculo.Autonomia: Currency;
begin
 Result := QuilometrosPorLitro * FcapacidadeTanque;
end;

constructor TVeiculo.Create(
  pckmInicial,
  pckmFinal: Integer;
  pcquantLitros,
  pcvalorCombustivel,
  pccapacidadeTanque: Currency);
begin
  FkmInicial        :=  pckmInicial;
  FkmFinal          :=  pckmFinal;
  FquantLitros      :=  pcquantLitros;
  FvalorCombustivel :=  pcvalorCombustivel;
  FcapacidadeTanque :=  pccapacidadeTanque;
end;

function TVeiculo.CustoDaViagem: Currency;
begin
 Result := QuilometragemRodada * FvalorCombustivel;
end;

function TVeiculo.GetCapacidadeTanque: Currency;
begin
  Result := FcapacidadeTanque;
end;

function TVeiculo.GetKmFinal: Integer;
begin
  Result := FkmFinal;
end;

function TVeiculo.GetKmInicial: Integer;
begin
  Result := FkmInicial;
end;

function TVeiculo.GetQuantLitros: Currency;
begin
  Result := FquantLitros;
end;

function TVeiculo.GetValorCombustivel: Currency;
begin
  Result := FvalorCombustivel;
end;

function TVeiculo.QuilometragemRodada: Currency;
begin
  Result := FkmFinal - FkmInicial;
end;

function TVeiculo.QuilometrosPorLitro: Currency;
begin
 Result := QuilometragemRodada / FquantLitros;
end;

end.

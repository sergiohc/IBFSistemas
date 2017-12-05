unit uiVeiculo;

interface
  type
    IVeiculo = interface
    ['{E8384961-B02E-45D3-9085-5C0B1BA76184}']

      function GetKmInicial: Integer;
      function GetKmFinal: Integer;
      function GetQuantLitros: Currency;
      function GetValorCombustivel: Currency;
      function GetCapacidadeTanque: Currency;

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

end.

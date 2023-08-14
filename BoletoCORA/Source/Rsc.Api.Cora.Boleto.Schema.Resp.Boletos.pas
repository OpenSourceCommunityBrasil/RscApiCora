unit Rsc.Api.Cora.Boleto.Schema.Resp.Boletos;

interface

uses
  System.Generics.Collections, REST.Json

  , Rsc.Api.Cora.Boleto.Schema.Resp.NewBoleto

  ;

{$M+}

type


  TItems = class(TBoletoResp)
  end;


  TBoletosListResp = class
  private
    FItems: TArray<TItems>;
    FTotalItems: Integer;
  published
    property items: TArray<TItems> read Fitems write Fitems;
    property TotalItems: Integer read FTotalItems write FTotalItems;
  public
    destructor Destroy; override;

    function ToString: string; override;
  end;

implementation


{ TRoot }

destructor TBoletosListResp.Destroy;
var
  Items  : TItems;
begin
  for Items in FItems do
  begin
    Items.Free;
  end;
  inherited;
end;


function TBoletosListResp.ToString: string;
begin
  Result :=  TJson.ObjectToJsonString(Self);
end;

end.

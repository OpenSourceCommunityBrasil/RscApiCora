unit Rsc.Api.Cora.Boleto.Schema.Resp.NewBoletoPix;

interface

uses
  Rsc.Api.Cora.Boleto.Schema.Resp.NewBoleto
  , Rsc.Api.Cora.Boleto.Classes.Pix

  ;

{$M+}

type

  
  TBoletoPixResp = class(TBoletoResp)
  private
    FPix: TPix;
  published
//    property Code;
//    property created_at;
//    property Customer;
//    property Id;
//    property payment_options;
//    property payment_terms;
//    property Payments;
    property Pix: TPix read FPix write FPix;
//    property Services;
//    property Status;
//    property total_amount;
//    property total_paid;
  public
    constructor Create; overload;
    destructor Destroy; override;
  end;
  
implementation

{ TBoletoPixResp }

constructor TBoletoPixResp.Create;
begin
  inherited;
  FPix := TPix.Create;
end;

destructor TBoletoPixResp.Destroy;
begin
  FPix.Free;
  inherited;
end;


end.

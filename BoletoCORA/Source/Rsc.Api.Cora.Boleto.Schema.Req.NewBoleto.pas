unit Rsc.Api.Cora.Boleto.Schema.Req.NewBoleto;

interface

uses
  System.Generics.Collections, REST.Json.Types, REST.Json

  , Rsc.Api.Cora.Boleto.Classes.Destination
  , Rsc.Api.Cora.Boleto.Classes.Notifications
  , Rsc.Api.Cora.Boleto.Classes.Discount
  , Rsc.Api.Cora.Boleto.Classes.Interest
  , Rsc.Api.Cora.Boleto.Classes.Fine
  , Rsc.Api.Cora.Boleto.Classes.PaymentTerms
  , Rsc.Api.Cora.Boleto.Classes.Services
  , Rsc.Api.Cora.Boleto.Classes.Address
  , Rsc.Api.Cora.Boleto.Classes.Document
  , Rsc.Api.Cora.Boleto.Classes.Customer

  ;

{$M+}

type

  TBoletoReq = class
  private
    FCode: string;
    FCustomer: TCustomer;
    FNotifications: TNotification;
    FPaymentTerms: TPaymentTerms;
    FServices: TArray<TServices>;
  protected
    function GetAsJson: string;
  published
    property Code: string read FCode write FCode;
    property Customer: TCustomer read FCustomer write FCustomer;
    property Notifications: TNotification read FNotifications write FNotifications;
    property payment_terms: TPaymentTerms read FPaymentTerms write FPaymentTerms;
    property services: TArray<TServices> read FServices write FServices;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
implementation





{ TRoot }

constructor TBoletoReq.Create;
begin
  inherited;
  FCustomer := TCustomer.Create;
  FPaymentTerms := TPaymentTerms.Create;
  FNotifications := TNotification.Create;
end;

destructor TBoletoReq.Destroy;
var
  Services : TServices;
begin
  FCustomer.Free;
  FPaymentTerms.Free;
  FNotifications.Free;

  for Services in FServices do
    begin
      Services.Free;
    end;

  inherited;
end;

function TBoletoReq.GetAsJson: string;
begin
  Result  :=  TJson.ObjectToJsonString(Self);
end;

end.

unit Rsc.Api.Cora.Boleto.Schema.Req.NewBoleto;

interface

uses
  System.Generics.Collections, REST.Json.Types, REST.Json, System.JSON, System.SysUtils

  , Rsc.Api.Cora.Boleto.Classes.Destination
  , Rsc.Api.Cora.Boleto.Classes.Notifications
  , Rsc.Api.Cora.Boleto.Classes.Discount
  , Rsc.Api.Cora.Boleto.Classes.Interest
  , Rsc.Api.Cora.Boleto.Classes.Fine
  , Rsc.Api.Cora.Boleto.Classes.PaymentTerms
  , Rsc.Api.Cora.Boleto.Classes.ServicesReq
  , Rsc.Api.Cora.Boleto.Classes.Address
  , Rsc.Api.Cora.Boleto.Classes.Document
  , Rsc.Api.Cora.Boleto.Classes.Customer

  ;

type

  TBoletoReq = class
  private
    FCode: string;
    FCustomer: TCustomer;
    FNotifications: TNotification;
    Fpayment_terms: TPaymentTerms;
    FServices: TArray<TServices>;
  protected
    function GetAsJson: string;
  public
    property Code: string read FCode write FCode;
    property Customer: TCustomer read FCustomer write FCustomer;
    property Notifications: TNotification read FNotifications write FNotifications;
    property payment_terms: TPaymentTerms read Fpayment_terms write Fpayment_terms;
    property services: TArray<TServices> read FServices write FServices;

    constructor Create;
    destructor Destroy; override;
    function ToString: string; override;
  end;
  
implementation

{ TBoletoReq }

constructor TBoletoReq.Create;
begin
  inherited;
  FCustomer := TCustomer.Create;
  Fpayment_terms := TPaymentTerms.Create;
  FNotifications := TNotification.Create;
end;

destructor TBoletoReq.Destroy;
var
  Services : TServices;
begin
  FCustomer.Free;
  Fpayment_terms.Free;
  FNotifications.Free;

  for Services in FServices do
    begin
      Services.Free;
    end;

  inherited;
end;

function TBoletoReq.GetAsJson: string;
var
  vJson : TJSONObject;
  ssdaat  : string;
begin

  vJson :=  TJson.ObjectToJsonObject(Self);
  try
    ssdaat  :=  FormatDateTime('yyyy-mm-dd', vJson.GetValue('payment_terms').GetValue<TDate>('due_date'));
    TJSONObject(vJson.GetValue('payment_terms')).RemovePair('due_date');
    TJSONObject(vJson.GetValue('payment_terms')).AddPair('due_date', ssdaat);

    Result  :=  vJson.ToString;
  finally
    vJson.Free;
  end;
end;

function TBoletoReq.ToString: string;
begin
  Result  :=  GetAsJson;
end;

end.

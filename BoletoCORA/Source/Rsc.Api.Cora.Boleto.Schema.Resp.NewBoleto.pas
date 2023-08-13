unit Rsc.Api.Cora.Boleto.Schema.Resp.NewBoleto;

interface

uses
  Rsc.Json.DTO, System.Generics.Collections, REST.Json.Types

  , Rsc.Api.Cora.Boleto.Schema.Req.NewBoletoPix

//  , Rsc.Api.Cora.Boleto.Classes.Destination
  , Rsc.Api.Cora.Boleto.Classes.Notifications
//  , Rsc.Api.Cora.Boleto.Classes.Discount
//  , Rsc.Api.Cora.Boleto.Classes.Interest
//  , Rsc.Api.Cora.Boleto.Classes.Fine
  , Rsc.Api.Cora.Boleto.Classes.PaymentTerms
  , Rsc.Api.Cora.Boleto.Classes.ServicesResp
//  , Rsc.Api.Cora.Boleto.Classes.Address
//  , Rsc.Api.Cora.Boleto.Classes.Document
  , Rsc.Api.Cora.Boleto.Classes.Customer
//  , Rsc.Api.Cora.Boleto.Classes.BankSlip
  , Rsc.Api.Cora.Boleto.Classes.PaymentOptions
  , Rsc.Api.Cora.Boleto.Classes.Payments
//  , Rsc.Api.Cora.Boleto.Classes.Schedules

  ;

{$M+}

type


  TBoletoResp = class(TBoletoPixReq)
  private
    FCreatedAt: TDateTime;
    FId: string;
    FPaymentOptions: TPaymentOptions;
    FPayments: TArray<TPayments>;
    FStatus: string;
    FTotalAmount: Double;
    FTotalPaId: Double;
  public
    property Code;
    property Customer;
    property Notifications;
    property Services;
    property payment_terms;
//    property payment_forms;
    property created_at: TDateTime read FCreatedAt write FCreatedAt;
    property Id: string read FId write FId;
    property payment_options: TPaymentOptions read FPaymentOptions write FPaymentOptions;
    property Payments: TArray<TPayments> read FPayments write FPayments;
    property Status: string read FStatus write FStatus;
    property total_amount: Double read FTotalAmount write FTotalAmount;
    property total_paid: Double read FTotalPaId write FTotalPaId;

    constructor Create; overload;
    destructor Destroy; override;

    function ToString: string;
  end;
  
implementation


{ TBoletoResp }

constructor TBoletoResp.Create;
begin
  inherited;
  FPaymentOptions := TPaymentOptions.Create;
end;

destructor TBoletoResp.Destroy;
begin
  FPaymentOptions.Free;

  inherited;
end;

function TBoletoResp.ToString: string;
begin
  Result  :=  GetAsJson;
end;

end.

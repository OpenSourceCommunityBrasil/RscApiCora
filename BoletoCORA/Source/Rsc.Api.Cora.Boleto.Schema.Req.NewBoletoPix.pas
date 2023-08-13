unit Rsc.Api.Cora.Boleto.Schema.Req.NewBoletoPix;

interface

uses
  Rsc.Api.Cora.Boleto.Schema.Req.NewBoleto

  ;

type

  TBoletoPixReq = class(TBoletoReq)
  private
    FPaymentForms: TArray<string>;
  public
    property Code;
    property Customer;
    property Notifications;
    property payment_terms;
    property services;

    property payment_forms: TArray<string> read FPaymentForms write FPaymentForms;
  end;

implementation


end.

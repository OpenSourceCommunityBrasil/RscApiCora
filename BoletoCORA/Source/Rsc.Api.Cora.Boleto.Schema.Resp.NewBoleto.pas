{====================================================================================}
{             RSC SISTEMAS                                                           }
{        SOLUÇÕES TECNOLÓGICAS                                                       }
{         rscsistemas.com.br                                                         }
{          +55 92 4141-2737                                                          }
{      contato@rscsistemas.com.br                                                    }
{                                                                                    }
{ Desenvolvidor por:                                                                 }
{   Roniery Santos Cardoso                                                           }
{     roniery@rscsistemas.com.br                                                     }
{     +55 92 984391279                                                               }
{                                                                                    }
{                                                                                    }
{ Versão Original RSC SISTEMAS                                                       }
{                                                                                    }
{ Faça uma  doação:                                                                  }
{ Pix - Email: roniery@rscsistemas.com.br                                            }
{ Banco: NuBank                                                                      }
{                                                                                    }
{                                                                                    }
{                                                                                    }
{ Componente TRscCoraBoleto                                                          }
{ Componente OpenSource                                                              }
{ Licença Pública Geral GNU v3.0                                                     }
{ Permissions of this strong copyleft license are conditioned on making available    }
{ complete source code of licensed works and modifications, which include larger     }
{ works using a licensed work, under the same license. Copyright and license         }
{ notices must be preserved. Contributors provide an express grant of patent rights. }
{                                                                                    }
{====================================================================================}

unit Rsc.Api.Cora.Boleto.Schema.Resp.NewBoleto;

interface

uses
  System.Generics.Collections, REST.Json.Types

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
    FCreatedAt: TDate;
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
    property created_at: TDate read FCreatedAt write FCreatedAt;
    property Id: string read FId write FId;
    property payment_options: TPaymentOptions read FPaymentOptions write FPaymentOptions;
    property Payments: TArray<TPayments> read FPayments write FPayments;
    property Status: string read FStatus write FStatus;
    property total_amount: Double read FTotalAmount write FTotalAmount;
    property total_paid: Double read FTotalPaId write FTotalPaId;

    constructor Create; overload;
    destructor Destroy; override;

    function ToString: string; override;
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

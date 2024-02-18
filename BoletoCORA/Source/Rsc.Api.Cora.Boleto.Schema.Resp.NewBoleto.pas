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
  System.Generics.Collections, REST.Json.Types, REST.Json, System.JSON, System.SysUtils

  , Rsc.Api.Cora.Boleto.Classes.Destination
  , Rsc.Api.Cora.Boleto.Classes.Notifications
  , Rsc.Api.Cora.Boleto.Classes.Discount
//  , Rsc.Api.Cora.Boleto.Classes.Interest   //
  , Rsc.Api.Cora.Boleto.Classes.Fine
  , Rsc.Api.Cora.Boleto.Classes.PaymentTerms
  , Rsc.Api.Cora.Boleto.Classes.ServicesResp
//  , Rsc.Api.Cora.Boleto.Classes.Address
  , Rsc.Api.Cora.Boleto.Classes.Document
  , Rsc.Api.Cora.Boleto.Classes.Customer
//  , Rsc.Api.Cora.Boleto.Classes.BankSlip
  , Rsc.Api.Cora.Boleto.Classes.PaymentOptions
  , Rsc.Api.Cora.Boleto.Classes.Payments
  , Rsc.Api.Cora.Boleto.Classes.Schedules
  , Rsc.Api.Cora.Boleto.Classes.Pix


  ;

{$M+}

type

  TBoletoResp = class
  private
    FId: string;
    FStatus: string;
    FCreated_At: TDateTime;
    FTotal_Amount: Integer;
    FTotal_PaId: Integer;
    Foccurrence_date: TDateTime;
    FCode: string;
    FCustomer: TCustomer;
    FServices: TArray<TServices>;
    FPayment_Terms: TPaymentTerms;
    FPayment_Options: TPaymentOptions;
    FPayments: TArray<TPayments>;
    FPix: TPix;
    FNotifications: TNotifications;

  public
    property Id             : string read FId write FId;
    property Status         : string read FStatus write FStatus;
    property Created_At     : TDateTime read FCreated_At write FCreated_At;
    property Total_Amount   : Integer read FTotal_Amount write FTotal_Amount;
    property Total_PaId     : Integer read FTotal_PaId write FTotal_PaId;
    property occurrence_date: TDateTime read Foccurrence_date write Foccurrence_date;
    property Code           : string read FCode write FCode;
    property Customer       : TCustomer read FCustomer;
    property Services       : TArray<TServices> read FServices write FServices;
    property Payment_Terms  : TPaymentTerms read FPayment_Terms;
    property Payment_Options: TPaymentOptions read FPayment_Options write FPayment_Options;
    property Payments       : TArray<TPayments> read FPayments write FPayments;
    property Pix            : TPix read FPix write FPix;
    property Notifications  : TNotifications read FNotifications;

    constructor Create;
    destructor Destroy; override;

    function ToString: string;
  end;
  
implementation


{ TBoletoResp }

constructor TBoletoResp.Create;
begin
  FPayment_Options  := TPaymentOptions.Create;
  FPix              := TPix.Create;
  FCustomer         := TCustomer.Create;
  Fpayment_terms    := TPaymentTerms.Create;
  FNotifications    := TNotifications.Create;
  SetLength(FServices, 0);

end;

destructor TBoletoResp.Destroy;
var
  Services : TServices;
begin
  FPayment_Options.Free;
  FPix.Free;
  FCustomer.Free;
  Fpayment_terms.Free;
  FNotifications.Free;

  for Services in FServices do
    begin
      Services.Free;
    end;

  inherited;
end;

function TBoletoResp.ToString: string;
var
  vJson : TJSONObject;
begin
  vJson :=  TJson.ObjectToJsonObject(Self, [joIgnoreEmptyStrings, joIgnoreEmptyArrays]);
  try
    Result  :=  vJson.ToString;
  finally
    vJson.Free;
  end;
end;

end.

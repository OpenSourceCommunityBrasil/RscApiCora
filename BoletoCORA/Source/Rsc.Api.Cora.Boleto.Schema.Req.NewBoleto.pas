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

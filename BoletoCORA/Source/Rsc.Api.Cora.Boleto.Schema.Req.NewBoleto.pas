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
  , Rsc.Api.Cora.Boleto.Classes.Installment

  ;

type

  TBoletoReq = class
  private
    FCode: string;
    FCustomer: TCustomer;
    FServices: TArray<TServices>;
    Fpayment_terms: TPaymentTerms;
    Finstallment: TInstallment;
    FNotifications: TNotification;
    Fpayment_forms: TArray<string>;
    FIsCarne: Boolean;
  public
    property Code: string read FCode write FCode;
    property Customer: TCustomer read FCustomer write FCustomer;
    property services: TArray<TServices> read FServices write FServices;
    property payment_terms: TPaymentTerms read Fpayment_terms write Fpayment_terms;
    property installment: TInstallment read Finstallment write Finstallment;
    property Notifications: TNotification read FNotifications write FNotifications;
    property payment_forms: TArray<string> read Fpayment_forms write Fpayment_forms;

    property IsCarne: Boolean read FIsCarne write FIsCarne;

    constructor Create;
    destructor Destroy; override;
    function ToString: string; override;
  end;
  
implementation

{ TBoletoReq }

constructor TBoletoReq.Create;
begin
  inherited;
  FCustomer       := TCustomer.Create;
  Fpayment_terms  := TPaymentTerms.Create;
  FNotifications  := TNotification.Create;
  Finstallment    := TInstallment.Create;

  SetLength(FServices, 0);
  SetLength(Fpayment_forms, 2);

  Fpayment_forms[0]  :=  'BANK_SLIP';
  Fpayment_forms[1]  :=  'PIX';

end;

destructor TBoletoReq.Destroy;
var
  Services : TServices;
begin
  FCustomer.Free;
  Fpayment_terms.Free;
  FNotifications.Free;
  Finstallment.Free;

  for Services in FServices do
    begin
      Services.Free;
    end;

  inherited;
end;

function TBoletoReq.ToString: string;
var
  vJson : TJSONObject;
  ssdaat  : string;
  bCarne: boolean;
begin

  vJson :=  TJson.ObjectToJsonObject(Self);
  try
      if vJson.TryGetValue<boolean>('isCarne', bCarne) then
      begin
        vJson.RemovePair('isCarne');

        if not bCarne then
          vJson.RemovePair('installment');
      end;

    ssdaat  :=  FormatDateTime('yyyy-mm-dd', vJson.GetValue('payment_terms').GetValue<TDate>('due_date'));
    TJSONObject(vJson.GetValue('payment_terms')).RemovePair('due_date');
    TJSONObject(vJson.GetValue('payment_terms')).AddPair('due_date', ssdaat);

    if TJSONObject(TJSONObject(vJson.GetValue('payment_terms')).getvalue('fine')).getValue('date').AsType<TDate> < Now
    then
      begin
        TJSONObject(TJSONObject(vJson.GetValue('payment_terms')).getvalue('fine')).RemovePair('date');
      end
    else
      begin
        if TJSONObject(TJSONObject(vJson.GetValue('payment_terms')).getvalue('fine')).getValue('amount').AsType<Double> >= 0
        then
          begin
            TJSONObject(TJSONObject(vJson.GetValue('payment_terms')).getvalue('fine')).RemovePair('date');
            TJSONObject(TJSONObject(vJson.GetValue('payment_terms')).getvalue('fine')).RemovePair('rate');
          end
        else
          begin
            TJSONObject(TJSONObject(vJson.GetValue('payment_terms')).getvalue('fine')).RemovePair('amount');

            if TJSONObject(TJSONObject(vJson.GetValue('payment_terms')).getvalue('fine')).getValue('rate').AsType<Double> <= 0
            then
              begin
                TJSONObject(TJSONObject(vJson.GetValue('payment_terms')).getvalue('fine')).RemovePair('rate');
              end;
          end;
      end;

    Result  :=  vJson.ToString;
  finally
    vJson.Free;
  end;
end;

end.

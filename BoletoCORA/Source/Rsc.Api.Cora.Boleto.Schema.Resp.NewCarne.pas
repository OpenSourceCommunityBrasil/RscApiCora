{====================================================================================}
{             RSC SISTEMAS                                                           }
{        SOLU��ES TECNOL�GICAS                                                       }
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
{ Vers�o Original RSC SISTEMAS                                                       }
{                                                                                    }
{ Fa�a uma  doa��o:                                                                  }
{ Pix - Email: roniery@rscsistemas.com.br                                            }
{ Banco: NuBank                                                                      }
{                                                                                    }
{                                                                                    }
{                                                                                    }
{ Componente TRscCoraBoleto                                                          }
{ Componente OpenSource                                                              }
{ Licen�a P�blica Geral GNU v3.0                                                     }
{ Permissions of this strong copyleft license are conditioned on making available    }
{ complete source code of licensed works and modifications, which include larger     }
{ works using a licensed work, under the same license. Copyright and license         }
{ notices must be preserved. Contributors provide an express grant of patent rights. }
{                                                                                    }
{====================================================================================}

unit Rsc.Api.Cora.Boleto.Schema.Resp.NewCarne;

interface

uses
  System.Generics.Collections
  , System.JSON
  , System.SysUtils
  , REST.Json.Types
  , REST.Json

  , Rsc.Api.Cora.Boleto.Classes.Destination
  , Rsc.Api.Cora.Boleto.Classes.Notification
  , Rsc.Api.Cora.Boleto.Classes.Discount
  , Rsc.Api.Cora.Boleto.Classes.Fine
  , Rsc.Api.Cora.Boleto.Classes.PaymentTerms
  , Rsc.Api.Cora.Boleto.Classes.ServicesResp
  , Rsc.Api.Cora.Boleto.Classes.Document
  , Rsc.Api.Cora.Boleto.Classes.Customer
  , Rsc.Api.Cora.Boleto.Classes.PaymentOptions
  , Rsc.Api.Cora.Boleto.Classes.Payments
  , Rsc.Api.Cora.Boleto.Classes.Schedules
  , Rsc.Api.Cora.Boleto.Classes.Pix
  , Rsc.Api.Cora.Boleto.Classes.Seller
  , Rsc.Api.Cora.Boleto.Classes.Buyer
  , Rsc.Api.Cora.Boleto.Classes.Bank_Slip
  , Rsc.Api.Cora.Boleto.Classes.AdditionalInformation

  ;


type

  TCarne = class
  private
    FId: string;
    FStatus: string;
    FCreated_At: TDateTime;
    FTotal_Amount: Integer;
    FService: TServices;
    FPayment_Terms: TPaymentTerms;
    FPayments: TArray<TPayments>;
    FPix: TPix;
    FNotifications: TNotification;
    FSeller: TSeller;
    FPayment_Forms: TArray<string>;
    FDocument_Url: string;
    FBuyer: TBuyer;
    FBank_Slip: TBank_Slip;
    FAuthentication_Id: string;

  public
    property Id             : string read FId write FId;
    property Status         : string read FStatus write FStatus;
    property Created_At     : TDateTime read FCreated_At write FCreated_At;
    property Total_Amount   : Integer read FTotal_Amount write FTotal_Amount;
    property Service        : TServices read FService write FService;
    property Payment_Terms  : TPaymentTerms read FPayment_Terms;
    property Payment_Forms  : TArray<string> read FPayment_Forms write FPayment_Forms;
    property Payments       : TArray<TPayments> read FPayments write FPayments;
    property Pix            : TPix read FPix write FPix;
    property Notification   : TNotification read FNotifications;
    property Seller         : TSeller read FSeller write FSeller;
    property Document_Url   : string read FDocument_Url write FDocument_Url;
    property Buyer          : TBuyer read FBuyer write FBuyer;
    property Bank_slip      : TBank_Slip read FBank_Slip write FBank_Slip;
    property Authentication_Id: string read FAuthentication_Id write FAuthentication_Id;

    constructor Create;
    destructor Destroy; override;

    function ToString: string; override;
  end;

  TCarneResp = class
  private
    FDocument_Url: string;
    FResult: TArray<TCarne>;
  public
    property Document_Url: string read FDocument_Url write FDocument_Url;
    property Result: TArray<TCarne> read FResult write FResult;

    constructor Create;
    destructor Destroy; override;

    function ToString: string; override;
  end;


implementation

{ TCarneResp }

constructor TCarne.Create;
begin
  FPayment_Terms  :=  TPaymentTerms.Create;
  FNotifications  :=  TNotification.Create;
  FSeller         :=  TSeller.Create;
  FBuyer          :=  TBuyer.Create;
  FBank_Slip      :=  TBank_Slip.Create;
  FPix            :=  TPix.Create;
  FService        :=  TServices.Create;


  SetLength(FPayments, 0);
  SetLength(Fpayment_forms, 2);

  Fpayment_forms[0]  :=  'BANK_SLIP';
  Fpayment_forms[1]  :=  'PIX';
end;

destructor TCarne.Destroy;
var
  Payments: TPayments;
begin
  FPayment_Terms.Free;
  FNotifications.Free;
  FSeller.Free;
  FBuyer.Free;
  FBank_Slip.Free;
  FPix.Free;
  FService.Free;

  for Payments in FPayments do
    begin
      Payments.Free;
    end;

  inherited;
end;

function TCarne.ToString: string;
begin
  Result :=  TJson.ObjectToJsonString(Self);
end;

{ TCarneResp }

constructor TCarneResp.Create;
begin
  SetLength(FResult, 0);
end;

destructor TCarneResp.Destroy;
var
  Carne: TCarne;
begin
  for Carne in FResult do
    begin
      Carne.Free;
    end;
  inherited;
end;

function TCarneResp.ToString: string;
begin
  Result :=  TJson.ObjectToJsonString(Self);
end;

end.

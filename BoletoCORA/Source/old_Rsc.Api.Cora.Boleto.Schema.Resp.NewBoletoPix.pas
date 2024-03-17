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

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

unit Rsc.Api.Cora.Boleto.Classes.PaymentTerms;

interface

uses
    Rsc.Api.Cora.Boleto.Classes.Interest
  , Rsc.Api.Cora.Boleto.Classes.Fine
  , Rsc.Api.Cora.Boleto.Classes.Discount

  ;

type

  TPaymentTerms = class
  private
    FDiscount: TDiscount;
    Fdue_date: TDate;
    FFine: TFine;
    FInterest: TInterest;
  public
    property Discount: TDiscount read FDiscount;
    property due_date: TDate read Fdue_date write Fdue_date;
    property Fine: TFine read FFine write FFine;
    property Interest: TInterest read FInterest;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TPaymentTerms }

constructor TPaymentTerms.Create;
begin
  inherited;
  FFine := TFine.Create;
  FInterest := TInterest.Create;
  FDiscount := TDiscount.Create;
end;

destructor TPaymentTerms.Destroy;
begin
  FFine.Free;
  FInterest.Free;
  FDiscount.Free;
  inherited;
end;

end.

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

unit Rsc.Api.Cora.Boleto.Classes.PaymentOptions;

interface

  uses
    Rsc.Api.Cora.Boleto.Classes.BankSlip;

type

  TPaymentOptions = class
  private
    FBank_slip: TBank_slip;
  public
    constructor Create;
    destructor Destroy; override;

    property bank_slip: TBank_slip read FBank_slip write FBank_slip;
  end;

implementation

{ TPaymentOptions }

constructor TPaymentOptions.Create;
begin
  inherited;
  FBank_slip := TBank_slip.Create;
end;

destructor TPaymentOptions.Destroy;
begin
  FBank_slip.Free;
  inherited;
end;

end.

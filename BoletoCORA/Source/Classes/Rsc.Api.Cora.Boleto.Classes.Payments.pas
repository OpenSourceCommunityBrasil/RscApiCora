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

unit Rsc.Api.Cora.Boleto.Classes.Payments;

interface

type

  TPayments = class
  private
    Fcreated_at: TDate;
    Ffinalized_at: TDate;
    FFine: Integer;
    FId: string;
    FInterest: Integer;
    FMethod: string;
    FOrder: Integer;
    FStatus: string;
    FTotalPaId: Integer;
  public
    property created_at: TDate read Fcreated_at write Fcreated_at;
    property finalized_at: TDate read Ffinalized_at write Ffinalized_at;
    property Fine: Integer read FFine write FFine;
    property Id: string read FId write FId;
    property Interest: Integer read FInterest write FInterest;
    property Method: string read FMethod write FMethod;
    property Order: Integer read FOrder write FOrder;
    property Status: string read FStatus write FStatus;
    property total_paid: Integer read FTotalPaId write FTotalPaId;
  end;

implementation

end.

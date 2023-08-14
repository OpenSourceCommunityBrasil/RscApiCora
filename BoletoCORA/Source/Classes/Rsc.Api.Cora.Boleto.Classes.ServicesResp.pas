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

unit Rsc.Api.Cora.Boleto.Classes.ServicesResp;

interface

type

  TServices = class
  private
    FAmount: Double;
    FDescription: string;
    FName: string;
    FUnit: string;
    Fcode: integer;
    Ftotal_amount: Double;
    Fquantity: Double;
  public
    property Amount: Double read FAmount write FAmount;
    property Description: string read FDescription write FDescription;
    property Name: string read FName write FName;

    property &Unit: string read FUnit write FUnit;
    property quantity : Double read Fquantity write Fquantity;
    property total_amount : Double read Ftotal_amount write Ftotal_amount;
    property code : integer read Fcode write Fcode;
  end;

implementation

end.

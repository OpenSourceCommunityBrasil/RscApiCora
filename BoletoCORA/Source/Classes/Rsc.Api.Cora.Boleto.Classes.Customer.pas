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

unit Rsc.Api.Cora.Boleto.Classes.Customer;

interface

uses

    Rsc.Api.Cora.Boleto.Classes.Address
  , Rsc.Api.Cora.Boleto.Classes.Document

  ;

type

  TCustomer = class
  private
    FName: string;
    FEmail: string;
    FDocument: TDocument;
    FAddress: TAddress;
  public
    property Name: string read FName write FName;
    property Email: string read FEmail write FEmail;
    property Document: TDocument read FDocument;
    property Address: TAddress read FAddress;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TCustomer }

constructor TCustomer.Create;
begin
  inherited;
  FDocument := TDocument.Create;
  FAddress := TAddress.Create;
end;

destructor TCustomer.Destroy;
begin
  FDocument.Free;
  FAddress.Free;
  inherited;
end;

end.

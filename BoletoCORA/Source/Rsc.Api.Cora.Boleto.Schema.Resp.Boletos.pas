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

unit Rsc.Api.Cora.Boleto.Schema.Resp.Boletos;

interface

uses
  System.Generics.Collections, REST.Json

  , Rsc.Api.Cora.Boleto.Schema.Resp.NewBoleto

  ;

{$M+}

type


  TItems = class(TBoletoResp)
  end;


  TBoletosListResp = class
  private
    FItems: TArray<TItems>;
    FTotalItems: Integer;
  published
    property items: TArray<TItems> read Fitems write Fitems;
    property TotalItems: Integer read FTotalItems write FTotalItems;
  public
    destructor Destroy; override;

    function ToString: string; override;
  end;

implementation


{ TRoot }

destructor TBoletosListResp.Destroy;
var
  Items  : TItems;
begin
  for Items in FItems do
  begin
    Items.Free;
  end;
  inherited;
end;


function TBoletosListResp.ToString: string;
begin
  Result :=  TJson.ObjectToJsonString(Self);
end;

end.

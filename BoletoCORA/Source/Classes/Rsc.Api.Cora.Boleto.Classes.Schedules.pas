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

unit Rsc.Api.Cora.Boleto.Classes.Schedules;

interface
  uses
  System.Generics.Collections
  , System.JSON
  , System.SysUtils
  , REST.Json.Types
  , REST.Json
  ;

type

  TSchedules = class
  private
    FActive: Boolean;
    FRule: string;
    Fscheduled_to: TDate;
    FStatus: string;
  public
    property Active: Boolean read FActive write FActive;
    property Rule: string read FRule write FRule;
    property scheduled_to: TDate read Fscheduled_to write Fscheduled_to;
    property Status: string read FStatus write FStatus;

    function ToString: string;
  end;

implementation

{ TSchedules }

function TSchedules.ToString: string;
begin
  Result :=  TJson.ObjectToJsonString(Self);
end;

end.


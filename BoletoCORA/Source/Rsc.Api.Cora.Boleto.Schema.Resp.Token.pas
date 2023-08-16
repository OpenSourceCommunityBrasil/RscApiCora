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

unit Rsc.Api.Cora.Boleto.Schema.Resp.Token;

interface

uses
  REST.Json.Types, REST.Json;

type

  TToken = class
  private
    Faccess_token: string;
    Fexpires_in: Integer;
    [JSONName('not-before-policy')]
    FNotBeforePolicy: Integer;
    Frefresh_expires_in: Integer;
    Frefresh_token: string;
    FScope: string;
    Fsession_state: string;
    Ftoken_type: string;
  public
    property access_token       : string  read Faccess_token        write Faccess_token;
    property expires_in         : Integer read Fexpires_in          write Fexpires_in;
    property NotBeforePolicy    : Integer read FNotBeforePolicy     write FNotBeforePolicy;
    property refresh_expires_in : Integer read Frefresh_expires_in  write Frefresh_expires_in;
    property refresh_token      : string  read Frefresh_token       write Frefresh_token;
    property Scope              : string  read FScope               write FScope;
    property session_state      : string  read Fsession_state       write Fsession_state;
    property token_type         : string  read Ftoken_type          write Ftoken_type;

    function ToString: string; override;
  end;

implementation

{ TToken }

function TToken.ToString: string;
begin
  Result :=  TJson.ObjectToJsonString(Self);
end;

end.

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

unit Rsc.Api.Cora.Boleto.Schema.Resp.NewWebhook;

interface

uses
  System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TWebhookResp = class
  private
    FActive: Boolean;
    FConnectionTimeout: Integer;
    FExpandable: Boolean;
    FId: string;
    FIncludeResource: Boolean;
    FReadTimeout: Integer;
    FResource: string;
    FTrigger: string;
    FUrl: string;
  published
    property Active: Boolean read FActive write FActive;
    property ConnectionTimeout: Integer read FConnectionTimeout write FConnectionTimeout;
    property Expandable: Boolean read FExpandable write FExpandable;
    property Id: string read FId write FId;
    property IncludeResource: Boolean read FIncludeResource write FIncludeResource;
    property ReadTimeout: Integer read FReadTimeout write FReadTimeout;
    property Resource: string read FResource write FResource;
    property Trigger: string read FTrigger write FTrigger;
    property Url: string read FUrl write FUrl;
  end;

implementation

end.

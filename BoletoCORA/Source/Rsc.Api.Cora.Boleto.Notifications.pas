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

unit Rsc.Api.Cora.Boleto.Notifications;

interface

  uses
      Rsc.Api.Cora.Boleto.Schema.Resp.Token
    , Rsc.Api.Cora.Boleto.Schema.Resp.NewBoleto
    , Rsc.Api.Cora.Boleto.Schema.Resp.BoletoDetalhes
    , Rsc.Api.Cora.Boleto.Schema.Resp.Boletos
    , Rsc.Api.Cora.Boleto.Schema.Resp.NewWebhook
    , Rsc.Api.Cora.Boleto.Schema.Resp.Webhooks
    , Rsc.Api.Cora.Boleto.Schema.Resp.NewCarne

    ;

type

  TNotificaToken                    = procedure(Sender : TObject; Const Token: TToken = nil; Erro: String = ''; CodResp: integer = -1)  of object;
  TNotificaGerarBoleto              = procedure(Sender : TObject; Const Boleto: TBoletoResp = nil; Erro: String = ''; CodResp: integer = -1)  of object;
  TNotificaGerarCarne               = procedure(Sender : TObject; Const Carne: TCarneResp = nil; Erro: String = ''; CodResp: integer = -1)  of object;
  TNotificaConsultarBoleto          = procedure(Sender : TObject; Const BoletoDetalhes: TBoletoDetalhesResp = nil; Erro: String = ''; CodResp: integer = -1)  of object;
  TNotificaConsultarBoletos         = procedure(Sender : TObject; Const BoletosList: TBoletosListResp = nil; Erro: String = ''; CodResp: integer = -1)  of object;
  TNotificaDeletarBoleto            = procedure(Sender : TObject; Const Erro: String = ''; CodResp: integer = -1)  of object;
  TNotificaAlterarNotificacaoBoleto = procedure(Sender : TObject; Const Erro: String = ''; CodResp: integer = -1)  of object;

  TNotificaNewWebhook               = procedure(Sender : TObject; Const NewWebhook: TWebhookResp = nil; Erro: String = ''; CodResp: integer = -1)  of object;
  TNotificaConsultarWebhooks        = procedure(Sender : TObject; Const WebhooksList: TWebhooksListResp = nil; Erro: String = ''; CodResp: integer = -1)  of object;
  TNotificaDeletarWebhook           = procedure(Sender : TObject; Const Erro: String = ''; CodResp: integer = -1)  of object;


implementation

end.

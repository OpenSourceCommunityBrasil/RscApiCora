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

unit Rsc.Api.Cora.Boleto.Consts;

interface

const

  URLBASE_HOMOLOGACAO                 = 'https://api.stage.cora.com.br/';
  URLBASE_PRODUCAO                    = 'https://api.cora.com.br/';

  ENDPOINT_TOKEN                      = 'oauth/token';
  ENDPOINT_AUTHORIZE                  = 'oauth/authorize?client_id={client_id}&response_type=code&redirect_uri={redirect_uri}&scopes={scopes}';

  ENDPOINT_GERAR_FATURA               = 'invoices/';
  ENDPOINT_GERAR_CARNE                = 'invoices/installments';
  ENDPOINT_CONSULTAR_FATURA           = 'invoices/{invoice_id}';
  ENDPOINT_CONSULTAR_FATURAS          = 'invoices?start={start}&end={end}';
  ENDPOINT_DELETAR_FATRA              = 'invoices/{invoice_id}';
  ENDPOINT_EDITAR_NOTIFICACAO_FATURA  = 'invoices/{invoice_id}/notifications';

  ENDPOINT_CRIAR_WEBHOOKS             = 'endpoints';
  ENDPOINT_LISTAR_WEBHOOKS            = 'endpoints';
  ENDPOINT_DELETAR_WEBHOOKS           = 'endpoints/{endpoint_id}';

implementation

end.

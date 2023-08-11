unit Rsc.Api.Cora.Boleto.Consts;

interface

const

  URLBASE_HOMOLOGACAO                 = 'https://api.stage.cora.com.br/';
  URLBASE_PRODUCAO                    = 'https://api.cora.com.br/';

  ENDPOINT_TOKEN                      = 'oauth/token';

  ENDPOINT_GERAR_FATURA               = 'invoices';
  ENDPOINT_GERAR_FATURA_PIX           = 'invoices';
  ENDPOINT_CONSULTAR_FATURA           = 'invoices/{invoice_id}';
  ENDPOINT_CONSULTAR_FATURAS          = 'invoices?start={start}&end={end}';
  ENDPOINT_DELETAR_FATRA              = 'invoices/{invoice_id}';
  ENDPOINT_EDITAR_NOTIFICACAO_FATURA  = 'invoices/{invoice_id}/notifications';

  ENDPOINT_CRIAR_WEBHOOKS             = 'endpoints';
  ENDPOINT_LISTAR_WEBHOOKS            = 'endpoints';
  ENDPOINT_DELETAR_WEBHOOKS           = 'endpoints/{endpoint_id}';

implementation

end.

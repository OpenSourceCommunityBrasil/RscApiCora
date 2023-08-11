unit Rsc.Api.Cora.Boleto.Notifications;

interface

  uses
      Rsc.Api.Cora.Boleto.Schema.Resp.Token
    , Rsc.Api.Cora.Boleto.Schema.Resp.NewBoleto
    , Rsc.Api.Cora.Boleto.Schema.Resp.NewBoletoPix
    , Rsc.Api.Cora.Boleto.Schema.Resp.BoletoDetalhes
    , Rsc.Api.Cora.Boleto.Schema.Resp.Boletos
    , Rsc.Api.Cora.Boleto.Schema.Resp.NewWebhook
    , Rsc.Api.Cora.Boleto.Schema.Resp.Webhooks

    ;

type

  TNotificaToken                    = procedure(Sender : TObject; Const Token: TToken = nil; Erro: String = ''; CodResp: integer = -1)  of object;
  TNotificaGerarBoleto              = procedure(Sender : TObject; Const Boleto: TBoletoResp = nil; Erro: String = ''; CodResp: integer = -1)  of object;
  TNotificaGerarBoletoPix           = procedure(Sender : TObject; Const BoletoPix: TBoletoPixResp = nil; Erro: String = ''; CodResp: integer = -1)  of object;
  TNotificaConsultarBoleto          = procedure(Sender : TObject; Const BoletoDetalhes: TBoletoDetalhesResp = nil; Erro: String = ''; CodResp: integer = -1)  of object;
  TNotificaConsultarBoletos         = procedure(Sender : TObject; Const BoletosList: TBoletosListResp = nil; Erro: String = ''; CodResp: integer = -1)  of object;
  TNotificaDeletarBoleto            = procedure(Sender : TObject; Const Erro: String = ''; CodResp: integer = -1)  of object;
  TNotificaAlterarNotificacaoBoleto = procedure(Sender : TObject; Const Erro: String = ''; CodResp: integer = -1)  of object;

  TNotificaNewWebhook               = procedure(Sender : TObject; Const NewWebhook: TWebhookResp = nil; Erro: String = ''; CodResp: integer = -1)  of object;
  TNotificaConsultarWebhooks        = procedure(Sender : TObject; Const WebhooksList: TWebhooksListResp = nil; Erro: String = ''; CodResp: integer = -1)  of object;
  TNotificaDeletarWebhook           = procedure(Sender : TObject; Const Erro: String = ''; CodResp: integer = -1)  of object;


implementation

end.

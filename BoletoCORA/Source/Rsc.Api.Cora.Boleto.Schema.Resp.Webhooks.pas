unit Rsc.Api.Cora.Boleto.Schema.Resp.Webhooks;

interface

uses
  System.Generics.Collections, REST.Json.Types, Rsc.Api.Cora.Boleto.Schema.Resp.NewWebhook;

{$M+}

type

  TWebhooksListResp = class
  private
  FItems: TArray<TWebhookResp>;
  published
    property Items: TArray<TWebhookResp> read FItems write FItems;
  public
    destructor Destroy; override;
  end;

implementation

{ TRoot }

destructor TWebhooksListResp.Destroy;
var
  webhook : TWebhookResp;
begin
  for webhook in FItems do
    webhook.Free;

  inherited;
end;



end.

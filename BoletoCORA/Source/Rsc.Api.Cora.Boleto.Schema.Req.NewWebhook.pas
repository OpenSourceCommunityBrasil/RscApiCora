unit Rsc.Api.Cora.Boleto.Schema.Req.NewWebhook;

interface

uses
  System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TWebhookReq = class
  private
    FResource: string;
    FTrigger: string;
    FUrl: string;
  published
    property Resource: string read FResource write FResource;
    property Trigger: string read FTrigger write FTrigger;
    property Url: string read FUrl write FUrl;
  end;

implementation

end.

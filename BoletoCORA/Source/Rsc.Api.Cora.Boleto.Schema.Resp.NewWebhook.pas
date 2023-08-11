unit Rsc.Api.Cora.Boleto.Schema.Resp.NewWebhook;

interface

uses
  Rsc.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TWebhookResp = class(TJsonDTO)
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

unit Rsc.Api.Cora.Boleto.Schema.Req.AlterarNotificacaoBoleto;

interface

uses
  System.Generics.Collections, REST.Json.Types, REST.Json

  , Rsc.Api.Cora.Boleto.Classes.Notifications

  ;

{$M+}

type

  TAlterarNotificacaoBoletoReq = class(TNotification)
  end;

implementation

end.

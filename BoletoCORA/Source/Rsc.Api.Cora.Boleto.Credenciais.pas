unit Rsc.Api.Cora.Boleto.Credenciais;

interface

uses
  System.Classes;

type

  TCredenciais = class(TPersistent)
  private
    { private declarations }
    Fclient_id : string;
    Fclient_secret : string;
  protected
    { protected declarations }
  published
    { public declarations }
    property client_id : string read Fclient_id write Fclient_id;
    property client_secret : string read Fclient_secret write Fclient_secret;
  end;

implementation

end.

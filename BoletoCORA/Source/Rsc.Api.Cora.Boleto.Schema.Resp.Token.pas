unit Rsc.Api.Cora.Boleto.Schema.Resp.Token;

interface

uses
  REST.Json.Types;

type

  TToken = class
  private
    Faccess_token: string;
    Fexpires_in: Integer;
    [JSONName('not-before-policy')]
    FNotBeforePolicy: Integer;
    Frefresh_expires_in: Integer;
    Frefresh_token: string;
    FScope: string;
    Fsession_state: string;
    Ftoken_type: string;
  public
    property access_token       : string  read Faccess_token        write Faccess_token;
    property expires_in         : Integer read Fexpires_in          write Fexpires_in;
    property NotBeforePolicy    : Integer read FNotBeforePolicy     write FNotBeforePolicy;
    property refresh_expires_in : Integer read Frefresh_expires_in  write Frefresh_expires_in;
    property refresh_token      : string  read Frefresh_token       write Frefresh_token;
    property Scope              : string  read FScope               write FScope;
    property session_state      : string  read Fsession_state       write Fsession_state;
    property token_type         : string  read Ftoken_type          write Ftoken_type;
  end;

implementation

end.

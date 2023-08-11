unit Rsc.Api.Cora.Boleto.Schema.Resp.Token;

interface

uses
  Rsc.Json.DTO, System.Generics.Collections, REST.Json.Types;

type

  TToken = class(TJsonDTO)
  private
    [JSONName('access_token')]
    FAccessToken: string;
    [JSONName('expires_in')]
    FExpiresIn: Integer;
    [JSONName('not-before-policy')]
    FNotBeforePolicy: Integer;
    [JSONName('refresh_expires_in')]
    FRefreshExpiresIn: Integer;
    [JSONName('refresh_token')]
    FRefreshToken: string;
    FScope: string;
    [JSONName('session_state')]
    FSessionState: string;
    [JSONName('token_type')]
    FTokenType: string;
  public
    property AccessToken      : string  read FAccessToken       write FAccessToken;
    property ExpiresIn        : Integer read FExpiresIn         write FExpiresIn;
    property NotBeforePolicy  : Integer read FNotBeforePolicy   write FNotBeforePolicy;
    property RefreshExpiresIn : Integer read FRefreshExpiresIn  write FRefreshExpiresIn;
    property RefreshToken     : string  read FRefreshToken      write FRefreshToken;
    property Scope            : string  read FScope             write FScope;
    property SessionState     : string  read FSessionState      write FSessionState;
    property TokenType        : string  read FTokenType         write FTokenType;
  end;

implementation

end.

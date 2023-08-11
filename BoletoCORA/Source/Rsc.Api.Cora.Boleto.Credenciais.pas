unit Rsc.Api.Cora.Boleto.Credenciais;

interface

type

  TCredenciais = class
  private
    { private declarations }
    FUserName : string;
    FPassword : string;
  protected
    { protected declarations }
  public
    { public declarations }
    property UserName : string read FUserName write FUserName;
    property Password : string read FPassword write FPassword;
  end;

implementation

end.

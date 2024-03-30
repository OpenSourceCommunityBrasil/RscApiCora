{====================================================================================}
{             RSC SISTEMAS                                                           }
{        SOLUÇÕES TECNOLÓGICAS                                                       }
{         rscsistemas.com.br                                                         }
{          +55 92 4141-2737                                                          }
{      contato@rscsistemas.com.br                                                    }
{                                                                                    }
{ Desenvolvidor por:                                                                 }
{   Roniery Santos Cardoso                                                           }
{     roniery@rscsistemas.com.br                                                     }
{     +55 92 984391279                                                               }
{                                                                                    }
{                                                                                    }
{ Versão Original RSC SISTEMAS                                                       }
{                                                                                    }
{ Faça uma  doação:                                                                  }
{ Pix - Email: roniery@rscsistemas.com.br                                            }
{ Banco: NuBank                                                                      }
{                                                                                    }
{                                                                                    }
{                                                                                    }
{ Componente TRscCoraBoleto                                                          }
{ Componente OpenSource                                                              }
{ Licença Pública Geral GNU v3.0                                                     }
{ Permissions of this strong copyleft license are conditioned on making available    }
{ complete source code of licensed works and modifications, which include larger     }
{ works using a licensed work, under the same license. Copyright and license         }
{ notices must be preserved. Contributors provide an express grant of patent rights. }
{                                                                                    }
{====================================================================================}

unit Rsc.Api.Cora.Boleto;

interface

  uses
      System.UITypes
    , System.Classes
    , System.SysUtils

    , Winapi.ShellAPI
    , Winapi.Windows

    , Generics.Collections
    , Rest.Json

    , IdSSLOpenSSL
    , IdHTTP

    , Rsc.Api.Cora.Boleto.Consts
    , Rsc.Api.Cora.Boleto.Enuns
    , Rsc.Api.Cora.Boleto.Notifications
    , Rsc.Api.Cora.Boleto.Credenciais

    , Rsc.Api.Cora.Boleto.Schema.Resp.Token
    , Rsc.Api.Cora.Boleto.Schema.Resp.NewBoleto
    , Rsc.Api.Cora.Boleto.Schema.Resp.BoletoDetalhes
    , Rsc.Api.Cora.Boleto.Schema.Resp.Boletos
    , Rsc.Api.Cora.Boleto.Schema.Resp.NewWebhook
    , Rsc.Api.Cora.Boleto.Schema.Resp.Webhooks

    , Rsc.Api.Cora.Boleto.Schema.Req.NewBoleto
    , Rsc.Api.Cora.Boleto.Schema.Req.AlterarNotificacaoBoleto
    , Rsc.Api.Cora.Boleto.Schema.Req.NewWebhook

    , Rsc.Api.Cora.Boleto.Classes.Notifications
    , Rsc.Api.Cora.Boleto.Schema.Req.NewCarne
    , Rsc.Api.Cora.Boleto.Schema.Resp.NewCarne

    ;

type

  TRscCoraBoleto = class(TComponent)
  private
    FCredenciais: TCredenciais;

    FToken  :TToken;
    FOnToken: TNotificaToken;
    FAmbiente: TEnumAmbiente;
    FOnGerarBoleto: TNotificaGerarBoleto;
    FOnConsultarBoleto: TNotificaConsultarBoleto;
    FOnConsultarBoletos: TNotificaConsultarBoletos;
    FOnDeletarBoleto: TNotificaDeletarBoleto;
    FOnAlterarNotificacaoBoleto: TNotificaAlterarNotificacaoBoleto;
    FOnNewWebhook: TNotificaNewWebhook;
    FOnConsultarWebhooks: TNotificaConsultarWebhooks;
    FOnDeletarWebhook: TNotificaDeletarWebhook;
    FDownalodPDF: Boolean;
    FPathDownloadPDF: string;
    FOnGerarCarne: TNotificaGerarCarne;

    procedure SetCredenciais(const Value: TCredenciais);
    procedure SetAmbiente(const Value: TEnumAmbiente);
    function GetAbout: string;
    procedure SetDownalodPDF(const Value: Boolean);
    procedure SetPathDownloadPDF(const Value: string);
    { private declarations }
  protected
    { protected declarations }
    procedure InOnToken(Sender : TObject; Const Token: TToken = nil; Erro: String    = '';  CodResp: integer  = -1);
    procedure InOnGerarBoleto(Sender : TObject; Const Boleto: TBoletoResp = nil; Erro: String    = '';  CodResp: integer  = -1);
    procedure InOnGerarCarne(Sender : TObject; Const Carne: TCarneResp = nil; Erro: String    = '';  CodResp: integer  = -1);
    procedure InOnConsultarBoleto(Sender : TObject; Const BoletoDetalhes: TBoletoDetalhesResp = nil; Erro: String    = '';  CodResp: integer  = -1);
    procedure InOnConsultarBoletos(Sender : TObject; Const BoletosList: TBoletosListResp = nil; Erro: String    = '';  CodResp: integer  = -1);
    procedure InOnDeletarBoleto(Sender : TObject; Const Erro: String    = '';  CodResp: integer  = -1);
    procedure InOnAlterarNotificacaoBoleto(Sender : TObject; Const Erro: String    = '';  CodResp: integer  = -1);

    procedure InOnNewWebhook(Sender : TObject; Const NewWebhook: TWebhookResp = nil; Erro: String    = '';  CodResp: integer  = -1);
    procedure InOnConsultarWebhooks(Sender : TObject; Const Webhooks: TWebhooksListResp = nil; Erro: String    = '';  CodResp: integer  = -1);
    procedure InOnDeletarWebhook(Sender : TObject; Const Erro: String    = '';  CodResp: integer  = -1);

    procedure VerificarPathDownloadPDF;
    procedure DownloadBoletoPDF(const NomeFile: string; Const UrlDownload: string);

  public
    { public declarations }
    function NewToken: Boolean; overload;
    function NewToken(refresh_token: string): Boolean; overload;
    function NewToken(auth_code: string; redirect_uri: string): Boolean; overload;

    function GerarBoleto(NewBoleto : TBoletoReq; IdempotencyKey: string): Boolean;
    function GerarCarne(NewCarner : TCarneReq; IdempotencyKey: string): Boolean;
    function ConsultarBoleto(invoice_id: string): Boolean;
    function ConsultarBoletos(DateStart: string; DateEnd: string; BoletoStatus: string = 'OPEN'; CpfCnpjDestinatario: string = ''; page: integer = 1; perPage: integer = 50): Boolean;
    function DeletarBoleto(invoice_id: string): Boolean;
    function AlterarNotificacaoBoleto(invoice_id: string; Notification: TNotification): Boolean;

    function CriarWebhook(NewWebhook : TWebhookReq; IdempotencyKey: string): Boolean;
    function ConsultarWebhooks: Boolean;
    function DeletarWebhook(Webhook_id: string): Boolean;

    procedure SolicitarAutorizacao(redirect_uri: string; scopes: string);

    Constructor Create(AOwner   : TComponent);  Override;
    Destructor  Destroy;  Override;

    property Token  : TToken  read FToken write FToken;

  published

    property About : string read GetAbout;

    property Credenciais    : TCredenciais read FCredenciais write SetCredenciais;
    property Ambiente       : TEnumAmbiente read FAmbiente write SetAmbiente;
    property DownalodPDF    : Boolean read FDownalodPDF write SetDownalodPDF;
    property PathDownloadPDF: string read FPathDownloadPDF write SetPathDownloadPDF;

    property OnToken                    : TNotificaToken                    read  FOnToken                    write  FOnToken;
    property OnGerarBoleto              : TNotificaGerarBoleto              read  FOnGerarBoleto              write  FOnGerarBoleto;
    property OnGerarCarne               : TNotificaGerarCarne               read  FOnGerarCarne               write  FOnGerarCarne;
    property OnConsultarBoleto          : TNotificaConsultarBoleto          read  FOnConsultarBoleto          write  FOnConsultarBoleto;
    property OnConsultarBoletos         : TNotificaConsultarBoletos         read  FOnConsultarBoletos         write  FOnConsultarBoletos;
    property OnDeletarBoleto            : TNotificaDeletarBoleto            read  FOnDeletarBoleto            write  FOnDeletarBoleto;
    property OnAlterarNotificacaoBoleto : TNotificaAlterarNotificacaoBoleto read  FOnAlterarNotificacaoBoleto write  FOnAlterarNotificacaoBoleto;

    property OnNewWebhook               : TNotificaNewWebhook               read  FOnNewWebhook               write  FOnNewWebhook;
    property OnConsultarWebhooks        : TNotificaConsultarWebhooks        read  FOnConsultarWebhooks        write  FOnConsultarWebhooks;
    property OnDeletarWebhook           : TNotificaDeletarWebhook           read  FOnDeletarWebhook           write  FOnDeletarWebhook;


  end;


implementation

{ TRscCoraBoleto }


constructor TRscCoraBoleto.Create(AOwner: TComponent);
begin
  inherited;
  FCredenciais  :=  TCredenciais.Create;
  FToken        :=  TToken.Create;
  FDownalodPDF  :=  False;
end;

destructor TRscCoraBoleto.Destroy;
begin
  FToken.Free;
  FCredenciais.Free;
  inherited;
end;

procedure TRscCoraBoleto.DownloadBoletoPDF(const NomeFile: string; Const UrlDownload: string);
var
  fileDownload: TFileStream;
  IdHTTP  : TIdHTTP;
begin
  if UrlDownload = '' then
    Exit;
  if NomeFile = '' then
    Exit;
  IdHTTP  := TIdHTTP.Create(nil);
  fileDownload := TFileStream.Create(FPathDownloadPDF + ExtractFileName(NomeFile) + '.pdf', fmCreate);
  try
    try
      IdHTTP.Get(UrlDownload, fileDownload);
    except
    end;
  finally
    FreeAndNil(fileDownload);
    IdHTTP.Free;
  end;
end;

procedure TRscCoraBoleto.InOnToken(Sender: TObject; const Token: TToken;
  Erro: String; CodResp: integer);
begin
  if Assigned(FOnToken) then
     FOnToken(Sender, Token, Erro, CodResp);
end;

procedure TRscCoraBoleto.InOnGerarBoleto(Sender: TObject;
  const Boleto: TBoletoResp; Erro: String; CodResp: integer);
begin

  if Boleto <> nil then
    begin
      if DownalodPDF then
        begin
          VerificarPathDownloadPDF;
          DownloadBoletoPDF(Boleto.Code, Boleto.Payment_Options.bank_slip.Url);
        end;
    end;

  if Assigned(FOnGerarBoleto) then
     FOnGerarBoleto(Sender, Boleto, Erro, CodResp);
end;

procedure TRscCoraBoleto.InOnGerarCarne(Sender: TObject;
  const Carne: TCarneResp; Erro: String; CodResp: integer);
var
  sfilename: string;
begin
  if Carne <> nil then
    begin
      if DownalodPDF then
        begin
          sfilename :=  Carne.Document_Url;
          Delete(sfilename, Pos('?', sfilename), Length(sfilename));
          Delete(sfilename, 1, Pos('boleto-parcelado', sfilename) - 1);

          VerificarPathDownloadPDF;
          DownloadBoletoPDF(sfilename, Carne.Document_Url);
        end;
    end;

  if Assigned(FOnGerarCarne) then
     FOnGerarCarne(Sender, Carne, Erro, CodResp);
end;

procedure TRscCoraBoleto.InOnConsultarBoleto(Sender: TObject;
  const BoletoDetalhes: TBoletoDetalhesResp; Erro: String; CodResp: integer);
begin
  if Assigned(FOnConsultarBoleto) then
     FOnConsultarBoleto(Sender, BoletoDetalhes, Erro, CodResp);
end;

procedure TRscCoraBoleto.InOnConsultarBoletos(Sender: TObject;
  const BoletosList: TBoletosListResp; Erro: String; CodResp: integer);
begin
  if Assigned(FOnConsultarBoletos) then
     FOnConsultarBoletos(Sender, BoletosList, Erro, CodResp);
end;

procedure TRscCoraBoleto.InOnDeletarBoleto(Sender: TObject; const Erro: String;
  CodResp: integer);
begin
  if Assigned(FOnDeletarBoleto) then
     FOnDeletarBoleto(Sender, Erro, CodResp);
end;

procedure TRscCoraBoleto.InOnAlterarNotificacaoBoleto(Sender: TObject;
  const Erro: String; CodResp: integer);
begin
  if Assigned(FOnAlterarNotificacaoBoleto) then
     FOnAlterarNotificacaoBoleto(Sender, Erro, CodResp);
end;

procedure TRscCoraBoleto.InOnNewWebhook(Sender: TObject;
  const NewWebhook: TWebhookResp; Erro: String; CodResp: integer);
begin
  if Assigned(FOnNewWebhook) then
     FOnNewWebhook(Sender, NewWebhook, Erro, CodResp);
end;

procedure TRscCoraBoleto.InOnConsultarWebhooks(Sender: TObject;
  const Webhooks: TWebhooksListResp; Erro: String; CodResp: integer);
begin
  if Assigned(FOnConsultarWebhooks) then
     FOnConsultarWebhooks(Sender, Webhooks, Erro, CodResp);
end;

procedure TRscCoraBoleto.InOnDeletarWebhook(Sender: TObject; const Erro: String;
  CodResp: integer);
begin
  if Assigned(FOnDeletarWebhook) then
     FOnDeletarWebhook(Sender, Erro, CodResp);
end;

procedure TRscCoraBoleto.SetAmbiente(const Value: TEnumAmbiente);
begin
  FAmbiente := Value;
end;

procedure TRscCoraBoleto.SetCredenciais(const Value: TCredenciais);
begin
  FCredenciais := Value;
end;

procedure TRscCoraBoleto.SetDownalodPDF(const Value: Boolean);
begin
  FDownalodPDF := Value;
end;

procedure TRscCoraBoleto.SetPathDownloadPDF(const Value: string);
begin
  FPathDownloadPDF := Value;
end;

function TRscCoraBoleto.NewToken: Boolean;
var
  StrmBody      : TStringStream ;
  StrlHeader    : TStringList ;
  vIdHTTP : TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  sUrlBase  : string;
begin
  Result  :=  False;

  StrlHeader  :=  TStringList.Create;
  StrmBody    :=  TStringStream.Create('', TEncoding.UTF8);
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];
      SSLHandler.SSLOptions.CertFile          :=  '';
      SSLHandler.SSLOptions.KeyFile           :=  '';
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         :=  '';
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;

      StrlHeader.Add('grant_type=client_credentials');

      vIdHTTP.Request.Username  :=  FCredenciais.client_id;
      vIdHTTP.Request.Password  :=  FCredenciais.client_secret;
      vIdHTTP.Request.BasicAuthentication :=  True;
      vIdHTTP.Request.ContentType      :=  'application/x-www-form-urlencoded';

      case FAmbiente of
        taHomologacao : sUrlBase  :=  URLBASE_HOMOLOGACAO;
        taProducao    : sUrlBase  :=  URLBASE_PRODUCAO;
      end;

      sUrlBase  :=  sUrlBase  + ENDPOINT_TOKEN;

      try
        vIdHTTP.Post(sUrlBase, StrlHeader, StrmBody);
        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              Result  :=  True;
              if FToken <> nil then
                FToken.FreeInstance;
              FToken  :=  TJson.JsonToObject<TToken>(StrmBody.DataString);
              InOnToken(Self, FToken, '', vIdHTTP.ResponseCode);
            end;
        else
          InOnToken(Self, nil, UTF8ToWideString(UTF8Encode(StrmBody.DataString)), vIdHTTP.ResponseCode);
        end;
      Except on E: Exception do
        InOnToken(Self, nil, 'Erro Inesperado: '+sLineBreak+ e.Message, 4001);
      end;
    except on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
    StrlHeader.Free
  end;
end;

function TRscCoraBoleto.NewToken(refresh_token: string): Boolean;
var
  StrmBody      : TStringStream ;
  StrlHeader    : TStringList ;
  vIdHTTP : TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  sUrlBase  : string;
begin
  Result  :=  False;

  StrlHeader  :=  TStringList.Create;
  StrmBody    :=  TStringStream.Create('', TEncoding.UTF8);
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];
      SSLHandler.SSLOptions.CertFile          :=  '';
      SSLHandler.SSLOptions.KeyFile           :=  '';
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         :=  '';
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;

      if refresh_token <> EmptyStr then
        begin
          StrlHeader.Add('grant_type=refresh_token');
          StrlHeader.Add('refresh_token='  + refresh_token);
        end
      else
        begin
          Exit;
        end;

      vIdHTTP.Request.Username  :=  FCredenciais.client_id;
      vIdHTTP.Request.Password  :=  FCredenciais.client_secret;
      vIdHTTP.Request.BasicAuthentication :=  True;
      vIdHTTP.Request.ContentType      :=  'application/x-www-form-urlencoded';

      case FAmbiente of
        taHomologacao : sUrlBase  :=  URLBASE_HOMOLOGACAO;
        taProducao    : sUrlBase  :=  URLBASE_PRODUCAO;
      end;

      sUrlBase  :=  sUrlBase  + ENDPOINT_TOKEN;

      try
        vIdHTTP.Post(sUrlBase, StrlHeader, StrmBody);
        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              Result  :=  True;
              if FToken <> nil then
                FToken.FreeInstance;
              FToken  :=  TJson.JsonToObject<TToken>(StrmBody.DataString);
              InOnToken(Self, FToken, '', vIdHTTP.ResponseCode);
            end;
        else
          InOnToken(Self, nil, UTF8ToWideString(UTF8Encode(StrmBody.DataString)), vIdHTTP.ResponseCode);
        end;
      Except on E: Exception do
        InOnToken(Self, nil, 'Erro Inesperado: '+sLineBreak+ e.Message, 4001);
      end;
    except on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
    StrlHeader.Free
  end;
end;

function TRscCoraBoleto.NewToken(auth_code, redirect_uri: string): Boolean;
var
  StrmBody      : TStringStream ;
  StrlHeader    : TStringList ;
  vIdHTTP : TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  sUrlBase  : string;
begin
  Result  :=  False;

  StrlHeader  :=  TStringList.Create;
  StrmBody    :=  TStringStream.Create('', TEncoding.UTF8);
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];
      SSLHandler.SSLOptions.CertFile          :=  '';
      SSLHandler.SSLOptions.KeyFile           :=  '';
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         :=  '';
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;

      if auth_code <> EmptyStr then
        begin
          StrlHeader.Add('grant_type=authorization_code');
          StrlHeader.Add('code='  + auth_code);
          StrlHeader.Add('redirect_uri='  + Trim(redirect_uri));
        end
      else
        begin
          StrlHeader.Add('grant_type=client_credentials');
        end;

      vIdHTTP.Request.Username  :=  FCredenciais.client_id;
      vIdHTTP.Request.Password  :=  FCredenciais.client_secret;
      vIdHTTP.Request.BasicAuthentication :=  True;
      vIdHTTP.Request.ContentType      :=  'application/x-www-form-urlencoded';

      case FAmbiente of
        taHomologacao : sUrlBase  :=  URLBASE_HOMOLOGACAO;
        taProducao    : sUrlBase  :=  URLBASE_PRODUCAO;
      end;

      sUrlBase  :=  sUrlBase  + ENDPOINT_TOKEN;

      try
        vIdHTTP.Post(sUrlBase, StrlHeader, StrmBody);
        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              Result  :=  True;
              if FToken <> nil then
                FToken.FreeInstance;
              FToken  :=  TJson.JsonToObject<TToken>(StrmBody.DataString);
              InOnToken(Self, FToken, '', vIdHTTP.ResponseCode);
            end;
        else
          InOnToken(Self, nil, UTF8ToWideString(UTF8Encode(StrmBody.DataString)), vIdHTTP.ResponseCode);
        end;
      Except on E: Exception do
        InOnToken(Self, nil, 'Erro Inesperado: '+sLineBreak+ e.Message, 4001);
      end;
    except on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
    StrlHeader.Free
  end;
end;

function TRscCoraBoleto.GerarBoleto(NewBoleto: TBoletoReq;
  IdempotencyKey: string): Boolean;
var
  StrmBody      : TStringStream ;
  StrlHeader    : TStringStream ;
  vIdHTTP : TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  sUrlBase  : string;
  Boleto: TBoletoResp;
begin
  Result  :=  False;

  StrlHeader  :=  TStringStream.Create(NewBoleto.ToString, TEncoding.UTF8);
  StrmBody    :=  TStringStream.Create(EmptyStr, TEncoding.UTF8);
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];
      SSLHandler.SSLOptions.CertFile          :=  '';
      SSLHandler.SSLOptions.KeyFile           :=  '';
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         :=  '';
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.ReadTimeout                       := 9000;
      vIdHTTP.ConnectTimeout                    := 9000;
      vIdHTTP.HandleRedirects                   :=  False;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.CustomHeaders.FoldLines := False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization', 'Bearer ' + Ftoken.Access_Token);
      vIdHTTP.Request.CustomHeaders.AddValue('Idempotency-Key', IdempotencyKey);

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.Authentication.Free;
      vIdHTTP.Request.Authentication := Nil;

      vIdHTTP.Request.Charset                   := 'utf-8';
      vIdHTTP.Request.AcceptCharSet             := vIdHTTP.Request.Charset;
      vIdHTTP.Request.Accept                    := '*/*';
      vIdHTTP.Request.AcceptEncoding            := 'gzip, deflate, br';
      vIdHTTP.Request.ContentType               := 'application/json';
      vIdHTTP.Request.ContentEncoding           := 'gzip, identity';
      vIdHTTP.Request.UserAgent                 := 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.0 Safari/537.36';

      case FAmbiente of
        taHomologacao : sUrlBase  :=  URLBASE_HOMOLOGACAO;
        taProducao    : sUrlBase  :=  URLBASE_PRODUCAO;
      end;

     sUrlBase  :=  sUrlBase  + ENDPOINT_GERAR_FATURA;

      try
        vIdHTTP.Post(sUrlBase, StrlHeader, StrmBody);
        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              Result  :=  True;
              Boleto  :=  TJson.JsonToObject<TBoletoResp>(StrmBody.DataString);
              try
                InOnGerarBoleto(Self, Boleto, '', vIdHTTP.ResponseCode);
              finally
                Boleto.Free;
              end;
            end;
        else
          InOnGerarBoleto(Self, nil, UTF8ToWideString(UTF8Encode(StrmBody.DataString)), vIdHTTP.ResponseCode);
        end;
      Except
        On E: EIdHTTPProtocolException do
         Begin
          If (Length(E.ErrorMessage) > 0) Or (E.ErrorCode > 0) then
           Begin
            If E.ErrorMessage <> '' Then
              InOnGerarBoleto(Self, nil, 'Erro Inesperado: '+sLineBreak+ E.ErrorMessage, E.ErrorCode)
            Else
             InOnGerarBoleto(Self, nil, 'Erro Inesperado: '+sLineBreak+ e.Message, E.ErrorCode);
           End;
         End;
        on E: Exception do
          begin
            InOnGerarBoleto(Self, nil, 'Erro Inesperado: '+sLineBreak+ e.Message, vIdHTTP.ResponseCode);
          end;
      end;
    except on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
    StrlHeader.Free
  end;
end;

function TRscCoraBoleto.GerarCarne(NewCarner : TCarneReq;
  IdempotencyKey: string): Boolean;
var
  StrmBody      : TStringStream ;
  StrlHeader    : TStringStream ;
  vIdHTTP : TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  sUrlBase  : string;
  vCarner: TCarneResp;
begin
  Result  :=  False;

  StrlHeader  :=  TStringStream.Create(NewCarner.ToString, TEncoding.UTF8);
  StrmBody    :=  TStringStream.Create(EmptyStr, TEncoding.UTF8);
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  '';
      SSLHandler.SSLOptions.KeyFile           :=  '';
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         :=  '';
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.ReadTimeout                       := 10000;
      vIdHTTP.ConnectTimeout                    := 10000;
      vIdHTTP.HandleRedirects                   :=  False;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.CustomHeaders.FoldLines := False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization', 'Bearer ' + Ftoken.Access_Token);
      vIdHTTP.Request.CustomHeaders.AddValue('Idempotency-Key', IdempotencyKey);

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.Authentication.Free;
      vIdHTTP.Request.Authentication := Nil;

      vIdHTTP.Request.Charset                   := 'utf-8';
      vIdHTTP.Request.AcceptCharSet             := vIdHTTP.Request.Charset;
      vIdHTTP.Request.Accept                    := '*/*';
      vIdHTTP.Request.AcceptEncoding            := 'gzip, deflate, br';
      vIdHTTP.Request.ContentType               := 'application/json';
      vIdHTTP.Request.ContentEncoding           := 'gzip, identity';
      vIdHTTP.Request.UserAgent                 := 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.0 Safari/537.36';

      case FAmbiente of
        taHomologacao : sUrlBase  :=  URLBASE_HOMOLOGACAO;
        taProducao    : sUrlBase  :=  URLBASE_PRODUCAO;
      end;

      sUrlBase  :=  sUrlBase  + ENDPOINT_GERAR_CARNE;

      try
        vIdHTTP.Post(sUrlBase, StrlHeader, StrmBody);
        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              Result  :=  True;
              vCarner  :=  TJson.JsonToObject<TCarneResp>(StrmBody.DataString);
              try
                InOnGerarCarne(Self, vCarner, '', vIdHTTP.ResponseCode);
              finally
                vCarner.Free;
              end;
            end;
        else
          InOnGerarCarne(Self, nil, UTF8ToWideString(UTF8Encode(StrmBody.DataString)), vIdHTTP.ResponseCode);
        end;
      Except
        On E: EIdHTTPProtocolException do
         Begin
          If (Length(E.ErrorMessage) > 0) Or (E.ErrorCode > 0) then
           Begin
            If E.ErrorMessage <> '' Then
              InOnGerarCarne(Self, nil, 'Erro Inesperado: '+sLineBreak+ E.ErrorMessage, E.ErrorCode)
            Else
             InOnGerarCarne(Self, nil, 'Erro Inesperado: '+sLineBreak+ e.Message, E.ErrorCode);
           End;
         End;
        on E: Exception do
          begin
            InOnGerarCarne(Self, nil, 'Erro Inesperado: '+sLineBreak+ e.Message, vIdHTTP.ResponseCode);
          end;
      end;
    except on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
    StrlHeader.Free
  end;
end;

function TRscCoraBoleto.GetAbout: string;
begin
  Result  :=  'V 1.3.0';
end;

function TRscCoraBoleto.ConsultarBoleto(invoice_id: string): Boolean;
var
  StrmBody      : TStringStream ;
  vIdHTTP : TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  sUrlBase  : string;
  Boleto: TBoletoDetalhesResp;
begin
  Result  :=  False;

  StrmBody    :=  TStringStream.Create('', TEncoding.UTF8);
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];
      SSLHandler.SSLOptions.CertFile          :=  '';
      SSLHandler.SSLOptions.KeyFile           :=  '';
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         :=  '';
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + Ftoken.Access_Token);
      vIdHTTP.Request.ContentType      :=  'application/json';

      case FAmbiente of
        taHomologacao : sUrlBase  :=  URLBASE_HOMOLOGACAO;
        taProducao    : sUrlBase  :=  URLBASE_PRODUCAO;
      end;

      sUrlBase  :=  sUrlBase  + StringReplace(ENDPOINT_CONSULTAR_FATURA, '{invoice_id}', invoice_id, [rfReplaceAll]);

      try
        vIdHTTP.Get(sUrlBase, StrmBody);
        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              Result  :=  True;
              Boleto  :=  TJson.JsonToObject<TBoletoDetalhesResp>(StrmBody.DataString);
              try
                InOnConsultarBoleto(Self, Boleto, '', vIdHTTP.ResponseCode);
              finally
                Boleto.Free;
              end;
            end;
        else
          InOnConsultarBoleto(Self, nil, UTF8ToWideString(UTF8Encode(StrmBody.DataString)), vIdHTTP.ResponseCode);
        end;
      Except on E: Exception do
        InOnConsultarBoleto(Self, nil, 'Erro Inesperado: '+sLineBreak+ e.Message, 4001);
      end;
    except on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
  end;
end;

function TRscCoraBoleto.ConsultarBoletos(DateStart, DateEnd, BoletoStatus,
  CpfCnpjDestinatario: string; page, perPage: integer): Boolean;
var
  StrmBody      : TStringStream ;
  vIdHTTP : TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  sUrlBase  : string;
  Boleto: TBoletosListResp;
begin
  Result  :=  False;

  StrmBody    :=  TStringStream.Create('', TEncoding.UTF8);
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];
      SSLHandler.SSLOptions.CertFile          :=  '';
      SSLHandler.SSLOptions.KeyFile           :=  '';
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         :=  '';
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + Ftoken.Access_Token);
      vIdHTTP.Request.ContentType      :=  'application/json';

      case FAmbiente of
        taHomologacao : sUrlBase  :=  URLBASE_HOMOLOGACAO;
        taProducao    : sUrlBase  :=  URLBASE_PRODUCAO;
      end;

      sUrlBase  :=  sUrlBase  + ENDPOINT_CONSULTAR_FATURAS;

      sUrlBase  :=  StringReplace(sUrlBase, '{start}', DateStart, [rfReplaceAll]);
      sUrlBase  :=  StringReplace(sUrlBase, '{end}', DateEnd, [rfReplaceAll]);

      if BoletoStatus <> EmptyStr then
        sUrlBase  :=  sUrlBase  + '&state=' + UpperCase(BoletoStatus);

      if CpfCnpjDestinatario <> EmptyStr then
        sUrlBase  :=  sUrlBase  + '&search=' + CpfCnpjDestinatario;

      if page.ToString <> EmptyStr then
        sUrlBase  :=  sUrlBase  + '&page=' + page.ToString;

      if perPage.ToString <> EmptyStr then
        sUrlBase  :=  sUrlBase  + '&perPage=' + perPage.ToString;

      try
        vIdHTTP.Get(sUrlBase, StrmBody);
        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              Result  :=  True;
              Boleto  :=  TJson.JsonToObject<TBoletosListResp>(StrmBody.DataString);
              try
                InOnConsultarBoletos(Self, Boleto, '', vIdHTTP.ResponseCode);
              finally
                Boleto.Free;
              end;
            end;
        else
          InOnConsultarBoletos(Self, nil, UTF8ToWideString(UTF8Encode(StrmBody.DataString)), vIdHTTP.ResponseCode);
        end;
      Except on E: Exception do
        InOnConsultarBoletos(Self, nil, 'Erro Inesperado: '+sLineBreak+ e.Message, 4001);
      end;
    except on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
  end;
end;

function TRscCoraBoleto.DeletarBoleto(invoice_id: string): Boolean;
var
  StrmBody      : TStringStream ;
  vIdHTTP : TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  sUrlBase  : string;
begin
  Result  :=  False;

  StrmBody    :=  TStringStream.Create('', TEncoding.UTF8);
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];
      SSLHandler.SSLOptions.CertFile          :=  '';
      SSLHandler.SSLOptions.KeyFile           :=  '';
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         :=  '';
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + Ftoken.Access_Token);
      vIdHTTP.Request.ContentType      :=  'application/json';

      case FAmbiente of
        taHomologacao : sUrlBase  :=  URLBASE_HOMOLOGACAO;
        taProducao    : sUrlBase  :=  URLBASE_PRODUCAO;
      end;

      sUrlBase  :=  sUrlBase  + ENDPOINT_DELETAR_FATRA;

      sUrlBase  :=  StringReplace(sUrlBase, '{invoice_id}', invoice_id, [rfReplaceAll]);

      try
        vIdHTTP.Delete(sUrlBase, StrmBody);
        case vIdHTTP.ResponseCode of
          200, 201, 204:
            begin
              Result  :=  True;
              InOnDeletarBoleto(Self, EmptyStr, vIdHTTP.ResponseCode);
            end;
        else
          InOnDeletarBoleto(Self, UTF8ToWideString(UTF8Encode(StrmBody.DataString)), vIdHTTP.ResponseCode);
        end;
      Except on E: Exception do
        InOnDeletarBoleto(Self, 'Erro Inesperado: '+sLineBreak+ e.Message, 4001);
      end;
    except on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
  end;
end;

function TRscCoraBoleto.AlterarNotificacaoBoleto(invoice_id: string; Notification: TNotification): Boolean;
var
  StrmBody      : TStringStream ;
  vIdHTTP : TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  sUrlBase  : string;
begin
  Result  :=  False;

  StrmBody    :=  TStringStream.Create(Notification.toString, TEncoding.UTF8);
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];
      SSLHandler.SSLOptions.CertFile          :=  '';
      SSLHandler.SSLOptions.KeyFile           :=  '';
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         :=  '';
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + Ftoken.Access_Token);
      vIdHTTP.Request.ContentType      :=  'application/json';

      case FAmbiente of
        taHomologacao : sUrlBase  :=  URLBASE_HOMOLOGACAO;
        taProducao    : sUrlBase  :=  URLBASE_PRODUCAO;
      end;

      sUrlBase  :=  sUrlBase  +  ENDPOINT_EDITAR_NOTIFICACAO_FATURA;

      sUrlBase  :=  StringReplace(sUrlBase, '{invoice_id}', invoice_id, [rfReplaceAll]);

      try
        vIdHTTP.Put(sUrlBase, StrmBody);
        case vIdHTTP.ResponseCode of
          200, 201, 204:
            begin
              Result  :=  True;
              InOnAlterarNotificacaoBoleto(Self, EmptyStr, vIdHTTP.ResponseCode);
            end;
        else
          InOnAlterarNotificacaoBoleto(Self, UTF8ToWideString(UTF8Encode(StrmBody.DataString)), vIdHTTP.ResponseCode);
        end;
      Except on E: Exception do
        InOnAlterarNotificacaoBoleto(Self, 'Erro Inesperado: '+sLineBreak+ e.Message, 4001);
      end;
    except on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
  end;
end;

function TRscCoraBoleto.CriarWebhook(NewWebhook: TWebhookReq;
  IdempotencyKey: string): Boolean;
var
  StrmBody      : TStringStream ;
  StrlHeader    : TStringList;
  vIdHTTP : TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  sUrlBase  : string;
  Webhook: TWebhookResp;
begin
  Result  :=  False;

  StrlHeader  :=  TStringList.Create;
  StrmBody    :=  TStringStream.Create(TJson.ObjectToJsonString(NewWebhook), TEncoding.UTF8);
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];
      SSLHandler.SSLOptions.CertFile          :=  '';
      SSLHandler.SSLOptions.KeyFile           :=  '';
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         :=  '';
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + Ftoken.Access_Token);
      vIdHTTP.Request.CustomHeaders.AddValue('Idempotency-Key',IdempotencyKey);
      vIdHTTP.Request.ContentType      :=  'application/json';

      case FAmbiente of
        taHomologacao : sUrlBase  :=  URLBASE_HOMOLOGACAO;
        taProducao    : sUrlBase  :=  URLBASE_PRODUCAO;
      end;

      sUrlBase  :=  sUrlBase  + ENDPOINT_CRIAR_WEBHOOKS;

      try
        StrlHeader.Text :=  vIdHTTP.Post(sUrlBase, StrmBody);
        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              Result  :=  True;
              Webhook :=  TJson.JsonToObject<TWebhookResp>(StrlHeader.Text);
              try
                InOnNewWebhook(Self, Webhook, '', vIdHTTP.ResponseCode);
              finally
                Webhook.Free;
              end;
            end;
        else
          InOnNewWebhook(Self, nil, UTF8ToWideString(UTF8Encode(StrlHeader.Text)), vIdHTTP.ResponseCode);
        end;
      Except on E: Exception do
        InOnNewWebhook(Self, nil, 'Erro Inesperado: '+sLineBreak+ e.Message, 4001);
      end;
    except on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
    StrlHeader.Free;
  end;
end;

function TRscCoraBoleto.ConsultarWebhooks: Boolean;
var
  StrmBody      : TStringStream ;
  vIdHTTP : TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  sUrlBase  : string;
  Webhooks: TWebhooksListResp;
begin
  Result  :=  False;

  StrmBody    :=  TStringStream.Create('', TEncoding.UTF8);
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];
      SSLHandler.SSLOptions.CertFile          :=  '';
      SSLHandler.SSLOptions.KeyFile           :=  '';
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         :=  '';
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + Ftoken.Access_Token);
      vIdHTTP.Request.ContentType      :=  'application/json';

      case FAmbiente of
        taHomologacao : sUrlBase  :=  URLBASE_HOMOLOGACAO;
        taProducao    : sUrlBase  :=  URLBASE_PRODUCAO;
      end;

      sUrlBase  :=  sUrlBase  + ENDPOINT_LISTAR_WEBHOOKS;

      try
        vIdHTTP.Get(sUrlBase, StrmBody);
        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              Result  :=  True;
              Webhooks  :=  TJson.JsonToObject<TWebhooksListResp>('{"Items":' + StrmBody.DataString + '}');
              try
                InOnConsultarWebhooks(Self, Webhooks, '', vIdHTTP.ResponseCode);
              finally
                Webhooks.Free;
              end;
            end;
        else
          InOnConsultarWebhooks(Self, nil, UTF8ToWideString(UTF8Encode(StrmBody.DataString)), vIdHTTP.ResponseCode);
        end;
      Except on E: Exception do
        InOnConsultarWebhooks(Self, nil, 'Erro Inesperado: '+sLineBreak+ e.Message, 4001);
      end;
    except on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
  end;
end;

function TRscCoraBoleto.DeletarWebhook(Webhook_id: string): Boolean;
var
  StrmBody      : TStringStream ;
  vIdHTTP : TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  sUrlBase  : string;
begin
  Result  :=  False;

  StrmBody    :=  TStringStream.Create('', TEncoding.UTF8);
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];
      SSLHandler.SSLOptions.CertFile          :=  '';
      SSLHandler.SSLOptions.KeyFile           :=  '';
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         :=  '';
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + Ftoken.Access_Token);
      vIdHTTP.Request.ContentType      :=  'application/json';

      case FAmbiente of
        taHomologacao : sUrlBase  :=  URLBASE_HOMOLOGACAO;
        taProducao    : sUrlBase  :=  URLBASE_PRODUCAO;
      end;

      sUrlBase  :=  sUrlBase  + ENDPOINT_DELETAR_WEBHOOKS;

      sUrlBase  :=  StringReplace(sUrlBase, '{endpoint_id}', Webhook_id, [rfReplaceAll]);

      try
        vIdHTTP.Delete(sUrlBase, StrmBody);
        case vIdHTTP.ResponseCode of
          200, 201, 204:
            begin
              Result  :=  True;
              InOnDeletarWebhook(Self, EmptyStr, vIdHTTP.ResponseCode);
            end;
        else
          InOnDeletarWebhook(Self, UTF8ToWideString(UTF8Encode(StrmBody.DataString)), vIdHTTP.ResponseCode);
        end;
      Except on E: Exception do
        InOnDeletarWebhook(Self, 'Erro Inesperado: '+sLineBreak+ e.Message, 4001);
      end;
    except on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
  end;
end;

procedure TRscCoraBoleto.SolicitarAutorizacao(redirect_uri, scopes: string);
var
  sUrlBase  : string;
begin

  case FAmbiente of
    taHomologacao : sUrlBase  :=  URLBASE_HOMOLOGACAO;
    taProducao    : sUrlBase  :=  URLBASE_PRODUCAO;
  end;

  sUrlBase  :=  sUrlBase  + ENDPOINT_AUTHORIZE;
  sUrlBase  :=  StringReplace(sUrlBase, '{client_id}', Self.FCredenciais.client_id, [rfReplaceAll]);
  sUrlBase  :=  StringReplace(sUrlBase, '{redirect_uri}', redirect_uri, [rfReplaceAll]);
  sUrlBase  :=  StringReplace(sUrlBase, '{scopes}', scopes, [rfReplaceAll]);

  ShellExecute(0, 'open', PWideChar(sUrlBase),  nil,  nil,  SW_SHOWMAXIMIZED);

end;


procedure TRscCoraBoleto.VerificarPathDownloadPDF;
begin
  if FPathDownloadPDF <> '' then
    begin
      if not DirectoryExists(FPathDownloadPDF) then
        begin
          try
            if not ForceDirectories(PwideChar(FPathDownloadPDF)) then
              begin
                FPathDownloadPDF :=  ExtractFilePath(ParamStr(0))  + 'Boleto\PDF\';
              end;
          except on E: Exception do
            FPathDownloadPDF  :=  ExtractFilePath(ParamStr(0))  + 'Boleto\PDF\';
          end;
        end;
    end
  else
    begin
      FPathDownloadPDF  :=  ExtractFilePath(ParamStr(0))  + 'Boleto\PDF\';
      VerificarPathDownloadPDF;
    end;

end;

end.

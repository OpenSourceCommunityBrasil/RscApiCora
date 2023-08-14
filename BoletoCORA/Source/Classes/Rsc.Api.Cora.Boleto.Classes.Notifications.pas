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

unit Rsc.Api.Cora.Boleto.Classes.Notifications;

interface

uses
  System.Generics.Collections, REST.Json

  , Rsc.Api.Cora.Boleto.Classes.Destination
  , Rsc.Api.Cora.Boleto.Classes.Schedules

  ;


type

  TNotification = class
  private
    FChannels: TArray<string>;
    FDestination: TDestination;
    FRules: TArray<string>;
  protected
    function GetAsJson: string;
  public
    property Channels: TArray<string> read FChannels write FChannels;
    property Destination: TDestination read FDestination;
    property Rules: TArray<string> read FRules write FRules;
  public
    constructor Create;
    destructor Destroy; override;

    function ToString: string; override;

  end;

  TNotifications = class(TNotification)
  private
    FId: string;
    FSchedules: TArray<TSchedules>;
  public
    property Id: string read FId write FId;
    property Schedules: TArray<TSchedules> read FSchedules write FSchedules;

    constructor Create; overload;
    destructor Destroy; override;
  end;

implementation

{ TNotification }

constructor TNotification.Create;
begin
  inherited;
  FDestination := TDestination.Create;
end;

destructor TNotification.Destroy;
begin
  FDestination.Free;
  inherited;
end;

function TNotification.GetAsJson: string;
begin
  Result  :=  TJson.ObjectToJsonString(Self);
end;


function TNotification.toString: string;
begin
  Result  :=  TJson.ObjectToJsonString(Self);
end;

{ TNotifications }

constructor TNotifications.Create;
begin
  inherited;
end;

destructor TNotifications.Destroy;
var
  Schedules  : TSchedules;
begin
  for Schedules in FSchedules do
  begin
    Schedules.Free;
  end;

  inherited;
end;

end.

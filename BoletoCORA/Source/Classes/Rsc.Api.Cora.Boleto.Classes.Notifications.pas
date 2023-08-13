unit Rsc.Api.Cora.Boleto.Classes.Notifications;

interface

uses
  System.Generics.Collections, REST.Json.Types, REST.Json

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

    function toString: string;

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

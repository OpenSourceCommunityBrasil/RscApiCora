unit Rsc.Api.Cora.Boleto.Classes.Notification;

interface
  uses
  System.Generics.Collections
  , System.JSON
  , System.SysUtils
  , REST.Json.Types
  , REST.Json
  , Rsc.Api.Cora.Boleto.Classes.Destination
  , Rsc.Api.Cora.Boleto.Classes.Schedules
  ;

type

  TNotification = class
  private
    FChannels: TArray<string>;
    FDestination: TDestination;
    FId: string;
    FSchedules: TArray<TSchedules>;
  public
    property Channels: TArray<string> read FChannels write FChannels;
    property Destination: TDestination read FDestination write FDestination;
    property Id: string read FId write FId;
    property Schedules: TArray<TSchedules> read FSchedules write FSchedules;

    constructor Create;
    destructor Destroy; override;

    function ToString: string;  override;

  end;


implementation

{ TNotification }

constructor TNotification.Create;
begin
  inherited;
  FDestination  :=  TDestination.Create;
end;

destructor TNotification.Destroy;
begin
  FDestination.Free;
  inherited;
end;

function TNotification.ToString: string;
begin
  Result :=  TJson.ObjectToJsonString(Self);
end;

end.


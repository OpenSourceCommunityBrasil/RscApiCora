unit Rsc.Api.Cora.Boleto.Classes.Notifications;

interface

uses
  System.Generics.Collections, REST.Json.Types, REST.Json

  , Rsc.Api.Cora.Boleto.Classes.Destination

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
  end;

implementation

{ TRoot }

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


end.

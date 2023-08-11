unit Rsc.Api.Cora.Boleto.Classes.Destination;

interface

type

  TDestination = class
  private
    FEmail: string;
    FName: string;
  public
    property Email: string read FEmail write FEmail;
    property Name: string read FName write FName;
  end;

implementation

end.

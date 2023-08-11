unit Rsc.Api.Cora.Boleto.Classes.Services;

interface

type

  TServices = class
  private
    FAmount: Integer;
    FDescription: string;
    FName: string;
  public
    property Amount: Integer read FAmount write FAmount;
    property Description: string read FDescription write FDescription;
    property Name: string read FName write FName;
  end;

implementation

end.

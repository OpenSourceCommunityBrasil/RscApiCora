unit Rsc.Api.Cora.Boleto.Classes.ServicesReq;

interface

type

  TServices = class
  private
    FAmount: Double;
    FDescription: string;
    FName: string;
  public
    property Amount: Double read FAmount write FAmount;
    property Description: string read FDescription write FDescription;
    property Name: string read FName write FName;
  end;

implementation

end.

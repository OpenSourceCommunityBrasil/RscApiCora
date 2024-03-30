unit Rsc.Api.Cora.Boleto.Classes.Buyer;

interface
  uses
    Rsc.Api.Cora.Boleto.Classes.Address
    ;

type

  TBuyer = class
  private
    FAddress: TAddress;
    FDocument: string;
    FEmail: string;
    FName: string;
    FType: string;
  public
    property Address: TAddress read FAddress;
    property Document: string read FDocument write FDocument;
    property Email: string read FEmail write FEmail;
    property Name: string read FName write FName;
    property &Type: string read FType write FType;
  end;

implementation

end.

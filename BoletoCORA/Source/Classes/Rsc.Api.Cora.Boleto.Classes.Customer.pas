unit Rsc.Api.Cora.Boleto.Classes.Customer;

interface

uses

    Rsc.Api.Cora.Boleto.Classes.Address
  , Rsc.Api.Cora.Boleto.Classes.Document

  ;

type

  TCustomer = class
  private
    FAddress: TAddress;
    FDocument: TDocument;
    FEmail: string;
    FName: string;
  public
    property Address: TAddress read FAddress;
    property Document: TDocument read FDocument;
    property Email: string read FEmail write FEmail;
    property Name: string read FName write FName;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TCustomer }

constructor TCustomer.Create;
begin
  inherited;
  FDocument := TDocument.Create;
  FAddress := TAddress.Create;
end;

destructor TCustomer.Destroy;
begin
  FDocument.Free;
  FAddress.Free;
  inherited;
end;

end.

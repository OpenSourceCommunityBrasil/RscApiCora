unit Rsc.Api.Cora.Boleto.Classes.Seller;

interface

type

  TSeller = class
  private
    FBusiness_Id: string;
    FDocument: string;
    FName: string;
    FType: string;
  published
    property business_id: string read FBusiness_Id write FBusiness_Id;
    property Document: string read FDocument write FDocument;
    property Name: string read FName write FName;
    property &Type: string read FType write FType;
  end;

implementation

end.

unit Rsc.Api.Cora.Boleto.Classes.Document;

interface

type

  TDocument = class
  private
    FIdentity: string;
    FType: string;
  public
    property Identity: string read FIdentity write FIdentity;
    property &Type: string read FType write FType;
  end;

implementation

end.

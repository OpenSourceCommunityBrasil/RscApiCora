unit Rsc.Api.Cora.Boleto.Classes.Discount;

interface

type


  TDiscount = class
  private
    FType: string;
    FValue: Double;
  public
    property &Type: string read FType write FType;
    property Value: Double read FValue write FValue;
  end;

implementation

end.

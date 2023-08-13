unit Rsc.Api.Cora.Boleto.Classes.Discount;

interface

type


  TDiscount = class
  private
    FType: string;
    FValue: Double;
//    FPercent: Double;
  public
    property &Type: string read FType write FType;
    property Value: Double read FValue write FValue;
//    property Percent: Double read FPercent write FPercent;
  end;

implementation

end.

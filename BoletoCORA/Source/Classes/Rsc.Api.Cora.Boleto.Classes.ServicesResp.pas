unit Rsc.Api.Cora.Boleto.Classes.ServicesResp;

interface

type

  TServices = class
  private
    FAmount: Double;
    FDescription: string;
    FName: string;
    FUnit: string;
    Fcode: integer;
    Ftotal_amount: Double;
    Fquantity: Double;
  public
    property Amount: Double read FAmount write FAmount;
    property Description: string read FDescription write FDescription;
    property Name: string read FName write FName;

    property &Unit: string read FUnit write FUnit;
    property quantity : Double read Fquantity write Fquantity;
    property total_amount : Double read Ftotal_amount write Ftotal_amount;
    property code : integer read Fcode write Fcode;
  end;

implementation

end.

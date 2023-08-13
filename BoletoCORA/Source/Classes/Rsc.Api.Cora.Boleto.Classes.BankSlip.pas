unit Rsc.Api.Cora.Boleto.Classes.BankSlip;

interface

type

  TBank_slip = class
  private
    FBarcode: string;
    FDigitable: string;
    FRegistered: Boolean;
    FUrl: string;
  published
    property Barcode: string read FBarcode write FBarcode;
    property Digitable: string read FDigitable write FDigitable;
    property Registered: Boolean read FRegistered write FRegistered;
    property Url: string read FUrl write FUrl;
  end;

implementation

end.



unit Rsc.Api.Cora.Boleto.Classes.PaymentOptions;

interface

  uses
    Rsc.Api.Cora.Boleto.Classes.BankSlip;

type

  TPaymentOptions = class
  private
    FBank_slip: TBank_slip;
  public
    constructor Create;
    destructor Destroy; override;

    property bank_slip: TBank_slip read FBank_slip write FBank_slip;
  end;

implementation

{ TPaymentOptions }

constructor TPaymentOptions.Create;
begin
  inherited;
  FBank_slip := TBank_slip.Create;
end;

destructor TPaymentOptions.Destroy;
begin
  FBank_slip.Free;
  inherited;
end;

end.

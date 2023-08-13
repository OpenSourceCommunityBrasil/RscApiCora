unit Rsc.Api.Cora.Boleto.Classes.PaymentTerms;

interface

uses
    Rsc.Api.Cora.Boleto.Classes.Interest
  , Rsc.Api.Cora.Boleto.Classes.Fine
  , Rsc.Api.Cora.Boleto.Classes.Discount

  ;

type

  TPaymentTerms = class
  private
    FDiscount: TDiscount;
    Fdue_date: TDate;
    FFine: TFine;
    FInterest: TInterest;
  public
    property Discount: TDiscount read FDiscount;
    property due_date: TDate read Fdue_date write Fdue_date;
    property Fine: TFine read FFine;
    property Interest: TInterest read FInterest;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TPaymentTerms }

constructor TPaymentTerms.Create;
begin
  inherited;
  FFine := TFine.Create;
  FInterest := TInterest.Create;
  FDiscount := TDiscount.Create;
end;

destructor TPaymentTerms.Destroy;
begin
  FFine.Free;
  FInterest.Free;
  FDiscount.Free;
  inherited;
end;

end.

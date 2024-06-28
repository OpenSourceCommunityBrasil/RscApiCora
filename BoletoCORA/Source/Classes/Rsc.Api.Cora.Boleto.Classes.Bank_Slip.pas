unit Rsc.Api.Cora.Boleto.Classes.Bank_Slip;

interface

type

  TBank_Slip = class
  private
    Famount_paid: Integer;
    FBarcode: string;
    Fbill_type: string;
    FDigitable: string;
    Fdiscount_percent: Double;
    Fdiscount_value: Integer;
    Fdocument_sequence: Integer;
    FFine: Integer;
    Ffine_percent: Double;
    Ffine_value: Integer;
    FInterest: Integer;
    Finterest_monthly_percent: Double;
    Four_number: string;
    FRegistered: Boolean;
    FUrl: string;
  public
    property amount_paid: Integer read Famount_paid write Famount_paid;
    property Barcode: string read FBarcode write FBarcode;
    property bill_type: string read Fbill_type write Fbill_type;
    property Digitable: string read FDigitable write FDigitable;
    property discount_percent: Double read Fdiscount_percent write Fdiscount_percent;
    property discount_value: Integer read Fdiscount_value write Fdiscount_value;
    property document_sequence: Integer read Fdocument_sequence write Fdocument_sequence;
    property Fine: Integer read FFine write FFine;
    property fine_percent: Double read Ffine_percent write Ffine_percent;
    property fine_value: Integer read Ffine_value write Ffine_value;
    property Interest: Integer read FInterest write FInterest;
    property interest_monthly_percent: Double read Finterest_monthly_percent write Finterest_monthly_percent;
    property our_number: string read Four_number write Four_number;
    property Registered: Boolean read FRegistered write FRegistered;
    property Url: string read FUrl write FUrl;
  end;


implementation

end.

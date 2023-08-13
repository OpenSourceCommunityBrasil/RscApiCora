unit Rsc.Api.Cora.Boleto.Classes.Payments;

interface

type

  TPayments = class
  private
    Fcreated_at: TDateTime;
    Ffinalized_at: TDateTime;
    FFine: Integer;
    FId: string;
    FInterest: Integer;
    FMethod: string;
    FOrder: Integer;
    FStatus: string;
    FTotalPaId: Integer;
  published
    property created_at: TDateTime read Fcreated_at write Fcreated_at;
    property finalized_at: TDateTime read Ffinalized_at write Ffinalized_at;
    property Fine: Integer read FFine write FFine;
    property Id: string read FId write FId;
    property Interest: Integer read FInterest write FInterest;
    property Method: string read FMethod write FMethod;
    property Order: Integer read FOrder write FOrder;
    property Status: string read FStatus write FStatus;
    property total_paid: Integer read FTotalPaId write FTotalPaId;
  end;

implementation

end.

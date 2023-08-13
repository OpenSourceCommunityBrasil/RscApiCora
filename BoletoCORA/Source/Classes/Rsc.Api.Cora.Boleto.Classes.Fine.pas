unit Rsc.Api.Cora.Boleto.Classes.Fine;

interface

type

  TFine = class
  private
    FAmount: Double;
//    FDate: TDateTime;
  public
    property Amount: Double read FAmount write FAmount;
//    property Date: TDateTime read FDate write FDate;
  end;

implementation

end.

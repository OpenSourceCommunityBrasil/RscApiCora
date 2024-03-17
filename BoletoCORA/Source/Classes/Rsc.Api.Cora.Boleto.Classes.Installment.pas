unit Rsc.Api.Cora.Boleto.Classes.Installment;

interface

type

  TDue_date = class
  private
    Fday_of_month: integer;
    Fdates: TArray<string>;
  public
    property day_of_month: integer read Fday_of_month write Fday_of_month;
    property dates: TArray<string> read Fdates write Fdates;
  end;

  TInstallment = class
  private
    Fnumber_of: integer;
    Fdue_date: TDue_date;
  public
    constructor Create;
    destructor Destroy; override;

    property number_of: integer read Fnumber_of write Fnumber_of;
    property due_date: TDue_date read Fdue_date write Fdue_date;

  end;



implementation

{ TInstallment }

constructor TInstallment.Create;
begin
  Fdue_date :=  TDue_date.Create;
end;

destructor TInstallment.Destroy;
begin
  Fdue_date.Free;
  inherited;
end;

end.


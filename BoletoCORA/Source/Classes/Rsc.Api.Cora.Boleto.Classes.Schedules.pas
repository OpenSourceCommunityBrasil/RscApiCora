unit Rsc.Api.Cora.Boleto.Classes.Schedules;

interface

type

  TSchedules = class
  private
    FActive: Boolean;
    FRule: string;
    Fscheduled_to: TDate;
    FStatus: string;
  public
    property Active: Boolean read FActive write FActive;
    property Rule: string read FRule write FRule;
    property scheduled_to: TDate read Fscheduled_to write Fscheduled_to;
    property Status: string read FStatus write FStatus;
  end;

implementation

end.


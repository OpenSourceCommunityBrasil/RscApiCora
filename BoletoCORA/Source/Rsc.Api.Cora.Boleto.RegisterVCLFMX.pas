unit Rsc.Api.Cora.Boleto.RegisterVCLFMX;
interface

uses
  System.SysUtils, System.Classes, Rsc.Api.Cora.Boleto;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Rsc API Cora', [TRscCoraBoleto]);
end;


end.

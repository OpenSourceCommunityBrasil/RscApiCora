unit Rsc.Api.Cora.Boleto.Schema.Req.NewCarne;

interface
uses
  System.Generics.Collections
  , REST.Json.Types
  , REST.Json
  , System.JSON
  , System.SysUtils

  , Rsc.Api.Cora.Boleto.Classes.Destination
  , Rsc.Api.Cora.Boleto.Classes.Notifications
  , Rsc.Api.Cora.Boleto.Classes.Discount
  , Rsc.Api.Cora.Boleto.Classes.Interest
  , Rsc.Api.Cora.Boleto.Classes.Fine
  , Rsc.Api.Cora.Boleto.Classes.PaymentTerms
  , Rsc.Api.Cora.Boleto.Classes.ServicesReq
  , Rsc.Api.Cora.Boleto.Classes.Address
  , Rsc.Api.Cora.Boleto.Classes.Document
  , Rsc.Api.Cora.Boleto.Classes.Customer
  , Rsc.Api.Cora.Boleto.Classes.Installment

  ;


type

  TCarneReq = class
  private
    FCode: string;
    FCustomer: TCustomer;
    FInstallment: TInstallment;
    FNotifications: TNotifications;
    Fpayment_terms: TPaymentTerms;
    Fpayment_forms: TArray<string>;
    FService: TService;
  public
    property Code: string read FCode write FCode;
    property Customer: TCustomer read FCustomer write FCustomer;
    property Installment: TInstallment read FInstallment write FInstallment;
    property Notifications: TNotifications read FNotifications write FNotifications;
    property payment_forms: TArray<string> read Fpayment_forms write Fpayment_forms;
    property payment_terms: TPaymentTerms read Fpayment_terms write Fpayment_terms;
    property Service: TService read FService write FService;

    constructor Create;
    destructor Destroy; override;

    function ToString: string; override;
  end;


implementation

{ TCarneReq }

constructor TCarneReq.Create;
begin
  FCustomer       := TCustomer.Create;
  FInstallment    := TInstallment.Create;
  FNotifications  := TNotifications.Create;
  Fpayment_terms  := TPaymentTerms.Create;
  FService        := TService.Create;

  SetLength(Fpayment_forms, 2);

  Fpayment_forms[0]  :=  'BANK_SLIP';
  Fpayment_forms[1]  :=  'PIX';
end;

destructor TCarneReq.Destroy;
begin
  FCustomer.Free;
  FInstallment.Free;
  FNotifications.Free;
  Fpayment_terms.Free;
  FService.Free;
  inherited;
end;

function TCarneReq.ToString: string;
var
  vJson : TJSONObject;
  ssdaat  : string;
  bCarne: boolean;
begin

  vJson :=  TJson.ObjectToJsonObject(Self);
  try
      if vJson.TryGetValue<boolean>('isCarne', bCarne) then
      begin
        vJson.RemovePair('isCarne');

        if not bCarne then
          begin
            vJson.RemovePair('installment');
          end
        else
          begin
            vJson.RemovePair('services');
          end;
      end;

    ssdaat  :=  FormatDateTime('yyyy-mm-dd', vJson.GetValue('payment_terms').GetValue<TDate>('due_date'));
    TJSONObject(vJson.GetValue('payment_terms')).RemovePair('due_date');
    TJSONObject(vJson.GetValue('payment_terms')).AddPair('due_date', ssdaat);

    if TJSONObject(TJSONObject(vJson.GetValue('payment_terms')).getvalue('fine')).getValue('date').AsType<TDate> < Now
    then
      begin
        TJSONObject(TJSONObject(vJson.GetValue('payment_terms')).getvalue('fine')).RemovePair('date');
      end
    else
      begin
        if TJSONObject(TJSONObject(vJson.GetValue('payment_terms')).getvalue('fine')).getValue('amount').AsType<Double> >= 0
        then
          begin
            TJSONObject(TJSONObject(vJson.GetValue('payment_terms')).getvalue('fine')).RemovePair('date');
            TJSONObject(TJSONObject(vJson.GetValue('payment_terms')).getvalue('fine')).RemovePair('rate');
          end
        else
          begin
            TJSONObject(TJSONObject(vJson.GetValue('payment_terms')).getvalue('fine')).RemovePair('amount');

            if TJSONObject(TJSONObject(vJson.GetValue('payment_terms')).getvalue('fine')).getValue('rate').AsType<Double> <= 0
            then
              begin
                TJSONObject(TJSONObject(vJson.GetValue('payment_terms')).getvalue('fine')).RemovePair('rate');
              end;
          end;
      end;

    Result  :=  vJson.ToString;
  finally
    vJson.Free;
  end;
end;

end.

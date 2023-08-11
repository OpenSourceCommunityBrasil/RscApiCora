unit Rsc.Api.Cora.Boleto.Schema.Resp.BoletoDetalhes;

interface

uses
  Rsc.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TBankSlip = class;
  TDocument = class;

  TPayments = class
  private
    [SuppressZero, JSONName('created_at')]
    FCreatedAt: TDateTime;
    [SuppressZero, JSONName('finalized_at')]
    FFinalizedAt: TDateTime;
    FFine: Integer;
    FId: string;
    FInterest: Integer;
    FMethod: string;
    FOrder: Integer;
    FStatus: string;
    [JSONName('total_paid')]
    FTotalPaId: Integer;
  published
    property CreatedAt: TDateTime read FCreatedAt write FCreatedAt;
    property FinalizedAt: TDateTime read FFinalizedAt write FFinalizedAt;
    property Fine: Integer read FFine write FFine;
    property Id: string read FId write FId;
    property Interest: Integer read FInterest write FInterest;
    property Method: string read FMethod write FMethod;
    property Order: Integer read FOrder write FOrder;
    property Status: string read FStatus write FStatus;
    property TotalPaId: Integer read FTotalPaId write FTotalPaId;
  end;

  TBankSlip = class
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

  TPaymentOptions = class
  private
    [JSONName('bank_slip')]
    FBankSlip: TBankSlip;
  published
    property BankSlip: TBankSlip read FBankSlip;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TPaymentTerms = class
  private
    [SuppressZero, JSONName('due_date')]
    FDueDate: TDateTime;
  published
    property DueDate: TDateTime read FDueDate write FDueDate;
  end;

  TServices = class
  private
    FAmount: Integer;
    FName: string;
    FUnit: string;
  published
    property Amount: Integer read FAmount write FAmount;
    property Name: string read FName write FName;
    property &Unit: string read FUnit write FUnit;
  end;

  TDocument = class
  private
    FIdentity: string;
    FType: string;
  published
    property Identity: string read FIdentity write FIdentity;
    property &Type: string read FType write FType;
  end;

  TCustomer = class
  private
    FDocument: TDocument;
    FName: string;
  published
    property Document: TDocument read FDocument;
    property Name: string read FName write FName;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBoletoDetalhesResp = class(TJsonDTO)
  private
    FCode: string;
    [SuppressZero, JSONName('created_at')]
    FCreatedAt: TDateTime;
    FCustomer: TCustomer;
    FId: string;
    [JSONName('payment_options')]
    FPaymentOptions: TPaymentOptions;
    [JSONName('payment_terms')]
    FPaymentTerms: TPaymentTerms;
    [JSONName('payments'), JSONMarshalled(False)]
    FPaymentsArray: TArray<TPayments>;
    [GenericListReflect]
    FPayments: TObjectList<TPayments>;
    [JSONName('services'), JSONMarshalled(False)]
    FServicesArray: TArray<TServices>;
    [GenericListReflect]
    FServices: TObjectList<TServices>;
    FStatus: string;
    [JSONName('total_amount')]
    FTotalAmount: Integer;
    [JSONName('total_paid')]
    FTotalPaId: Integer;
    function GetPayments: TObjectList<TPayments>;
    function GetServices: TObjectList<TServices>;
  protected
    function GetAsJson: string; override;
  published
    property Code: string read FCode write FCode;
    property CreatedAt: TDateTime read FCreatedAt write FCreatedAt;
    property Customer: TCustomer read FCustomer;
    property Id: string read FId write FId;
    property PaymentOptions: TPaymentOptions read FPaymentOptions;
    property PaymentTerms: TPaymentTerms read FPaymentTerms;
    property Payments: TObjectList<TPayments> read GetPayments;
    property Services: TObjectList<TServices> read GetServices;
    property Status: string read FStatus write FStatus;
    property TotalAmount: Integer read FTotalAmount write FTotalAmount;
    property TotalPaId: Integer read FTotalPaId write FTotalPaId;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TPaymentOptions }

constructor TPaymentOptions.Create;
begin
  inherited;
  FBankSlip := TBankSlip.Create;
end;

destructor TPaymentOptions.Destroy;
begin
  FBankSlip.Free;
  inherited;
end;

{ TCustomer }

constructor TCustomer.Create;
begin
  inherited;
  FDocument := TDocument.Create;
end;

destructor TCustomer.Destroy;
begin
  FDocument.Free;
  inherited;
end;

{ TRoot }

constructor TBoletoDetalhesResp.Create;
begin
  inherited;
  FCustomer := TCustomer.Create;
  FPaymentTerms := TPaymentTerms.Create;
  FPaymentOptions := TPaymentOptions.Create;
end;

destructor TBoletoDetalhesResp.Destroy;
begin
  FCustomer.Free;
  FPaymentTerms.Free;
  FPaymentOptions.Free;
  GetServices.Free;
  GetPayments.Free;
  inherited;
end;

function TBoletoDetalhesResp.GetPayments: TObjectList<TPayments>;
begin
  Result := ObjectList<TPayments>(FPayments, FPaymentsArray);
end;

function TBoletoDetalhesResp.GetServices: TObjectList<TServices>;
begin
  Result := ObjectList<TServices>(FServices, FServicesArray);
end;

function TBoletoDetalhesResp.GetAsJson: string;
begin
  RefreshArray<TPayments>(FPayments, FPaymentsArray);
  RefreshArray<TServices>(FServices, FServicesArray);
  Result := inherited;
end;

end.

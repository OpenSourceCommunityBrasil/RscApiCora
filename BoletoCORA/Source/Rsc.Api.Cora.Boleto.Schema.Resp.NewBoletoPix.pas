unit Rsc.Api.Cora.Boleto.Schema.Resp.NewBoletoPix;

interface

uses
  Rsc.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TAddress = class;
  TBankSlip = class;
  TDocument = class;
  TFine = class;
  TInterest = class;

  TPix = class
  private
    FEmv: string;
  published
    property Emv: string read FEmv write FEmv;
  end;
  
  TPayments = class
  end;
  
  TBankSlip = class
  private
    FBarcode: string;
    FDigitable: string;
    [JSONName('our_number')]
    FOurNumber: string;
    FRegistered: Boolean;
    FUrl: string;
  published
    property Barcode: string read FBarcode write FBarcode;
    property Digitable: string read FDigitable write FDigitable;
    property OurNumber: string read FOurNumber write FOurNumber;
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
  
  TInterest = class
  private
    FRate: Double;
  published
    property Rate: Double read FRate write FRate;
  end;
  
  TFine = class
  private
    FAmount: Integer;
    [SuppressZero]
    FDate: TDateTime;
  published
    property Amount: Integer read FAmount write FAmount;
    property Date: TDateTime read FDate write FDate;
  end;
  
  TPaymentTerms = class
  private
    [SuppressZero, JSONName('due_date')]
    FDueDate: TDateTime;
    FFine: TFine;
    FInterest: TInterest;
  published
    property DueDate: TDateTime read FDueDate write FDueDate;
    property Fine: TFine read FFine;
    property Interest: TInterest read FInterest;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TServices = class
  private
    FAmount: Integer;
    FDescription: string;
    FName: string;
    FUnit: string;
  published
    property Amount: Integer read FAmount write FAmount;
    property Description: string read FDescription write FDescription;
    property Name: string read FName write FName;
    property &Unit: string read FUnit write FUnit;
  end;
  
  TAddress = class
  private
    FCity: string;
    FComplement: string;
    FDistrict: string;
    FNumber: string;
    FState: string;
    FStreet: string;
    [SuppressZero, JSONName('zip_code')]
    FZipCode: TDateTime;
  published
    property City: string read FCity write FCity;
    property Complement: string read FComplement write FComplement;
    property District: string read FDistrict write FDistrict;
    property Number: string read FNumber write FNumber;
    property State: string read FState write FState;
    property Street: string read FStreet write FStreet;
    property ZipCode: TDateTime read FZipCode write FZipCode;
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
    FAddress: TAddress;
    FDocument: TDocument;
    FEmail: string;
    FName: string;
  published
    property Address: TAddress read FAddress;
    property Document: TDocument read FDocument;
    property Email: string read FEmail write FEmail;
    property Name: string read FName write FName;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TBoletoPixResp = class(TJsonDTO)
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
    FPix: TPix;
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
    property Pix: TPix read FPix;
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

{ TPaymentTerms }

constructor TPaymentTerms.Create;
begin
  inherited;
  FFine := TFine.Create;
  FInterest := TInterest.Create;
end;

destructor TPaymentTerms.Destroy;
begin
  FFine.Free;
  FInterest.Free;
  inherited;
end;

{ TCustomer }

constructor TCustomer.Create;
begin
  inherited;
  FDocument := TDocument.Create;
  FAddress := TAddress.Create;
end;

destructor TCustomer.Destroy;
begin
  FDocument.Free;
  FAddress.Free;
  inherited;
end;

{ TRoot }

constructor TBoletoPixResp.Create;
begin
  inherited;
  FCustomer := TCustomer.Create;
  FPaymentTerms := TPaymentTerms.Create;
  FPaymentOptions := TPaymentOptions.Create;
  FPix := TPix.Create;
end;

destructor TBoletoPixResp.Destroy;
begin
  FCustomer.Free;
  FPaymentTerms.Free;
  FPaymentOptions.Free;
  FPix.Free;
  GetServices.Free;
  GetPayments.Free;
  inherited;
end;

function TBoletoPixResp.GetPayments: TObjectList<TPayments>;
begin
  Result := ObjectList<TPayments>(FPayments, FPaymentsArray);
end;

function TBoletoPixResp.GetServices: TObjectList<TServices>;
begin
  Result := ObjectList<TServices>(FServices, FServicesArray);
end;

function TBoletoPixResp.GetAsJson: string;
begin
  RefreshArray<TPayments>(FPayments, FPaymentsArray);
  RefreshArray<TServices>(FServices, FServicesArray);
  Result := inherited;
end;

end.

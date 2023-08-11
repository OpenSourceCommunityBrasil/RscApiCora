unit Rsc.Api.Cora.Boleto.Schema.Req.NewBoletoPix;

interface

uses
  Rsc.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TAddress = class;
  TDocument = class;
  TFine = class;
  TInterest = class;

  TInterest = class
  private
    FRate: Double;
  published
    property Rate: Double read FRate write FRate;
  end;
  
  TFine = class
  private
    FAmount: Integer;
  published
    property Amount: Integer read FAmount write FAmount;
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
  published
    property Amount: Integer read FAmount write FAmount;
    property Description: string read FDescription write FDescription;
    property Name: string read FName write FName;
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
  
  TBoletoPixReq = class(TJsonDTO)
  private
    FCode: string;
    FCustomer: TCustomer;
    [JSONName('payment_forms')]
    FPaymentFormsArray: TArray<string>;
    [JSONMarshalled(False)]
    FPaymentForms: TList<string>;
    [JSONName('payment_terms')]
    FPaymentTerms: TPaymentTerms;
    [JSONName('services'), JSONMarshalled(False)]
    FServicesArray: TArray<TServices>;
    [GenericListReflect]
    FServices: TObjectList<TServices>;
    function GetPaymentForms: TList<string>;
    function GetServices: TObjectList<TServices>;
  protected
    function GetAsJson: string; override;
  published
    property Code: string read FCode write FCode;
    property Customer: TCustomer read FCustomer;
    property PaymentForms: TList<string> read GetPaymentForms;
    property PaymentTerms: TPaymentTerms read FPaymentTerms;
    property Services: TObjectList<TServices> read GetServices;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
implementation

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

constructor TBoletoPixReq.Create;
begin
  inherited;
  FCustomer := TCustomer.Create;
  FPaymentTerms := TPaymentTerms.Create;
end;

destructor TBoletoPixReq.Destroy;
begin
  FCustomer.Free;
  FPaymentTerms.Free;
  GetServices.Free;
  GetPaymentForms.Free;
  inherited;
end;

function TBoletoPixReq.GetPaymentForms: TList<string>;
begin
  Result := List<string>(FPaymentForms, FPaymentFormsArray);
end;

function TBoletoPixReq.GetServices: TObjectList<TServices>;
begin
  Result := ObjectList<TServices>(FServices, FServicesArray);
end;

function TBoletoPixReq.GetAsJson: string;
begin
  RefreshArray<string>(FPaymentForms, FPaymentFormsArray);
  RefreshArray<TServices>(FServices, FServicesArray);
  Result := inherited;
end;

end.

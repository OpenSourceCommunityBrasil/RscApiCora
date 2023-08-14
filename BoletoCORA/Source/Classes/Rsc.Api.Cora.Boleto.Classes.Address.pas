unit Rsc.Api.Cora.Boleto.Classes.Address;

interface

type

  TAddress = class
  private
    FCity       : string;
    FComplement : string;
    FDistrict   : string;
    FNumber     : string;
    FState      : string;
    FStreet     : string;
    Fzip_code   : string;
  public
    property City       : string read FCity       write FCity;
    property Complement : string read FComplement write FComplement;
    property District   : string read FDistrict   write FDistrict;
    property Number     : string read FNumber     write FNumber;
    property State      : string read FState      write FState;
    property Street     : string read FStreet     write FStreet;
    property zip_code   : string read Fzip_code   write Fzip_code;
  end;

implementation

end.


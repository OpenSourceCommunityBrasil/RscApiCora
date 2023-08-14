{====================================================================================}
{             RSC SISTEMAS                                                           }
{        SOLUÇÕES TECNOLÓGICAS                                                       }
{         rscsistemas.com.br                                                         }
{          +55 92 4141-2737                                                          }
{      contato@rscsistemas.com.br                                                    }
{                                                                                    }
{ Desenvolvidor por:                                                                 }
{   Roniery Santos Cardoso                                                           }
{     roniery@rscsistemas.com.br                                                     }
{     +55 92 984391279                                                               }
{                                                                                    }
{                                                                                    }
{ Versão Original RSC SISTEMAS                                                       }
{                                                                                    }
{ Faça uma  doação:                                                                  }
{ Pix - Email: roniery@rscsistemas.com.br                                            }
{ Banco: NuBank                                                                      }
{                                                                                    }
{                                                                                    }
{                                                                                    }
{ Componente TRscCoraBoleto                                                          }
{ Componente OpenSource                                                              }
{ Licença Pública Geral GNU v3.0                                                     }
{ Permissions of this strong copyleft license are conditioned on making available    }
{ complete source code of licensed works and modifications, which include larger     }
{ works using a licensed work, under the same license. Copyright and license         }
{ notices must be preserved. Contributors provide an express grant of patent rights. }
{                                                                                    }
{====================================================================================}

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


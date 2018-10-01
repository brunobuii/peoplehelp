unit UBairro;

interface

uses
    UEntidade
  , UCidade
  ;

type
  TBAIRRO = class(TENTIDADE)
  private
    FCIDADE: TCIDADE;

  public
    NOME: String;

    constructor Create; override;
    destructor Destroy; override;

    property CIDADE: TCIDADE read FCIDADE write FCIDADE;
  end;

const
  TBL_BAIRRO           = 'BAIRRO';
  FLD_BAIRRO_NOME      = 'NOME';
  FLD_BAIRRO_ID_CIDADE = 'ID_CIDADE';

implementation

uses
    SysUtils
  ;

{ TBAIRRO }

constructor TBAIRRO.Create;
begin
  FCIDADE := TCIDADE.Create;
end;

destructor TBAIRRO.Destroy;
begin
  if Assigned(FCIDADE) then
  begin
    FreeAndNil(FCIDADE);
  end;
  inherited;
end;

end.

unit UUsuario;

interface

uses
    UENTIDADE
  , UBAIRRO
  ;

type
  TUSUARIO = class(TENTIDADE)
  private
    FBAIRRO: TBAIRRO;
  public
    NOME: String;
    INSCRICAO_FEDERAL: String;
    EMAIL: String;
    SENHA: String;
    RUA: String;
    SEXO: Integer;
    NUMERO: Integer;
    TELEFONE: String;
    PRESTADOR: Boolean;
    CLIENTE: Boolean;

    constructor Create; override;
    destructor Destroy; override;

    property BAIRRO: TBAIRRO read FBAIRRO write FBAIRRO;
  end;

const
  TBL_USUARIO                   = 'USUARIO';
  FLD_USUARIO_NOME              = 'NOME';
  FLD_USUARIO_INSCRICAO_FEDERAL = 'INSCRICAO_FEDERAL';
  FLD_USUARIO_EMAIL             = 'EMAIL';
  FLD_USUARIO_SENHA             = 'SENHA';
  FLD_USUARIO_RUA               = 'RUA';
  FLD_USUARIO_SEXO              = 'SEXO';
  FLD_USUARIO_ID_BAIRRO         = 'ID_BAIRRO';
  FLD_USUARIO_NUMERO            = 'NUMERO';
  FLD_USUARIO_TELEFONE          = 'TELEFONE';
  FLD_USUARIO_CLIENTE           = 'CLIENTE';
  FLD_USUARIO_PRESTADOR         = 'PRESTADOR';

implementation

uses
    SysUtils
  ;

{ TUSUARIO }

constructor TUSUARIO.Create;
begin
  FBAIRRO := TBAIRRO.Create
end;

destructor TUSUARIO.Destroy;
begin
  if Assigned(FBAIRRO) then
  begin
    FreeAndNil(FBAIRRO);
  end;

  inherited;
end;

end.

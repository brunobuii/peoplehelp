unit UUsuario;

interface

uses
    UENTIDADE
  ;

type
  TUSUARIO = class(TENTIDADE)
  public
    NOME: String;
    INSCRICAO_FEDERAL: String;
    EMAIL: String;
    SENHA: String;
    RUA: String;
    SEXO: Integer;
    BAIRRO: String;
    CIDADE: String;
    NUMERO: Integer;
    TELEFONE: String;
    PRESTADOR: Boolean;
    CLIENTE: Boolean;
  end;

const
  TBL_USUARIO                   = 'USUARIO';
  FLD_USUARIO_NOME              = 'NOME';
  FLD_USUARIO_INSCRICAO_FEDERAL = 'INSCRICAO_FEDERAL';
  FLD_USUARIO_EMAIL             = 'EMAIL';
  FLD_USUARIO_SENHA             = 'SENHA';
  FLD_USUARIO_RUA               = 'RUA';
  FLD_USUARIO_CIDADE            = 'CIDADE';
  FLD_USUARIO_SEXO            = 'SEXO';
  FLD_USUARIO_BAIRRO            = 'BAIRRO';
  FLD_USUARIO_NUMERO            = 'NUMERO';
  FLD_USUARIO_TELEFONE          = 'TELEFONE';
  FLD_USUARIO_CLIENTE           = 'CLIENTE';
  FLD_USUARIO_PRESTADOR         = 'PRESTADOR';

implementation

end.

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
  end;

const
  TBL_USUARIO                   = 'USUARIO';
  FLD_USUARIO_NOME              = 'NOME';
  FLD_USUARIO_INSCRICAO_FEDERAL = 'INSCRICAO_FEDERAL';
  FLD_USUARIO_EMAIL             = 'EMAIL';
  FLD_USUARIO_SENHA             = 'SENHA';

implementation

end.

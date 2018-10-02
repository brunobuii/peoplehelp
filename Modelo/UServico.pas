unit UServico;

interface

uses
  UEntidade;

type
  TSERVICO = class(TENTIDADE)
  public
    NOME: String;
  end;

const
  TBL_SERVICO      = 'SERVICO';
  FLD_SERVICO_NOME = 'NOME';

implementation


end.

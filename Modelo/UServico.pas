unit UServico;

interface

uses
  UEntidade;

type
  TSERVICO = class(TENTIDADE)
  public
    SERVICO: String;
  end;

const
  TBL_SERVICO         = 'SERVICO';
  FLD_SERVICO_SERVICO = 'SERVICO';

implementation


end.

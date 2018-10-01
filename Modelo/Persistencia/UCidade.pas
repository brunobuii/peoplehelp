unit UCidade;

interface

uses
  UEntidade;

type
  TCIDADE = class(TENTIDADE)
  public
    NOME: String;
  end;

const
  TBL_CIDADE      = 'CIDADE';
  FLD_CIDADE_NOME = 'NOME';

implementation

end.

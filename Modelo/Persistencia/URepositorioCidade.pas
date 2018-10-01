unit URepositorioCidade;

interface

uses
    URepositorioDB
  , UCidade
  , SQLExpr;

type
  TRepositorioCidade = class(TRepositorioDB<TCIDADE>)
  protected
    procedure AtribuiDBParaEntidade(const coCIDADE: TCIDADE); override;
    procedure AtribuiEntidadeParaDB(const coCIDADE: TCIDADE;
      const coSQLQuery: TSQLQuery); override;
  public
    constructor Create;
  end;

implementation

uses
    UEntidade
  , UMensagens
  ;

{ TRepositorioCidade }

constructor TRepositorioCidade.Create;
begin
  Inherited Create(TCIDADE, TBL_CIDADE, FLD_ENTIDADE_ID, STR_CIDADE);
end;

procedure TRepositorioCidade.AtribuiDBParaEntidade(const coCIDADE: TCIDADE);
begin
  inherited;
  with FSQLSelect do
  begin
    coCIDADE.NOME:= FieldByName(FLD_CIDADE_NOME).AsString;
  end;
end;

procedure TRepositorioCidade.AtribuiEntidadeParaDB(const coCIDADE: TCIDADE;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_CIDADE_NOME).AsString := coCIDADE.NOME;
  end;
end;

end.

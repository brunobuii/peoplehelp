unit URepositorioServico;

interface

uses
    URepositorioDB
  , UServico
  , SQLExpr;

type
  TRepositorioServico = class(TRepositorioDB<TSERVICO>)
  protected
    procedure AtribuiDBParaEntidade(const coSERVICO: TSERVICO); override;
    procedure AtribuiEntidadeParaDB(const coSERVICO: TSERVICO;
      const coSQLQuery: TSQLQuery); override;
  public
    constructor Create;
  end;

implementation

uses
    UEntidade
  , UMensagens
  ;

{ TRepositorioServico }

constructor TRepositorioServico.Create;
begin
  Inherited Create(TSERVICO, TBL_SERVICO, FLD_ENTIDADE_ID, STR_SERVICO);
end;

procedure TRepositorioServico.AtribuiDBParaEntidade(const coSERVICO: TSERVICO);
begin
  inherited;
  with FSQLSelect do
  begin
    coSERVICO.NOME:= FieldByName(FLD_SERVICO_NOME).AsString;
  end;
end;

procedure TRepositorioServico.AtribuiEntidadeParaDB(const coSERVICO: TSERVICO;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_SERVICO_NOME).AsString := coSERVICO.NOME;
  end;
end;

end.

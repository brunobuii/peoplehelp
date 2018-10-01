unit URepositorioBairro;

interface

uses
    URepositorioDB
  , URepositorioCidade
  , UBairro
  , SQLExpr;

type
  TRepositorioBairro = class(TRepositorioDB<TBAIRRO>)
  private
   FRepositorioCidade: TRepositorioCidade;
  protected
    procedure AtribuiDBParaEntidade(const coBAIRRO: TBAIRRO); override;
    procedure AtribuiEntidadeParaDB(const coBAIRRO: TBAIRRO;
      const coSQLQuery: TSQLQuery); override;
  public
    constructor Create;
    destructor Destroy; override;

    function RetornaBairrosCidade(const ciIdCidade: Integer): TArray<TBAIRRO>;
  end;

implementation

uses
    UEntidade
  , UMensagens
  , SysUtils
  , UCidade
  , Generics.Collections
  ;

const
  CNT_SELECT_BAIRROS_PELA_CIDADE = 'select * from bairro where id_cidade = :id_cidade';

{ TRepositorioBairro }

constructor TRepositorioBairro.Create;
begin
  Inherited Create(TBAIRRO, TBL_BAIRRO, FLD_ENTIDADE_ID, STR_BAIRRO);
  FRepositorioCidade := TRepositorioCidade.Create;
end;

destructor TRepositorioBairro.Destroy;
begin
  FreeAndNil(FRepositorioCidade);
  inherited;
end;

function TRepositorioBairro.RetornaBairrosCidade(
  const ciIdCidade: Integer): TArray<TBAIRRO>;
var
  loListaBairros: TList<TBAIRRO>;
  loBAIRRO: TBAIRRO;
begin
  loListaBairros := TList<TBAIRRO>.Create;
  try
    FSQLSelect.Close;
    FSQLSelect.CommandText := CNT_SELECT_BAIRROS_PELA_CIDADE;
    FSQLSelect.Prepared := True;
    FSQLSelect.ParamByName(FLD_BAIRRO_ID_CIDADE).AsInteger := ciIdCidade;
    FSQLSelect.Open;

    if not FSQLSelect.Eof then
    begin
      loBAIRRO := TBAIRRO.Create;
      AtribuiDBParaEntidade(loBAIRRO);

      loListaBairros.Add(loBAIRRO);
    end;

    Result := loListaBairros.ToArray;
  finally
    FreeAndNil(loListaBairros);
  end;
end;

procedure TRepositorioBairro.AtribuiDBParaEntidade(const coBAIRRO: TBAIRRO);
begin
  inherited;
  with FSQLSelect do
  begin
    coBAIRRO.NOME   := FieldByName(FLD_BAIRRO_NOME).AsString;
    coBAIRRO.CIDADE := TCIDADE(FRepositorioCidade.Retorna(FieldByName(FLD_BAIRRO_ID_CIDADE).AsInteger));
  end;
end;

procedure TRepositorioBairro.AtribuiEntidadeParaDB(const coBAIRRO: TBAIRRO;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_BAIRRO_NOME).AsString := coBAIRRO.NOME;
    ParamByName(FLD_BAIRRO_ID_CIDADE).AsInteger := coBAIRRO.CIDADE.ID;
  end;
end;

end.


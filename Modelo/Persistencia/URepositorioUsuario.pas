unit URepositorioUsuario;

interface

uses
    URepositorioDB
  , UUsuario
  , SQLExpr
  ;

type
  TRepositorioUsuario = class(TRepositorioDB<TUSUARIO>)
  protected
    procedure AtribuiDBParaEntidade(const coUSUARIO: TUSUARIO); override;
    procedure AtribuiEntidadeParaDB(const coUSUARIO: TUSUARIO;
                                    const coSQLQuery: TSQLQuery); override;
  public
    constructor Create;
    function RetornaPeloLogin(const csLogin: String): TUSUARIO;
  end;

implementation

uses
    UDM
  , UUtilitarios
  , SysUtils
  , UEntidade
  , UMensagens
  ;

const
  CNT_SELECT_PELO_EMAIL = 'select * from usuario where email = :email';

{ TRepositorioUsuario }

constructor TRepositorioUsuario.Create;
begin
  Inherited Create(TUSUARIO, TBL_USUARIO, FLD_ENTIDADE_ID, STR_USUARIO);
end;

function TRepositorioUsuario.RetornaPeloLogin(const csLogin: String): TUSUARIO;
begin
  FSQLSelect.Close;
  FSQLSelect.CommandText := CNT_SELECT_PELO_EMAIL;
  FSQLSelect.Prepared    := True;
  FSQLSelect.ParamByName(FLD_USUARIO_EMAIL).AsString := csLogin;
  FSQLSelect.Open;

  Result := nil;
  if not FSQLSelect.Eof then
    begin
      Result := TUSUARIO.Create;
      AtribuiDBParaEntidade(Result);
    end;
end;

procedure TRepositorioUsuario.AtribuiDBParaEntidade(const coUSUARIO: TUSUARIO);
begin
  inherited;
  with FSQLSelect do
  begin
    coUSUARIO.NOME              := FieldByName(FLD_USUARIO_NOME).AsString;
    coUSUARIO.INSCRICAO_FEDERAL := FieldByName(FLD_USUARIO_INSCRICAO_FEDERAL).AsString;
    coUSUARIO.EMAIL             := FieldByName(FLD_USUARIO_EMAIL).AsString;
    coUSUARIO.SENHA             := FieldByName(FLD_USUARIO_SENHA).AsString;
  end;
end;

procedure TRepositorioUsuario.AtribuiEntidadeParaDB(const coUSUARIO: TUSUARIO;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_USUARIO_NOME).AsString              := coUSUARIO.NOME;
    ParamByName(FLD_USUARIO_INSCRICAO_FEDERAL).AsString := coUSUARIO.INSCRICAO_FEDERAL;
    ParamByName(FLD_USUARIO_EMAIL).AsString             := coUSUARIO.EMAIL;
    ParamByName(FLD_USUARIO_SENHA).AsString             := coUSUARIO.SENHA;
  end;
end;

end.

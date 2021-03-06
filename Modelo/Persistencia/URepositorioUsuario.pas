unit URepositorioUsuario;

interface

uses
    URepositorioDB
  , UUsuario
  , SQLExpr
  , URepositorioBairro
  ;

type
  TRepositorioUsuario = class(TRepositorioDB<TUSUARIO>)
  private
    FRepositorioBairro: TRepositorioBairro;

  protected
    procedure AtribuiDBParaEntidade(const coUSUARIO: TUSUARIO); override;
    procedure AtribuiEntidadeParaDB(const coUSUARIO: TUSUARIO;
      const coSQLQuery: TSQLQuery); override;
  public
    constructor Create;
    destructor Destroy; override;
    function RetornaPeloLogin(const csLogin: String): TUSUARIO;
  end;

implementation

uses
  UDM, UUtilitarios, SysUtils, UEntidade, UMensagens, UBairro;

const
  CNT_SELECT_PELO_EMAIL = 'select * from usuario where email = :email';

  { TRepositorioUsuario }

constructor TRepositorioUsuario.Create;
begin
  Inherited Create(TUSUARIO, TBL_USUARIO, FLD_ENTIDADE_ID, STR_USUARIO);
  FRepositorioBairro := TRepositorioBairro.Create;
end;

destructor TRepositorioUsuario.Destroy;
begin
  FreeAndNil(FRepositorioBairro);
  inherited;
end;

function TRepositorioUsuario.RetornaPeloLogin(const csLogin: String): TUSUARIO;
begin
  FSQLSelect.Close;
  FSQLSelect.CommandText := CNT_SELECT_PELO_EMAIL;
  FSQLSelect.Prepared := True;
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
    coUSUARIO.RUA               := FieldByName(FLD_USUARIO_RUA).AsString;
    coUSUARIO.SEXO              := FieldByName(FLD_USUARIO_SEXO).AsInteger;
    coUSUARIO.NUMERO            := FieldByName(FLD_USUARIO_NUMERO).AsInteger;
    coUSUARIO.TELEFONE          := FieldByName(FLD_USUARIO_TELEFONE).AsString;
    coUSUARIO.CLIENTE           := Boolean(FieldByName(FLD_USUARIO_CLIENTE).AsInteger);
    coUSUARIO.PRESTADOR         := Boolean(FieldByName(FLD_USUARIO_PRESTADOR).AsInteger);
    coUSUARIO.BAIRRO            := TBAIRRO(FRepositorioBairro.Retorna(FieldByName(FLD_USUARIO_ID_BAIRRO).AsInteger));
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
    ParamByName(FLD_USUARIO_RUA).AsString               := coUSUARIO.RUA;
    ParamByName(FLD_USUARIO_SEXO ).AsInteger            := Integer(coUSUARIO.SEXO);
    ParamByName(FLD_USUARIO_NUMERO).AsInteger           := coUSUARIO.NUMERO;
    ParamByName(FLD_USUARIO_TELEFONE).AsString          := coUSUARIO.TELEFONE;
    ParamByName(FLD_USUARIO_CLIENTE).AsInteger          := Integer(coUSUARIO.CLIENTE);
    ParamByName(FLD_USUARIO_PRESTADOR).AsInteger        := Integer(coUSUARIO.PRESTADOR);
    ParamByName(FLD_USUARIO_ID_BAIRRO).AsInteger        := coUSUARIO.BAIRRO.ID;
  end;
end;

end.

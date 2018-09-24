unit UUsuarioLogado;

interface

uses
    UUsuario
  , URepositorioUsuario
  , UUtilitarios
  ;

type
  TUsuarioLogado = class
  private
    FUSUARIO: TUSUARIO;
    FRepositorioUsuario: TRepositorioUsuario;

    function InternoValidaLogin(const csEmail: String;const csSenha: String): Boolean;
    function InternoRetornaHash(const csSenha: String): String;

    procedure InternoRealizaLogin(const csEmail: String;const csSenha: String);
    procedure InternoLogoff;


  public
    constructor Create;
    destructor Destroy; override;

    class procedure RealizaLogin(const csEmail: String;const csSenha: String);
    class procedure Logoff;

    class function USUARIO: TUSUARIO;

    class function Unico: TUsuarioLogado;
    class function ValidaLogin(const csEmail: String;const csSenha: String): Boolean;
    class function RetornaHash(const csSenha: String): String;
  end;

implementation

uses
    SysUtils
  , IdHashMessageDigest
  , UMensagens
  ;

var
  UsuarioLogado: TUsuarioLogado = nil;

{ TUsuarioLogado }

constructor TUsuarioLogado.Create;
begin
  FRepositorioUsuario := TRepositorioUsuario.Create;
end;

destructor TUsuarioLogado.Destroy;
begin
  FreeAndNil(FRepositorioUsuario);
  inherited;
end;

procedure TUsuarioLogado.InternoLogoff;
begin
  if Assigned(FUSUARIO) then
    FreeAndNil(FUSUARIO);
end;

class procedure TUsuarioLogado.RealizaLogin(const csEmail, csSenha: String);
begin
  Unico.InternoRealizaLogin(csEmail, csSenha);
end;

class function TUsuarioLogado.RetornaHash(const csSenha: String): String;
begin
  Result := Unico.InternoRetornaHash(csSenha);
end;

procedure TUsuarioLogado.InternoRealizaLogin(const csEmail, csSenha: String);
begin
  if not InternoValidaLogin(csEmail, csSenha) then
    raise EValidacaoNegocio.Create(STR_USUARIO_OU_SENHA_SAO_INVALIDOS);

  FUSUARIO := FRepositorioUsuario.RetornaPeloLogin(csEmail);
end;

function TUsuarioLogado.InternoRetornaHash(const csSenha: String): String;
var
  HashMessageDigest5: TIdHashMessageDigest5;
begin
  HashMessageDigest5 := TIdHashMessageDigest5.Create;
  try
    Result := HashMessageDigest5.HashStringAsHex(csSenha);
  finally
     FreeAndNil(HashMessageDigest5);
  end;
end;

function TUsuarioLogado.InternoValidaLogin(const csEmail, csSenha: String): Boolean;
var
  loUSUARIO: TUSUARIO;
begin
  loUSUARIO := FRepositorioUsuario.RetornaPeloLogin(csEmail);
  if Assigned(loUSUARIO) then
    Result := loUSUARIO.SENHA = InternoRetornaHash(csSenha)
  else
    Result := False;
end;

class procedure TUsuarioLogado.Logoff;
begin
  Unico.InternoLogoff;
end;

class function TUsuarioLogado.Unico: TUsuarioLogado;
begin
  if not Assigned(UsuarioLogado) then
    UsuarioLogado := TUsuarioLogado.Create;

  Result := UsuarioLogado;
end;

class function TUsuarioLogado.USUARIO: TUSUARIO;
begin
  Result := Unico.FUSUARIO;
end;

class function TUsuarioLogado.ValidaLogin(const csEmail, csSenha: String): Boolean;
begin
  Result := Unico.InternoValidaLogin(csEmail, csSenha);
end;

end.

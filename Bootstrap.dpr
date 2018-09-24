program Bootstrap;

uses
  Forms,
  Controls,
  SysUtils,
  UFrmLogin in 'VisaoControle\UFrmLogin.pas' {FrmLogin},
  UFrmCRUD in 'VisaoControle\UFrmCRUD.pas' {FrmCRUD},
  UUtilitarios in 'Modelo\UUtilitarios.pas',
  UMensagens in 'Modelo\UMensagens.pas',
  UConstantes in 'Modelo\UConstantes.pas',
  UDialogo in 'Modelo\UDialogo.pas',
  UOpcaoPesquisa in 'Modelo\UOpcaoPesquisa.pas',
  UDM in 'Modelo\Persistencia\UDM.pas' {dmEntra21: TDataModule},
  UEntidade in 'Modelo\Persistencia\UEntidade.pas',
  URepositorio in 'Modelo\Persistencia\URepositorio.pas',
  URepositorioDB in 'Modelo\Persistencia\URepositorioDB.pas',
  URegraCRUD in 'Modelo\Regra\URegraCRUD.pas',
  UFrmRegistrar in 'VisaoControle\UFrmRegistrar.pas' {FrmRegistrar},
  UFrmPrincipal in 'VisaoControle\UFrmPrincipal.pas' {FrmPrincipal},
  UFrmSplashScreen in 'VisaoControle\UFrmSplashScreen.pas' {FrmSplashScreen},
  URepositorioUsuario in 'Modelo\Persistencia\URepositorioUsuario.pas',
  UUsuario in 'Modelo\Persistencia\UUsuario.pas',
  URegraCRUDUsuario in 'Modelo\Regra\URegraCRUDUsuario.pas',
  UUsuarioLogado in 'Modelo\UUsuarioLogado.pas';

{$R *.res}

var
  FrmSplashScreen: TFrmSplashScreen;
begin
  Application.Initialize;
  Application.CreateForm(TdmEntra21, dmEntra21);

  FrmSplashScreen := TFrmSplashScreen.Create(Application);
  if FrmSplashScreen.ShowModal = mrOk then
  begin
    FreeAndNil(FrmSplashScreen);
    Application.CreateForm(TFrmPrincipal, FrmPrincipal);
    Application.Run;
  end
  else
  begin
    Application.Run;
    Application.Terminate;
  end;
end.

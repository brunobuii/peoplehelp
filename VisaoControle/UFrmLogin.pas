//{$DEFINE PROD}
unit UFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons
  , UMensagens, Vcl.Menus, Vcl.ComCtrls, Vcl.Imaging.jpeg;

type
  TFrmLogin = class(TForm)
    sbPrincipal: TStatusBar;
    edLoginEmail: TEdit;
    edLoginSenha: TEdit;
    imSenha: TImage;
    imLogin: TImage;
    imgFundo: TImage;
    imgTopo: TImage;
    imgEntrar: TImage;
    imgFechar: TImage;
    imgLogo: TImage;
    imgCadeado: TImage;
    imLoginCadeado: TImage;
    imgEmail2: TImage;
    imSenha2: TImage;
    procedure imEntrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgFecharClick(Sender: TObject);
  end;

implementation

{$R *.dfm}

uses
     UDialogo
   , UUsuarioLogado
   ;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  {$IFNDEF PROD}
  edLoginEmail.Text := 'admin@admin.com';
  edLoginSenha.Text := 'adminadmin';
  {$ENDIF}
end;

procedure TFrmLogin.imgFecharClick(Sender: TObject);
begin
CloseModal;
end;

procedure TFrmLogin.imEntrarClick(Sender: TObject);
begin
  try
    TUsuarioLogado.RealizaLogin(edLoginEmail.Text, edLoginSenha.Text);

    ModalResult := mrYes;
    CloseModal;
  except
    on E: Exception Do
    begin
      TDialogo.Excecao(E);
    end;
  end;
end;

end.

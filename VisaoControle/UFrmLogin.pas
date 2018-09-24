//{$DEFINE PROD}
unit UFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons
  , UMensagens, Vcl.Menus, Vcl.ComCtrls;

type
  TFrmLogin = class(TForm)
    sbPrincipal: TStatusBar;
    Panel1: TPanel;
    Image1: TImage;
    Image4: TImage;
    Image5: TImage;
    lbLogin: TLabel;
    Label1: TLabel;
    imEntrar: TImage;
    edLoginEmail: TEdit;
    edLoginSenha: TEdit;
    procedure imEntrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

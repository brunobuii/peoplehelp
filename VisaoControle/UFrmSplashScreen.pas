unit UFrmSplashScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TFrmSplashScreen = class(TForm)
    imgLogo: TImage;
    imgFundo: TImage;
    imacessar: TImage;
    imRegistrar: TImage;
    procedure ImRegistrarClick(Sender: TObject);
    procedure ImAcessarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
    UFrmRegistrar
  , UFrmLogin
  ;

{$R *.dfm}

procedure TFrmSplashScreen.ImAcessarClick(Sender: TObject);
var
  FrmLogin: TFrmLogin;
begin
  FrmLogin := TFrmLogin.Create(Self);
  try
    if FrmLogin.ShowModal = mrYes then
    begin
      ModalResult := mrOK;
    end
    else
    begin
      ModalResult := mrCancel;
    end;
    CloseModal;
  finally
    FreeandNil(FrmLogin);
  end;
end;

procedure TFrmSplashScreen.ImRegistrarClick(Sender: TObject);
var
  FrmRegistrar: TFrmRegistrar;
begin
  FrmRegistrar := TFrmRegistrar.Create(Self);
  try
    if FrmRegistrar.ShowModal = mrOK then
    begin
      ModalResult := mrOk;
      CloseModal;
    end;
  finally
    FreeAndNil(FrmRegistrar);
  end;
end;

end.

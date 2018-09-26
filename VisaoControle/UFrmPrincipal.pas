unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFrmPrincipal = class(TForm)
    sbPrincipal: TStatusBar;
    pnTopo: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image4: TImage;
    Label4: TLabel;
    Image5: TImage;
    Image6: TImage;
    Label5: TLabel;
    procedure miSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miServicoClick(Sender: TObject);
  private
    { Private declaration }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
    UDM
  , DB
  , UFrmRegistrar
  , UFrmLogin
  , UFrmServico
  ;

  {$R *.dfm}

procedure TFrmPrincipal.miSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.miServicoClick(Sender: TObject);
begin
  if FrmServico = nil then
    FrmServico := TFrmServico.Create(Self);
FrmServico.Show;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  sbPrincipal.Panels[0].Text := 'Banco de Dados: ' +
    dmEntra21.SQLConnection.Params.Values[CNT_DATA_BASE];
end;

end.

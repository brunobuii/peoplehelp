unit UFrmCriarServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Grids
  , URegraCRUDUsuario
  , UUsuario
  , URepositorioServico
  ;

type
  TFrmCriarServico = class(TForm)
    imFundo: TImage;
    pnEsquerdo: TPanel;
    Label2: TLabel;
    btnSalvar: TButton;
    StringGrid1: TStringGrid;
    cbxServico: TComboBox;
    lbServico: TLabel;
    edValor: TEdit;
    lbValor: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    FRepositorioServico: TRepositorioServico;
  public
    { Public declarations }
  end;

var
  FrmCriarServico: TFrmCriarServico;

implementation

{$R *.dfm}

uses
    UUsuarioLogado
  , UDialogo
  , UServico;

procedure TFrmCriarServico.FormCreate(Sender: TObject);
//var
//  loSERVICO: TSERVICO;
begin
   FRepositorioServico := TRepositorioServico.Create;

//  rgServico.Items.Clear;
//  for loSERVICO in FRepositorioSERVICO.RetornaTodos do
//  begin
//    rgServico.Items.AddObject(loSERVICO.NOME, loSERVICO);
//  end;
end;

end.

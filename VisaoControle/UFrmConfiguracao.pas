unit UFrmConfiguracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls
  , URepositorioCidade
  , URepositorioBairro
  ;

type
  TFrmConfiguracao = class(TForm)
    imFundo: TImage;
    imgFundo: TImage;
    pnEsquerdo: TPanel;
    lbAlterar: TLabel;
    Label1: TLabel;
    edEmail: TEdit;
    btnSalvar: TButton;
    Label2: TLabel;
    edEndereco: TEdit;
    lbCidade: TLabel;
    lbBairro: TLabel;
    cbxCidade: TComboBox;
    cbxBairro: TComboBox;
    lbNumero: TLabel;
    edNumero: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbxCidadeClick(Sender: TObject);
  private
   FRepositorioCidade: TRepositorioCidade;
   FRepositorioBairro: TRepositorioBairro;
  public
    { Public declarations }
  end;

var
  FrmConfiguracao: TFrmConfiguracao;

implementation

{$R *.dfm}

uses
    UCidade
  , UBairro
  ;

procedure TFrmConfiguracao.cbxCidadeClick(Sender: TObject);
var
  loCIDADE: TCIDADE;
  loBAIRRO: TBAIRRO;
begin
  cbxBairro.Items.Clear;

  loCIDADE := TCIDADE(cbxCidade.Items.Objects[cbxCidade.ItemIndex]);
  for loBAIRRO in FRepositorioBairro.RetornaBairrosCidade(loCIDADE.ID) do
  begin
    cbxBairro.AddItem(loBAIRRO.NOME, loBAIRRO);
  end
end;

procedure TFrmConfiguracao.FormCreate(Sender: TObject);
var
  loCIDADE: TCIDADE;
begin
   FRepositorioCidade := TRepositorioCidade.Create;
   FRepositorioBairro := TRepositorioBairro.Create;

  cbxCidade.Items.Clear;
  for loCIDADE in FRepositorioCidade.RetornaTodos do
  begin
    cbxCidade.AddItem(loCIDADE.NOME, loCIDADE);
  end;
end;


procedure TFrmConfiguracao.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FRepositorioCidade);
   FreeAndNil(FRepositorioBairro);
end;

end.

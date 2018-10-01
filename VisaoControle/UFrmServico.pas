unit UFrmServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg
  , URegraCRUDUsuario
  , UUsuario
  , URepositorioCidade
  , URepositorioBairro, Vcl.Grids
  ;

type
  TFrmServico = class(TForm)
    Panel2: TPanel;
    lbCidade: TLabel;
    cbxCidade: TComboBox;
    lbBairro: TLabel;
    cbxBairro: TComboBox;
    lbServico: TLabel;
    cbxServico: TComboBox;
    btnPesqusiar: TButton;
    lbFiltro: TLabel;
    lbSexo: TLabel;
    cbxSexo: TComboBox;
    imFundo: TImage;
    StringGrid1: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure cbxCidadeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AtualizaListaServico;
  private
    FRegraCRUDUsuario: TRegraCRUDUsuario;
    FRepositorioCidade: TRepositorioCidade;
    FRepositorioBairro: TRepositorioBairro;
  end;

var
  FrmServico: TFrmServico;

implementation

{$R *.dfm}

uses
    UFrmPrincipal
  , UDialogo
  , UCidade
  , UBairro
  ;

const
    COL_TIPO            = 0;
    COL_DISPONIBILIDADE = 1;
    COL_VALOR           = 2;

procedure TFrmServico.AtualizaListaServico;
begin
// TipoDisponibilidade := TTipoDisponibilidade(rgDisponibilidade.ItemIndex);
//
//  sgImoveis.RowCount := 2;
//  sgImoveis.Rows[1].Clear;
//
//  //Definindo cabeçalhos da grid.
//  sgServico.Cells[COL_PRESTADOR, 0] := STR_PRESTADOR;
//  sgServico.Cells[COL_SERVICO, 0]   := STR_SERVICO;
//  sgServico.Cells[COL_VALOR, 0]     := STR_VALOR;
//
//  Linha := 0;
//  for Servico in Servicos do
//  begin
//    Inc(Linha);
//
//    sgServico.Cells[COL_PRESTADOR, Linha] := CNT_DESCRICAO_TIPO_IMOVEL[Imovel.Tipo];
//    sgServico.Cells[COL_SERVICO, Linha]   := CNT_DESCRICAO_TIPO_DISPONIBILIDADE[TipoDisponibilidade];
//    sgServico.Cells[COL_VALOR, Linha]     := FloatToStrF(Imovel.RetornaValor(TipoDisponibilidade), ffCurrency, 10, 2);
//
//    sgImoveis.RowCount := Linha + 1;
end;

procedure TFrmServico.cbxCidadeChange(Sender: TObject);
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

procedure TFrmServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmServico := nil;
end;

procedure TFrmServico.FormCreate(Sender: TObject);
var
  loCIDADE: TCIDADE;
begin
   FRegraCRUDUsuario  := TRegraCRUDUsuario.Create;
   FRepositorioCidade := TRepositorioCidade.Create;
   FRepositorioBairro := TRepositorioBairro.Create;

  cbxCidade.Items.Clear;
  for loCIDADE in FRepositorioCidade.RetornaTodos do
  begin
    cbxCidade.AddItem(loCIDADE.NOME, loCIDADE);
  end;
end;

procedure TFrmServico.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FRegraCRUDUsuario);
   FreeAndNil(FRepositorioCidade);
   FreeAndNil(FRepositorioBairro);
end;

end.

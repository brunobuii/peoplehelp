unit UFrmServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Grids, Data.DB, Vcl.DBGrids
  , URegraCRUDUsuario
  , UUsuario
  , URepositorioCidade
  , URepositorioBairro
  , URepositorioServico
  , UListaVisualizacao
  , SQLExpr
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
    dbgPrestadores: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure cbxCidadeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesqusiarClick(Sender: TObject);
  private
    FRegraCRUDUsuario: TRegraCRUDUsuario;
    FRepositorioCidade: TRepositorioCidade;
    FRepositorioBairro: TRepositorioBairro;
    FListaVisualizacao: TListaVisualizacao;
    FRepositorioServico: TRepositorioServico;

    procedure OnDefineParametros(const coSQLDataSet: TSQLDataSet);
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
  , UOpcaoPesquisa
  , UServico
  ;

const
  COL_PRESTADOR       = 0;
  COL_SERVICO         = 1;
  COL_VALOR           = 2;

//  CNT_SELECAO_PERSTADORES = 'select * from vw_prestador_servico'
//                          + ' where (id_bairro  = :id_bairro or null = :id_bairro)'
//                          + '   and (id_cidade  = :id_cidade or null = :id_cidade)'
//                          + '   and (id_servico = :id_servico or null = :id_servico)'
//                          + '   and (id_sexo    = :id_sexo or null = :id_sexo)';


  CNT_SELECAO_PERSTADORES = 'select * from vw_prestador_servico';


  VW_PRESTADORES_ID_BAIRRO  = 'id_bairro';
  VW_PRESTADORES_ID_CIDADE  = 'id_cidade';
  VW_PRESTADORES_ID_SERVICO = 'id_servico';
  VW_PRESTADORES_ID_SEXO    = 'id_sexo';

procedure TFrmServico.btnPesqusiarClick(Sender: TObject);
begin
  FListaVisualizacao.OnDefineParametros := OnDefineParametros;
  FListaVisualizacao.CarregaPesquisa(TOpcaoPesquisa.Create
    .DefineSQL(CNT_SELECAO_PERSTADORES));
end;

procedure TFrmServico.cbxCidadeChange(Sender: TObject);
var
  loCIDADE: TCIDADE;
  loBAIRRO: TBAIRRO;
begin
  cbxBairro.ItemIndex := 0;

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
  loSERVICO: TSERVICO;
begin
  FRegraCRUDUsuario  := TRegraCRUDUsuario.Create;
  FRepositorioCidade := TRepositorioCidade.Create;
  FRepositorioBairro := TRepositorioBairro.Create;
  FRepositorioServico := TRepositorioServico.Create;

  for loCIDADE in FRepositorioCidade.RetornaTodos do
  begin
    cbxCidade.AddItem(loCIDADE.NOME, loCIDADE);
  end;

  for loSERVICO in FRepositorioSERVICO.RetornaTodos do
  begin
    cbxServico.AddItem(loSERVICO.SERVICO, loSERVICO);
  end;

  FListaVisualizacao := TLIstaVisualizacao.Create(dbgPrestadores);
end;

procedure TFrmServico.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FRegraCRUDUsuario);
   FreeAndNil(FRepositorioCidade);
   FreeAndNil(FRepositorioBairro);
   FreeAndNil(FRepositorioServico);
end;

procedure TFrmServico.OnDefineParametros(const coSQLDataSet: TSQLDataSet);
var
  lsCondicao: String;

  procedure AdicionaCondicao(const csCondicao: String);
  begin
    if lsCondicao = EmptyStr then
    begin
      lsCondicao := 'where ' +  csCondicao
    end
    else
    begin
      lsCondicao := lsCondicao + ' and ' +  csCondicao
    end
  end;

begin
  lsCondicao := '';

  if cbxBairro.ItemIndex <> 0 then
  begin
    AdicionaCondicao('id_bairro = :id_bairro');
  end;

  if cbxCidade.ItemIndex <> 0 then
  begin
    AdicionaCondicao('id_cidade = :id_cidade');
  end;

  if cbxServico.ItemIndex <> 0 then
  begin
    AdicionaCondicao('id_servico = :id_servico');
  end;

   if cbxSexo.ItemIndex <> 0 then
  begin
    AdicionaCondicao('id_sexo = :id_sexo');
  end;

  coSQLDataSet.CommandText := CNT_SELECAO_PERSTADORES + ' ' + lsCondicao;

  if cbxBairro.ItemIndex <> 0 then
  begin
    coSQLDataSet.ParamByName(VW_PRESTADORES_ID_BAIRRO).AsInteger := TBAIRRO(cbxBairro.Items.Objects[cbxBairro.ItemIndex]).ID;
  end;

  if cbxCidade.ItemIndex <> 0 then
  begin
    coSQLDataSet.ParamByName(VW_PRESTADORES_ID_CIDADE).AsInteger := TCIDADE(cbxCidade.Items.Objects[cbxCidade.ItemIndex]).ID;
  end;

  if cbxServico.ItemIndex <> 0 then
  begin
    coSQLDataSet.ParamByName(VW_PRESTADORES_ID_SERVICO).AsInteger := cbxServico.ItemIndex;
  end;

   if cbxSexo.ItemIndex <> 0 then
  begin
    coSQLDataSet.ParamByName(VW_PRESTADORES_ID_SEXO).AsInteger := cbxSexo.ItemIndex;
  end;
end;

end.

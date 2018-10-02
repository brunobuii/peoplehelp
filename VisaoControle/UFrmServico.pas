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
    FListaVisualizacao: TLIstaVisualizacao;

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
  ;

const
  COL_PRESTADOR       = 0;
  COL_SERVICO         = 1;
  COL_VALOR           = 2;

  CNT_SELECAO_PERSTADORES = 'select * from vw_prestador_servico'
                          + ' where (id_bairro  = :id_bairro or null = :id_bairro1)'
                          + '   and (id_cidade  = :id_cidade or null = :id_cidade1)'
                          + '   and (id_servico = :id_servico or null = :id_servico1)'
                          + '   and (id_sexo    = :id_sexo or null = :id_sexo1)';

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
begin
  FRegraCRUDUsuario  := TRegraCRUDUsuario.Create;
  FRepositorioCidade := TRepositorioCidade.Create;
  FRepositorioBairro := TRepositorioBairro.Create;

  for loCIDADE in FRepositorioCidade.RetornaTodos do
  begin
    cbxCidade.AddItem(loCIDADE.NOME, loCIDADE);
  end;

  FListaVisualizacao := TLIstaVisualizacao.Create(dbgPrestadores);
end;

procedure TFrmServico.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FRegraCRUDUsuario);
   FreeAndNil(FRepositorioCidade);
   FreeAndNil(FRepositorioBairro);
end;

procedure TFrmServico.OnDefineParametros(const coSQLDataSet: TSQLDataSet);
begin
  with coSQLDataSet do
  begin
    ParamByName(VW_PRESTADORES_ID_BAIRRO      ).DataType := ftString;
    ParamByName(VW_PRESTADORES_ID_BAIRRO + '1').Clear;
    ParamByName(VW_PRESTADORES_ID_CIDADE + '1').DataType := ftString;
    ParamByName(VW_PRESTADORES_ID_CIDADE + '1').Clear;
    ParamByName(VW_PRESTADORES_ID_SERVICO + '1').DataType := ftString;
    ParamByName(VW_PRESTADORES_ID_SERVICO + '1').Clear;
    ParamByName(VW_PRESTADORES_ID_SEXO + '1').DataType := ftString;
    ParamByName(VW_PRESTADORES_ID_SEXO + '1').Clear;

    if cbxBairro.ItemIndex = 0 then
    begin
      ParamByName(VW_PRESTADORES_ID_BAIRRO + '1').DataType := ftString;
      ParamByName(VW_PRESTADORES_ID_BAIRRO + '1').Clear;
    end
    else
      ParamByName(VW_PRESTADORES_ID_BAIRRO ).AsInteger := TBAIRRO(cbxBairro.Items.Objects[cbxBairro.ItemIndex]).ID;

    if cbxCidade.ItemIndex = 0 then
    begin
      ParamByName(VW_PRESTADORES_ID_CIDADE + '1' ).DataType := ftString;
      ParamByName(VW_PRESTADORES_ID_CIDADE + '1').Value    := NULL;
      ParamByName(VW_PRESTADORES_ID_CIDADE + '1').Clear;
    end
    else
      ParamByName(VW_PRESTADORES_ID_CIDADE ).AsInteger := TCIDADE(cbxCidade.Items.Objects[cbxCidade.ItemIndex]).ID;

    if cbxServico.ItemIndex = 0 then
    begin
      ParamByName(VW_PRESTADORES_ID_SERVICO  + '1').DataType := ftString;
      ParamByName(VW_PRESTADORES_ID_SERVICO  + '1').Value    := NULL;
      ParamByName(VW_PRESTADORES_ID_SERVICO  + '1').Clear;
    end
    else
      ParamByName(VW_PRESTADORES_ID_SERVICO ).AsInteger := cbxServico.ItemIndex;

    if cbxSexo.ItemIndex = 0 then
    begin
      ParamByName(VW_PRESTADORES_ID_SEXO + '1').DataType := ftString;
      ParamByName(VW_PRESTADORES_ID_SEXO + '1').Value    := NULL;
      ParamByName(VW_PRESTADORES_ID_SEXO + '1').Clear;
    end
    else
      ParamByName(VW_PRESTADORES_ID_SEXO ).AsInteger := cbxSexo.ItemIndex;
  end;
end;

end.

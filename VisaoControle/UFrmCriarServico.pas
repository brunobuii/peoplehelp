unit UFrmCriarServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Grids
  , URegraCRUDUsuario
  , UUsuario
  , URepositorioServico
  , UOpcaoPesquisa, Data.DB
  , Vcl.DBGrids
  , UListaVisualizacao
  , SQLExpr
  ;


type
  TFrmCriarServico = class(TForm)
    imFundo: TImage;
    pnEsquerdo: TPanel;
    Label2: TLabel;
    btnAtualiza: TButton;
    cbxServico: TComboBox;
    lbServico: TLabel;
    edValor: TEdit;
    lbValor: TLabel;
    btnSalvar: TButton;
    dbgPrestadores: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAtualizaClick(Sender: TObject);
  private
    FRepositorioServico: TRepositorioServico;
    FListaVisualizacao: TLIstaVisualizacao;
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

const
CNT_SELECAO_PERSTADORES = 'select * from vw_servico';


  VW_PRESTADORES_ID_PRESTADOR  = 'id_prestador';
  VW_PRESTADORES_ID_SERVICO    = 'id_servico';
  VW_PRESTADORES_ID_VALOR      = 'id_valor';

procedure TFrmCriarServico.btnAtualizaClick(Sender: TObject);
begin

  FListaVisualizacao.CarregaPesquisa(TOpcaoPesquisa.Create
    .DefineSQL(CNT_SELECAO_PERSTADORES));
end;

procedure TFrmCriarServico.FormCreate(Sender: TObject);
var
  loSERVICO: TSERVICO;
begin
  FRepositorioServico := TRepositorioServico.Create;

  for loSERVICO in FRepositorioSERVICO.RetornaTodos do
  begin
    cbxServico.AddItem(loSERVICO.SERVICO, loSERVICO);
  end;
end;

procedure TFrmCriarServico.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FRepositorioServico);
end;

end.

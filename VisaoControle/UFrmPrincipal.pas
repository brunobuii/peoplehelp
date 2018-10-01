unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TFrmPrincipal = class(TForm)
    sbPrincipal: TStatusBar;
    pnEsqueda: TPanel;
    imInicio: TImage;
    imBuscar: TImage;
    imAgenda: TImage;
    imConfiguracao: TImage;
    imSair: TImage;
    imFundo: TImage;
    imIniciotxt: TImage;
    imBuscartxt: TImage;
    imAgendatxt: TImage;
    imConfiguracaotxt: TImage;
    imMensagemtxt: TImage;
    imMensagem: TImage;
    imNext: TImage;
    imPrevious: TImage;
    imServicoPrestador: TImage;
    procedure miSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ServicoClick(Sender: TObject);
    procedure HomeClick(Sender: TObject);
    procedure MensagemClick(Sender: TObject);
    procedure AgendamentoClick(Sender: TObject);
    procedure imConfiguracaoClick(Sender: TObject);
    procedure imNextClick(Sender: TObject);
    procedure imPreviousClick(Sender: TObject);
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
  , UFrmMensagem
  , UFrmAgendamento
  , UFrmConfiguracao;

  {$R *.dfm}

procedure TFrmPrincipal.ServicoClick(Sender: TObject);
begin
  if FrmServico = nil then
    FrmServico := TFrmServico.Create(Self);
FrmServico.Show;
end;

procedure TFrmPrincipal.HomeClick(Sender: TObject);
begin
//FormClose;
end;

procedure TFrmPrincipal.imConfiguracaoClick(Sender: TObject);
begin
 if FrmConfiguracao = nil then
    FrmConfiguracao := TFrmConfiguracao.Create(Self);
FrmConfiguracao.Show;
end;

procedure TFrmPrincipal.imNextClick(Sender: TObject);
begin
imInicio.Visible          := False;
imBuscar.Visible          := False;
imAgenda.Visible          := False;
imConfiguracao.Visible    := False;
imBuscartxt.Visible       := False;
imAgendatxt.Visible       := False;
imMensagemtxt.Visible     := False;
imConfiguracaotxt.Visible := False;
imMensagem.Visible        := False;
imIniciotxt.Visible       := False;
imNext.Visible            := False;
imPrevious.Visible        := Enabled;
imServicoPrestador.Visible := Enabled;
end;

procedure TFrmPrincipal.imPreviousClick(Sender: TObject);
begin
imInicio.Visible          := Enabled;
imBuscar.Visible          := Enabled;
imAgenda.Visible          := Enabled;
imConfiguracao.Visible    := Enabled;
imBuscartxt.Visible       := Enabled;
imAgendatxt.Visible       := Enabled;
imMensagemtxt.Visible     := Enabled;
imConfiguracaotxt.Visible := Enabled;
imMensagem.Visible        := Enabled;
imIniciotxt.Visible       := Enabled;
imNext.Visible            := Enabled;
imPrevious.Visible           := False;
imServicoPrestador.Visible   := False;
end;

procedure TFrmPrincipal.AgendamentoClick(Sender: TObject);
begin
 if FrmAgendamento = nil then
    FrmAgendamento := TFrmAgendamento.Create(Self);
FrmAgendamento.Show;
end;

procedure TFrmPrincipal.MensagemClick(Sender: TObject);
begin
  if FrmMensagem = nil then
    FrmMensagem := TFrmMensagem.Create(Self);
FrmMensagem.Show;
end;

procedure TFrmPrincipal.miSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  sbPrincipal.Panels[0].Text := 'Banco de Dados: ' +
    dmEntra21.SQLConnection.Params.Values[CNT_DATA_BASE];
end;

end.

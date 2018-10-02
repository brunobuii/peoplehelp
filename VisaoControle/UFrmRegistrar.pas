unit UFrmRegistrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons, UMensagens, Vcl.Menus, URegraCRUDUsuario, UUsuario,
  Vcl.ComCtrls
  , URepositorioCidade
  , URepositorioBairro
  ;

type
  TFrmRegistrar = class(TForm)
    PnTopo: TPanel;
    Image1: TImage;
    Image4: TImage;
    Image5: TImage;
    PnRodape: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnLimpar: TBitBtn;
    btnSair: TBitBtn;
    PnEsquerdo: TPanel;
    PnDireito: TPanel;
    lbNome: TLabel;
    lbCPF: TLabel;
    lbEmail: TLabel;
    lbRua: TLabel;
    lbCidade: TLabel;
    lbNumero: TLabel;
    lbTelefone: TLabel;
    edNome: TEdit;
    edCPF: TEdit;
    edEmail: TEdit;
    edRua: TEdit;
    edNumero: TEdit;
    edTelefone: TEdit;
    lbSenha: TLabel;
    edSenha: TEdit;
    lbConfirmacaoSenha: TLabel;
    edConfirmacaoSenha: TEdit;
    cbxPrestador: TCheckBox;
    cbxCliente: TCheckBox;
    cbxCidade: TComboBox;
    cbxTermo: TCheckBox;
    rgSexo: TRadioGroup;
    lbBairro: TLabel;
    cbxBairro: TComboBox;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbxCidadeChange(Sender: TObject);
  private
    FRegraCRUDUsuario: TRegraCRUDUsuario;
    FRepositorioCidade: TRepositorioCidade;
    FRepositorioBairro: TRepositorioBairro;
  end;

implementation

{$R *.dfm}

uses
    UUsuarioLogado
  , UDialogo
  , UCidade
  , UBairro
  ;

procedure TFrmRegistrar.btnGravarClick(Sender: TObject);
var
  USUARIO: TUSUARIO;
begin
  if cbxTermo.Visible = Enabled then

  try
    USUARIO                   := TUSUARIO.Create;
    USUARIO.NOME              := edNome.Text;
    USUARIO.INSCRICAO_FEDERAL := edCPF.Text;
    USUARIO.SENHA             := edSenha.Text;
    USUARIO.RUA               := edRua.Text;
    USUARIO.NUMERO            := StrToInt(edNumero.Text);
    USUARIO.EMAIL             := edEmail.Text;
    USUARIO.TELEFONE          := edTelefone.Text;
    USUARIO.PRESTADOR         := cbxPrestador.Checked;
    USUARIO.CLIENTE           := cbxCliente.Checked;
    USUARIO.SEXO              := rgSexo.ItemIndex;
    USUARIO.BAIRRO.ID         := TBAIRRO(cbxBairro.Items.Objects[cbxBairro.ItemIndex]).ID;

    FRegraCRUDUsuario.CONFIRMACAO_SENHA := edConfirmacaoSenha.Text;
    FRegraCRUDUsuario.Insere(USUARIO);
    TUsuarioLogado.RealizaLogin(edEmail.Text, edSenha.Text);
    ModalResult := mrOK;
    ShowMessage('Cadastro Realizado com Sucesso! Seja Bem Vindo(a)! '+ USUARIO.NOME);

    CloseModal;
  except
    on E: Exception do
    begin
      TDialogo.Excecao(E);
    end;
  end;
end;

procedure TFrmRegistrar.btnLimparClick(Sender: TObject);
begin
  edNome.Clear;
  edCPF.Clear;
  edEmail.Clear;
  edRua.Clear;
  cbxCidade.Clear;
  cbxBairro.Clear;
  edNumero.Clear;
  edTelefone.Clear;
  edSenha.Clear;
  edConfirmacaoSenha.Clear;
end;

procedure TFrmRegistrar.btnNovoClick(Sender: TObject);
begin
  edNome.Visible             := Enabled;
  edCPF.Visible              := Enabled;
  edEmail.Visible            := Enabled;
  edRua.Visible              := Enabled;
  cbxCidade.Visible          := Enabled;
  edNumero.Visible           := Enabled;
  edTelefone.Visible         := Enabled;
  edSenha.Visible            := Enabled;
  edConfirmacaoSenha.Visible := Enabled;
  cbxTermo.Visible           := Enabled;
  rgSexo.Visible             := Enabled;
  cbxBairro.Visible          := Enabled;
  lbBairro.Visible           := Enabled;
  cbxPrestador.Visible       := Enabled;
  cbxCliente.Visible         := Enabled;
  btnGravar.Visible          := Enabled;
  btnLimpar.Visible          := Enabled;
end;

procedure TFrmRegistrar.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRegistrar.cbxCidadeChange(Sender: TObject);
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

procedure TFrmRegistrar.FormCreate(Sender: TObject);
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

procedure TFrmRegistrar.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FRegraCRUDUsuario);
   FreeAndNil(FRepositorioCidade);
   FreeAndNil(FRepositorioBairro);
 end;

end.

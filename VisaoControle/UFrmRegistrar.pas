unit UFrmRegistrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons, UMensagens, Vcl.Menus, URegraCRUDUsuario, UUsuario,
  Vcl.ComCtrls;

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
    cmbCidade: TComboBox;
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
  private
    FRegraCRUDUsuario: TRegraCRUDUsuario;
  end;

implementation

{$R *.dfm}

uses
  UUsuarioLogado, UDialogo;

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
    USUARIO.NUMERO            := edNumero.Int;
    USUARIO.EMAIL             := edEmail.Text;
    USUARIO.CIDADE            := cmbCidade.Text;
    USUARIO.TELEFONE          := edTelefone.Text;
    USUARIO.PRESTADOR         := cbxPrestador.Checked;
    USUARIO.CLIENTE           := cbxCliente.Checked;
    USUARIO.SEXO              := rgSexo.
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
 // else
  ShowMessage('Você Não Está de Acordo com os Termos!');
end;

procedure TFrmRegistrar.btnLimparClick(Sender: TObject);
begin
  edNome.Clear;
  edCPF.Clear;
  edEmail.Clear;
  edRua.Clear;
  cmbCidade.Clear;
  cmbBairro.Clear;
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
  cmbCidade.Visible          := Enabled;
  edNumero.Visible           := Enabled;
  edTelefone.Visible         := Enabled;
  edSenha.Visible            := Enabled;
  edConfirmacaoSenha.Visible := Enabled;
  cbxTermo.Visible           := Enabled;
  rgSexo.Visible             := Enabled;
  cbxBairro                  := Enabled;
  cbxPrestador.Visible       := Enabled;
  cbxCliente.Visible         := Enabled;
  btnGravar.Visible          := Enabled;
  btnLimpar.Visible          := Enabled;
end;

procedure TFrmRegistrar.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRegistrar.FormCreate(Sender: TObject);
begin
 FRegraCRUDUsuario:= TRegraCRUDUsuario.Create;
end;

procedure TFrmRegistrar.FormDestroy(Sender: TObject);
begin
 FreeAndNil(FRegraCRUDUsuario);
 end;

end.

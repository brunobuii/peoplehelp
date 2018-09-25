unit UFrmRegistrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons, UMensagens, Vcl.Menus, URegraCRUDUsuario, UUsuario;

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
    lbServico: TLabel;
    edNome: TEdit;
    edCPF: TEdit;
    edEmail: TEdit;
    edRua: TEdit;
    edCidade: TEdit;
    edNumero: TEdit;
    edTelefone: TEdit;
    edServico: TEdit;
    lbSenha: TLabel;
    edSenha: TEdit;
    lbConfirmacaoSenha: TLabel;
    edConfirmacaoSenha: TEdit;
    cbxPrestador: TCheckBox;
    cbxCliente: TCheckBox;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FRegraCRUDUsuario: TRegraCRUDUsuario;
    FUSUARIO: TUSUARIO;
  end;

implementation

{$R *.dfm}

uses
  UUsuarioLogado, UDialogo;

procedure TFrmRegistrar.btnGravarClick(Sender: TObject);
var
  USUARIO: TUSUARIO;
begin
  try
    USUARIO := TUSUARIO.Create;
    USUARIO.NOME := edNome.Text;
    USUARIO.INSCRICAO_FEDERAL := edCPF.Text;
    USUARIO.SENHA := edSenha.Text;
    USUARIO.RUA := edRua.Text;
    USUARIO.EMAIL := edEmail.Text;
    USUARIO.CIDADE := edCidade.Text;
    USUARIO.TELEFONE := edTelefone.Text;
    USUARIO.PRESTADOR := cbxPrestador.Checked;
    USUARIO.CLIENTE := cbxCliente.Checked;
    FRegraCRUDUsuario.CONFIRMACAO_SENHA := edConfirmacaoSenha.Text;
    FRegraCRUDUsuario.Insere(USUARIO);
    TUsuarioLogado.RealizaLogin(edEmail.Text, edSenha.Text);
    ModalResult := mrOK;
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
  edCidade.Clear;
  edNumero.Clear;
  edTelefone.Clear;
  edServico.Clear;
  edSenha.Clear;
  edConfirmacaoSenha.Clear;
end;

procedure TFrmRegistrar.btnNovoClick(Sender: TObject);
begin
  edNome.Visible             := Enabled;
  edCPF.Visible              := Enabled;
  edEmail.Visible            := Enabled;
  edRua.Visible              := Enabled;
  edCidade.Visible           := Enabled;
  edNumero.Visible           := Enabled;
  edTelefone.Visible         := Enabled;
  edServico.Visible          := Enabled;
  edSenha.Visible            := Enabled;
  edConfirmacaoSenha.Visible := Enabled;
  cbxPrestador.Visible := Enabled;
  cbxCliente.Visible := Enabled;
  btnGravar.Visible := Enabled;
  btnLimpar.Visible := Enabled;
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

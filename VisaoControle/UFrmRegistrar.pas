unit UFrmRegistrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons
  , UMensagens
  , Vcl.Menus
  , URegraCRUDUsuario
  , UUsuario
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
    btnExcluir: TBitBtn;
    btnLimpar: TBitBtn;
    btnSair: TBitBtn;
    PnEsquerdo: TPanel;
    rdCadastro: TRadioGroup;
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
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    FRegraCRUDUsuario: TRegraCRUDUsuario;
    FUSUARIO: TUSUARIO;
  end;



implementation

{$R *.dfm}

uses
     UUsuarioLogado
   , UDialogo
   ;

procedure TFrmRegistrar.btnGravarClick(Sender: TObject);
var
  USUARIO: TUSUARIO;
begin
  try
    USUARIO      := TUSUARIO.Create;
    USUARIO.NOME := edNome.Text;
    //...
    //...

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
end;

procedure TFrmRegistrar.btnNovoClick(Sender: TObject);
begin
// if (TTipordCadastro = tdPrestador) then
//  edNome.Enabled := True;
//  edCPF.Enabled := True;
//  edEmail.Enabled := True;
//  edRua.Enabled := True;
//  edCidade.Enabled := True;
//  edNumero.Enabled := True;
//  edTelefone.Enabled := True;
//  edServico.Enabled := True;
end;

procedure TFrmRegistrar.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.

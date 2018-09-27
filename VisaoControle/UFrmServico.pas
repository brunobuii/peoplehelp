unit UFrmServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TFrmServico = class(TForm)
    Panel1: TPanel;
    imgLupa: TImage;
    Image1: TImage;
    Panel2: TPanel;
    lbCidade: TLabel;
    ComboBox1: TComboBox;
    lbBairro: TLabel;
    ComboBox2: TComboBox;
    lbServico: TLabel;
    ComboBox3: TComboBox;
    btnPesqusiar: TButton;
    lbFiltro: TLabel;
    lbSexo: TLabel;
    cbSexo: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmServico: TFrmServico;

implementation

{$R *.dfm}

uses
  UFrmPrincipal;

procedure TFrmServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmServico := nil;
end;

end.

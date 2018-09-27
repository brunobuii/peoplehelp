unit UFrmMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmMensagem = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ListBox2: TListBox;
    ListBox1: TListBox;
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMensagem: TFrmMensagem;

implementation

{$R *.dfm}

procedure TFrmMensagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmMensagem := nil;
end;

end.

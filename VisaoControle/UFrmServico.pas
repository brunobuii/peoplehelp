unit UFrmServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrmServico = class(TForm)
    GroupBox1: TGroupBox;
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

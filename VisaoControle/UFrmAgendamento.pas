unit UFrmAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCalendars, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.Grids;

type
  TFrmAgendamento = class(TForm)
    imFundo: TImage;
    StringGrid1: TStringGrid;
//  procedure CabecalhoResultadoConsulta;
//  function RetornaLinha(poLinha: TTipoLinnhaHorario): Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAgendamento: TFrmAgendamento;

implementation

{$R *.dfm}

uses
  UMensagens
  ;
{ TFrmAgendamento }

//procedure TFrmAgendamento.CabecalhoResultadoConsulta;
//const
//  STR_DATE_TIME = 'Hora';
//  CNT_COL_HORAS = 0;
//begin
// sgConsultaResultado.Cells[0, 0] := STR_DATE_TIME;
//
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlOITO_ZERO          )] := STR_OITO_ZERO           ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlOITO_TRINTA        )] := STR_OITO_TRINTA         ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlNOVE_ZERO          )] := STR_NOVE_ZERO           ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlNOVE_TRINTA        )] := STR_NOVE_TRINTA         ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlDEZ_ZERO           )] := STR_DEZ_ZERO            ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlDEZ_TRINTA         )] := STR_DEZ_TRINTA          ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlONZE_ZERO          )] := STR_ONZE_ZERO           ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlONZE_TRINTA        )] := STR_ONZE_TRINTA         ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlTREZE_ZERO         )] := STR_TREZE_ZERO          ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlTREZE_TRINTA       )] := STR_TREZE_TRINTA        ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlQUATORZE_ZERO      )] := STR_QUATORZE_ZERO       ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlQUATORZE_TRINTA    )] := STR_QUATORZE_TRINTA     ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlQUINZE_ZERO        )] := STR_QUINZE_ZERO         ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlQUINZE_TRINTA      )] := STR_QUINZE_TRINTA       ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlDEZESSEIS_ZERO     )] := STR_DEZESSEIS_ZERO      ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlDEZESSEIS_TRINTA   )] := STR_DEZESSEIS_TRINTA    ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlDEZESSETE_ZERO     )] := STR_DEZESSETE_ZERO      ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlDEZESSETE_TRINTA   )] := STR_DEZESSETE_TRINTA    ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlDEZOITO_ZERO       )] := STR_DEZOITO_ZERO        ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlDEZOITO_TRINTA     )] := STR_DEZOITO_TRINTA      ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlDEZENOVE_ZERO      )] := STR_DEZENOVE_ZERO       ;
//  sgConsultaResultado.Cells[CNT_COL_HORAS, RetornaLinha(tlDEZENOVE_QRT_CINCO )] := STR_DEZENOVE_TRINTA     ;
//  end;
//function TFrmAgendamento.RetornaLinha(poLinha: TTipoLinnhaHorario): Integer;
//begin
//  Result:= Integer(CNT_HORARIOS_CADASTRO(poLinha));
//end;

end.

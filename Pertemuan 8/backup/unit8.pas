unit Unit8;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TFormRotasi }

  TFormRotasi = class(TForm)
    BtnGaris: TButton;
    BtnTampil: TButton;
    Button1: TButton;
    EditSudut: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    procedure BtnGarisClick(Sender: TObject);
    procedure BtnTampilClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Line;
    procedure RotateLine(Angle: Double);
  public

  end;

var
  FormRotasi: TFormRotasi;
  xint1, yint1, xint2, yint2: Integer;
  x1, y1, x2, y2: Integer;
  currentAngle: Double;

implementation

{$R *.lfm}

{ TFormRotasi }

procedure TFormRotasi.FormCreate(Sender: TObject);
begin

  x1 := 100; y1 := 100;
  x2 := 200; y2 := 100;
  xint1 := x1;
  yint1 := y1;
  xint2 := x2;
  yint2 := y2;
  Canvas.Pen.Color := clRed;
  Line;
  currentAngle := 0;
  Edit1.Text := FloatToStr(currentAngle);
end;

procedure TFormRotasi.Line;
begin
  Canvas.MoveTo(xint1, yint1);
  Canvas.LineTo(xint2, yint2);
end;

procedure TFormRotasi.RotateLine(Angle: Double);
var
  sudutRadian: Double;
  x11, y11, x22, y22, dx, dy: Double;
begin
  sudutRadian := (Angle / 180) * Pi; // Konversi sudut dari derajat ke radian
  x11 := x1 * cos(sudutRadian) - y1 * sin(sudutRadian);
  y11 := x1 * sin(sudutRadian) + y1 * cos(sudutRadian);
  x22 := x2 * cos(sudutRadian) - y2 * sin(sudutRadian);
  y22 := x2 * sin(sudutRadian) + y2 * cos(sudutRadian);

  dx := x2 - x22;
  dy := y2 - y22;

  x11 := x11 + dx;
  y11 := y11 + dy;
  x22 := x22 + dx;
  y22 := y22 + dy;

  xint1 := Round(x11);
  yint1 := Round(y11);
  xint2 := Round(x22);
  yint2 := Round(y22);

  Canvas.Pen.Color := clBlue;
  Canvas.Clear;
  Line;
end;

procedure TFormRotasi.BtnGarisClick(Sender: TObject);
begin
  currentAngle := currentAngle + 10;
  if currentAngle >= 360 then
    currentAngle := currentAngle - 360;
  RotateLine(currentAngle);
  Edit1.Text := FloatToStr(currentAngle);
end;

procedure TFormRotasi.BtnTampilClick(Sender: TObject);
begin

  Canvas.Pen.Color := clRed;
  currentAngle := 0;
  xint1 := x1;
  yint1 := y1;
  xint2 := x2;
  yint2 := y2;
  Canvas.Clear;
  Line;
  Edit1.Text := FloatToStr(currentAngle);
end;

procedure TFormRotasi.Button1Click(Sender: TObject);
begin
  close;
end;

end.


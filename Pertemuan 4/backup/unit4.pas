unit unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ButtonLove: TButton;
    ButtonEmoteSenyum: TButton;
    ButtonEmoteMarah: TButton;
    ButtonEmoteSedih: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ButtonLoveClick(Sender: TObject);
    procedure ButtonEmoteSenyumClick(Sender: TObject);
    procedure ButtonEmoteMarahClick(Sender: TObject);
    procedure ButtonEmoteSedihClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Label1Click(Sender: TObject);
  private
    procedure DrawEmote(EmoteType: String);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ButtonLoveClick(Sender: TObject);
begin
  DrawEmote('love');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Invalidate;
end;

procedure TForm1.ButtonEmoteSenyumClick(Sender: TObject);
begin
  DrawEmote('senyum');
end;

procedure TForm1.ButtonEmoteMarahClick(Sender: TObject);
begin
  DrawEmote('marah');
end;

procedure TForm1.ButtonEmoteSedihClick(Sender: TObject);
begin
  DrawEmote('sedih');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Label1.Caption := 'X : ' + IntToSTR(X) + ' Y : ' + IntToStr(Y);
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.DrawEmote(EmoteType: String);
var
  CenterX, CenterY: Integer;
begin
  Canvas.Brush.Color := clWhite;
  Canvas.FillRect(0, 0, Width, Height);

  CenterX := Width div 2;
  CenterY := Height div 2;


  if EmoteType = 'senyum' then
  begin
    Canvas.Brush.Color := clYellow;
    Canvas.Ellipse(CenterX - 100, CenterY - 100, CenterX + 100, CenterY + 100);
    Canvas.Ellipse(CenterX - 70, CenterY - 40, CenterX - 50, CenterY - 20);
    Canvas.Ellipse(CenterX + 50, CenterY - 40, CenterX + 70, CenterY - 20);
    Canvas.Arc(CenterX - 80, CenterY, CenterX + 80, CenterY + 40, 0, 180);
    Canvas.MoveTo(CenterX - 80, CenterY + 20);
    Canvas.LineTo(CenterX + 80, CenterY + 20);
  end
  else if EmoteType = 'marah' then
  begin
    Canvas.Brush.Color := clYellow;
    Canvas.Ellipse(CenterX - 100, CenterY - 100, CenterX + 100, CenterY + 100);
    Canvas.Ellipse(CenterX - 70, CenterY - 40, CenterX - 50, CenterY - 20);
    Canvas.Ellipse(CenterX + 50, CenterY - 40, CenterX + 70, CenterY - 20);
    Canvas.MoveTo(CenterX - 75, CenterY - 45);
    Canvas.LineTo(CenterX - 50, CenterY - 55);
    Canvas.MoveTo(CenterX + 50, CenterY - 55);
    Canvas.LineTo(CenterX + 75, CenterY - 45);
    Canvas.Arc(CenterX - 80, CenterY + 20, CenterX + 80, CenterY + 60, 0, 180);
  end
  else if EmoteType = 'sedih' then
  begin
    Canvas.Brush.Color := clYellow;
    Canvas.Ellipse(CenterX - 100, CenterY - 100, CenterX + 100, CenterY + 100);
    Canvas.Ellipse(CenterX - 70, CenterY - 40, CenterX - 50, CenterY - 20);
    Canvas.Ellipse(CenterX + 50, CenterY - 40, CenterX + 70, CenterY - 20);
    Canvas.Arc(CenterX - 80, CenterY + 20, CenterX + 80, CenterY + 40, 0, 180);
  end
  else if EmoteType = 'love' then
  begin
    Canvas.Brush.Color := clRed;
    Canvas.Ellipse(CenterX - 60, CenterY - 80, CenterX, CenterY - 20);
    Canvas.Ellipse(CenterX, CenterY - 80, CenterX + 60, CenterY - 20);
    Canvas.Polygon([Point(CenterX - 60, CenterY - 60), Point(CenterX + 60, CenterY - 60), Point(CenterX, CenterY + 30)]);
  end;
end;

end.


unit unit6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnKanan: TButton;
    BtnKiri: TButton;
    BtnAtas: TButton;
    BtnBawah: TButton;
    Panel1: TPanel;
    procedure BtnAtasClick(Sender: TObject);
    procedure BtnBawahClick(Sender: TObject);
    procedure BtnKananClick(Sender: TObject);
    procedure BtnKiriClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Panel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
     { private declarations }
    xPos, yPos: Integer;
    isDragging: Boolean;
    offsetX, offsetY: Integer;
    procedure DrawObject;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BtnKananClick(Sender: TObject);
begin
  xPos := xPos + 10;
  DrawObject;
end;

procedure TForm1.BtnAtasClick(Sender: TObject);
begin
  yPos := yPos - 10;
  DrawObject;
end;

procedure TForm1.BtnBawahClick(Sender: TObject);
begin
  yPos := yPos + 10;
  DrawObject;
end;

procedure TForm1.BtnKiriClick(Sender: TObject);
begin
  xPos := xPos - 10;
  DrawObject;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  xPos := 100;
  yPos := 100;
  isDragging := False;
  DrawObject;
end;

procedure TForm1.DrawObject;
begin
  Panel1.Canvas.FillRect(Panel1.ClientRect);
  Panel1.Canvas.Rectangle(xPos, yPos, xPos + 50, yPos + 50);
end;

procedure TForm1.Panel1Click(Sender: TObject);
begin

end;

procedure TForm1.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  isDragging := True;
  offsetX := X - xPos;
  offsetY := Y - yPos;

end;

procedure TForm1.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if isDragging then
  begin
    xPos := X - offsetX;
    yPos := Y - offsetY;
    DrawObject;
  end;

end;

procedure TForm1.Panel1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  isDragging := False;

end;

end.


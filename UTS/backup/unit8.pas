unit unit8;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnWarnaDinding: TButton;
    BtnWarnaAtap: TButton;
    BtnWarnaJendela: TButton;
    BtnWarnaPintu: TButton;
    BtnPerbesar: TButton;
    BtnGeserKiri: TButton;
    BtnGeserKanan: TButton;
    BtnPerkecil: TButton;
    ColorDialog1: TColorDialog;
    Label1: TLabel;
    Label2: TLabel;
    PaintBox1: TPaintBox;
    procedure BtnWarnaDindingClick(Sender: TObject);
    procedure BtnWarnaAtapClick(Sender: TObject);
    procedure BtnWarnaJendelaClick(Sender: TObject);
    procedure BtnWarnaPintuClick(Sender: TObject);
    procedure BtnPerbesarClick(Sender: TObject);
    procedure BtnGeserKiriClick(Sender: TObject);
    procedure BtnGeserKananClick(Sender: TObject);
    procedure BtnPerkecilClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure PaintBox1Click(Sender: TObject);
  private
    DindingColor, AtapColor, PintuColor, JendelaColor: TColor;
    ScaleFactor: Double;
    OffsetX: Integer;
    procedure GambarRumah;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BtnWarnaDindingClick(Sender: TObject);
begin
  // Pilih warna dinding
  if ColorDialog1.Execute then
  begin
    DindingColor := ColorDialog1.Color;
    PaintBox1.Repaint; // Refresh gambar
  end;

end;

procedure TForm1.BtnWarnaAtapClick(Sender: TObject);
begin
  // Pilih warna atap
  if ColorDialog1.Execute then
  begin
    AtapColor := ColorDialog1.Color;
    PaintBox1.Repaint;
  end;

end;

procedure TForm1.BtnWarnaJendelaClick(Sender: TObject);
begin
  // Pilih warna jendela
  if ColorDialog1.Execute then
  begin
    JendelaColor := ColorDialog1.Color;
    PaintBox1.Repaint;
  end;

end;

procedure TForm1.BtnWarnaPintuClick(Sender: TObject);
begin
  // Pilih warna pintu
  if ColorDialog1.Execute then
  begin
    PintuColor := ColorDialog1.Color;
    PaintBox1.Invalidate;
  end;

end;

procedure TForm1.BtnPerbesarClick(Sender: TObject);
begin
  // Perbesar skala rumah
  ScaleFactor := ScaleFactor + 0.1;
  PaintBox1.Invalidate;

end;

procedure TForm1.BtnGeserKiriClick(Sender: TObject);
begin
  // Geser rumah ke kiri
  OffsetX := OffsetX - 10;
  PaintBox1.Repaint;

end;

procedure TForm1.BtnGeserKananClick(Sender: TObject);
begin
  // Geser rumah ke kanan
  OffsetX := OffsetX + 10;
  PaintBox1.Repaint;

end;

procedure TForm1.BtnPerkecilClick(Sender: TObject);
begin
  // Perkecil skala rumah
  if ScaleFactor > 0.2 then
    ScaleFactor := ScaleFactor - 0.1;
  PaintBox1.Repaint;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  // Set warna default
  DindingColor := clYellow;
  AtapColor := clRed;
  PintuColor := clBlue;
  JendelaColor := clBlue;

  // Set faktor skala awal
  ScaleFactor := 1.0;

  // Set offset translasi awal
  OffsetX := 0;
  GambarRumah;

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.PaintBox1Click(Sender: TObject);
begin
  GambarRumah;

end;
procedure TForm1.GambarRumah;
var
  x, y, dindingWidth, dindingHeight: Integer;
  midX: Integer;
begin
  // Set koordinat awal dan ukuran dasar rumah
  x := 50 + OffsetX;
  y := 150;
  dindingWidth := Round(400 * ScaleFactor);  // Lebar dinding
  dindingHeight := Round(150 * ScaleFactor); // Tinggi dinding

  // Bersihkan area PaintBox
  PaintBox1.Canvas.Clear;

  // Gambar Dinding
  PaintBox1.Canvas.Brush.Color := DindingColor;
  PaintBox1.Canvas.Rectangle(x, y, x + dindingWidth, y + dindingHeight);

 // Gambar Atap Segitiga
PaintBox1.Canvas.Brush.Color := AtapColor;
midX := x + dindingWidth div 2;  // Titik tengah atas (puncak segitiga)
PaintBox1.Canvas.Polygon([
  Point(midX, y - Round(60 * ScaleFactor)),   // Titik puncak segitiga
  Point(x, y),                                // Titik kiri bawah
  Point(x + dindingWidth, y)                  // Titik kanan bawah
]);


  // Gambar Pintu
  PaintBox1.Canvas.Brush.Color := PintuColor;
  PaintBox1.Canvas.Rectangle(midX - Round(20 * ScaleFactor), y + Round(90 * ScaleFactor),
                             midX + Round(20 * ScaleFactor), y + dindingHeight); // Pintu di tengah

  // Gambar Jendela (kiri dan kanan)
  PaintBox1.Canvas.Brush.Color := JendelaColor;

  // Jendela kiri 1
  PaintBox1.Canvas.Rectangle(midX - Round(140 * ScaleFactor), y + Round(40 * ScaleFactor),
                             midX - Round(100 * ScaleFactor), y + Round(100 * ScaleFactor)); // Jendela kiri 1

  // Jendela kiri 2 (tambahan)
  PaintBox1.Canvas.Rectangle(midX - Round(160 * ScaleFactor), y + Round(40 * ScaleFactor),
                             midX - Round(140 * ScaleFactor), y + Round(100 * ScaleFactor)); // Jendela kiri 2

  // Jendela kanan 1
  PaintBox1.Canvas.Rectangle(midX + Round(100 * ScaleFactor), y + Round(40 * ScaleFactor),
                             midX + Round(140 * ScaleFactor), y + Round(100 * ScaleFactor)); // Jendela kanan 1

  // Jendela kanan 2 (tambahan)
  PaintBox1.Canvas.Rectangle(midX + Round(80 * ScaleFactor), y + Round(40 * ScaleFactor),
                             midX + Round(100 * ScaleFactor), y + Round(100 * ScaleFactor)); // Jendela kanan 2
end;


end.


unit unit8;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnWarnaDinding: TButton;  // Tombol untuk mengubah warna dinding
    BtnWarnaAtap: TButton;     // Tombol untuk mengubah warna atap
    BtnWarnaJendela: TButton;  // Tombol untuk mengubah warna jendela
    BtnWarnaPintu: TButton;    // Tombol untuk mengubah warna pintu
    BtnPerbesar: TButton;      // Tombol untuk memperbesar ukuran rumah
    BtnGeserKiri: TButton;     // Tombol untuk menggeser rumah ke kiri
    BtnGeserKanan: TButton;    // Tombol untuk menggeser rumah ke kanan
    BtnPerkecil: TButton;      // Tombol untuk memperkecil ukuran rumah
    ColorDialog1: TColorDialog; // Dialog untuk memilih warna
    Label1: TLabel;
    Label2: TLabel;
    PaintBox1: TPaintBox;       // Komponen PaintBox untuk menggambar rumah
    procedure BtnWarnaDindingClick(Sender: TObject); // Prosedur klik untuk tombol warna dinding
    procedure BtnWarnaAtapClick(Sender: TObject);    // Prosedur klik untuk tombol warna atap
    procedure BtnWarnaJendelaClick(Sender: TObject); // Prosedur klik untuk tombol warna jendela
    procedure BtnWarnaPintuClick(Sender: TObject);   // Prosedur klik untuk tombol warna pintu
    procedure BtnPerbesarClick(Sender: TObject);     // Prosedur klik untuk memperbesar rumah
    procedure BtnGeserKiriClick(Sender: TObject);    // Prosedur klik untuk menggeser rumah ke kiri
    procedure BtnGeserKananClick(Sender: TObject);   // Prosedur klik untuk menggeser rumah ke kanan
    procedure BtnPerkecilClick(Sender: TObject);     // Prosedur klik untuk memperkecil rumah
    procedure FormCreate(Sender: TObject);           // Prosedur untuk inisialisasi form
    procedure Label1Click(Sender: TObject);
    procedure PaintBox1Click(Sender: TObject);       // Prosedur klik pada PaintBox
  private
    DindingColor, AtapColor, PintuColor, JendelaColor: TColor;  // Variabel untuk menyimpan warna komponen rumah
    ScaleFactor: Double;      // Variabel untuk menyimpan skala ukuran rumah
    OffsetX: Integer;         // Variabel untuk menyimpan posisi horizontal rumah
    procedure GambarRumah;    // Prosedur untuk menggambar rumah
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BtnWarnaDindingClick(Sender: TObject);
begin
  // Pilih warna dinding dari dialog warna
  if ColorDialog1.Execute then
  begin
    DindingColor := ColorDialog1.Color; // Set warna dinding
    PaintBox1.Repaint; // Refresh gambar di PaintBox
  end;
end;

procedure TForm1.BtnWarnaAtapClick(Sender: TObject);
begin
  // Pilih warna atap dari dialog warna
  if ColorDialog1.Execute then
  begin
    AtapColor := ColorDialog1.Color; // Set warna atap
    PaintBox1.Repaint; // Refresh gambar di PaintBox
  end;
end;

procedure TForm1.BtnWarnaJendelaClick(Sender: TObject);
begin
  // Pilih warna jendela dari dialog warna
  if ColorDialog1.Execute then
  begin
    JendelaColor := ColorDialog1.Color; // Set warna jendela
    PaintBox1.Repaint; // Refresh gambar di PaintBox
  end;
end;

procedure TForm1.BtnWarnaPintuClick(Sender: TObject);
begin
  // Pilih warna pintu dari dialog warna
  if ColorDialog1.Execute then
  begin
    PintuColor := ColorDialog1.Color; // Set warna pintu
    PaintBox1.Invalidate; // Refresh gambar di PaintBox
  end;
end;

procedure TForm1.BtnPerbesarClick(Sender: TObject);
begin
  // Perbesar skala rumah
  ScaleFactor := ScaleFactor + 0.1; // Tambah faktor skala
  PaintBox1.Invalidate; // Refresh gambar di PaintBox
end;

procedure TForm1.BtnGeserKiriClick(Sender: TObject);
begin
  // Geser rumah ke kiri
  OffsetX := OffsetX - 10; // Kurangi posisi horizontal (geser kiri)
  PaintBox1.Repaint; // Refresh gambar di PaintBox
end;

procedure TForm1.BtnGeserKananClick(Sender: TObject);
begin
  // Geser rumah ke kanan
  OffsetX := OffsetX + 10; // Tambah posisi horizontal (geser kanan)
  PaintBox1.Repaint; // Refresh gambar di PaintBox
end;

procedure TForm1.BtnPerkecilClick(Sender: TObject);
begin
  // Perkecil skala rumah
  if ScaleFactor > 0.2 then // Pastikan skala tidak terlalu kecil
    ScaleFactor := ScaleFactor - 0.1; // Kurangi faktor skala
  PaintBox1.Repaint; // Refresh gambar di PaintBox
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Set warna default untuk komponen rumah
  DindingColor := clYellow; // Warna dinding
  AtapColor := clRed;       // Warna atap
  PintuColor := clBlue;     // Warna pintu
  JendelaColor := clBlue;   // Warna jendela

  // Set faktor skala awal
  ScaleFactor := 1.0;

  // Set offset translasi awal
  OffsetX := 0; // Tidak ada pergeseran awal
  GambarRumah;  // Gambar rumah saat form pertama kali dibuat
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.PaintBox1Click(Sender: TObject);
begin
  // Gambar ulang rumah saat PaintBox diklik
  GambarRumah;
end;

procedure TForm1.GambarRumah;
var
  x, y, dindingWidth, dindingHeight: Integer; // Variabel untuk posisi dan ukuran dinding
  midX: Integer; // Variabel untuk menyimpan titik tengah
begin
  // Set koordinat awal dan ukuran dasar rumah
  x := 50 + OffsetX; // Koordinat horizontal (dengan pergeseran)
  y := 150;          // Koordinat vertikal
  dindingWidth := Round(400 * ScaleFactor);  // Lebar dinding (dipengaruhi skala)
  dindingHeight := Round(150 * ScaleFactor); // Tinggi dinding (dipengaruhi skala)

  // Bersihkan area PaintBox sebelum menggambar ulang
  PaintBox1.Canvas.Clear;

  // Gambar Dinding
  PaintBox1.Canvas.Brush.Color := DindingColor; // Set warna kuas untuk dinding
  PaintBox1.Canvas.Rectangle(x, y, x + dindingWidth, y + dindingHeight); // Gambar dinding persegi panjang

  // Gambar Atap Segitiga
  PaintBox1.Canvas.Brush.Color := AtapColor; // Set warna kuas untuk atap
  midX := x + dindingWidth div 2;  // Titik tengah untuk puncak atap segitiga
  PaintBox1.Canvas.Polygon([
    Point(midX, y - Round(60 * ScaleFactor)),   // Titik puncak segitiga
    Point(x, y),                                // Titik kiri bawah atap
    Point(x + dindingWidth, y)                  // Titik kanan bawah atap
  ]);

  // Gambar Pintu
  PaintBox1.Canvas.Brush.Color := PintuColor; // Set warna kuas untuk pintu
  PaintBox1.Canvas.Rectangle(midX - Round(20 * ScaleFactor), y + Round(90 * ScaleFactor),
                             midX + Round(20 * ScaleFactor), y + dindingHeight); // Gambar pintu di tengah

  // Gambar Jendela Kiri dan Kanan
  PaintBox1.Canvas.Brush.Color := JendelaColor; // Set warna kuas untuk jendela

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


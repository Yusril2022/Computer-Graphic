unit per2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Printers;

type

  { TForm1 }

  TForm1 = class(TForm)
    Print: TButton;
    laukDaging: TCheckBox;
    laukAyam: TCheckBox;
    laukIkan: TCheckBox;
    laukTahu: TCheckBox;
    laukTempe: TCheckBox;
    CheckGroup1: TCheckGroup;
    listMinum: TComboBox;
    hargaNasi: TEdit;
    hargaMinum: TEdit;
    hargaDaging: TEdit;
    hargaAyam: TEdit;
    hargaIkan: TEdit;
    hargaTahu: TEdit;
    hargaTempe: TEdit;
    totalHarga: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    nasiPutih: TRadioButton;
    nasiUduk: TRadioButton;
    nasiKuning: TRadioButton;
    nasiLiwet: TRadioButton;
    nasiGoreng: TRadioButton;
    RadioGroup1: TRadioGroup;
    procedure PrintClick(Sender: TObject);
    procedure hargaDagingChange(Sender: TObject);
    procedure hargaMinumChange(Sender: TObject);
    procedure hargaNasiChange(Sender: TObject);
    procedure hargaTempeChange(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure laukAyamChange(Sender: TObject);
    procedure laukDagingChange(Sender: TObject);
    procedure laukIkanChange(Sender: TObject);
    procedure laukTahuChange(Sender: TObject);
    procedure laukTempeChange(Sender: TObject);
    procedure listMinumChange(Sender: TObject);
    procedure nasiGorengChange(Sender: TObject);
    procedure nasiKuningChange(Sender: TObject);
    procedure nasiLiwetChange(Sender: TObject);
    procedure nasiPutihChange(Sender: TObject);
    procedure nasiUdukChange(Sender: TObject);
    procedure totalHargaChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.nasiPutihChange(Sender: TObject);
begin
  hargaNasi.Text := '5000';
end;

procedure TForm1.nasiUdukChange(Sender: TObject);
begin
  hargaNasi.Text := '6000';
end;

procedure TForm1.totalHargaChange(Sender: TObject);
var
  total, nasi, minum, daging, ayam,ikan , tahu, tempe: Double;
begin
   nasi := StrToFloatDef(hargaNasi.Text, 0);
  minum := StrToFloatDef(hargaMinum.Text, 0);
  daging := StrToFloatDef(hargaDaging.Text, 0);
  ayam := StrToFloatDef(hargaAyam.Text, 0);
  ikan := StrToFloatDef(hargaIkan.Text, 0);
  tahu := StrToFloatDef(hargaTahu.Text, 0);
  tempe := StrToFloatDef(hargaTempe.Text, 0);

  total := nasi + minum + daging + ayam + Ikan + tahu + tempe;

  totalHarga.Text := FloatToStr(total);

end;

procedure TForm1.hargaNasiChange(Sender: TObject);
begin

end;

procedure TForm1.hargaTempeChange(Sender: TObject);
begin

end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.laukAyamChange(Sender: TObject);
begin
  if laukAyam.Checked then
    hargaAyam.Text := '15000'
  else
    hargaAyam.Text := '0';
end;

procedure TForm1.laukDagingChange(Sender: TObject);
begin
  if laukDaging.Checked then
    hargaDaging.Text := '20000'
  else
    hargaDaging.Text := '0';

end;

procedure TForm1.laukIkanChange(Sender: TObject);
begin
  if laukIkan.Checked then
    hargaIkan.Text := '10000'
  else
    hargaIkan.Text := '0';
end;

procedure TForm1.laukTahuChange(Sender: TObject);
begin
  if laukTahu.Checked then
    hargaTahu.Text := '5000'
  else
    hargaTahu.Text := '0';
end;

procedure TForm1.laukTempeChange(Sender: TObject);
begin
  if laukTempe.Checked then
    hargaTempe.Text := '4000'
  else
    hargaTempe.Text :='0';
end;

procedure TForm1.hargaMinumChange(Sender: TObject);
begin

end;

procedure TForm1.hargaDagingChange(Sender: TObject);
begin

end;

procedure TForm1.PrintClick(Sender: TObject);
var
  pilihanNasi, pilihanMinum, pilihanLauk, hargaNasi, hargaMinum, hargaLauk: string;
  total: Double;
begin
  // Cek pilihan nasi
  if nasiPutih.Checked then
    pilihanNasi := 'Nasi Putih'
  else if nasiUduk.Checked then
    pilihanNasi := 'Nasi Uduk'
  else if nasiKuning.Checked then
    pilihanNasi := 'Nasi Kuning'
  else if nasiLiwet.Checked then
    pilihanNasi := 'Nasi Liwet'
  else if nasiGoreng.Checked then
    pilihanNasi := 'Nasi Goreng'
  else
    pilihanNasi := 'Tidak ada pilihan nasi';

  // Ambil harga nasi
  hargaNasi := hargaNasi.Text;

  // Cek pilihan minum
  case listMinum.ItemIndex of
    0: pilihanMinum := 'Es Teh';
    1: pilihanMinum := 'Es Kopi';
    2: pilihanMinum := 'Es Kopyor';
    else pilihanMinum := 'Tidak ada pilihan minum';
  end;

  // Ambil harga minum
  hargaMinum := hargaMinum.Text;

  // Cek pilihan lauk
  pilihanLauk := '';
  hargaLauk := '';

  if laukDaging.Checked then
  begin
    pilihanLauk := pilihanLauk + 'Daging, ';
    hargaLauk := hargaLauk + 'Rp' + hargaDaging.Text + ', ';
  end;

  if laukAyam.Checked then
  begin
    pilihanLauk := pilihanLauk + 'Ayam, ';
    hargaLauk := hargaLauk + 'Rp' + hargaAyam.Text + ', ';
  end;

  if laukIkan.Checked then
  begin
    pilihanLauk := pilihanLauk + 'Ikan, ';
    hargaLauk := hargaLauk + 'Rp' + hargaIkan.Text + ', ';
  end;

  if laukTahu.Checked then
  begin
    pilihanLauk := pilihanLauk + 'Tahu, ';
    hargaLauk := hargaLauk + 'Rp' + hargaTahu.Text + ', ';
  end;

  if laukTempe.Checked then
  begin
    pilihanLauk := pilihanLauk + 'Tempe, ';
    hargaLauk := hargaLauk + 'Rp' + hargaTempe.Text + ', ';
  end;

  // Hapus koma terakhir jika ada lauk yang dipilih
  if pilihanLauk <> '' then
  begin
    SetLength(pilihanLauk, Length(pilihanLauk) - 2);  // Hapus koma dan spasi terakhir
    SetLength(hargaLauk, Length(hargaLauk) - 2);      // Hapus koma dan spasi terakhir
  end;

  // Hitung total
  total := StrToFloatDef(totalHarga.Text, 0);

  // Cetak rekapan termasuk harga per item
  with TPrinter.Create do
  try
    BeginDoc;
    Canvas.TextOut(10, 10, 'Pilihan Anda:');
    Canvas.TextOut(10, 30, 'Nasi: ' + pilihanNasi + ' (Rp' + hargaNasi + ')');
    Canvas.TextOut(10, 50, 'Minuman: ' + pilihanMinum + ' (Rp' + hargaMinum + ')');
    Canvas.TextOut(10, 70, 'Lauk: ' + pilihanLauk + ' (' + hargaLauk + ')');
    Canvas.TextOut(10, 90, 'Total Harga: Rp' + FloatToStr(total));
    EndDoc;
  finally
    Free;
  end;
end;


procedure TForm1.listMinumChange(Sender: TObject);
begin

  if listMinum.Text = 'Es teh' then
    hargaMinum.Text := '3000'
  else if listMinum.Text = 'Air Mineral' then
    hargaMinum.Text := '4000'
  else if listMinum.Text = 'Es kopi' then
    hargaMinum.Text := '5000'
  else if listMinum.Text = 'Jus Jeruk' then
    hargaMinum.Text := '6000'
  else
    hargaMinum.Text := '0';
end;

procedure TForm1.nasiGorengChange(Sender: TObject);
begin
  hargaNasi.Text := '10000';
end;

procedure TForm1.nasiKuningChange(Sender: TObject);
begin
  hargaNasi.Text := '7000';
end;

procedure TForm1.nasiLiwetChange(Sender: TObject);
begin
  hargaNasi.Text := '8000';
end;

end.


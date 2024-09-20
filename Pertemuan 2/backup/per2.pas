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
  PrintText: TStringList;
  i, YPos: Integer;
begin
  // Mengecek apakah ada printer yang tersedia
  if not Printer.Printers.Count > 0 then
  begin
    ShowMessage('Tidak ada printer yang tersedia.');
    Exit;
  end;

  // Membuat list string untuk menyimpan teks yang akan dicetak
  PrintText := TStringList.Create;
  try
    // Menambahkan informasi yang ingin dicetak
    PrintText.Add('--- Daftar Pembelian ---');
    PrintText.Add('Nasi: ' + hargaNasi.Text);
    PrintText.Add('Minum: ' + hargaMinum.Text);

    if laukDaging.Checked then
      PrintText.Add('Lauk Daging: ' + hargaDaging.Text);
    if laukAyam.Checked then
      PrintText.Add('Lauk Ayam: ' + hargaAyam.Text);
    if laukIkan.Checked then
      PrintText.Add('Lauk Ikan: ' + hargaIkan.Text);
    if laukTahu.Checked then
      PrintText.Add('Lauk Tahu: ' + hargaTahu.Text);
    if laukTempe.Checked then
      PrintText.Add('Lauk Tempe: ' + hargaTempe.Text);

    PrintText.Add('Total Harga: ' + totalHarga.Text);

    // Mulai mencetak
    Printer.BeginDoc;
    try
      // Mengatur posisi vertikal awal
      YPos := 100;

      for i := 0 to PrintText.Count - 1 do
      begin
        Printer.Canvas.TextOut(100, YPos, PrintText[i]);  // Cetak teks pada posisi (X: 100, Y: YPos)
        YPos := YPos + 30;  // Menambahkan jarak antar baris
      end;
    finally
      Printer.EndDoc;  // Selesai mencetak
    end;
  finally
    PrintText.Free;  // Mengosongkan list string
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


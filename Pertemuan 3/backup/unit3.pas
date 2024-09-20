unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus;

type

  { TFormImage }

  TFormImage = class(TForm)
    ButtonCariMobil: TButton;
    Warni: TEdit;
    WARNA: TLabel;
    Mesin: TEdit;
    Merk: TLabel;
    CC: TLabel;
    MerkMobil: TEdit;
    FormCariMobil: TEdit;
    Deskripsi: TLabel;
    MobilCivic: TImage;
    MobilBrio: TImage;
    LogoHonda: TImage;
    Background: TImage;
    DeskripsiMobil: TMemo;
    MobilWRV: TImage;
    MobilCRV: TImage;
    MobilHRV: TImage;
    MobilAccord: TImage;
    procedure ButtonCariMobilClick(Sender: TObject);
    procedure WarniChange(Sender: TObject);
    procedure DeskripsiMobilChange(Sender: TObject);  // Event untuk deskripsi mobil
    procedure MerkMobilChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);  // Event untuk menyembunyikan gambar saat form dibuat
    procedure MesinChange(Sender: TObject);
    procedure MobilAccordClick(Sender: TObject);
    procedure MobilCivicClick(Sender: TObject);
    procedure MobilCRVClick(Sender: TObject);
    procedure MobilHRVClick(Sender: TObject);
    procedure MobilWRVClick(Sender: TObject);
    procedure MobilBrioClick(Sender: TObject);
    procedure NamaMobilChange(Sender: TObject);
  private
    procedure SembunyikanSemuaMobil;
    procedure TampilkanMobil(NamaMobil: string);
  public

  end;

var
  FormImage: TFormImage;

implementation

{$R *.lfm}

{ TFormImage }

// Menyembunyikan semua gambar mobil saat form dibuat
procedure TFormImage.FormCreate(Sender: TObject);
begin
  SembunyikanSemuaMobil;
end;

procedure TFormImage.MesinChange(Sender: TObject);
begin

end;

procedure TFormImage.MobilAccordClick(Sender: TObject);
begin

end;

procedure TFormImage.MobilCivicClick(Sender: TObject);
begin

end;

procedure TFormImage.MobilCRVClick(Sender: TObject);
begin

end;

procedure TFormImage.MobilHRVClick(Sender: TObject);
begin

end;

procedure TFormImage.MobilWRVClick(Sender: TObject);
begin

end;

procedure TFormImage.MobilBrioClick(Sender: TObject);
begin

end;

procedure TFormImage.NamaMobilChange(Sender: TObject);
begin

end;

// Fungsi untuk menyembunyikan semua gambar mobil
procedure TFormImage.SembunyikanSemuaMobil;
begin
  MobilWRV.Visible := False;
  MobilCRV.Visible := False;
  MobilHRV.Visible := False;
  MobilAccord.Visible := False;
  MobilBrio.Visible := False;
  MobilCivic.Visible := False;
end;

// Fungsi untuk menampilkan mobil yang dicari dan deskripsinya
procedure TFormImage.TampilkanMobil(NamaMobil: string);
begin
  SembunyikanSemuaMobil;  // Sembunyikan semua mobil terlebih dahulu

  if NamaMobil = 'WR-V' then
  begin
    MobilWRV.Visible := True;
    DeskripsiMobil.Lines.Text := 'Melaju lebih percaya diri untuk raih impianmu bersama Honda WR-V!';
    MerkMobil.Text := 'Honda WR-V SUV';
    Mesin.Text := '1500 CC';
    Warni.Text := 'Taffeta White';

  end
  else if NamaMobil = 'CR-V' then
  begin
    MobilCRV.Visible := True;
    DeskripsiMobil.Lines.Text := 'Jadilah yang terdepan dengan SUV andalan terbaru dari Honda, All New Honda CR-V yang kini hadir dalam pilihan mesin hybrid untuk konsumsi bahan bakar lebih hemat dan tenaga powerful.';
    MerkMobil.Text := 'All New CR-V';
    Mesin.Text := '2500 CC';
    Warni.Text := 'Canyon River Blue';
  end
  else if NamaMobil = 'HR-V' then
  begin
    MobilHRV.Visible := True;
    DeskripsiMobil.Lines.Text := 'Jelajahi era baru bersama mobil berteknologi tinggi, didesain untuk memenuhi visi dan ambisi Anda.';
    MerkMobil.Text := 'HR-V Prestige';
    Mesin.Text := '1550 CC';
    Warni.Text := 'Sand Khaki Pearl';
  end
  else if NamaMobil = 'Civic' then
  begin
    MobilAccord.Visible := True;
    DeskripsiMobil.Lines.Text := 'Rasakan pengalaman yang memuaskan setiap kali menyalakan mesin dan berakselerasi dengan All New Honda Civic RS.';
    MerkMobil.Text := 'CIVIC RS';
    Mesin.Text := '3000 CC';
    Warni.Text := 'Platinum White';
  end
  else if NamaMobil = 'Brio' then
  begin
    MobilBrio.Visible := True;
    DeskripsiMobil.Lines.Text := 'Nikmati pengalaman berkendara penuh gaya dan kenyamanan dengan mobil yang sporty, stylish, dan sophisticated. It’s time to show the world who you really are!';
    MerkMobil.Text := 'Brio Satya';
    Mesin.Text := '1300 CC';
    Warni.Text := 'Electric Lime';
  end
  else if NamaMobil = 'Accord' then
  begin
    MobilCivic.Visible := True;
    DeskripsiMobil.Lines.Text := 'Shape the new world together with the partner that offers you the freedom to choose between Electric, Hybrid and Fuel Engine. All in one drive.';
    MerkMobil.Text := 'All New Accord';
    Mesin.Text := '2500 CC';
    Warni.Text := 'Platinum White';
  end
  else
  begin
    DeskripsiMobil.Lines.Text := 'Mobil tidak ditemukan.';
  end;
end;

// Event ketika tombol cari mobil diklik
procedure TFormImage.ButtonCariMobilClick(Sender: TObject);
var
  NamaMobil: string;
begin
  NamaMobil := FormCariMobil.Text;
  TampilkanMobil(NamaMobil);


end;

procedure TFormImage.WarniChange(Sender: TObject);
begin

end;

// Event yang dipicu ketika isi dari TMemo berubah
procedure TFormImage.DeskripsiMobilChange(Sender: TObject);
begin


end;

procedure TFormImage.MerkMobilChange(Sender: TObject);
begin

end;

end.


unit per1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonTampil: TButton;
    Keluar1: TButton;
    ButtonHapus: TButton;
    Keluar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;

    LOGIN: TLabel;
    NIM: TEdit;
    NM: TEdit;
    PS: TEdit;
    J: TEdit;
    TampilNIM: TEdit;
    TampilNM: TEdit;
    TampilPS: TEdit;
    TampilJ: TEdit;
    procedure ButtonTampilClick(Sender: TObject);
    procedure ButtonHapusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure JChange(Sender: TObject);
    procedure Keluar1Click(Sender: TObject);
    procedure KeluarClick(Sender: TObject);
    procedure NIMChange(Sender: TObject);
    procedure NMChange(Sender: TObject);
    procedure PSChange(Sender: TObject);
    procedure TampilJChange(Sender: TObject);
    procedure TampilNIMChange(Sender: TObject);
    procedure TampilNMChange(Sender: TObject);
    procedure TampilPSChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ButtonTampilClick(Sender: TObject);
begin

  TampilNIM.Text := NIM.Text;
  TampilNM.Text := NM.Text;
  TampilPS.Text := PS.Text;
  TampilJ.Text := J.Text;
end;

procedure TForm1.ButtonHapusClick(Sender: TObject);
begin

  NIM.Clear;
  NM.Clear;
  PS.Clear;
  J.Clear;
  TampilNIM.Clear;
  TampilNM.Clear;
  TampilPS.Clear;
  TampilJ.Clear;

  ShowMessage('Berhasil di hapus !');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.JChange(Sender: TObject);
var
  inputText: string;
begin

  if Sender is TEdit then
  begin
    inputText := TEdit(Sender).Text;
    if inputText = '' then
    begin

      TEdit(Sender).Clear;
    end;
  end;
end;

procedure TForm1.Keluar1Click(Sender: TObject);
begin
  close;
end;



procedure TForm1.KeluarClick(Sender: TObject);
begin
  Close;
  ShowMessage('Lets Goo !');
end;

procedure TForm1.NIMChange(Sender: TObject);
var
  i: Integer;
  isNumeric: Boolean;
begin
  isNumeric := True;


  for i := 1 to Length(NIM.Text) do
  begin
    if not (NIM.Text[i] in ['0'..'9']) then
    begin
      isNumeric := False;
      Break;
    end;
  end;


  if not isNumeric then
  begin
    ShowMessage('NIM hanya boleh angka!');
    NIM.Clear;
  end;
end;



procedure TForm1.NMChange(Sender: TObject);
var
  inputText: string;
begin

  if Sender is TEdit then
  begin
    inputText := TEdit(Sender).Text;


    if inputText = '' then
    begin
      TEdit(Sender).Clear;
    end;
  end;
end;


procedure TForm1.PSChange(Sender: TObject);
var
  inputText: string;
begin

  if Sender is TEdit then
  begin
    inputText := TEdit(Sender).Text;


    if inputText = '' then
    begin
      TEdit(Sender).Clear;
    end;
  end;
end;

procedure TForm1.TampilJChange(Sender: TObject);
begin

  if Trim(TampilJ.Text) = '' then
  begin
    TampilJ.Text := '';
  end
  else
  begin

  end;
end;



procedure TForm1.TampilNIMChange(Sender: TObject);
begin

  if Length(TampilNIM.Text) > 0 then
  begin

  end;
end;


procedure TForm1.TampilNMChange(Sender: TObject);
begin

  if Trim(TampilNM.Text) = '' then
  begin
    TampilNM.Text := '';
  end
  else if not (TampilNM.Text[1] in ['A'..'Z']) then
  begin

    TampilNM.Text := AnsiUpperCase(Copy(TampilNM.Text, 1, 1)) + Copy(TampilNM.Text, 2, Length(TampilNM.Text) - 1);
  end;
end;

procedure TForm1.TampilPSChange(Sender: TObject);
begin

  if Trim(TampilPS.Text) = '' then
  begin
    TampilPS.Text := '';
  end
  else
  begin

  end;
end;




end.


unit unit9;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Memo1: TMemo;
    Panel1: TPanel;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;
var
  TeksBuffer: TStringList;
  CurrentLineIndex: Integer;

procedure TForm1.FormCreate(Sender: TObject);

begin

  TeksBuffer := TStringList.Create;
  TeksBuffer.Add('Horizon.');
  TeksBuffer.Add('University.');
  TeksBuffer.Add('Indonesia.');
  TeksBuffer.Add('');
  TeksBuffer.Add('Teknik Informatika.');
  TeksBuffer.Add('Sistem Informasi.');
  TeksBuffer.Add('');
  CurrentLineIndex := 0;


  Memo1.Clear;
  Memo1.Lines.Add(TeksBuffer[CurrentLineIndex]);
end;

procedure TForm1.Image2Click(Sender: TObject);
begin

end;

procedure TForm1.Panel1Click(Sender: TObject);
begin

end;

procedure TForm1.Panel2Click(Sender: TObject);
begin

end;



procedure TForm1.Timer1Timer(Sender: TObject);

begin

  if CurrentLineIndex < TeksBuffer.Count - 1 then
    Inc(CurrentLineIndex)
  else
    CurrentLineIndex := 0;


  Memo1.Lines.Add(TeksBuffer[CurrentLineIndex]);
  if Memo1.Lines.Count > 5 then
    Memo1.Lines.Delete(0);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin

  Image1.Left := Image1.Left + 10;


  if Image1.Left >= Panel1.Width - Image1.Width then
    Image1.Left := 0;
end;

end.

